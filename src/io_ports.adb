
with PPS;

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

   procedure PWM_Ch1_Close is
      use PPS;
   begin
         PPS_Output ("4", "RPB0", Character'Image (ASCII.NUL));

   end PWM_Ch1_Close;

   procedure PWM_Ch2_Close is
      use PPS;
   begin
         PPS_Output ("2", "RPB1", Character'Image (ASCII.NUL));

   end PWM_Ch2_Close;

   procedure PWM_Ch3_Close is
      use PPS;
   begin
         PPS_Output ("3", "RPB2", Character'Image (ASCII.NUL));

   end PWM_Ch3_Close;

   procedure PWM_Ch4_Close is
      use PPS;
   begin
         PPS_Output ("1", "RPB15", Character'Image (ASCII.NUL));

   end PWM_Ch4_Close;

   procedure PWM_Ch5_Close is
      use PPS;
   begin
         PPS_Output ("3", "RPB13", Character'Image (ASCII.NUL));

   end PWM_Ch5_Close;

   procedure SPI_PPS_Close is
      use PPS;
   begin
         PPS_Output ("4", "RPG9", Character'Image (ASCII.NUL));

   end SPI_PPS_Close;

   procedure SPI2_PPS_Close is
      use PPS;
   begin
      if Has_100_Pins then
         PPS_Output ("1", "RPG8", Character'Image (ASCII.NUL));
      else
         PPS_Output ("2", "RPG8", Character'Image (ASCII.NUL));
         end if;

   end SPI2_PPS_Close;

end IO_Ports;
