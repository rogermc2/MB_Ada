
package body IO_Ports is

   function Console_Rx_Pin return Positive is
   begin
      --  This is UART1
      if Has_100_Pins then
         return 89;
      else
         return 6;
      end if;

   end Console_Rx_Pin;

   function Console_Tx_Pin return Positive is
   begin
      if Has_100_Pins then
         return 87;
      else
         return 58;
      end if;

   end Console_Tx_Pin;

end IO_Ports;
