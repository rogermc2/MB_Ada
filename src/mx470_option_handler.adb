
with Ada.Assertions; use Ada.Assertions;
--  with Ada.Characters.Handling;
with Ada.Strings.Unbounded; use Ada.Strings.Unbounded;
with Ada.Text_IO; use Ada.Text_IO;

--  with Arguments;
with Commands;
--  with Command_And_Token_Tables; use Command_And_Token_Tables;
with Console;
--  with Draw;
with Evaluation; use Evaluation;
with Flash;
with Global;
with M_Basic; use M_Basic;
--  with SPI_LCD;

package body MX470_Option_Handler is

   function Get_Arg (E_String : String; TP : Positive) return Unbounded_String is
   begin
      return To_Unbounded_String (Slice (To_Unbounded_String (E_String),
                                  TP, E_String'Length));
   end Get_Arg;

   function Do_Autorun (E_String : String) return Boolean is
      Found : constant Boolean := Check_String (E_String, "AUTORUN") > 0;
   begin
      if Found then
         if Check_String (E_String, "ON") > 0 then
            Flash.Option.Autorun := True;
            Flash.Save_Options;
         elsif
           Check_String (E_String, "OFF") > 0 then
            Flash.Option.Autorun := False;
            Flash.Save_Options;
         end if;
      end if;

      return Found;

   end Do_Autorun;

   function Do_Baud_Rate (E_String : String) return Boolean is
      TP    : constant Natural := Check_String (E_String, "BAUDRATE");
      Found : constant Boolean := TP > 0;
      Arg   : Unbounded_String;
   begin
      if Found then
         Arg := Get_Arg (E_String, TP);
         Flash.Option.Baud_Rate :=
           Get_Int (Arg, 100, Global.Bus_Speed / 130);
         Flash.Save_Options;
         Console.Init_Serial_Console;
      end if;

      return Found;

   end Do_Baud_Rate;

   function Do_Case (E_String : String) return Boolean is
      Found : constant Boolean := Check_String (E_String, "CASE") > 0;
   begin
      if Found then
         if Check_String (E_String, "LOWER") > 0 then
            Flash.Option.List_Case := Commands.CONFIG_LOWER;
            Flash.Save_Options;
         elsif
           Check_String (E_String, "UPPER") > 0 then
            Flash.Option.List_Case := Commands.CONFIG_UPPER;
            Flash.Save_Options;
         elsif
           Check_String (E_String, "TITLE") > 0 then
            Flash.Option.List_Case := Commands.CONFIG_TITLE;
            Flash.Save_Options;
         end if;
      end if;

      return Found;

   end Do_Case;

   function Do_Colour_Code (E_String : String) return Boolean is
      TP    : constant Natural := Check_String (E_String, "COLOURCODE");
      Found : constant Boolean := TP > 0;
   begin
      if Found then
         if Check_String (E_String, "ON") > 0 then
            Flash.Option.Colour_Code := True;
            Flash.Save_Options;
         elsif
           Check_String (E_String, "OFF") > 0 then
            Flash.Option.Colour_Code := False;
            Flash.Save_Options;
         end if;
      end if;

      return Found;

   end Do_Colour_Code;

   function Do_Reset (E_String : String) return Boolean is
      Found        : constant Boolean := Check_String (E_String, "RESET") > 0;
   begin
      if Found then
         Flash.Reset_All_Options;
         --  gotot saveandreset
      end if;

      return Found;

   end Do_Reset;

   function Do_Save (E_String : String) return Boolean is
      Found : constant Boolean := Check_String (E_String, "SAVE") > 0;
   begin
      if Found and then Current_Line_Ptr /= 0 then
         Flash.Save_Options;
      end if;

      return Found;

   end Do_Save;

   function Do_Tab (E_String : String) return Boolean is
      Found : constant Boolean := Check_String (E_String, "TAB") > 0;
   begin
      if Found then
         if Check_String (E_String, "2") > 0 then
            Flash.Option.Tab := 2;
            Flash.Save_Options;
         elsif Check_String (E_String, "4") > 0 then
            Flash.Option.Tab := 4;
            Flash.Save_Options;
         elsif Check_String (E_String, "8") > 0 then
            Flash.Option.Tab := 8;
            Flash.Save_Options;
         end if;
      end if;

      return Found;

   end Do_Tab;

   --  MiscMX470.c 84
   procedure Other_Options is
      Routine_Name : constant String := "OPtion_Handler.Option_Cmd ";
      E_String     : constant String := To_String (Global.E_UB_String);
      Done         : Boolean := False;
   begin
      Put_Line (Routine_Name & "E_String: '" & E_String & "'");
      --  Check_String checks if the next text in an element (a basic statement)
      --  corresponds to an alphabetic string.

      Done :=
        Do_Reset(E_String) or else
        Do_Autorun (E_String) or else
        Do_Case (E_String) or else
        Do_Tab (E_String) or else
        Do_Baud_Rate (E_String) or else
        Do_Colour_Code (E_String) or else
        Do_Save (E_String);

      Assert (Done, Routine_Name & "unrecognized option " & E_String);

   end Other_Options;

end MX470_Option_Handler;
