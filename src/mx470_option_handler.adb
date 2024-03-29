
with Interfaces;

with Ada.Containers;
with Ada.Strings.Unbounded; use Ada.Strings.Unbounded;
with Ada.Text_IO; use Ada.Text_IO;

with Arguments;
with Commands;
with Command_And_Token_Tables; use Command_And_Token_Tables;
with Configuration;
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
with Support;

package body MX470_Option_Handler is

   Restart_Exception : Exception;
   UIOTGSTAT         : constant Interfaces.Unsigned_16 := 0;

   procedure Save_And_Reset;

   function Get_Arg (Command_Line : String_Buffer; TP : Positive)
                     return Unbounded_String is
      use String_Buffer_Package;
   begin
      return To_Unbounded_String (Element (Command_Line, TP));

   end Get_Arg;

   --  Check_String checks if the next text in an element (a basic statement)
   --  corresponds to an alphabetic string.

   function Do_Console (Subfunction : String_Buffer) return Boolean is
      use External;
      use IO_Ports;
      use M_Basic.Conversion;
      use String_Buffer_Package;
      Routine_Name : constant String := "MX470_Option_Handler.Do_Console ";
      Found        : constant Boolean :=
        Check_String (Element (Subfunction, 1), "CONSOLE");
   begin
      if Found then
         if Check_String (Element (Subfunction, 2), "OFF") then
            Flash.Option.SDCARD_CS := 0;
            Flash.Option.SD_CD := 0;
            Flash.Option.SD_WP := 0;
            Flash.Save_Options;

         elsif Check_String (Element (Subfunction, 2), "OFF") then
            if Current_Line_Ptr /= null then
               Put_Line (Routine_Name & "invalid option in a program.");
               Flash.Option.Serial_Con_Disabled := True;
               Save_And_Reset;
            end if;

         elsif Check_String (Element (Subfunction, 2), "ON") then
            if Current_Line_Ptr /= null then
               Put_Line (Routine_Name & "invalid option in a program.");
            end if;

            if Ext_Current_Config (Console_Rx_Pin) /= EXT_NOT_CONFIG or else
              Ext_Current_Config (Console_Tx_Pin) /= EXT_NOT_CONFIG then
               Put_Line (Routine_Name & "error: console pins are in use.");
            end if;
            Flash.Option.Serial_Con_Disabled := False;
            Save_And_Reset;

         elsif Check_String (Element (Subfunction, 2), "INVERT") then
            Flash.Option.Invert := 1;
            Flash.Save_Options;
            Console.Init_Serial_Console;

         elsif Check_String (Element (Subfunction, 2), "NOINVERT") then
            Flash.Option.Invert := 0;
            Flash.Save_Options;
            Console.Init_Serial_Console;

         elsif Check_String (Element (Subfunction, 2), "AUTO") then
            Flash.Option.Invert := 2;
            Flash.Save_Options;
            Console.Init_Serial_Console;

         elsif Check_String (Element (Subfunction, 2), "ECHO") then
            M_Misc.Echo_Option := True;

         elsif Check_String (Element (Subfunction, 2), "NOECHO") then
            M_Misc.Echo_Option := False;
         end if;
      end if;

      return Found;

   end Do_Console;

   function Do_Controls (Command_Line : String_Buffer) return Boolean is
      use Evaluation;
      use String_Buffer_Package;
      Found : constant Boolean :=
        Check_String (Element (Command_Line, 1), "CONTROLS");
      Arg   : Unbounded_String;
   begin
      if Found then
         Arg := Get_Arg (Command_Line, 1);
         Flash.Option.Max_Controls := Get_Int (Arg, 0, 1000) + 1;
         Save_And_Reset;
      end if;

      return Found;

   end Do_Controls;

   function Do_Error (Subfunction : String_Buffer) return Boolean is
      use String_Buffer_Package;
      Found : constant Boolean := Check_String (Element (Subfunction, 1), "ERROR");
   begin
      if Found then
         if Flash.Option.SDCARD_CS = 0 then
            Put_Line ("SD card has not been configured.");
         end if;

         if Check_String (Element (Subfunction, 2), "CONTINUE") then
            File_IO.Option_File_Error_Abort := False;
         elsif Check_String (Element (Subfunction, 2), "ABORT") then
            File_IO.Option_File_Error_Abort := True;
         end if;
      end if;

      return Found;

   end Do_Error;

   function Do_Keyboard (Command_Line : String_Buffer) return Boolean is
      use Keyboard;
      use String_Buffer_Package;
      Found : constant Boolean :=
        Check_String (Element (Command_Line, 1), "KEYBOARD");
   begin
      if Found then
         if Check_String (Element (Command_Line, 2), "DISABLE") then
            Flash.Option.Keyboard_Config := NO_KEYBOARD;
         elsif Check_String (Element (Command_Line, 2), "US") then
            Flash.Option.Keyboard_Config := CONFIG_US;
         elsif Check_String (Element (Command_Line, 2), "FR") then
            Flash.Option.Keyboard_Config := CONFIG_FR;
         elsif Check_String (Element (Command_Line, 2), "GR") then
            Flash.Option.Keyboard_Config := CONFIG_GR;
         elsif Check_String (Element (Command_Line, 2), "IT") then
            Flash.Option.Keyboard_Config := CONFIG_IT;
         elsif Check_String (Element (Command_Line, 2), "BE") then
            Flash.Option.Keyboard_Config := CONFIG_BE;
         elsif Check_String (Element (Command_Line, 2), "UK") then
            Flash.Option.Keyboard_Config := CONFIG_UK;
         elsif Check_String (Element (Command_Line, 2), "ES") then
            Flash.Option.Keyboard_Config := CONFIG_ES;
         end if;
         Save_And_Reset;
      end if;

      return Found;

   end Do_Keyboard;

   --     function Do_LCD_Panel (Command_Line : String_Buffer) return Boolean is
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

   function Do_List (Command_Line : String_Buffer) return Boolean is
      use Flash;
      use String_Buffer_Package;
      --        Routine_Name : constant String := "MX470_Option_Handler.Do_List ";
      Found        : constant Boolean :=
        Check_String (Element (Command_Line, 1), "LIST");
      Sub_Found    : Boolean := False;
   begin
      if Found then
         Sub_Found := Option.SDCARD_CS > 0;
         if Sub_Found then
            Put ("OPTION SDCARD " & Integer'Image (Option.SDCARD_CS));
            if Option.SD_CD > 0 then
               Put (", " & Integer'Image (Option.SD_CD));

               if Option.SD_WP > 0 then
                  Put (", " & Integer'Image (Option.SD_WP));
               end if;
            end if;
            New_Line;
         end if;

         if Option.Autorun then
            Sub_Found := True;
            Put_Line ("Option.Autorun not implemented.");
         end if;

         if Option.Serial_Con_Disabled then
            Sub_Found := True;
            Put_Line ("Option.Serial_Con_Disabled not implemented.");
         else
            if Option.Baud_Rate /= Configuration.CONSOLE_BAUDRATE then
               Sub_Found := True;
               Put_Line ("Option.Baud_Rate not implemented.");
            end if;
            if Option.Invert = 1 then
               Sub_Found := True;
               Put_Line ("Option.Invert not implemented.");
            end if;
            if Option.Invert = 2 then
               Sub_Found := True;
               Put_Line ("Option.Console.Auto not implemented.");
            end if;
         end if;

         if not Sub_Found then
            Put_Line ("No options are set.");
         end if;
      end if;

      return Found;

   end Do_List;

   function Do_Reset (Command_Line : String_Buffer) return Boolean is
      use String_Buffer_Package;
      Found        : constant Boolean :=
        Check_String (Element (Command_Line, 1), "RESET");
   begin
      if Found then
         Flash.Reset_All_Options;
         Save_And_Reset;
      end if;

      return Found;

   end Do_Reset;

   function Do_RTC (Command_Line : String_Buffer) return Boolean is
      use Arguments;
      use Evaluation;
      use String_Buffer_Package;
      Arg_Data : Arguments_Record;
      Arg      : Unbounded_String;
      Found    : constant Boolean :=
        Check_String (Element (Command_Line, 1), "RTC");
   begin
      if Found then
         if Check_String (Element (Command_Line, 2), "DISABLE") then
            Flash.Option.RTC_Clock := 0;
            Flash.Option.RTC_Data := 0;
         else
            Arg_Data :=
              Get_Args (Command_Line, 1, 3 , ",");
            if Arg_Data.Arg_C = 3 then
               Arg :=
                 To_Unbounded_String (Arg_Data.Arg_Buffer (Arg_Data.Arg_V (1)));
               Flash.Option.RTC_Data := Integer (Get_Integer (Arg));
               External.Check_Pin
                 (Flash.Option.RTC_Data, Commands.Option_Error_Check);
               Arg :=
                 To_Unbounded_String (Arg_Data.Arg_Buffer (Arg_Data.Arg_V (3)));
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

   function Do_SD_Card (Command_Line : String_Buffer) return Boolean is
      use Ada.Containers;
      use String_Buffer_Package;
      --        Routine_Name : constant String := "MXX470_Option_Handler.Do_SD_Card ";
      Found : constant Boolean :=
        Check_String (Element (Command_Line, 1), "SDCARD");
   begin
      if Found and then Length (Command_Line) > 1 then
         if Check_String (Element (Command_Line, 2), "DISABLE") then
            Flash.Option.SDCARD_CS := 0;
            Flash.Option.SD_CD := 0;
            Flash.Option.SD_WP := 0;
            Flash.Save_Options;
         else
            File_IO.Config_SD_Card (Command_Line);
         end if;

         Save_And_Reset;
      end if;

      return Found;

   end Do_SD_Card;

   --  MiscMX470.c 84
   function Other_Options return Boolean is
      use Global;
      use String_Buffer_Package;
      --        Routine_Name : constant String := "MX470_Option_Handler.Other_Options ";
      Subfunction  : String_Buffer := Command_Line;
      Result       : Boolean := False;
   begin
      Delete_First (Subfunction);
      Result :=
        Do_Reset(Command_Line) or else
        Do_Keyboard (Command_Line) or else
        Do_Controls (Command_Line) or else
        Do_SD_Card (Command_Line) or else
        Do_Error (Command_Line) or else
        Do_Console (Command_Line) or else
        Do_RTC (Command_Line) or else
        Do_List (Command_Line);

      return Result;

   end Other_Options;

   procedure Save_And_Reset is
      use Interfaces;
      use M_Basic.Conversion;
      use Support;
      Routine_Name : constant String := "MX470_Option_Handler.Save_And_Reset ";
   begin
      if Current_Line_Ptr = null and then Flash.Save_Options then
         delay (0.2);
         if (UIOTGSTAT and 1) > 0 then
            Put_Line (Routine_Name);
            Put_Line ("Please restart the Micromite");
         else
            Except_Code := RESTART_NO_AUTORUN;
            --              C_Functions.Soft_Reset;
            Put_Line ("Restart");
            raise Restart_Exception;
            --              Support.Restart;
         end if;
      end if;

   exception
      when Restart_Exception => Support.Execute_MM_Basic;
      when others => Put_Line (Routine_Name);

   end Save_And_Reset;

end MX470_Option_Handler;
