
with File_IO;
with Main_Support;
with SSD_1963;

package body Console is

   Console_Receive_Buffer : String (1 .. Console_Receive_Buffer_Size);
   Prev_Char              : Character := Character'Val (0);

   procedure Check_Abort is
   begin
      null;
   end Check_Abort;

   function Get_Console return Character is
      aChar : Character := Character'Val (0);
   begin
         Check_Abort;
         aChar := Console_Receive_Buffer (Console_Rx_Buf_Tail);

      return aChar;

   end Get_Console;

   function MM_Get_Character return Character is
      aChar : Character := Character'Val (0);
      Done  : Boolean := False;
   begin
      while not Done loop
         --           Process_Touch;
         File_IO.Check_SDCard;
         SSD_1963.Show_Cursor (True);
         aChar := Main_Support.MM_Inkey;
         Done := aChar /= Character'Val (0);
      end loop;

      if aChar = Character'Val (10) or aChar = Character'Val (13) then
         Prev_Char := Character'Val (0);
      end if;

      return aChar;

   end MM_Get_Character;

end Console;
