
with Ada.Strings.Unbounded; use Ada.Strings.Unbounded;
with Ada.Text_IO; use Ada.Text_IO;

with Evaluation;
with File_IO;
with Flash;
with Global;
with Keyboard;
with M_Basic; use M_Basic;

package body MX470_Option_Handler is

   function Get_Arg (E_String : String; TP : Positive) return Unbounded_String is
   begin
      return To_Unbounded_String (Slice (To_Unbounded_String (E_String),
                                  TP, E_String'Length));
   end Get_Arg;

   --  Check_String checks if the next text in an element (a basic statement)
   --  corresponds to an alphabetic string.

   function Do_Controls (E_String : String) return Boolean is
      use Evaluation;
      TP    : constant Natural := Check_String (E_String, "CONTROLS");
      Found : constant Boolean := TP > 0;
      Arg   : Unbounded_String;
   begin
      if Found then
         Arg := Get_Arg (E_String, TP);
         Flash.Option.Max_Controls := Get_Int (Arg, 0, 1000) + 1;
         Flash.Save_Options;
      end if;

      return Found;

   end Do_Controls;

   function Do_Keyboard (E_String : String) return Boolean is
      use Keyboard;
      Found : constant Boolean := Check_String (E_String, "KEYBOARD") > 0;
   begin
      if Found then
         if Check_String (E_String, "DISABLE") > 0 then
            Flash.Option.Keyboard_Config := NO_KEYBOARD;
         elsif Check_String (E_String, "US") > 0 then
            Flash.Option.Keyboard_Config := CONFIG_US;
         elsif Check_String (E_String, "FR") > 0 then
            Flash.Option.Keyboard_Config := CONFIG_FR;
         elsif Check_String (E_String, "GR") > 0 then
            Flash.Option.Keyboard_Config := CONFIG_GR;
         elsif Check_String (E_String, "IT") > 0 then
            Flash.Option.Keyboard_Config := CONFIG_IT;
         elsif Check_String (E_String, "BE") > 0 then
            Flash.Option.Keyboard_Config := CONFIG_BE;
         elsif Check_String (E_String, "UK") > 0 then
            Flash.Option.Keyboard_Config := CONFIG_UK;
         elsif Check_String (E_String, "ES") > 0 then
            Flash.Option.Keyboard_Config := CONFIG_ES;
         end if;
         Flash.Save_Options;
      end if;

      return Found;

   end Do_Keyboard;

   function Do_Reset (E_String : String) return Boolean is
      Found        : constant Boolean := Check_String (E_String, "RESET") > 0;
   begin
      if Found then
         Flash.Reset_All_Options;
         --  gotot saveandreset
      end if;

      return Found;

   end Do_Reset;

   function Do_SD_Card (E_String : String) return Boolean is
      TP    : constant Natural := Check_String (E_String, "SDCARD");
      Found : constant Boolean := TP > 0;
   begin
      if Found then
         if Check_String (E_String, "DISABLR") > 0 then
            Flash.Option.SDCARD_CS := 0;
            Flash.Option.SD_CD := 0;
            Flash.Option.SD_WP := 0;
            Flash.Save_Options;
         else
            File_IO.Config_SD_Card (Get_Arg (E_String, TP));
         end if;
      end if;

      return Found;

   end Do_SD_Card;

   --  MiscMX470.c 84
   function Other_Options return Boolean is
      Routine_Name : constant String := "MX470_Option_Handler.Other_Options ";
      E_String     : constant String := To_String (Global.E_UB_String);
      Result       : Boolean := False;
   begin
      Put_Line (Routine_Name & "E_String: '" & E_String & "'");
      Result :=
        Do_Reset(E_String) or else
        Do_Keyboard (E_String) or else
        Do_Controls (E_String) or else
        Do_SD_Card (E_String);

      return Result;

   end Other_Options;

end MX470_Option_Handler;
