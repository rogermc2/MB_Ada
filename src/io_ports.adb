
package body IO_Ports is

   Num_Pins_64_Chip  : constant Positive := 64;
   Num_Pins_100_Chip : constant Positive := 100;

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

   function Num_Pins return Positive is
   begin
      if Has_100_Pins then
         return Num_Pins_100_Chip;
      else
         return Num_Pins_64_Chip;
      end if;

   end Num_Pins;

end IO_Ports;
