
with Interfaces;

with Ada.Assertions;
with Ada.Characters.Handling;
with Ada.Strings.Fixed;
with Ada.Text_IO; use Ada.Text_IO;

with MMC_Pic32;

package body Fat_File is

   Current_Vol   : constant Natural := 0;
   FS_ID         : Natural := 0;
   Fat_File_Sys  : array (1 .. Num_Volumes) of Fat_FS;
   LFN_Buffer    : LFN_Buff;
   Dir_Buffer    : Dir_Buff;

   function Try_Not_EXFAT (FS           : in out Fat_FS; B_Sect : DWord;
                           Num_Clusters : out DWord) return F_Result;
   function Get_Logical_Drive_Num (Path : String) return Natural;
   function LD2PD (Vol : Natural) return Natural;

   function Load_DWord (Data : Byte_Array; Ptr : Long_Integer)
                        return Long_Integer;
   function Load_DWord (Data : Byte_Array; Ptr : Long_Integer) return DWord;
   function Load_QWord (Data : Byte_Array; Ptr : Long_Integer) return QWord;
   function Load_Word (Data : Byte_Array; Ptr : Long_Integer) return Word;
   function Move_Window (FS : in out Fat_FS; Sector :in out  DWord)
                         return F_Result;
   function Sector_Size (FS : Fat_FS) return DWord;
   function Sync_Window (FS : in out Fat_FS) return F_Result;
   function Try_EXFAT
     (FS      : in out Fat_FS; Boot_Sect : DWord; Format : in out FS_FAT_Format;
      Max_LBA : out QWord) return F_Result;
   function Try_FAT
     (FS           : in out Fat_FS; Boot_Sect : DWord;
      Num_Clusters : out DWord; Max_LBA : QWord;
      Format  : in out FS_FAT_Format) return F_Result;
   function Try_FAT_Subtype
     (FS          : in out Fat_FS; Boot_Sect : DWord;
      Num_Reserve : DWord; Num_Clusters : out DWord;
      FA_Size     : DWord; Total_Sect : DWord)
      return F_Result;

   --  ff.c 3066
   function Check_File_System (FS : in out Fat_FS; Sect : in out DWord)
                               return FS_Format_Check is
      use Interfaces;
      Result : FS_Format_Check := Check_Not_FAT;
   begin
      FS.Win_Flag := False;
      FS.Win_Sector := DWord (16#FFFFFFFF#);
      if Move_Window (FS, Sect) /= FR_OK then
         Result := Check_Disk_Error;
      elsif Load_Word (FS.Win, BS_55AA) /= 16#AA55# then
         Result := Check_Not_BS;
      elsif Load_Word (FS.Win, BS_JmpBoot) = Word (16#E9#) or else
        (Load_Word (FS.Win, BS_JmpBoot) = Word (16#EB#) and then
             (Load_Word (FS.Win, BS_JmpBoot + 2) = Word (16#90#))) then
         if (Load_DWord (FS.Win, BS_FilSysType) and DWord (16#FFFFFF#)) =
           DWord (16#544146#) then  --  "TAF"
            --  Check FAT string
            Result := Check_FAT;
         elsif
           (Load_DWord (FS.Win, BS_FilSysType32) = DWord (16#33544146#)) then
            --  Check FAT string  16#33544146# = "3TAF"
            Result := Check_FAT;
         end if;
      end if;

      return Result;

   end Check_File_System;

   --  Check_Non_VBR finds a FAT partition on the drive.
   --  Supports only generic partitioning rules, FDISK and SFD.
   procedure Check_Non_VBR
     (FS           : in out Fat_FS; Vol_ID : Integer;
      Format_Check : in out FS_Format_Check) is
      use Interfaces;

      Part_Ptr     : Long_Integer := 0;
      BR           : array (1 .. 4) of DWord := (others => 0);
      BR_Index     : Positive;
   begin
      --  ff.c 3083
      if Format_Check = Check_Not_FAT or else
        (FS_Format_Check'Enum_Rep (Format_Check) < 2 and then
         LD2PD (Vol_ID) /= 0) then
         --  Not a FAT-VBR or forced partition number
         --  ff.c 3085
         for idx in 0 .. 3 loop
            --  Get partition offset
            Part_Ptr := Long_Integer (MBR_Table + idx * SZ_PTE);
            if FS.Win (Part_Ptr + PTE_System) > 0 then
               BR (idx + 1) := (Load_DWord (FS.Win, Part_Ptr + PTE_StLba));
            end if;

            BR_Index := LD2PD (Vol_ID);
            if BR_Index > 2 then
               BR_Index := BR_Index - 1;
            end if;

            loop
               if BR (BR_Index) > 0 then
                  Format_Check := Check_File_System (FS, BR (BR_Index));
               else
                  Format_Check := Check_Not_BS;
               end if;

               BR_Index := BR_Index + 1;
               exit when LD2PD (Vol_ID) = 0 and then
                 FS_Format_Check'Enum_Rep (Format_Check) >= 2 and then
                 BR_Index < 5;
            end loop;
         end loop;  --  ff.c 3182
      end if;

   end Check_Non_VBR;

   function Clust2Sec (FS : Fat_FS; Cluster : DWord)
                       return DWord is
      use Interfaces;
      Clust : constant DWord := Cluster - 2;
   begin
      if Clust < FS.Num_Fat_Entries - 2 then
         return Clust * DWord (FS.Cluster_Size) + FS.Data_Base;
      else
         return 0;
      end if;

   end Clust2Sec;

   function F_Mount (FS : in out Fat_FS; Path : String; Opt : Integer)
                     return F_Result is
      --        Routine_Name : constant String := "Fat_File.F_Mount ";
      Vol      : constant Integer := Get_Logical_Drive_Num (Path);
      Mode     : Word := 0;
      Result   : F_Result;
   begin
      --  ff.c 3318
      if Vol < 0 then
         Result := FR_INVALID_DRIVE;
      else
         FS.FS_Type := FS_FAT_Unknown;
         Fat_File_Sys (Vol) := FS;
         if Opt = 1 then
            --  Force mount the volume
            Result := Find_Volume (Path, FS, Mode);
            Fat_File_Sys (Vol) := FS;
         else
            --  ff.c 3345 Do not mount now, it will be mounted later
            Result := FR_OK;
         end if;
      end if;

      return Result;

   end F_Mount;

   --  Find_Volume finds a logical drive and checks that the volume is mounted.
   function Find_Volume (Path : String; FS : out Fat_FS; Mode : in out Word)
                         return F_Result is
      use Interfaces;
      use Disk_IO;
      Vol_ID       : constant Integer := Get_Logical_Drive_Num (Path);
      F_READ       : constant Word := FA_Status'Enum_Rep (FA_READ);
      Boot_Sect    : DWord := 0;
      Format       : FS_FAT_Format := FS_FAT_Unknown;
      Format_Check : FS_Format_Check;
      Max_LBA      : QWord := 0;
      Num_Clusters : DWord := 0;
      Status       : Disk_IO.D_Status;
      Result       : F_Result;
   begin
      --  ff.c 3034
      if Vol_ID < 0 then
         Result := FR_INVALID_DRIVE;
      else --  Vol_ID >= 0
         FS := Fat_File_Sys (Vol_ID);
         Mode := Mode and (not F_READ);
         --  ff.c 3049
         if FS_FAT_Format'Enum_Rep (FS.FS_Type) > 0 then
            --  FS_FAT nknown
            Status := MMC_Pic32.Disk_Status (FS.Drive_Num);
            if not FS_Read_Only and then Mode /= 0 and then
              Status = STA_PROTECT then
               Result := FR_WRITE_PROTECTED;
            else --  FS_FAT_Unknown
               --  ff.c 3055
               Result := FR_OK;
            end if;
         else  --  FS.FS_Type = FS_FAT_Unknown
            --  ff.c 3062
            FS.FS_Type := FS_FAT_Unknown;
            FS.Drive_Num := LD2PD (Vol_ID);
            Status := MMC_Pic32.Disk_Initialize (FS.Drive_Num);
            if Status = STA_NOINIT then
               Result := FR_NOT_READY;
            elsif not FS_Read_Only and then Mode /= 0 and then
              Status = STA_PROTECT then
               Result := FR_WRITE_PROTECTED;
            else
               --  ff.c 3082
               Format_Check := Check_File_System (FS, Boot_Sect);
               Check_Non_VBR (FS, Vol_ID, Format_Check);

                --  ff.c 3182
               if Format_Check = Check_Disk_Error then
                  Result := FR_DISK_ERR;
               elsif
                 FS_Format_Check'Enum_Rep (Format_Check) >=
                 FS_Format_Check'Enum_Rep (Check_Not_FAT) then
                  Result := FR_NO_FILESYSTEM;
                  Put_Line ("No FAT volume found");
                  --  3190 Otherwise, a FAT volume has been found (bsect).
                  --  The following code initializes the file system object.
               elsif FS_EXFAT_Support and then Format_Check = Check_EXFAT then
                  if Try_EXFAT (FS, Boot_Sect, Format, Max_LBA) /= FR_OK then
                     Result := Try_Not_EXFAT (FS, Boot_Sect, Num_Clusters);
                  end if;
               end if;
            end if;
         end if;  --  FS.FS_Type > 0
      end if;

      return Result;

   end Find_Volume;

   function Get_Logical_Drive_Num (Path : String) return Natural is
      use Ada.Characters.Handling;
      use Ada.Strings.Fixed;
      Path_Ptr : Positive := 1;
      TT       : Natural;
      TP       : Positive := 1;  --  Path ptr?
      Idx      : Natural;
      Vol      : Integer := -1;
      Vol_ID   : constant array (0 .. 7) of Natural :=
        (0, 1, 2, 3, 4, 5, 6, 7);
      Sp       : Natural;
      C        : Character;
      Tc       : Character;
      Result   : Natural := 0;
   begin
      if Path'Length > 0 then
         TT := Index (Path, ":");
         if TT > 0 then
            --  The path name contains a :.
            Idx := Character'Pos (Path (Path'First)) - Character'Pos ('0');
            TP := 2;
            if Idx < 10 and then TP = TT then
               if Idx < Num_Volumes then
                  --  If a drive ID is found, get the value and strip it off.
                  Vol := Idx;
                  Path_Ptr := Path_Ptr + TT;
               end if;

            elsif STR_VOLUME_ID > 0 then
               --  No numerical drive number so look for a drive string ID.
               Idx := 0;
               TT := TT + 1;
               loop
                  Sp := Vol_ID (Idx);
                  TP := 1;
                  loop
                     --  Compare a string drive ID with path name
                     C := VOLUME_STRS (Sp);
                     SP := Sp + 1;
                     Tc := To_Upper (Path (TP));
                     TP := TP + 1;
                     exit when C = ASCII.NUL or else C /= Tc;
                  end loop;
                  exit when (C = Path (TT) and TP = TT) or else
                    Idx >= Num_Volumes;
               end loop;

               if Idx < Num_Volumes then
                  Vol := Idx;
                  Path_Ptr := TT;
               end if;
            end if;
            Result := vol;
         else
            Result := Current_Vol;
         end if;
      end if;

      return Result;

   end Get_Logical_Drive_Num;

   --  Get physical drive number
   function LD2PD (Vol : Natural) return Natural is
      use Ada.Assertions;
   begin
      Assert (Multi_Partition, "Fat_File.LD2PD, Vol_To_Part not implmented");

      return Vol;

   end LD2PD;

   function Load_DWord (Data : Byte_Array; Ptr : Long_Integer)
                        return Long_Integer is
      Result : constant DWord := Load_DWord (Data, Ptr);
   begin
      return Long_Integer (Result);

   end Load_DWord;

   function Load_DWord (Data : Byte_Array; Ptr : Long_Integer) return DWord is
      use Interfaces;
      RV_Ptr : constant Long_Integer := Ptr;
      RV     : DWord := Unsigned_32 (Data (Ptr + 3));
   begin
      for index in reverse RV_Ptr .. RV_Ptr + 2 loop
         RV := Shift_Left (RV, 8) or Unsigned_32 (Data (index));
      end loop;

      return RV;

   end Load_DWord;

   function Load_QWord (Data : Byte_Array; Ptr : Long_Integer) return QWord is
      use Interfaces;
      RV_Ptr : constant Long_Integer := Ptr;
      RV     : Unsigned_64 := Unsigned_64 (Data (RV_Ptr + 7));
   begin
      for index in reverse RV_Ptr .. RV_Ptr + 6 loop
         RV := Shift_Left (RV, 8) or Unsigned_64 (Data (index));
      end loop;

      return RV;

   end Load_QWord;

   function Load_Word (Data : Byte_Array; Ptr : Long_Integer) return Word is
      use Interfaces;
   begin
      return Shift_Left (Unsigned_16 (Data (Ptr)), 8) or
        Unsigned_16 (Data (Ptr + 1));

   end Load_Word;

   --  Move_Window loads FS.Win from disk
   function Move_Window (FS : in out Fat_FS; Sector : in out DWord)
                         return F_Result is
      use Interfaces;
      use Disk_IO;
      Count  : Natural := 1;
      Result : F_Result := FR_OK;
   begin
      if Sector /= FS.Win_Sector and then not FS_Read_Only then
         --  Window offset has changed
         Result := Sync_Window (FS);
      end if;

      if Result = FR_OK and then
        MMC_Pic32.Disk_Read (Drive_Type'Enum_Rep (FS.Drive_Typ),
                             FS.Win, Sector, Count) /=  Res_OK then
         Sector := DWord (16#FFFFFFFF#);
         Result := FR_DISK_ERR;
      end if;

      return Result;

   end Move_Window;

   function Sector_Size (FS : Fat_FS) return DWord is
   begin
      if Max_SS = Min_SS then
         return DWord (Max_SS);
      else
         return DWord (FS.Sector_Size);
      end if;

   end Sector_Size;

   function Sync_Window (FS : in out Fat_FS) return F_Result is
      use Interfaces;
      use Disk_IO;
      W_Sect       : DWord;
      Count        : Natural := 0;
      Write_Result : D_Result := Res_OK;
      Result       : F_Result := FR_OK;
   begin
      if FS.Win_Flag then
         W_Sect := FS.Win_Sector;
         Count := 1;
         Write_Result := MMC_Pic32.Disk_Write
           (Drive_Type'Enum_Rep (FS.Drive_Typ), FS.Win, W_Sect, Count);
         if Write_Result /= Res_OK then
            Result := FR_DISK_ERR;
         else
            FS.Win_Flag := False;
            if W_Sect - FS.Fat_Base < FS.Fat_Size then
               for nf in reverse 3 .. FS.Fat_Size loop
                  W_Sect := W_Sect + FS.Fat_Size;
                  if Write_Result = Res_OK then
                     Count := 1;
                     Write_Result := MMC_Pic32.Disk_Write
                       (Drive_Type'Enum_Rep (FS.Drive_Typ), FS.Win,
                        W_Sect, Count);
                  end if;
               end loop;

               if Write_Result /= Res_OK then
                  Result := FR_DISK_ERR;
               end if;
            end if;
         end if;
      end if;

      return Result;

   end Sync_Window;

   function Try_EXFAT
     (FS     : in out Fat_FS; Boot_Sect : DWord;
      Format : in out FS_FAT_Format; Max_LBA : out QWord)
      return F_Result is
      use Interfaces;
      Idx          : Long_Integer;
      Num_Clusters : DWord;
      Result       : F_Result := FR_OK;
   begin
      --  ff.c 3194 Check zero filler
      Idx := BPB_ZeroedEx;
      while Idx < BPB_ZeroedEx + 53 and then FS.Win (Idx) = 0 loop
         Idx := Idx + 1;
      end loop;

      --  ff.c 3195
      if Idx < BPB_ZeroedEx + 53 then
         Result := FR_NO_FILESYSTEM;

      elsif Load_Word (FS.Win, BPB_FSVerEx) /= 16#100# then
         Result := FR_NO_FILESYSTEM;
         Put_Line
           ("Invalid file  system version: " &
              Word'Image (Load_Word (FS.Win, BPB_FSVerEx)) &
              ".  Version 1.0 is required.");
      elsif BPB_BytsPerSecEx / 2 /= Long_Integer (Sector_Size (FS)) then
         --  BPB_BytsPerSecEx equal the physical sector size.
         Result := FR_NO_FILESYSTEM;
         Put_Line ("Invalid file  system sector size.");
      else
         --  ff.c 3206 Set Max_LBA to last LBA + 1 of the volume.
         Max_LBA := Load_QWord (FS.Win, BPB_TotSecEx) + QWord (Boot_Sect);
         if Max_LBA >= 16#100000000# then
            Result := FR_NO_FILESYSTEM;
            Put_Line
              ("Invalid file system cannot be processed as a 32 bit LBA.");
         else
            --  ff.c 3210
            Result := Try_FAT (FS, Boot_Sect, Num_Clusters, Max_LBA, Format);
         end if;
      end if;

      return Result;

   end Try_EXFAT;

   function Try_FAT_Subtype
     (FS           : in out Fat_FS; Boot_Sect : DWord; Num_Reserve : DWord;
      Num_Clusters : out DWord; FA_Size : DWord; Total_Sect : DWord)
      return F_Result is
      use Interfaces;
      Szb_Fat     : DWord;
      Sysect      : DWord;
      FAT_Format  : FS_FAT_Format;
      Result      : F_Result := FR_OK;
   begin
      --  ff.c 3282
      Sysect := Num_Reserve + FA_Size +
        FS.Root_Dir_Size / Sector_Size (FS) / DWord (SZDIRE);
      if Total_Sect < Sysect then
         Result := FR_NO_FILESYSTEM;
         Put_Line ("Invalid volume size.");
      else
         --  ff.c 3194
         Num_Clusters := Total_Sect - Sysect / DWord (FS.Cluster_Size);
         if Num_Clusters = 0 then
            Result := FR_NO_FILESYSTEM;
            Put_Line ("Invalid Num_Clusters.");
         else
            FAT_Format := FS_FAT32;
         end if;

         --  ff.c 3198
         if Long_Integer (Num_Clusters) <= MAX_FAT12 then
            FAT_Format := FS_FAT12;
         elsif Long_Integer (Num_Clusters) <= MAX_FAT16 then
            FAT_Format := FS_FAT16;
         end if;

         --  ff.c 3204
         FS.Num_Fat_Entries := DWord (Num_Clusters + 2);
         FS.Volume_Base := Boot_Sect;
         FS.Fat_Base := Boot_Sect + Num_Reserve;
         FS.Data_Base := Boot_Sect + Sysect;
         if FAT_Format = FS_FAT32 then
            if Load_Word (FS.Win, BPB_FSVer32) /= 0 then
               Result := FR_NO_FILESYSTEM;
               Put_Line ("Fat32 version 0.0 is required.");
            elsif FS.Root_Dir_Size /= 0 then
               Result := FR_NO_FILESYSTEM;
               Put_Line ("Root directory size must be 0.");
            else
               --  ff.c 3214
               FS.Dir_Base :=
                 Load_DWord (FS.Win, BPB_RootClus32);
               Szb_Fat := FS.Num_Fat_Entries;
            end if;

            --  ff.c 3219
         elsif FS.Root_Dir_Size = 0 then
            Result := FR_NO_FILESYSTEM;
            Put_Line
              ("Root directory size must not be 0.");
         else  --  not FS_FAT32
            --  ff.c 3221
            FS.Dir_Base := FS.Fat_Base + FA_Size;
            if FAT_Format = FS_FAT16 then
               Szb_Fat := 2 * FS.Num_Fat_Entries;
            else
               Szb_Fat := FS.Num_Fat_Entries * 3 / 2 +
                 (FS.Num_Fat_Entries and 1);
            end if;

            --  ff.c 3225
            if FS.Fat_Size < (Szb_Fat + Sector_Size (FS) - 1) /
              Sector_Size (FS) then
               Result := FR_NO_FILESYSTEM;
               Put_Line ("BPB_FATz too small.");
            else
               if not FS_Read_Only then
                  --  ff.c 3230
                  FS.Last_Cluster := 16#FFFFFFFF#;
                  FS.Free_Cluster := 16#FFFFFFFF#;
                  FS.Fsi_Flag := 16#80#;
               end if;

               --  ff.c 3254
               FS.FS_Type := FAT_Format;
               FS_ID := FS_ID + 1;
               FS.ID := FS_ID;
               if Use_Long_FileName = 1 then
                  FS.Lfn_Buffer := LFN_Buffer;
                  if FS_EXFAT_Support then
                     FS.Dir_Buffer := Dir_Buffer;
                  end if;
               end if;
               Result := FR_OK;
            end if;
         end if;
      end if;

      return Result;

   end Try_FAT_Subtype;

   function Try_FAT
     (FS           : in out Fat_FS; Boot_Sect : DWord;
      Num_Clusters : out DWord; Max_LBA : QWord;
      Format  : in out FS_FAT_Format) return F_Result is
      use Interfaces;
      Sector : DWord;
      Idx    : Long_Integer;
      Done   : Boolean := False;
      Result : F_Result := FR_OK;
   begin
      --  ff.c 3118
      FS.Fat_Size := Load_DWord (FS.Win, BPB_FatSzEx);
      FS.Num_Fats := FS.Win (BPB_NumFATsEx);
      if FS.Num_Fats /= 1 then
         --  Only one FAT supported
         Result := FR_NO_FILESYSTEM;
         Put_Line
           ("Invalid file system, more than one FAT.");
      elsif Shift_Left (FS.Win (BPB_SecPerClusEx), 1) = 0 then
         Result := FR_NO_FILESYSTEM;
         Put ("Invalid file system, Sectors per cluster must be ");
         Put_Line (" in the range 1 through 32768");
      else
         --  ff.c 3128
         Num_Clusters := Load_DWord (FS.Win, BPB_NumClusEx);
         if Num_Clusters > MAX_EXFAT then
            Result := FR_NO_FILESYSTEM;
            Put_Line ("Invalid file system, too many clusters. ");
         else
            --  ff.c 3131
            FS.Num_Fat_Entries := DWord (Num_Clusters + 2);
            FS.Volume_Base := Boot_Sect;
            FS.Data_Base := Boot_Sect +
              Load_DWord (FS.Win, BPB_DataOfsEx);
            FS.Fat_Base :=
              Boot_Sect + Load_DWord (fs.Win, BPB_FatOfsEx);
            if Max_LBA < QWord (FS.Data_Base) +
              QWord (Num_Clusters * DWord (FS.Cluster_Size)) then
               Result := FR_NO_FILESYSTEM;
               Put_Line ("Invalid file system.");
            else
               --  ff.c 3139
               FS.Dir_Base := Load_DWord (FS.Win, BPB_RootClusEx);
               Sector := Clust2Sec (FS, FS.Dir_Base);
               if Move_Window (FS, Sector) /= FR_OK then
                  Result := FR_DISK_ERR;
                  Put_Line ("Invalid file system.");
               else
                  Idx := 0;
                  Done := False;
                  while not Done and then
                    Idx < Long_Integer (Sector_Size (FS)) loop
                     Done := FS.Win (Idx) = 16#81# and then
                       Load_DWord (FS.Win, Idx + 20) = Long_Integer (2);
                     if not Done then
                        Idx := Idx + SZDIRE;
                     end if;
                  end loop;

                  --  ff.c 3149
                  if Idx = Long_Integer (Sector_Size (FS)) then
                     Result := FR_NO_FILESYSTEM;
                     Put_Line ("Invalid file system.");
                  elsif not FS_Read_Only then
                     FS.Last_Cluster :=  16#FFFFFFFF#;
                     FS.Free_Cluster :=  16#FFFFFFFF#;
                     Format := FS_EXFAT;
                  end if;
               end if;
            end if;
         end if;
      end if;

      return Result;

   end Try_FAT;

   function Try_Not_EXFAT
     (FS : in out Fat_FS; B_Sect : DWord; Num_Clusters : out DWord)
      return F_Result is
      use Interfaces;
      FA_Size     : DWord;
      Total_Sect  : DWord;
      Num_Reserve : DWord;
      Result      : F_Result := FR_OK;
   begin
      --  ff.c 3252
      if DWord (Load_Word (FS.Win, BPB_BytsPerSec)) /= Sector_Size (FS) then
         Result := FR_NO_FILESYSTEM;
         Put_Line ("Invalid file system");
         Put ("BPB_BytsPerSec must be equal to the ");
         Put_Line ("physical sector size");
      else
         --  ff.c 3255
         FA_Size := DWord
           (Load_Word (FS.Win, BPB_FATSz16));
         if FA_Size = 0 then
            FA_Size :=
              Load_DWord (FS.Win, BPB_FATSz32);
         end if;

         FS.Fat_Size := FA_Size;
         FS.Num_Fats := FS.Win (BPB_NumFATs);
         if FS.Num_Fats /= 1 and then
           FS.Num_Fats /= 2 then
            Result := FR_NO_FILESYSTEM;
            Put_Line ("Invalid file system");
            Put_Line ("Number of Fats must be 1 or 2");
         else
            --  ff.c 3263
            FA_Size := DWord (FS.Num_Fats);
            FS.Cluster_Size := FS.Win (BPB_SecPerClus);
            if FS.Cluster_Size = 0 or else
              (FS.Cluster_Size and (FS.Cluster_Size - 1)) /= 0 then
               Result := FR_NO_FILESYSTEM;
               Put_Line ("Invalid file system");
               Put_Line ("Cluster_Size must be a power of 2");
            else
               --  ff.c 3269
               FS.Root_Dir_Size := DWord (Load_Word (FS.Win, BPB_RootEntCnt));
               if (FS.Root_Dir_Size) mod Sector_Size (FS) / DWord (SZDIRE)
                 /= 0 then
                  Result := FR_NO_FILESYSTEM;
                  Put_Line ("Invalid file system");
                  Put_Line ("Must be sector aligned");
               else
                  Total_Sect := DWord (Load_Word (FS.Win, BPB_TotSec16));
                  if Total_Sect = 0 then
                     Total_Sect := Load_DWord (FS.Win, BPB_TotSec32);
                  end if;

                  --  ff.c 3277
                  Num_Reserve :=
                    DWord (Load_Word (FS.Win, BPB_RsvdSecCnt));
                  if Num_Reserve = 0 then
                     Result := FR_NO_FILESYSTEM;
                     Put_Line ("Invalid file system");
                     Put_Line ("Num_Reserve is zero.");
                  else
                     --  ff.c 3282
                     Result := Try_FAT_Subtype
                       (FS, B_Sect, Num_Reserve, Num_Clusters, FA_Size,
                        Total_Sect);
                  end if;
               end if;
            end if;
         end if;
      end if;

      return Result;

   end Try_Not_EXFAT;

end Fat_File;
