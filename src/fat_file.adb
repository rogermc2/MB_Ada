
with Interfaces;

with Ada.Assertions;
with Ada.Characters.Handling;
with Ada.Strings.Fixed;
with Ada.Text_IO; use Ada.Text_IO;

package body Fat_File is

   Current_Vol   : constant Natural := 0;
   FS_ID         : Natural := 0;
   Fat_File_Sys  : array (0 .. Num_Volumes - 1) of Fat_FS;
   LFN_Buffer    : LFN_Buff;
   Dir_Buffer    : Dir_Buff;

   function Try_Not_EXFAT
     (FS           : in out Fat_FS; B_Sect : Long_Integer;
      Num_Clusters : out Long_Integer) return F_Result;
   function Get_Logical_Drive_Num (Path : String) return Natural;
   function LD2PD (Vol : Natural) return Natural;

   function Load_DWord (Data : Byte_Array; Ptr : Long_Integer)
                        return Long_Integer;
   function Load_DWord (Data : Byte_Array; Ptr : Long_Integer) return DWord;
   function Load_QWord (Data : Byte_Array; Ptr : Long_Integer) return QWord;
   function Load_Word (Data : Byte_Array; Ptr : Long_Integer) return Word;
   function Move_Window (FS : in out Fat_FS; Sector :in out  Long_Integer)
                         return F_Result;
   function Sector_Size (FS : Fat_FS) return Long_Integer;
   function Sync_Window (FS : in out Fat_FS) return F_Result;
   function Try_EXFAT
     (FS      : in out Fat_FS; B_Sect : Long_Integer; Format : in out FS_FAT_Format;
      Max_LBA : out Long_Integer) return F_Result;

   function Check_File_System (FS : in out Fat_FS; Sect : in out Long_Integer)
                               return FS_Format_Check is
      use Interfaces;
      Result : FS_Format_Check := Check_Not_FAT;
   begin
      FS.Win_Flag := False;
      FS.Win_Sector := Long_Integer (16#FFFFFFFF#);
      if Move_Window (FS, Sect) /= FR_OK then
         Result := Check_Disk_Error;
         --        elsif Load_Word (FS.Win + BS_55AA) /= 16#AA55# then
      elsif Load_Word (FS.Win, BS_55AA) /= 16#AA55# then
         Result := Check_Not_BS;
      elsif Load_Word (FS.Win, BS_JmpBoot) = Word (16#E9#) then
         null;
      end if;

      return Result;

   end Check_File_System;

   --  	Check_Non_VBR finds a FAT partition on the drive.
   --  Supports only generic partitioning rules, FDISK and SFD.

   function Check_Non_VBR
     (FS     : in out Fat_FS; Vol_ID : Integer; B_Sect : in out Long_Integer)
      return FS_Format_Check is
      use Interfaces;
      Format_Check : FS_Format_Check;
      Part_Ptr     : Long_Integer := 0;
      BR           : array (1 .. 4) of Long_Integer := (others => 0);
      BR_Index     : Positive;
   begin
      --  ff.c 3077
      Format_Check := Check_File_System (FS, B_Sect);
      if Format_Check = Check_Not_FAT or else
        (FS_Format_Check'Enum_Rep (Format_Check) < 2 and then
         LD2PD (Vol_ID) /= 0) then
         --  Not a FAT-VBR or forced partition number
         --  ff.c 3080
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
         end loop;
      end if;

      return Format_Check;

   end Check_Non_VBR;

   function Clust2Sec (FS : Fat_FS; Cluster : Long_Integer)
                       return Long_Integer is
      Clust : constant Long_Integer := Cluster - 2;
   begin
      if Clust < FS.Num_Fat_Entries - 2 then
         return Clust * Long_Integer (FS.Cluster_Size) + FS.Data_Base;
      else
         return 0;
      end if;

   end Clust2Sec;

   function F_Mount (FS : in out Fat_FS; Path : String; Opt : Integer)
                     return F_Result is
      --        Routine_Name : constant String := "Fat_File.F_Mount ";
      Vol      : constant Integer := Get_Logical_Drive_Num (Path);
      CFS      : Fat_FS (FS.Win_Size);
      Path_Pos : Positive := 1;
      Mode     : Word := 0;
      Res      : F_Result;
      Result   : F_Result;
   begin
      if Vol < 0 then
         Result := FR_INVALID_DRIVE;
      else
         CFS := Fat_File_Sys (Vol);
         CFS.FS_Type := FS_FAT_Unknown;
         FS.FS_Type := FS_FAT_Unknown;
         Fat_File_Sys (Vol) := FS;
         if Opt /= 1 then
            Result := FR_OK;
         else
            Res := Find_Volume (Path, FS, Mode);
         end if;
      end if;

      return Result;

   end F_Mount;

   function Find_Volume (Path : String; RFS : in out Fat_FS;
                         Mode : in out Word) return F_Result is
      use Interfaces;
      use Disk_IO;
      Vol_ID       : constant Integer := Get_Logical_Drive_Num (Path);
      F_READ       : constant Word := FA_Status'Enum_Rep (FA_READ);
      FS           : Fat_FS;
      B_Sect       : Long_Integer := 0;
      Format       : FS_FAT_Format := FS_FAT_Unknown;
      Format_Check : FS_Format_Check;
      Max_LBA      : Long_Integer := 0;
      Num_Clusters : Long_Integer := 0;
      Status       : D_Status;
      Result       : F_Result;
   begin
      --  ff.c 3025
      if Vol_ID < 0 then
         Result := FR_INVALID_DRIVE;
      else --  Vol_ID >= 0
         FS := Fat_File_Sys (Vol_ID);
         RFS := FS;
         Mode := Mode and (not F_READ);
         if FS_FAT_Format'Enum_Rep (FS.FS_Type) > 0 then
            Status := Disk_Status (FS.Drive_Typ);
            if not FS_Read_Only and then Mode /= 0 and then
              Status = STA_PROTECT then
               Result := FR_WRITE_PROTECTED;
            else
               --  ff.c 3046
               Result := FR_OK;
            end if;
         else
            --  ff.c 3053
            FS.FS_Type := FS_FAT_Unknown;
            FS.Drive_Num := LD2PD (Vol_ID);
            Status := Disk_Initialize (FS.Drive_Typ);
            if Status = STA_NOINIT then
               Result := FR_NOT_READY;
            elsif not FS_Read_Only and then Mode /= 0 and then
              Status =STA_PROTECT then
               Result := FR_WRITE_PROTECTED;
            else
               --  ff.c 3073
               Format_Check := Check_Non_VBR (FS, Vol_ID, B_Sect);

               --  ff.c 3089
               if Format_Check = Check_Disk_Error then
                  Result := FR_DISK_ERR;
               elsif
                 FS_Format_Check'Enum_Rep (Format_Check) >=
                 FS_Format_Check'Enum_Rep (Check_Not_FAT) then
                  Result := FR_NO_FILESYSTEM;
                  Put_Line ("No FAT volume found");
                  --  3097 Otherwise, a FAT volume has been found (bsect).
                  --  The following code initializes the file system object.
               elsif FS_EXFAT_Support and then Format_Check = Check_EXFAT then
                  if Try_EXFAT (FS, B_Sect, Format, Max_LBA) /= FR_OK then
                     Result := Try_Not_EXFAT (FS, B_Sect, Num_Clusters);
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

   function Move_Window (FS : in out Fat_FS; Sector : in out Long_Integer)
                         return F_Result is
      use Disk_IO;
      Result : F_Result := FR_OK;
   begin
      if Sector /= FS.Win_Sector and then not FS_Read_Only then
         Result := Sync_Window (FS);
      end if;

      if Result = FR_OK and then
        Disk_Read (FS.Drive_Typ, FS.Win, Sector, 1) /= Res_OK then
         Sector := Long_Integer (16#FFFFFFFF#);
         Result := FR_DISK_ERR;
      end if;

      return Result;

   end Move_Window;

   function Sector_Size (FS : Fat_FS) return Long_Integer is
   begin
      if Max_SS = Min_SS then
         return Max_SS;
      else
         return FS.Sector_Size;
      end if;

   end Sector_Size;

   function Sync_Window (FS : in out Fat_FS) return F_Result is
      use Disk_IO;
      W_Sect       : Long_Integer;
      Write_Result : D_Result := Res_OK;
      Result       : F_Result := FR_OK;
   begin
      if FS.Win_Flag then
         W_Sect := FS.Win_Sector;
         Write_Result := Disk_Write (FS.Drive_Typ, FS.Win, W_Sect, 1);
         if Write_Result /= Res_OK then
            Result := FR_DISK_ERR;
         else
            FS.Win_Flag := False;
            if W_Sect - FS.Fat_Base < FS.Fat_Size then
               for nf in reverse 3 .. FS.Fat_Size loop
                  W_Sect := W_Sect + FS.Fat_Size;
                  if Write_Result = Res_OK then
                     Write_Result :=
                       Disk_Write (FS.Drive_Typ, FS.Win, W_Sect, 1);
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
     (FS     : in out Fat_FS; B_Sect : Long_Integer;
      Format : in out FS_FAT_Format; Max_LBA : out Long_Integer)
      return F_Result is
      use Interfaces;
      Idx          : Long_Integer;
      Num_Clusters : Long_Integer;
      Sector       : Long_Integer;
      Done         : Boolean;
      Result       : F_Result := FR_OK;
   begin
      --  ff.c 3099 Check zero filler
      Idx := BPB_ZeroedEx;
      while Idx < BPB_ZeroedEx + 53 and then FS.Win (Idx) = 0 loop
         Idx := Idx + 1;
      end loop;

      if Idx < BPB_ZeroedEx + 53 then
         Result := FR_NO_FILESYSTEM;

      elsif Load_Word (FS.Win, BPB_FSVerEx) /= 16#100# then
         Result := FR_NO_FILESYSTEM;
         Put_Line
           ("Invalid file  system version: " &
              Word'Image (Load_Word (FS.Win, BPB_FSVerEx)) &
              ".  Version 1.0 is required.");
      elsif BPB_BytsPerSecEx  / 2 /= Sector_Size (FS) then
         --  BPB_BytsPerSecEx equal the physical sector size.
         Result := FR_NO_FILESYSTEM;
         Put_Line ("Invalid file  system sector size.");
      else
         --  ff.c 3112 Set Max_LBA to last LBA + 1 of the volume.
         Max_LBA := Long_Integer (Load_QWord (FS.Win, BPB_TotSecEx)) +
           B_Sect;
         if Max_LBA >= 16#100000000# then
            Result := FR_NO_FILESYSTEM;
            Put_Line
              ("Invalid file system cannot be processed a 32 bit LBA.");
         else
            --  ff.c 3116
            FS.Fat_Size := Load_DWord (FS.Win, BPB_FatSzEx);
            FS.Num_Fats := FS.Win (BPB_NumFATsEx);
            if FS.Num_Fats > 1 then
               Result := FR_NO_FILESYSTEM;
               Put_Line
                 ("Invalid file system, more than one FAT.");
            elsif FS.Win (BPB_SecPerClusEx) / 2 = 0 then
               Result := FR_NO_FILESYSTEM;
               Put ("Invalid file system, Sectors per cluster must be ");
               Put_Line (" in the range 1 through 32768");
            else
               Num_Clusters := Load_DWord (FS.Win, BPB_NumClusEx);
               if Num_Clusters > Long_Integer (MAX_EXFAT) then
                  Result := FR_NO_FILESYSTEM;
                  Put_Line ("Invalid file system, too many clusters. ");
               else
                  --  ff.c 3128
                  FS.Num_Fat_Entries := Long_Integer (Num_Clusters + 2);
                  FS.Volume_Base := B_Sect;
                  FS.Data_Base := B_Sect +
                    Load_DWord (fs.Win, BPB_DataOfsEx);
                  FS.Fat_Base :=
                    B_Sect + Load_DWord (fs.Win, BPB_FatOfsEx);
                  if Max_LBA < FS.Data_Base +
                    Num_Clusters * Long_Integer (FS.Cluster_Size) then
                     Result := FR_NO_FILESYSTEM;
                     Put_Line ("Invalid file system.");
                  else
                     --  ff.c 3137
                     FS.Dir_Base := Load_DWord (FS.Win, BPB_RootClusEx);
                     Sector := Clust2Sec (FS, FS.Dir_Base);
                     if Move_Window (FS, Sector) /= FR_OK then
                        Result := FR_DISK_ERR;
                        Put_Line ("Invalid file system.");
                     else
                        Idx := 0;
                        Done := False;
                        while not Done and then Idx < Sector_Size (FS) loop
                           Done := FS.Win (Idx) = 16#81# and then
                             Load_DWord (FS.Win, Idx + 20) =
                             Long_Integer (2);
                           if not Done then
                              Idx := Idx + SZDIRE;
                           end if;
                        end loop;

                        --  ff.c 3147
                        if Idx = Sector_Size (FS) then
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
         end if;
      end if;

      return Result;

   end Try_EXFAT;

   function Try_Not_EXFAT
     (FS           : in out Fat_FS; B_Sect : Long_Integer;
      Num_Clusters : out Long_Integer) return F_Result is
      use Interfaces;
      FAT_Format  : FS_FAT_Format;
      FA_Size     : Long_Integer;
      Total_Sect  : Long_Integer;
      Num_Reserve : Long_Integer;
      Sysect      : Long_Integer;
      Szb_Fat     : Long_Integer;
      Result      : F_Result := FR_OK;
   begin
      --  ff.c 3159
      if Long_Integer
        (Load_Word (FS.Win, BPB_BytsPerSec)) /=
          Sector_Size (FS) then
         Result := FR_NO_FILESYSTEM;
         Put_Line ("Invalid file system");
         Put ("BPB_BytsPerSec must be equal to the ");
         Put_Line ("physical sector size");
      else
         --  ff.c 3160
         FA_Size := Long_Integer
           (Load_Word (FS.Win, BPB_FATSz16));
         if FA_Size = 0 then
            FA_Size :=
              Load_DWord (FS.Win, BPB_FATSz32);
         end if;

         FS.Fat_Size := FA_Size;
         FS.Num_Fats := fs.Win (BPB_NumFATs);
         if FS.Num_Fats /= 1 and then
           FS.Num_Fats /= 2 then
            Result := FR_NO_FILESYSTEM;
            Put_Line ("Invalid file system");
            Put_Line ("Number of Fats must be 1 or 2");
         else
            --  ff.c 3168
            FA_Size := Long_Integer (FS.Num_Fats);
            FS.Cluster_Size := FS.Win (BPB_SecPerClus);
            if FS.Cluster_Size = 0 or else
              (FS.Cluster_Size and (FS.Cluster_Size - 1)) /= 0 then
               Result := FR_NO_FILESYSTEM;
               Put_Line ("Invalid file system");
               Put_Line ("Cluster_Size must be a power of 2");
            else
               --  ff.c 3174
               FS.Root_Dir_Size :=
                 Long_Integer (Load_Word (FS.Win, BPB_RootEntCnt));
               if (FS.Root_Dir_Size) mod Sector_Size (FS) / SZDIRE
                 /= 0 then
                  Result := FR_NO_FILESYSTEM;
                  Put_Line ("Invalid file system");
                  Put_Line ("Must be sector aligned");
               else
                  Total_Sect :=
                    Long_Integer (Load_Word (FS.Win, BPB_TotSec16));
                  if Total_Sect = 0 then
                     Total_Sect := Load_DWord (FS.Win, BPB_TotSec32);
                  end if;

                  --  ff.c 3182
                  Num_Reserve :=
                    Long_Integer (Load_Word (FS.Win, BPB_RsvdSecCnt));
                  if Num_Reserve = 0 then
                     Result := FR_NO_FILESYSTEM;
                     Put_Line ("Invalid file system");
                     Put_Line ("Num_Reserve is zero.");
                  else
                     --  ff.c 3190
                     Sysect := Num_Reserve + FA_Size +
                       FS.Root_Dir_Size / Sector_Size (FS) / SZDIRE;
                     if Total_Sect < Sysect then
                        Result := FR_NO_FILESYSTEM;
                        Put_Line ("Invalid volume size.");
                     else
                        --  ff.c 3194
                        Num_Clusters := Long_Integer (Total_Sect - Sysect) /
                          Long_Integer (FS.Cluster_Size);
                        if Num_Clusters = 0 then
                           Result := FR_NO_FILESYSTEM;
                           Put_Line ("Invalid Num_Clusters.");
                        else
                           FAT_Format := FS_FAT32;
                        end if;

                        --  ff.c 3198
                        if Num_Clusters <= MAX_FAT12 then
                           FAT_Format := FS_FAT12;
                        elsif Num_Clusters <= MAX_FAT16 then
                           FAT_Format := FS_FAT16;
                        end if;

                        --  ff.c 3204
                        FS.Num_Fat_Entries := Num_Clusters + 2;
                        FS.Volume_Base := B_Sect;
                        FS.Fat_Base := B_Sect + Num_Reserve;
                        FS.Data_Base := B_Sect + Sysect;
                        if FAT_Format = FS_FAT32 then
                           if Load_Word (FS.Win, BPB_FSVer32) /= 0 then
                              Result := FR_NO_FILESYSTEM;
                              Put_Line ("Fat32 version 0.0 is required.");
                           elsif fs.Root_Dir_Size /= 0 then
                              Result := FR_NO_FILESYSTEM;
                              Put_Line ("Root directory size must be 0.");
                           else
                              --  ff.c 3214
                              FS.Dir_Base :=
                                Load_DWord (FS.Win, BPB_RootClus32);
                              Szb_Fat := FS.Num_Fat_Entries;
                           end if;

                           --  ff.c 3219
                        elsif fs.Root_Dir_Size = 0 then
                           Result := FR_NO_FILESYSTEM;
                           Put_Line
                             ("Root directory size must not be 0.");
                        else
                           --  ff.c 3221
                           FS.Dir_Base := FS.Fat_Base + FA_Size;
                           if FAT_Format = FS_FAT16 then
                              Szb_Fat := 2 * FS.Num_Fat_Entries;
                           else
                              Szb_Fat := FS.Num_Fat_Entries * 3 / 2 +
                                Long_Integer
                                  (DWord (FS.Num_Fat_Entries) and 1);
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
                  end if;
               end if;
            end if;
         end if;
      end if;

      return Result;

   end Try_Not_EXFAT;

end Fat_File;
