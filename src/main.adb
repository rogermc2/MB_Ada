
with System;

with Interfaces.C; use Interfaces.C;

with Ada.Strings.Unbounded; use Ada.Strings.Unbounded;
with Ada.Text_IO; use Ada.Text_IO;

with Audio;
with Command_And_Token_Tables; use Command_And_Token_Tables;
with Configuration;
with Draw;
with Editor;
with Exceptions;
with File_IO;
with Flash;
with Global;
with I2C;
with Keyboard;
with M_Basic;
with M_Misc;
with Misc_MX470;
with P32mx470f512h;
with SPI_LCD;
with SSD_1963;
with Support; use Support;
with Touch;
with Watchdog_Timer;

procedure Main is
   use System;
   use String_Buffer_Package;
   Program_Name    : constant String := "Main ";
   Startup_Token   : constant String := "MM.Startup";
   Saved_Cause     : Setup_Exception := Cause_Nothing;
   Watchdog_Set    : Boolean := False;
   Basic_Running   : Boolean := True;
   Error_In_Prompt : Boolean := False;
begin
   --  140
   Watchdog_Timer.Clear_Event_WDT;
   Misc_MX470.Init_Processor;
   M_Basic.Init_Basic;

   if Except_Cause /= Cause_Display then
      Saved_Cause := Except_Cause;
      Except_Cause := Cause_Display;
      --  Setup the SSD display early in case it is being used
      --  as the console output.
      SSD_1963.Init_Display_SSD;
      Except_Cause := Saved_Cause;
      Saved_Cause := Cause_Nothing;
   end if;

   if P32mx470f512h.RCON = 64 then
      Restart;
   else
      --        if Debug_Mode then
      --           null;
      --        else
      Put_Line ("Ada Port Of Micromite Plus MMBasic");
      --        M_Basic.Print_String ("Ada Port Of Micromite Plus MMBasic");
      --        M_Basic.Print_String ("\r\n");
      --        end if;
   end if;

   Except_Cause := Cause_Display;
   SPI_LCD.Init_Display_SPI (False);

   Except_Cause := Cause_File_IO;
   File_IO.Init_File_IO;
   Except_Cause := Cause_Keyboard;
   Keyboard.Init_Keyboard;

   Except_Cause := Cause_RTC;
   if Flash.Option.RTC_Data /= 0 then
      I2C.RTC_Get_Time;
   end if;

   Except_Cause := Cause_Touch;
   Touch.Init_Touch;

   --  298
   if Except_Cause /= Cause_MM_Startup then
      M_Basic.Clear_Program;
      M_Basic.Prepare_Program (True);

      Except_Cause := Cause_MM_Startup;
      Clear_Token_Buffer;
      Token_Buffer_Append (Startup_Token);

      --  311
      if M_Basic.Find_Subfunction (Startup_Token, T_NOTYPE) /= 0 then
         Put_Line (Program_Name  & "Startup_Token found");
         Token_Buffer_Append (Startup_Token);
         Token_Buffer_Append ("/0");
         M_Basic.Execute_Program;
      else
         Put_Line (Program_Name &
                     "Startup_Token not found,Token_Buffer_Length: " &
                     Integer'Image (Token_Buffer_Length));
         Put_Line (Program_Name & "Token_Buffer (1): " &
                     Get_Token_Buffer_Item (1));
      end if;
   end if;

   --  Autorun code

   Except_Cause := Cause_Nothing;
   Put_Line (Program_Name  & "Process_Commands");
   Process_Commands;

exception
   when others =>
      Put_Line (Program_Name);

end Main;
