
with Interfaces; use Interfaces;
package UART is

   type UART_Module is (UART1, UART2, UART3, UART4, UART5, UART6);
   for UART_Module use  (UART1 => unsigned_8 (0), UART2 => unsigned_8 (1),
                         UART3 => unsigned_8 (2), UART4 => unsigned_8 (3),
                         UART5 => unsigned_8 (4), UART6 => unsigned_8 (5));

   type UART_Enable_Mode is (UART_Disable, UART_Peripheral, UART_Rx, UART_Tx,
                             UART_Enable, UART_Enable_or_UART_Peripheral,
                            UART_Enable_or_UART_Rx, UART_Enable_or_UART_Tx);
   for UART_Enable_Mode use
     (UART_Disable => unsigned_8 (0),
      UART_Peripheral => unsigned_8 (1),
      UART_Rx => unsigned_8 (2),
      UART_Tx => unsigned_8 (4),
      UART_Enable => unsigned_8 (16#80#),
      UART_Enable_or_UART_Peripheral => unsigned_8 (16#81#),
      UART_Enable_or_UART_Rx => unsigned_8 (16#82#),
      UART_Enable_or_UART_Tx => unsigned_8 (16#84#));

   type Register_Set is record
      Reg   : unsigned_8 := 0;
      Clear : unsigned_8 := 0;
      Set   : unsigned_8 := 0;
      Inv   : unsigned_8 := 0;
   end record;

   type UART_Reg is record
      Mode : Register_Set;
      Sta  : Register_Set;
      Tx   : Register_Set;
      Rx   : Register_Set;
      Brg  : Register_Set;
   end record;

   UART_Number_Of_Modules : constant Natural := 6;

   function "or" (L, R : UART_Enable_Mode) return UART_Enable_Mode;
   procedure UART_Enable (ID : UART_Module; Mode : UART_Enable_Mode);
   function UART_Enable_Flags (Mode : UART_Enable_Mode) return UART_Enable_Mode;

end UART;
