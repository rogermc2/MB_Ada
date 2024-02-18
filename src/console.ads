
package Console is

   Console_Receive_Buffer_Size  : constant Positive := 256;
   Console_Rx_Buf_Head          : Integer := -1;
   Console_Rx_Buf_Tail          : Integer := -1;

   Console_Transmit_Buffer_Size : constant Positive := 256;
   Console_Tx_Buf_Head          : Integer := -1;
   Console_Tx_Buf_Tail          : Integer := -1;

   function Check_Abort return Boolean;
   function Get_Console (aChar : out Character) return Boolean;
   procedure Init_Serial_Console;
   function MM_Get_Character return Character;

end Console;
