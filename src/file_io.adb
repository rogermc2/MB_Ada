
with Ada.Assertions; use Ada.Assertions;
with Ada.Containers;
--  with Ada.Text_IO; use Ada.Text_IO;

with Arguments;

with Flash;
--  with Support;

package body File_IO is

   procedure Check_SDCard is
   begin
      null;
   end Check_SDCard;

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

   function File_Get_Character (File_Num : Positive) return Character is
   begin
      return Character'Val (0);

   end File_Get_Character;

   procedure Init_File_IO is
   begin
      null;
   end Init_File_IO;

   function Init_SDCard return Boolean is
      OK : Boolean := False;
   begin
      return OK;

   end Init_SDCard;

end File_IO;
