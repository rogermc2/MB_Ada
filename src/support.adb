
with Ada.Text_IO; use Ada.Text_IO;

with Audio;
with Command_And_Token_Tables; use Command_And_Token_Tables;
with Configuration;
with Draw;
with Exceptions;
with File_IO;
with Flash;
with Global;
with I2C;
with Keyboard;
with M_Basic;
with M_Misc;
with Memory;
with Misc_MX470;
with SPI_LCD;
with SSD_1963;
with Touch;
with Watchdog_Timer;

package body Support is

   Saved_Cause  : Setup_Exception := Cause_Nothing;

   procedure Copy_Slice (Pos1 : in out Positive; Pos2 : Positive) is
   begin
      Token_Buffer_Append (Get_Input_Slice (Pos1, Pos2));
      while Pos1 <= Pos2 loop
         Pos1 := Pos1 + 1;
      end loop;

   end Copy_Slice;

   procedure Do_PIN is
   begin
      null;
   end Do_PIN;

   procedure Initialize is
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
   end Initialize;

   procedure Process_Commands is
   begin
      if Flash.Option.DISPLAY_CONSOLE then
         Draw.Set_Font (Global.Prompt_Font);
         Draw.GUI_Fcolour := Global.Prompt_Fcolour;
         Draw.GUI_Bcolour := Global.Prompt_Bcolour;
         if Draw.Current_X /= 0 then
            --  Prompt should be on a new line.
            New_Line;
         end if;
      end if;

      if M_Basic.Current_Line_Ptr > 0 then
         Audio.Close_Audio;
         Audio.Vol_Left := 100;
         Audio.Vol_Right := 100;
      end if;

      Global.MM_Abort := False;
      Global.Break_Key := Configuration.BREAK_KEY;
      M_Misc.Echo_Option := True;
      M_Basic.Local_Index := 0;  --  Should not be needed but ensures that all
      Memory.Clear_Temp_Memory;  --  space will be cleared.
      M_Basic.Current_Line_Ptr := 0;

      if Global.MM_Char_Pos > 1 then
         --  Prompt should be on a new line.
         New_Line;
      end if;

      while Flash.Option.PIN /= 0 and not Global.Ignore_PIN loop
         Do_PIN;
      end loop;

      --  300
      Global.Except_Code := Exceptions.EXCEP_IRQ;
      M_Basic.Prepare_Program (False);

   end Process_Commands;

   procedure Restart is
   begin
      null;
   end Restart;

   procedure Setup is
   begin
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

   end Setup;

end Support;
