
with Ada.Text_IO; use Ada.Text_IO;

with Audio;
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

   procedure Buffer_Append (Buffer : in out String_Buffer; Item : String) is
      use String_Buffer_Package;
   begin
      Append (Buffer, Item);

   end Buffer_Append;

   function Buffer_Item (Buffer : String_Buffer;
                         Pos    : Positive) return String is
      use String_Buffer_Package;
   begin
      return Element (Buffer, Pos);

   end Buffer_Item;
   function Buffer_Length (Buffer : String_Buffer) return Natural is
   begin
      return Natural (Buffer.Length);

   end Buffer_Length;

   function Buffer_Not_Empty (Buffer : String_Buffer) return Boolean is
      use String_Buffer_Package;
   begin
      return not Is_Empty (Buffer);

   end Buffer_Not_Empty;

   procedure Clear_Buffer (Buffer : in out String_Buffer) is
      use String_Buffer_Package;
      begin
      Buffer := Empty_Vector;

   end Clear_Buffer;

   procedure Copy_Slice (Buffer : in out String_Buffer;
                         Pos1   : in out Positive; Pos2 : Positive) is
   begin
      Buffer_Append (Buffer, Get_Input_Slice (Pos1, Pos2));
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

   procedure Print_Buffer (Buffer : String_Buffer) is
      use String_Buffer_Package;
   begin
      for index in Buffer.First_Index .. Buffer.Last_Index loop
         Put (Element (Buffer, index) & " ");
      end loop;
      New_Line;

   end Print_Buffer;

   procedure Process_Commands is
--        Routine_Name : constant String := "Support.Process_Commands";
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

--        Put_Line (Routine_Name & "Current_Line_Ptr: " &
--                    Integer'Image (M_Basic.Current_Line_Ptr));

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

   procedure Skip_Spaces (Buffer : String_Buffer; Pos : in out Positive) is
      use String_Buffer_Package;
   begin
      while  Element (Buffer, Pos)(1) = ' ' loop
         Pos := Pos + 1;
      end loop;

   end Skip_Spaces;

   --  Skip_Element skips to the the zero char that preceeds an element
   procedure Skip_Buffer_Element (Buffer : String_Buffer;
                                  Pos    : in out Positive) is
      --        Routine_Name : constant String :=
      --                         "Command_And_Token_Tables.Skip_Token_Buffer_Element";
      use String_Buffer_Package;
   begin
      while Pos <= Integer (Buffer.Length) and then
        Buffer (Pos)(1) /= '0' loop
         Pos := Pos + 1;
      end loop;

   end Skip_Buffer_Element;

   procedure Skip_Buffer_Spaces (Buffer : in out String_Buffer;
                                 Pos    : in out Positive) is
      use String_Buffer_Package;
   begin
      while Pos <= Integer (Length (Buffer)) and then
        Element (Buffer, Pos)(1) = ' ' loop
         Pos := Pos + 1;
      end loop;

   end Skip_Buffer_Spaces;

end Support;
