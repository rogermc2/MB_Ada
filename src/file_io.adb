
with Ada.Assertions; use Ada.Assertions;
with Arguments;

--  with Command_And_Token_Tables; use Command_And_Token_Tables;
--  with Commands;
with Evaluation;
--  with External;
with Flash;

package body File_IO is

   procedure Check_SDCard is
   begin
      null;
   end Check_SDCard;

   procedure Config_SD_Card (Arg_String : Unbounded_String) is
      use Arguments;
      use Evaluation;
      --        use String_Buffer_Package;
      --        use Var_Package;
      Routine_Name : constant String := "File_IO.Config_SD_Card ";
      Arg          : Unbounded_String := To_Unbounded_String (Arg_V (1));
      Arg_Val      : Integer := Integer (Get_Integer (Arg));
      --        Pin_Check    : Integer;
   begin
      Get_Args (Arg_String, 1, 5, ",");
      Assert (Integer (Arg_C) > 0 and then Integer (Arg_C) <= 5,
              Routine_Name & "invalid number of arguments:" &
                Integer'Image (Integer (Arg_C)) &
                ", 1 to 5 arguments are required.");
      Flash.Option.SD_CD := 0;
      Flash.Option.SD_WP := 0;
      --        Pin_Check := External.Check_Pin (Arg_1_Val, Commands.Option_Error_Check);
      Flash.Option.SDCARD_CS := Arg_Val;

      if Integer (Arg_C) > 2 then
         Arg := To_Unbounded_String (Arg_V (3));
         Arg_Val := Integer (Get_Integer (Arg));
         --        Pin_Check := External.Check_Pin (abs (Arg_3_Val), Commands.Option_Error_Check);
         Flash.Option.SD_CD := Arg_Val;
      end if;

      if Integer (Arg_C) = 5 then
         Arg := To_Unbounded_String (Arg_V (5));
         Arg_Val := Integer (Get_Integer (Arg));
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

end File_IO;
