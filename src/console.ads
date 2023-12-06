
package Console is

   Console_Receive_Buffer_Size  : constant Positive := 256;
   Console_Rx_Buf_Head          : Integer := -1;
   Console_Rx_Buf_Tail          : Integer := -1;

   Console_Transmit_Buffer_Size : constant Positive := 256;
   Console_Tx_Buf_Head          : Integer := -1;
   Console_Tx_Buf_Tail          : Integer := -1;

   procedure Check_Abort;
   function Get_Console return Character;
   function MM_Get_Character return Character;

end Console;
