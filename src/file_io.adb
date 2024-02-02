
with Ada.Assertions; use Ada.Assertions;
with Ada.Containers;
with Ada.Text_IO; use Ada.Text_IO;

with Arguments;

with Disk_IO;
with Fat_File;
with Flash;
with Global;
with MMC_Pic32;
with Serial_File_IO;
--  with Support;

package body File_IO is

   FS : Fat_File.Fat_FS;

   procedure Check_SD_Card is
   begin
      null;
   end Check_SD_Card;

   procedure Config_SD_Card (Command_Line : String_Buffer) is
      use Ada.Containers;
      use Arguments;
      Routine_Name : constant String := "File_IO.Config_SD_Card ";
      Args         : String_Buffer := Command_Line;
      Arg_Data     : Arguments_Record;
      Arg_Val      : Integer := 0;
      --        Pin_Check    : Integer;
   begin
      --  File_IO 107
      Args.Delete_First;
      --  File_IO 109
      Arg_Data := Get_Args (Args, 1, 5, ",");

      Assert (Arg_Data.Arg_V.Length > 0, Routine_Name & "Arg_V is empty");
      Arg_Val := Integer'Value (Arg_Data.Arg_Buffer (Arg_Data.Arg_V (1)));
      Assert (Arg_Data.Arg_C > 0 and then Arg_Data.Arg_C <= 5,
              Routine_Name & "invalid number of arguments:" &
                Integer'Image (Arg_Data.Arg_C) &
                ", 1 to 5 arguments are required.");

      --  File_IO 113
      Flash.Option.SD_CD := 0;
      Flash.Option.SD_WP := 0;
      --        Pin_Check := External.Check_Pin (Arg_1_Val, Commands.Option_Error_Check);
      --  File_IO 115
      Flash.Option.SDCARD_CS := Arg_Val;

      if Arg_Data.Arg_C > 2 then
         Arg_Val := Integer'Value (Arg_Data.Arg_Buffer (Arg_Data.Arg_V (3)));
         --        Pin_Check := External.Check_Pin (abs (Arg_3_Val), Commands.Option_Error_Check);
         Flash.Option.SD_CD := Arg_Val;
      end if;

      if Arg_Data.Arg_C = 5 then
         Arg_Val := Integer'Value (Arg_Data.Arg_Buffer (Arg_Data.Arg_V (5)));
         --        Pin_Check := External.Check_Pin (abs (Arg_3_Val), Commands.Option_Error_Check);
         Flash.Option.SD_WP := Arg_Val;
      end if;

   end Config_SD_Card;

--     function File_Get_Character (File_Num : Positive) return Character is
--     begin
--        return Character'Val (0);
--
--     end File_Get_Character;

   procedure Init_File_IO is
   begin
      null;
   end Init_File_IO;

   function Init_SD_Card return Boolean is
      use Disk_IO;
      use Fat_File;
      use MMC_Pic32;
      use Serial_File_IO;
      Routine_Name : constant String := "File_IO.Init_SD_Card ";
      OK       : Boolean := Global.Bus_Speed >= 30000000;
   begin
      if not OK then
         Put_Line ("CPU speed is to low.");
      elsif Flash.Option.SDCARD_CS = 0 then
         Put_Line ("The SD card has not been configured.");
         OK := False;
      elsif not MMC_Pic32.MDD_SDSPI_Card_Detect_State then
         Put_Line (To_String (F_Error_Message (2)));
         OK := False;
      elsif SD_Card_Stat = STA_NOINIT then
         OK := True;
      else
         for index in 1 .. Max_Open_Files loop
            if File_Table (index).Com > Max_Com_Ports then
               if File_Table (index).Name /= Null_Unbounded_String then
                  Close (File_Table (index).File_ID);
               end if;
            end if;
         end loop;

         OK := F_Mount (FS, "", 1) = FR_OK;
         if not OK then
            Put_Line (Routine_Name & "SD card failed to mount.");
         end if;
      end if;

      return OK;

   end Init_SD_Card;

end File_IO;
