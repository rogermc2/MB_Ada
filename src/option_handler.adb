
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
with Flash;
with Global;
with M_Basic; use M_Basic;
with M_Misc; use M_Misc;
with SPI_LCD;

package body Option_Handler is

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

   function Do_Default (E_String : String) return Boolean is
      Found : constant Boolean := Check_String (E_String, "DEFAULT") > 0;
   begin
      if Found then
         if Check_String (E_String, "INTEGER") > 0 then
            Arguments.Default_Type := T_INT;
         elsif Check_String (E_String, "FLOAT") > 0 then
            Arguments.Default_Type := T_NBR;
         elsif Check_String (E_String, "STRING") > 0 then
            Arguments.Default_Type := T_STR;
         elsif Check_String (E_String, "NONE") > 0 then
            Arguments.Default_Type := T_NOTYPE;
         end if;
      end if;

      return Found;

   end Do_Default;

   function Do_Display (E_String : String) return Boolean is
      use String_Buffer_Package;
      Routine_Name : constant String := "OPtion_Handler.Do_Display ";
      TP           : constant Natural := Check_String (E_String, "BAUDRATE");
      Found        : constant Boolean := TP > 0;
      Arg          : Unbounded_String;
   begin
      if Found then
         Arguments.Get_Args (To_Unbounded_String (E_String),TP, 3, ",");
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

   function Do_LCD_Panel (E_String : String) return Boolean is
      use Ada.Characters.Handling;
      use Draw;
      use String_Buffer_Package;
      Routine_Name  : constant String := "OPtion_Handler.Do_LCD_Panel ";
      TP            : constant Natural := Check_String (E_String, "LCDPANEL");
      Found         : constant Boolean := TP > 0;
      Arg           : Unbounded_String;
   begin
      if Found then
         Arguments.Get_Args (To_Unbounded_String (E_String),TP, 13, ",");
         Arg := To_Unbounded_String (Element (Arguments.Arg_V, 1));

         if To_Upper (Element (Arguments.Arg_V, 1)) = "USER" then
            Assert (Flash.Option.Display_Type > 0, Routine_Name &
                      "display has been configured already.");
            Assert (Integer (Arguments.Arg_C) = 5, Routine_Name &
                      "invalid number of arguments.");
            Arg := To_Unbounded_String (Element (Arguments.Arg_V, 2));
            Display_H_Res := Get_Int (Arg, 1, 10000);
            H_Res := Display_H_Res;
            Arg := To_Unbounded_String (Element (Arguments.Arg_V, 4));
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

   function Do_PIN (E_String : String) return Boolean is
      TP           : constant Natural := Check_String (E_String, "PIN");
      Found        : constant Boolean := TP > 0;
      Arg          : Unbounded_String;
   begin
      if Found then
         Arg := Get_Arg (E_String, TP);
         Flash.Option.PIN := Get_Int (Arg, 0, 99999999);
         Flash.Save_Options;
      end if;

      return Found;

   end Do_PIN;

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

   --  MM_Misc.c 268
   procedure Option_Cmd is
      Routine_Name : constant String := "OPtion_Handler.Option_Cmd ";
      E_String     : constant String := To_String (Global.E_UB_String);
      TP           : Natural;
      Arg          : Unbounded_String;
      Done         : Boolean := False;
   begin
      Put_Line (Routine_Name & "E_String: '" & E_String & "'");
      --  Check_String checks if the next text in an element (a basic statement)
      --  corresponds to an alphabetic string.
      TP := Check_String (E_String, "BASE");
      if TP > 0 then
         Assert (not Commands.Dim_Used, Routine_Name &
                   "BASE Option must be before DIM or LOCAL");
         Option_Base := Get_Int (Global.E_UB_String, 0, 1);
         Done := True;

      elsif Check_String (E_String, "EXPLICIT") > 0 then
         Assert (Arguments.Var_Count = 0, Routine_Name &
                   "EXPLICIT variables have been defined already.");
         Arguments.Option_Explicit := True;
         Done := True;

      elsif not Do_Default (E_String) then
         TP := Check_String (E_String, "BREAK");
         if TP > 0 then
            Arg := Get_Arg (E_String, TP);
            Global.Break_Key := Integer (Get_Integer (Arg));
            Done := True;
         end if;
      end if;

      Done := Done or else Do_Autorun (E_String) or else
        Do_Case (E_String) or else
        Do_Tab (E_String) or else
        Do_Baud_Rate (E_String) or else
        Do_Display (E_String) or else
        Do_PIN (E_String) or else
        Do_Colour_Code (E_String) or else
        Do_LCD_Panel (E_String);

      Assert (Done, Routine_Name & "unrecognized option " & E_String);

   end Option_Cmd;

end Option_Handler;
