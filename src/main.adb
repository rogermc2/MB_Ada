
with Interfaces.C; use Interfaces.C;

with Audio;
with Configuration;
with Draw;
with Exceptions;
with File_IO;
with Flash;
with Global;
with I2C;
with Keyboard;
with Main_Support; use Main_Support;
with M_Basic;
with M_Misc;
with Misc_MX470;
with P32mx470f512h;
with SPI_LCD;
with SSD_1963;
with Touch;
with Watchdog_Timer;

procedure Main is
   Except_Code     : Exceptions.Exception_Code;
   Except_Cause    : Setup_Exception := Cause_Nothing;
   Saved_Cause     : Setup_Exception := Cause_Nothing;
   Break_Key       : Integer := Configuration.BREAK_KEY;
   MM_Char_Pos     : Positive := 1;
   MM_Abort        : Boolean := False;
   Ignore_PIN      : Boolean := False;
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
      M_Basic.Print_String ("Ada Port Of Micromite Plus MMBasic");
      M_Basic.Print_String ("\r\n");
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
      if M_Basic.Find_Subfunction ("MM_Startup", 0) >= 0 then
         M_Basic.Execute_Program ("MM_Startup");
      end if;
   end if;

   --  Autorun code

   Except_Cause := Cause_Nothing;

   loop
      if Flash.Option.DISPLAY_CONSOLE then
         Draw.Set_Font (Global.Prompt_Font);
         Draw.GUI_Fcolour := Global.Prompt_Fcolour;
         Draw.GUI_Bcolour := Global.Prompt_Bcolour;
         if Draw.Current_X /= 0 then
            --  Prompt should be on a new line.
            M_Basic.Print_String ("\r\n");
         end if;
      end if;

      if M_Basic.Current_Line_Ptr > 0 then
         Audio.Close_Audio;
         Audio.Vol_Left := 100;
         Audio.Vol_Right := 100;
      end if;

      MM_Abort := False;
      Break_Key := Configuration.BREAK_KEY;
      M_Misc.Echo_Option := True;
      M_Basic.Local_Index := 0;  --  Should not be needed but ensures that all
      --  space will be cleared.
      M_Basic.Current_Line_Ptr := 0;
      if MM_Char_Pos > 1 then
         --  Prompt should be on a new line.
         M_Basic.Print_String ("\r\n");
      end if;

      while Flash.Option.PIN /= 0 and not Ignore_PIN loop
         Do_PIN;
      end loop;

      Except_Code := Exceptions.EXCEP_IRQ;
      M_Basic.Prepare_Program (False);

   end loop;


end Main;
