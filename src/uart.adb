
package body UART is

   UART_Registers : array (Integer range 1 .. 6) of UART_Reg;

   function "or" (L, R : UART_Enable_Mode) return UART_Enable_Mode is
      Or_Val : constant Unsigned_8 := UART_Enable_Mode'Enum_Rep (L) or
        UART_Enable_Mode'Enum_Rep (R);
   begin

      return UART_Enable_Mode'Enum_Val (Or_Val);

   end "or";

   procedure UART_Enable (ID : UART_Module; Mode : UART_Enable_Mode) is
   begin
      case Mode is
         when UART_Disable =>
            UART_Registers (UART_Module'Enum_Rep (ID)).Mode.Set := 0;
         when UART_Enable =>
            UART_Registers (UART_Module'Enum_Rep (ID)).Mode.Set := 1;
         when UART_Peripheral =>
            UART_Registers (UART_Module'Enum_Rep (ID)).Mode.Reg := 1;
         when  UART_Rx =>
            UART_Registers (UART_Module'Enum_Rep (ID)).Mode.Reg := 1;
         when UART_Tx =>
            UART_Registers (UART_Module'Enum_Rep (ID)).Mode.Reg := 1;
         when others => null;
      end case;

   end UART_Enable;

   function UART_Enable_Flags (Mode : UART_Enable_Mode)
                               return UART_Enable_Mode is
   begin
      return UART_Enable or Mode;

   end UART_Enable_Flags;

end UART;
