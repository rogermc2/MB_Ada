
with PPS;

package body IO_Ports is

   Num_Pins_64_Chip  : constant Positive := 64;
   Num_Pins_100_Chip : constant Positive := 100;

   procedure Com1_En_PPS_Close is
      use PPS;
   begin
         PPS_Output (4, "RPB14", Character'Image (ASCII.NUL));

   end Com1_En_PPS_Close;

   procedure Com1_Tx_PPS_Close is
      use PPS;
   begin
         PPS_Output (2, "RPB1", Character'Image (ASCII.NUL));

   end Com1_Tx_PPS_Close;

   procedure Com2_Tx_PPS_Close is
      use PPS;
   begin
         PPS_Output (1, "RPB5", Character'Image (ASCII.NUL));

   end Com2_Tx_PPS_Close;

   procedure Com3_Tx_PPS_Close is
      use PPS;
   begin
         PPS_Output (3, "RPB0", Character'Image (ASCII.NUL));

   end Com3_Tx_PPS_Close;

   procedure Com4_Tx_PPS_Close is
      use PPS;
   begin
         PPS_Output (2, "RPF0", Character'Image (ASCII.NUL));

   end Com4_Tx_PPS_Close;

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

   --  Define the counting pin numbers.
   --  INT1PIN refers to the PIC32 external interrupt #1.
   function INT1PIN return Positive is
   begin
      if Has_100_Pins then
         return 76;
      else
         return 49;
      end if;

      end INT1PIN;

   procedure INT1Pin_Close is
   begin
      PPS.PPS_Input (4, "INT1", Character'Image (ASCII.NUL));

      end INT1Pin_Close;

   procedure INT1Pin_Open is
   begin
      PPS.PPS_Input (4, "INT1", "RPD1");

   end INT1Pin_Open;

   function INT2PIN return Positive is
   begin
      if Has_100_Pins then
         return 81;
      else
         return 52;
      end if;

      end INT2PIN;

   function INT3PIN return Positive is
   begin
      if Has_100_Pins then
         return 34;
      else
         return 23;
      end if;

   end INT3PIN;

   function INT4PIN return Positive is
   begin
      if Has_100_Pins then
         return 78;
      else
         return 51;
      end if;

   end INT4PIN;

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
         PPS_Output (4, "RPB0", Character'Image (ASCII.NUL));

   end PWM_Ch1_Close;

   procedure PWM_Ch2_Close is
      use PPS;
   begin
         PPS_Output (2, "RPB1", Character'Image (ASCII.NUL));

   end PWM_Ch2_Close;

   procedure PWM_Ch3_Close is
      use PPS;
   begin
         PPS_Output (3, "RPB2", Character'Image (ASCII.NUL));

   end PWM_Ch3_Close;

   procedure PWM_Ch4_Close is
      use PPS;
   begin
         PPS_Output (1, "RPB15", Character'Image (ASCII.NUL));

   end PWM_Ch4_Close;

   procedure PWM_Ch5_Close is
      use PPS;
   begin
         PPS_Output (3, "RPB13", Character'Image (ASCII.NUL));

   end PWM_Ch5_Close;

   procedure SPI_PPS_Close is
      use PPS;
   begin
         PPS_Output (4, "RPG9", Character'Image (ASCII.NUL));

   end SPI_PPS_Close;

   procedure SPI2_PPS_Close is
      use PPS;
   begin
      if Has_100_Pins then
         PPS_Output (1, "RPG8", Character'Image (ASCII.NUL));
      else
         PPS_Output (2, "RPG8", Character'Image (ASCII.NUL));
         end if;

   end SPI2_PPS_Close;

end IO_Ports;
