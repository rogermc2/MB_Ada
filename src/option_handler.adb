
with Interfaces;

with Ada.Assertions; use Ada.Assertions;
with Ada.Characters.Handling;
with Ada.Strings.Unbounded; use Ada.Strings.Unbounded;
with Ada.Text_IO; use Ada.Text_IO;

with Arguments;
with Commands;
with Command_And_Token_Tables; use Command_And_Token_Tables;
with Console;
with Draw;
with Evaluation; use Evaluation;
with External;
with Flash;
with Global;
with M_Basic; use M_Basic;
with M_Misc; use M_Misc;
with MX470_Option_Handler;
with SPI_LCD;
with Support;

package body Option_Handler is

--     function Get_Arg (Command_Line : String; TP : Positive) return Unbounded_String is
--     begin
--        return To_Unbounded_String (Slice (To_Unbounded_String (Command_Line),
--                                    TP, Command_Line'Length));
--     end Get_Arg;

   function Do_Autorun (Command_Line : String_Buffer) return Boolean is
      use String_Buffer_Package;
      Found : constant Boolean :=
        Check_String (Element (Command_Line, 1), "AUTORUN");
   begin
      if Found then
         if Check_String (Element (Command_Line, 2), "ON") then
            Flash.Option.Autorun := True;
            Flash.Save_Options;
         elsif
           Check_String (Element (Command_Line, 2), "OFF") then
            Flash.Option.Autorun := False;
            Flash.Save_Options;
         end if;
      end if;

      return Found;

   end Do_Autorun;

   function Do_Baud_Rate (Command_Line : String_Buffer) return Boolean is
      use String_Buffer_Package;
--        TP    : constant Natural := Check_String (Command_Line, "BAUDRATE");
--        Found : constant Boolean := TP > 0;
      Found : constant Boolean :=
        Check_String (Element (Command_Line, 1), "BAUDRATE");
      Arg   : Unbounded_String;
   begin
      if Found then
--           Arg := Get_Arg (Command_Line, TP)
         Arg := To_Unbounded_String (Element (Command_Line, 2));
         Flash.Option.Baud_Rate :=
           Get_Int (Arg, 100, Global.Bus_Speed / 130);
         Flash.Save_Options;
         Console.Init_Serial_Console;
      end if;

      return Found;

   end Do_Baud_Rate;

   function Do_Case (Command_Line : String_Buffer) return Boolean is
      use String_Buffer_Package;
      Found : constant Boolean :=
        Check_String (Element (Command_Line, 1), "CASE");
   begin
      if Found then
         if Check_String (Element (Command_Line, 2), "LOWER") then
            Flash.Option.List_Case := Commands.CONFIG_LOWER;
            Flash.Save_Options;
         elsif
           Check_String (Element (Command_Line, 2), "UPPER") then
            Flash.Option.List_Case := Commands.CONFIG_UPPER;
            Flash.Save_Options;
         elsif
           Check_String (Element (Command_Line, 2), "TITLE") then
            Flash.Option.List_Case := Commands.CONFIG_TITLE;
            Flash.Save_Options;
         end if;
      end if;

      return Found;

   end Do_Case;

   function Do_Colour_Code (Command_Line : String_Buffer) return Boolean is
      use String_Buffer_Package;
--        TP    : constant Natural := Check_String (Command_Line, "COLOURCODE");
--        Found : constant Boolean := TP > 0;
      Found : constant Boolean :=
        Check_String (Element (Command_Line, 1), "COLOURCODE");
   begin
      if Found then
         if Check_String (Element (Command_Line, 2), "ON") then
            Flash.Option.Colour_Code := True;
            Flash.Save_Options;
         elsif
           Check_String (Element (Command_Line, 2), "OFF") then
            Flash.Option.Colour_Code := False;
            Flash.Save_Options;
         end if;
      end if;

      return Found;

   end Do_Colour_Code;

   function Do_Default (Command_Line : String_Buffer) return Boolean is
      use String_Buffer_Package;
      Found : constant Boolean :=
        Check_String (Element (Command_Line, 1), "DEFAULT");
   begin
      if Found then
         if Check_String (Element (Command_Line, 2), "INTEGER") then
            Arguments.Default_Type := T_INT;
         elsif Check_String (Element (Command_Line, 2), "FLOAT") then
            Arguments.Default_Type := T_NBR;
         elsif Check_String (Element (Command_Line, 2), "STRING") then
            Arguments.Default_Type := T_STR;
         elsif Check_String (Element (Command_Line, 2), "NONE") then
            Arguments.Default_Type := T_NOTYPE;
         end if;
      end if;

      return Found;

   end Do_Default;

   function Do_Display (Command_Line : String_Buffer) return Boolean is
      use Arguments.Arg_Package;
      use String_Buffer_Package;
      Routine_Name : constant String := "Option_Handler.Do_Display ";
--        TP           : constant Natural := Check_String (Command_Line, "BAUDRATE");
--        Found        : constant Boolean := TP > 0;
      Found        : constant Boolean :=
        Check_String (Element (Command_Line, 1), "BAUDRATE");
      Arg          : Unbounded_String;
   begin
      if Found then
--           Arguments.Get_Args (To_Unbounded_String (Command_Line), TP, 3, ",");
         Arguments.Get_Args
           (To_Unbounded_String (Element (Command_Line, 2)), 2, 3, ",");
         Assert (not Flash.Option.DISPLAY_CONSOLE, Routine_Name &
                   "DISPLAY, LCD console cannot be Changed ");

         Arg := To_Unbounded_String (Element (Arguments.Arg_V, 1));
         Flash.Option.Height := Get_Int (Arg, 5, 100);

         if Integer (Arguments.Arg_C) = 3 then
            Arg := To_Unbounded_String  (Element (Arguments.Arg_V, 2));
            Flash.Option.Width := Get_Int (Arg, 37, 132);
            Flash.Save_Options;
         end if;
      end if;

      return Found;

   end Do_Display;

   function Do_LCD_Panel (Command_Line : String_Buffer) return Boolean is
      use Ada.Characters.Handling;
      use Arguments;
      use Draw;
      use String_Buffer_Package;
      Routine_Name  : constant String := "Option_Handler.Do_LCD_Panel ";
--        TP            : constant Natural := Check_String (Command_Line, "LCDPANEL");
--        Found         : constant Boolean := TP > 0;
      Found         : constant Boolean :=
        Check_String (Element (Command_Line, 1), "LCDPANEL");
      Arg           : Unbounded_String;
   begin
      if Found then
         Arguments.Get_Args
           (To_Unbounded_String (Element (Command_Line, 2)), 2, 13, ",");
         Arg := To_Unbounded_String (Arg_Buffer (Arg_V (1)));

         if To_Upper (Arg_Buffer (Arg_V (1))) = "USER" then
            Assert (Flash.Option.Display_Type > 0, Routine_Name &
                      "display has been configured already.");
            Assert (Integer (Arguments.Arg_C) = 5, Routine_Name &
                      "invalid number of arguments.");
            Arg := To_Unbounded_String (Arg_Buffer (Arg_V (2)));
            Display_H_Res := Get_Int (Arg, 1, 10000);
            H_Res := Display_H_Res;
            Arg := To_Unbounded_String (Arg_Buffer (Arg_V (4)));
            Display_V_Res := Get_Int (Arg, 1, 10000);
            V_Res := Display_V_Res;
            Flash.Option.Display_Type := SPI_LCD.DISP_USER;
            --  Setup drawing primitives
            Draw_Rectangle_Ptr := Draw_Rectangle_User_Ptr;
            Draw_Bit_Map_Ptr := Draw_Bit_Map_User_Ptr;
         end if;
      end if;

      return Found;

   end Do_LCD_Panel;

   function Do_PIN (Command_Line : String_Buffer) return Boolean is
      use String_Buffer_Package;
--        TP           : constant Natural := Check_String (Command_Line, "PIN");
--        Found        : constant Boolean := TP > 0;
      Found        : constant Boolean :=
        Check_String (Element (Command_Line, 1), "PIN");
      Arg          : Unbounded_String;
   begin
      if Found then
         Arg := To_Unbounded_String (Element (Command_Line, 2));
         Flash.Option.PIN := Get_Int (Arg, 0, 99999999);
         Flash.Save_Options;
      end if;

      return Found;

   end Do_PIN;

   function Do_Save (Command_Line : String_Buffer) return Boolean is
      use M_Basic.Conversion;
      use String_Buffer_Package;
      Found : constant Boolean := Check_String (Element (Command_Line, 1), "SAVE");
   begin
      if Found and then Current_Line_Ptr /= null then
         Flash.Save_Options;
      end if;

      return Found;

   end Do_Save;

   function Do_Tab (Command_Line : String_Buffer) return Boolean is
      use String_Buffer_Package;
      Found : constant Boolean := Check_String (Element (Command_Line, 1), "TAB");
   begin
      if Found then
         if Check_String (Element (Command_Line, 2), "2") then
            Flash.Option.Tab := 2;
            Flash.Save_Options;
         elsif Check_String (Element (Command_Line, 2), "4") then
            Flash.Option.Tab := 4;
            Flash.Save_Options;
         elsif Check_String (Element (Command_Line, 2), "8") then
            Flash.Option.Tab := 8;
            Flash.Save_Options;
         end if;
      end if;

      return Found;

   end Do_Tab;

   --  MM_Misc.c 268
   procedure Option_Cmd is
      use Interfaces;
      use Global;
      use M_Basic.Conversion;
      use String_Buffer_Package;
      Routine_Name : constant String := "Option_Handler.Option_Cmd ";
      --        Command_Line : constant String := To_String (Global.Command_Line);
      Subfunction  : constant String := Element (Command_Line, 1);
--        TP           : Natural;
      Arg          : Unbounded_String;
      Done         : Boolean := False;
   begin
--        Put_Line (Routine_Name & "Command_Line: '" & Command_Line & "'");
      Put_Line (Routine_Name & "Command_Line:");
      Support.Print_Buffer (Command_Line);
--        Assert (Length (Global.Command_Line) > 0, Routine_Name &
      Assert (Integer (Command_Line.Length) > 0, Routine_Name &
                "called with empty Global.Command_Line");
      Commands.Option_Error_Check := External.CP_IGNORE_INUSE;
      if Current_Line_Ptr /= null then
         Commands.Option_Error_Check :=
           Commands.Option_Error_Check or External.CP_NOABORT;
      end if;

      --  Check_String checks if the next text in an element (a basic statement)
      --  corresponds to an alphabetic string.
--        TP := Check_String (Command_Line, "BASE");
--        TP := Check_String (Subfunction, "BASE");
--        if TP > 0 then
      if Check_String (Subfunction, "BASE") then
         Assert (not Commands.Dim_Used, Routine_Name &
                   "BASE Option must be before DIM or LOCAL");
         Option_Base := Get_Int (Element (Command_Line, 2), 0, 1);
--           Option_Base := Get_Int (Global.Command_Line, 0, 1);
         Done := True;

--        elsif Check_String (Command_Line, "EXPLICIT") > 0 then
      elsif Check_String (Subfunction, "EXPLICIT") then
         Assert (Arguments.Var_Count = 0, Routine_Name &
                   "EXPLICIT variables have been defined already.");
         Arguments.Option_Explicit := True;
         Done := True;

      elsif not Do_Default (Command_Line) then
         if Check_String (Subfunction, "BREAK") then
            Arg := To_Unbounded_String (Element (Command_Line, 2));
            Global.Break_Key := Integer (Get_Integer (Arg));
            Done := True;
         end if;
      end if;

      Done := Done or else Do_Autorun (Command_Line) or else
        Do_Case (Command_Line) or else
        Do_Tab (Command_Line) or else
        Do_Baud_Rate (Command_Line) or else
        Do_Display (Command_Line) or else
        Do_PIN (Command_Line) or else
        Do_Colour_Code (Command_Line) or else
        Do_LCD_Panel (Command_Line) or else
        Do_Save (Command_Line);

      if not Done then
         Done := MX470_Option_Handler.Other_Options;
      end if;

      Assert (Done, Routine_Name & "unrecognized option " & Subfunction);

   end Option_Cmd;

end Option_Handler;
