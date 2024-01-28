
with Ada.Assertions;
with Ada.Characters.Handling;
with Ada.Strings.Fixed;
--  with Ada.Strings.Unbounded; use Ada.Strings.Unbounded;
--  with Ada.Text_IO; use Ada.Text_IO;

with Flat_File_Configuration; use Flat_File_Configuration;

package body Fat_File is

   Current_Vol  : Natural := 0;
   Fat_File_Sys : array (0 .. Num_Volumes - 1) of Fat_FS;

   function Get_Logical_Drive_Num (Path : String) return Natural;
   function LD2PD (Vol : Natural) return Natural;

   function Find_Volume (Path : String; RFS : in out Fat_FS;
                         Mode : in out Interfaces.Unsigned_16)
                         return F_Result is
      use Disk_IO;
      Vol_ID  : constant Integer := Get_Logical_Drive_Num (Path);
      FS      : Fat_FS;
      B_Sect  : Natural := 0;
      Format  : Natural := 0;
      Status  : D_Status;
      Result  : F_Result;
   begin
      if Vol_ID < 0 then
         Result := FR_INVALID_DRIVE;
      else
         FS := Fat_File_Sys (Vol_ID);
         RFS := FS;
         Mode := Mode and (not FA_READ);
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
            end if;
         end if;
      end if;

      return Result;

   end Find_Volume;

   function F_Mount (FS : in out Fat_FS; Path : String; Opt : Integer)
                     return F_Result is
      --        Routine_Name : constant String := "Fat_File.F_Mount ";
      Vol      : constant Integer := Get_Logical_Drive_Num (Path);
      CFS      : Fat_FS;
      Path_Pos : Positive := 1;
      Mode     : Unsigned_16 := 0;
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

   function Get_Logical_Drive_Num (Path : String) return Natural is
      use Ada.Characters.Handling;
      use Ada.Strings.Fixed;
      use Flat_File_Configuration;
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
      if Multi_Partition then
         Assert (False, "Fat_File.LD2PD, Vol_To_Part not implmented");
      else
         return Vol;
      end if;

      end LD2PD;

end Fat_File;
