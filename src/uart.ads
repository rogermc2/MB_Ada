
with Interfaces.C; use Interfaces.C;
package UART is

   type UART_Module is (UART1, UART2, UART3, UART4, UART5, UART6);
   for UART_Module use  (UART1 => unsigned (0), UART2 => unsigned (1),
                         UART3 => unsigned (2), UART4 => unsigned (3),
                         UART5 => unsigned (4), UART6 => unsigned (5));

   type UART_Enable_Mode is (UART_Disable, UART_Peripheral,
                             UART_Rx, UART_Tx, UART_Enable);
   for UART_Enable_Mode use (UART_Disable => unsigned (0),
                            UART_Peripheral => unsigned (1),
                            UART_Rx => unsigned (2),
                            UART_Tx => unsigned (4),
                            UART_Enable => unsigned (16#80#));
   type Register_Set is record
      Reg   : unsigned := 0;
      Clear : unsigned := 0;
      Set   : unsigned := 0;
      Inv   : unsigned := 0;
   end record;

   type UART_Reg is record
      Mode : Register_Set;
      Sta  : Register_Set;
      Tx   : Register_Set;
      Rx   : Register_Set;
      Brg  : Register_Set;
   end record;

   UART_Number_Of_Modules : constant Natural := 6;

   procedure UART_Enable (ID : UART_Module; Mode : UART_Enable_Mode);
   function UART_Enable_Flags (Mode : UART_Enable_Mode) return UART_Enable_Mode;

end UART;
