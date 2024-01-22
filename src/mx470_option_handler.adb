
with Ada.Strings.Unbounded; use Ada.Strings.Unbounded;
with Ada.Text_IO; use Ada.Text_IO;

with Arguments;
with Commands;
with Command_And_Token_Tables;
with Console;
with Evaluation;
with External;
with File_IO;
with Flash;
with Global;
with IO_Ports;
with Keyboard;
with M_Basic; use M_Basic;
with M_Misc;

package body MX470_Option_Handler is

   procedure Save_And_Reset;

   function Get_Arg (Command_Line : String; TP : Positive) return Unbounded_String is
   begin
      return To_Unbounded_String (Slice (To_Unbounded_String (Command_Line),
                                  TP, Command_Line'Length));
   end Get_Arg;

   --  Check_String checks if the next text in an element (a basic statement)
   --  corresponds to an alphabetic string.

   function Do_Console (Command_Line : String) return Boolean is
      use External;
      use IO_Ports;
      use M_Basic.Conversion;
      Routine_Name : constant String := "MX470_Option_Handler.Do_Console ";
      TP           : constant Natural := Check_String (Command_Line, "CONSOLE");
      Found        : constant Boolean := TP > 0;
   begin
--        Put_Line ("Do_Console");
      if Found then
         if Check_String (Command_Line, "OFF") > 0 then
            Flash.Option.SDCARD_CS := 0;
            Flash.Option.SD_CD := 0;
            Flash.Option.SD_WP := 0;
            Flash.Save_Options;

         elsif Check_String (Command_Line, "OFF") > 0 then
            if Current_Line_Ptr /= null then
               Put_Line (Routine_Name & "invalid option in a program.");
               Flash.Option.Serial_Con_Disabled := True;
               Save_And_Reset;
            end if;

         elsif Check_String (Command_Line, "ON") > 0 then
            if Current_Line_Ptr /= null then
               Put_Line (Routine_Name & "invalid option in a program.");
            end if;

            if Ext_Current_Config (Console_Rx_Pin) /= EXT_NOT_CONFIG or else
              Ext_Current_Config (Console_Tx_Pin) /= EXT_NOT_CONFIG then
               Put_Line (Routine_Name & "error: console pins are in use.");
            end if;
            Flash.Option.Serial_Con_Disabled := False;
            Save_And_Reset;

         elsif Check_String (Command_Line, "INVERT") > 0 then
            Flash.Option.Invert := 1;
            Flash.Save_Options;
            Console.Init_Serial_Console;

         elsif Check_String (Command_Line, "NOINVERT") > 0 then
            Flash.Option.Invert := 0;
            Flash.Save_Options;
            Console.Init_Serial_Console;

         elsif Check_String (Command_Line, "AUTO") > 0 then
            Flash.Option.Invert := 2;
            Flash.Save_Options;
            Console.Init_Serial_Console;

         elsif Check_String (Command_Line, "ECHO") > 0 then
            M_Misc.Echo_Option := True;

         elsif Check_String (Command_Line, "NOECHO") > 0 then
            M_Misc.Echo_Option := False;
         end if;
      end if;

      return Found;

   end Do_Console;

   function Do_Controls (Command_Line : String) return Boolean is
      use Evaluation;
      TP    : constant Natural := Check_String (Command_Line, "CONTROLS");
      Found : constant Boolean := TP > 0;
      Arg   : Unbounded_String;
   begin
--        Put_Line ("Do_Controls");
      if Found then
         Arg := Get_Arg (Command_Line, TP);
         Flash.Option.Max_Controls := Get_Int (Arg, 0, 1000) + 1;
         Save_And_Reset;
      end if;

      return Found;

   end Do_Controls;

   function Do_Error (Command_Line : String) return Boolean is
      TP    : constant Natural := Check_String (Command_Line, "ERROR");
      Found : constant Boolean := TP > 0;
   begin
--        Put_Line ("Do_Error");
      if Found then
         if Flash.Option.SDCARD_CS = 0 then
            Put_Line ("SD card has not been configured.");
         end if;

         if Check_String (Command_Line, "CONTINUE") > 0 then
            File_IO.Option_File_Error_Abort := False;
         elsif Check_String (Command_Line, "ABORT") > 0 then
            File_IO.Option_File_Error_Abort := True;
         end if;
      end if;

      return Found;

   end Do_Error;

   function Do_Keyboard (Command_Line : String) return Boolean is
      use Keyboard;
      Found : constant Boolean := Check_String (Command_Line, "KEYBOARD") > 0;
   begin
--        Put_Line ("Do_Keyboard");
      if Found then
         if Check_String (Command_Line, "DISABLE") > 0 then
            Flash.Option.Keyboard_Config := NO_KEYBOARD;
         elsif Check_String (Command_Line, "US") > 0 then
            Flash.Option.Keyboard_Config := CONFIG_US;
         elsif Check_String (Command_Line, "FR") > 0 then
            Flash.Option.Keyboard_Config := CONFIG_FR;
         elsif Check_String (Command_Line, "GR") > 0 then
            Flash.Option.Keyboard_Config := CONFIG_GR;
         elsif Check_String (Command_Line, "IT") > 0 then
            Flash.Option.Keyboard_Config := CONFIG_IT;
         elsif Check_String (Command_Line, "BE") > 0 then
            Flash.Option.Keyboard_Config := CONFIG_BE;
         elsif Check_String (Command_Line, "UK") > 0 then
            Flash.Option.Keyboard_Config := CONFIG_UK;
         elsif Check_String (Command_Line, "ES") > 0 then
            Flash.Option.Keyboard_Config := CONFIG_ES;
         end if;
         Save_And_Reset;
      end if;

      return Found;

   end Do_Keyboard;

   --     function Do_LCD_Panel (Command_Line : String) return Boolean is
   --        use Ada.Characters.Handling;
   --        use Draw;
   --        use String_Buffer_Package;
   --        Routine_Name  : constant String := "OPtion_Handler.Do_LCD_Panel ";
   --        TP            : constant Natural := Check_String (Command_Line, "LCDPANEL");
   --        Found         : constant Boolean := TP > 0;
   --        Arg           : Unbounded_String;
   --     begin
   --        if Found then
   --           Arguments.Get_Args (To_Unbounded_String (Command_Line),TP, 13, ",");
   --           Arg := To_Unbounded_String (Element (Arguments.Arg_V, 1));
   --
   --           if To_Upper (Element (Arguments.Arg_V, 1)) = "USER" then
   --              Assert (Flash.Option.Display_Type > 0, Routine_Name &
   --                        "display has been configured already.");
   --              Assert (Integer (Arguments.Arg_C) = 5, Routine_Name &
   --                        "invalid number of arguments.");
   --              Arg := To_Unbounded_String (Element (Arguments.Arg_V, 2));
   --              Display_H_Res := Get_Int (Arg, 1, 10000);
   --              H_Res := Display_H_Res;
   --              Arg := To_Unbounded_String (Element (Arguments.Arg_V, 4));
   --              Display_V_Res := Get_Int (Arg, 1, 10000);
   --              V_Res := Display_V_Res;
   --              Flash.Option.Display_Type := SPI_LCD.DISP_USER;
   --              --  Setup drawing primitives
   --              Draw_Rectangle_Ptr := Draw_Rectangle_User_Ptr;
   --              Draw_Bit_Map_Ptr := Draw_Bit_Map_User_Ptr;
   --           end if;
   --        end if;
   --
   --        return Found;
   --
   --     end Do_LCD_Panel;

   function Do_List (Command_Line : String) return Boolean is
      use Flash;
--        Routine_Name : constant String := "MX470_Option_Handler.Do_List ";
      Found        : constant Boolean :=
        Check_String (Command_Line, "LIST") > 0;
   begin
--        Put_Line (Routine_Name);
      if Found then
--           Put_Line (Routine_Name & "FOUND");
         if Option.SDCARD_CS > 0 then
            Put ("OPTION SDCARD " & Integer'Image (Option.SDCARD_CS));
            if Option.SD_CD > 0 then
               Put (", " & Integer'Image (Option.SD_CD));

               if Option.SD_WP > 0 then
                  Put (", " & Integer'Image (Option.SD_WP));
               end if;
               New_Line;
            end if;
         end if;
      end if;

      return Found;

   end Do_List;

   function Do_Reset (Command_Line : String) return Boolean is
      Found        : constant Boolean := Check_String (Command_Line, "RESET") > 0;
   begin
      if Found then
         Flash.Reset_All_Options;
         Save_And_Reset;

      end if;

      return Found;

   end Do_Reset;

   function Do_RTC (Command_Line : String) return Boolean is
      use Arguments;
      use Evaluation;
      use Command_And_Token_Tables.String_Buffer_Package;
      TP    : constant Natural := Check_String (Command_Line, "RTC");
      Arg   : Unbounded_String;
      Found : constant Boolean := TP > 0;
   begin
--        Put_Line ("Do_RTC");
      if Found then
--           Put_Line ("Do_RTC found");
         if Check_String (Command_Line, "DISABLE") > 0 then
            Flash.Option.RTC_Clock := 0;
            Flash.Option.RTC_Data := 0;
         else
            Get_Args (To_Unbounded_String (Command_Line), TP, 3 , ",");
            if Integer (Arg_C) = 3 then
               Arg := To_Unbounded_String (Element (Arg_V, 1));
               Flash.Option.RTC_Data := Integer (Get_Integer (Arg));
               External.Check_Pin
                 (Flash.Option.RTC_Data, Commands.Option_Error_Check);
               Arg := To_Unbounded_String (Element (Arg_V, 3));
               Flash.Option.RTC_Clock := Integer (Get_Integer (Arg));
               External.Check_Pin
                 (Flash.Option.RTC_Data, Commands.Option_Error_Check);
               Save_And_Reset;
            else
               Put_Line
                 ("invalid syntax, exactly three arguments are required.");
            end if;
         end if;
      end if;

      return Found;

   end Do_RTC;

   function Do_SD_Card (Command_Line : String) return Boolean is
      TP    : constant Natural := Check_String (Command_Line, "SDCARD");
      Found : constant Boolean := TP > 0;
   begin
--        Put_Line ("Do_SD_Card");
      if Found then
--           Put_Line ("Do_SD_Card found");
         if Check_String (Command_Line, "DISABLE") > 0 then
            Flash.Option.SDCARD_CS := 0;
            Flash.Option.SD_CD := 0;
            Flash.Option.SD_WP := 0;
            Flash.Save_Options;
         else
--              Put_Line ("Do_SD_Card else");
            File_IO.Config_SD_Card (Get_Arg (Command_Line, TP));
         end if;
--           Put_Line ("Do_SD_Card Save_And_Reset");
         Save_And_Reset;
      end if;
--        Put_Line ("Do_SD_Card done");

      return Found;

   end Do_SD_Card;

   --  MiscMX470.c 84
   function Other_Options return Boolean is
      Routine_Name : constant String := "MX470_Option_Handler.Other_Options ";
      Command_Line : constant String := To_String (Global.Command_Line);
      Result       : Boolean := False;
   begin
      Put_Line (Routine_Name & "Command_Line: '" & Command_Line & "'");
      Result :=
        Do_Reset(Command_Line) or else
        Do_Keyboard (Command_Line) or else
        Do_Controls (Command_Line) or else
        Do_SD_Card (Command_Line) or else
        Do_Error (Command_Line) or else
        Do_Console (Command_Line) or else
        Do_RTC (Command_Line) or else
        Do_List (Command_Line);
        Put_Line (Routine_Name & "Done");

      return Result;

   end Other_Options;

   procedure Save_And_Reset is
      use M_Basic.Conversion;
      Routine_Name : constant String := "MX470_Option_Handler.Save_And_Reset ";
   begin
      if Current_Line_Ptr = null and then Flash.Save_Options then
         delay (0.2);
         Put_Line (Routine_Name & "Restart the Micromite");
      end if;

   end Save_And_Reset;

end MX470_Option_Handler;
