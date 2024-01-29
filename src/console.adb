
with Audio;
with File_IO;
with Global;
with IO_Support;
with SSD_1963;
with Timers;
with USB;

package body Console is

   Console_Receive_Buffer : String (1 .. Console_Receive_Buffer_Size);
   Prev_Char              : Character := Character'Val (0);

   function Check_Abort return Boolean is
      OK : Boolean := True;
   begin
      USB.USB_Service;
      OK := not Global.MM_Abort;
      if not OK then
         Audio.Close_Audio;
         SSD_1963.Show_Cursor (False);
         Console_Rx_Buf_Head := Console_Rx_Buf_Tail;
         Timers.WD_Timer := 0;
      end if;

      return OK;

   end Check_Abort;

   function Get_Console (aChar : out Character) return Boolean is
      OK : constant Boolean := Check_Abort;
   begin
      aChar := Character'Val (0);

      if OK and then Console_Rx_Buf_Head < Console_Tx_Buf_Tail then
         aChar := Console_Receive_Buffer (Console_Rx_Buf_Tail);
         --  Advance the head of the queue.
         Console_Rx_Buf_Tail :=
           (Console_Rx_Buf_Tail + 1) mod Console_Receive_Buffer_Size;
      end if;

      return OK;

   end Get_Console;

   procedure Init_Serial_Console is
   begin
      null;
   end Init_Serial_Console;

   function MM_Get_Character return Character is
      aChar : Character := Character'Val (0);
      Done  : Boolean := False;
      OK    : Boolean := True;
   begin
      while not Done loop
         --           Process_Touch;
         File_IO.Check_SD_Card;
         SSD_1963.Show_Cursor (True);
         declare
            In_Code : constant String := IO_Support.MM_Inkey (OK);
         begin
            if OK then
               Done := In_Code (1) /= Character'Val (0);
            end if;

            if In_Code'Length = 1 then
               aChar := In_Code (1);
            end if;
         end;
      end loop;

      if aChar = Character'Val (10) or aChar = Character'Val (13) then
         --  CR or LF
         Prev_Char := Character'Val (0);
      end if;

      return aChar;

   end MM_Get_Character;

end Console;
