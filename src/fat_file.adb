
with Interfaces;

with Ada.Assertions;
with Ada.Characters.Handling;
with Ada.Strings.Fixed;
with Ada.Text_IO; use Ada.Text_IO;

with Flat_File_Configuration; use Flat_File_Configuration;

package body Fat_File is

   --  Offset of partition table in the MBR
   MBR_Table              : constant Positive := 446;
   BPD_Zeroed_Ex          : constant Long_Integer := 11;   --  EXFAT: MBZ field
   --  EXFAT: File system version
   BPB_FS_Ver_EX          : constant Long_Integer := 104;
   BPD_Byts_Per_Sector_Ex : constant Long_Integer := 108;
   PTE_Size               : constant Positive := 16;
   PTE_System_ID          : constant Long_Integer := 4;
   --  MBR PTE: Start in LBA
   PTE_St_Lba             : constant Long_Integer := 8;
   BS_55AA                : constant Long_Integer := 510;  --  Signature word

   Current_Vol            : Natural := 0;
   Fat_File_Sys           : array (0 .. Num_Volumes - 1) of Fat_FS;

   function Get_Logical_Drive_Num (Path : String) return Natural;
   function LD2PD (Vol : Natural) return Natural;

   function Load_DWord (Data : Byte_Array; Ptr : Long_Integer) return DWord;
   function Load_QWord (Data : Byte_Array; Ptr : Long_Integer) return QWord;
   function Load_Word (Data : Byte_Array; Ptr : Long_Integer) return Word;
   function Move_Window (FS : in out Fat_FS; Sector :in out  Long_Integer)
                         return F_Result;

   function Check_File_System (FS : in out Fat_FS; Sect : in out Long_Integer)
                               return Natural is
      use Interfaces;
      Result : Natural := 2;
   begin
      FS.Win_Flag := False;
      FS.Win_Sector := Long_Integer (16#FFFFFFFF#);
      if Move_Window (FS, Sect) /= FR_OK then
         Result := 4;
         --        elsif Load_Word (FS.Win + BS_55AA) /= 16#AA55# then
      elsif Load_Word (FS.Win, BS_55AA) /= 16#AA55# then
         null;
      end if;

      return Result;

   end Check_File_System;

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
         CFS.FS_Type := 0;
         FS.FS_Type := 0;
         Fat_File_Sys (Vol) := FS;
         if Opt /= 1 then
            Result := FR_OK;
         else
            Res := Find_Volume (Path, FS, Mode);
         end if;
      end if;

      return Result;

   end F_Mount;

   --  Find_Volume_Aux attempts to mount a volume for which the file system
   --  object is not valid.
   --  It analyzes the BPB and initializes the fs object.
   function Find_Volume_Aux
     (Path : String; FS : in out Fat_FS; Vol_ID : Integer; Mode : in out Word)
      return F_Result is
      use Interfaces;
      use Disk_IO;
      B_Sect    : Long_Integer := 0;
      Format    : Natural;
      Part_Ptr  : Long_Integer := 0;
      BR        : array (1 .. 4) of Long_Integer := (others => 0);
      BR_Index  : Positive;
      bpb_index : Long_Integer;
      Max_LBA   : QWord := 0;
      Status    : D_Status;
      Result    : F_Result := FR_OK;
   begin
      FS.FS_Type := 0;
      --  Bind the logical drive to a physical drive.
      FS.Drive_Num := LD2PD (Vol_ID);
      --  Initialize the physical drive.
      Status := Disk_Initialize (FS.Drive_Typ);
      if Status = STA_NOINIT then
         Result := FR_NOT_READY;
      elsif FS_Read_Only and then Mode = 0 and then
        Status =STA_PROTECT then
         Result := FR_WRITE_PROTECTED;
      else
         Format := Check_File_System (FS, B_Sect);
         if Format = 2 or else (Format < 2 and LD2PD (Vol_ID) /= 0) then
            --  Not a FAT-VBR or forced partition number
            for idx in 0 .. 3 loop
               --  Get partition offset
               Part_Ptr :=
                 Long_Integer (MBR_Table + idx * PTE_Size);
               if FS.Win (Part_Ptr + PTE_System_ID) > 0 then
                  BR (idx + 1) := Long_Integer
                    (Load_DWord (FS.Win, Part_Ptr + PTE_St_Lba));
               end if;
               BR_Index := LD2PD (Vol_ID);
               if BR_Index > 2 then
                  BR_Index := BR_Index - 1;
               end if;
               loop
                  if BR (BR_Index) > 0 then
                     Format := Check_File_System (FS, BR (BR_Index));
                  else
                     Format := 3;
                  end if;
                  BR_Index := BR_Index + 1;
                  exit when LD2PD (Vol_ID) = 0 and then
                    Format >= 2 and then BR_Index < 5;
               end loop;
            end loop;

         end if;  --  Format = 2 ,,

         if Format = 4 then
            Result := FR_DISK_ERR;
         elsif Format >= 2 then
            Result := FR_NO_FILESYSTEM;
         elsif FS_EXFAT and then Format = 1 then
            --  Check zero filler
            bpb_index := BPD_Zeroed_Ex;
            while bpb_index < BPD_Zeroed_Ex + 53 and then
              FS.Win (bpb_index) = 0 loop
               bpb_index := bpb_index + 1;
            end loop;
            if bpb_index < BPD_Zeroed_Ex + 53  then
               Result := FR_NO_FILESYSTEM;
            end if;
         elsif Load_Word (FS.Win, BPB_FS_Ver_EX) /= 16#100# then
            Result := FR_NO_FILESYSTEM;
            Put_Line
              ("Invalid file  system version: " &
                 Word'Image (Load_Word (FS.Win, BPB_FS_Ver_EX)) &
                 ".  Version 1.0 is required.");
         elsif Load_Word (FS.Win, BPD_Byts_Per_Sector_Ex) /= SS (FS) then
            Result := FR_NO_FILESYSTEM;

         end if;
      end if;

      return Result;

   end Find_Volume_Aux;

   function Find_Volume (Path : String; RFS : in out Fat_FS;
                         Mode : in out Word) return F_Result is
      use Interfaces;
      use Disk_IO;
      Vol_ID   : constant Integer := Get_Logical_Drive_Num (Path);
      F_READ   : constant Word := FA_Status'Enum_Rep (FA_READ);
      FS       : Fat_FS;
      B_Sect   : Long_Integer := 0;
      Format   : Natural := 0;
      Part_Ptr : Long_Integer := 0;
      BR       : array (1 .. 4) of Long_Integer := (others => 0);
      BR_Index : Positive;
      Status   : D_Status;
      Result   : F_Result;
   begin
      if Vol_ID < 0 then
         Result := FR_INVALID_DRIVE;
      else --  Vol_ID >= 0
         FS := Fat_File_Sys (Vol_ID);
         RFS := FS;
         Mode := Mode and (not F_READ);
         if FS.FS_Type > 0 then
            Status := Disk_Status (FS.Drive_Typ);
            if not FS_Read_Only and then Mode /= 0 and then
              Status = STA_PROTECT then
               Result := FR_WRITE_PROTECTED;
            else
               Result := FR_OK;
            end if;
         else
            FS.FS_Type := 0;
            FS.Drive_Num := LD2PD (Vol_ID);
            Status := Disk_Initialize (FS.Drive_Typ);
            if Status = STA_NOINIT then
               Result := FR_NOT_READY;
            elsif FS_Read_Only and then Mode = 0 and then
              Status =STA_PROTECT then
               Result := FR_WRITE_PROTECTED;
            else
               Format := Check_File_System (FS, B_Sect);
               if Format = 2 or else (Format < 2 and LD2PD (Vol_ID) /= 0) then
                  --  Not a FAT-VBR or forced partition number
                  for idx in 0 .. 3 loop
                     --  Get partition offset
                     Part_Ptr :=
                       Long_Integer (MBR_Table + idx * PTE_Size);
                     if FS.Win (Part_Ptr + PTE_System_ID) > 0 then
                        BR (idx + 1) := Long_Integer
                          (Load_DWord (FS.Win, Part_Ptr + PTE_St_Lba));
                     end if;
                  end loop;

                  BR_Index := LD2PD (Vol_ID);
                  if BR_Index > 2 then
                     BR_Index := BR_Index - 1;
                  end if;
                  loop
                     if BR (BR_Index) > 0 then
                        Format := Check_File_System (FS, BR (BR_Index));
                     else
                        Format := 3;
                     end if;
                     BR_Index := BR_Index + 1;
                     exit when LD2PD (Vol_ID) = 0 and then
                       Format >= 2 and then BR_Index < 5;
                  end loop;
               end if;
            end if;
         end if;  --  FS.FS_Type > 0

         Result := Find_Volume_Aux (Path, FS, Vol_ID, Mode);
      end if;  --  Vol_ID >= 0

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

end Fat_File;
