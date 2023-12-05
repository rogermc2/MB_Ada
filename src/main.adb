
with File_IO;
with Flash;
with I2C;
with Keyboard;
with Main_Support; use Main_Support;
with M_Basic;
with Misc_MX470;
with P32mx470f512h;
with SPI_LCD;
with Touch;
with Watchdog_Timer;

procedure Main is
   Ignore_PIN      : Boolean := False;
   Watchdog_Set    : Boolean := False;
   Basic_Running   : Boolean := True;
   Error_In_Prompt : Boolean := False;

begin
   Watchdog_Timer.Clear_Event_WDT;
   Misc_MX470.Init_Processor;
   M_Basic.Init_Basic;

   if P32mx470f512h.RCON = 64 then
      Process_RCON_64;
   else
--        if Debug_Mode then
--           null;
--        else
         M_Basic.Print_String ("Ada Port Of Micromite Plus MMBasic");
--        end if;
   end if;

   SPI_LCD.Init_Display (False);
   File_IO.Init_File_IO;
   Keyboard.Init_Keyboard;

   if Flash.Option.RTC_Data /= 0 then
      I2C.RTC_Get_Time
   end if;


end Main;
