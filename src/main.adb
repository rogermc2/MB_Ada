
with System;

with Interfaces.C; use Interfaces.C;

with Ada.Strings.Unbounded; use Ada.Strings.Unbounded;
with Ada.Text_IO; use Ada.Text_IO;

with Audio;
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
   Startup_Token   : constant Unbounded_String :=
                       To_Unbounded_String ("MM.Startup");
--     Tokens          : M_Basic.UB_String_Buffer;
   Tokens          : Unbounded_String;
   Saved_Cause     : Setup_Exception := Cause_Nothing;
   Watchdog_Set    : Boolean := False;
   Basic_Running   : Boolean := True;
   Error_In_Prompt : Boolean := False;

begin
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

   SPI_LCD.Init_Display_SPI (False);
   File_IO.Init_File_IO;
   Keyboard.Init_Keyboard;

   if Flash.Option.RTC_Data /= 0 then
      I2C.RTC_Get_Time;
   end if;

   Touch.Init_Touch;

   if Except_Cause /= Cause_MM_Startup then
      M_Basic.Clear_Program;
      M_Basic.Prepare_Program (True);
      M_Basic.Token_Buffer := Null_Unbounded_String;
      Append (M_Basic.Token_Buffer, Startup_Token);
      if M_Basic.Find_Subfunction (Startup_Token, 0) /= Null_Address then
         Append (M_Basic.Token_Buffer, Startup_Token);
         Append (M_Basic.Token_Buffer, To_Unbounded_String ("/0"));
         M_Basic.Execute_Program (M_Basic.Token_Buffer);
      end if;
   end if;

   --  Autorun code

   Except_Cause := Cause_Nothing;
   Process_Commands (M_Basic.Token_Buffer);
--     Put_Line (To_String (Tokens (1)));

end Main;
