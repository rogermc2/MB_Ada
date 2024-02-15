
with P32_Defs; use P32_Defs;
with PPS; use PPS;

package body IO_Ports is

   Num_Pins_64_Chip  : constant Positive := 64;
   Num_Pins_100_Chip : constant Positive := 100;

   --  pps.h 223 and 476
   --  #define PPSOutput(grp,pin,fn)   OUT_PIN_PPS##grp##_##pin = OUT_FN_PPS##grp##_##fn
   --  #define PPSInput(grp,fn,pin) IN_FN_PPS##grp##_##fn = IN_PIN_PPS##grp##_##pin
   procedure Com1_En_PPS_Close is
   begin
      --    IOPorts.h COM1_EN_PPS_CLOSE   PPSOutput(4, RPB14, NULL)
      OUT_PIN_PPS4_RPB14 := OUT_FN_PPS4_NULL;

   end Com1_En_PPS_Close;

   procedure Com1_Tx_PPS_Close is
   begin
      --     IOPorts.h COM1_TX_PPS_CLOSE   PPSOutput(2, RPB1, NULL)
      OUT_PIN_PPS2_RPB1 := OUT_FN_PPS2_NULL;

   end Com1_Tx_PPS_Close;

   procedure Com2_Tx_PPS_Close is
   begin
      --     IOPorts.h COM1_TX_PPS_CLOSE   PPSOutput(1, RPB5, NULL)
      OUT_PIN_PPS1_RPB5 := OUT_FN_PPS1_NULL;

   end Com2_Tx_PPS_Close;

   procedure Com3_Tx_PPS_Close is
   begin
      --     IOPorts.h COM3_TX_PPS_CLOSE   PPSOutput(3, RPB0, NULL)
      OUT_PIN_PPS3_RPB0 := OUT_FN_PPS3_NULL;

   end Com3_Tx_PPS_Close;

   procedure Com4_Tx_PPS_Close is
   begin
      --     IOPorts.h COM4_TX_PPS_CLOSE   PPSOutput(2, RPF0, NULL)
      OUT_PIN_PPS2_RPF0 := OUT_FN_PPS2_NULL;

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

--     procedure INT1Pin_Close is
--     begin
      --  PPSInput(grp,fn,pin) IN_FN_PPS##grp##_##fn = IN_PIN_PPS##grp##_##pin
      --     IOPorts.h INT1PIN_CLOSE  PPSInput(4, INT1, NULL)
--        IN_FN_PPS4_INT1 := IN_PIN_PPS4_NULL;
      --  IN_PIN undefined for pin = Null;
--     end INT1Pin_Close;

   procedure INT1Pin_Open is
   begin
      --     IOPorts.h INT1PIN_OPEN   PPSInput(4, INT1, RPD1)
      IN_FN_PPS4_INT1 := IN_PIN_PPS4_RPD1;

   end INT1Pin_Open;

   function INT2PIN return Positive is
   begin
      if Has_100_Pins then
         return 81;
      else
         return 52;
      end if;

   end INT2PIN;

--     procedure INT2Pin_Close is
--     begin
      --  PPSInput(grp,fn,pin) IN_FN_PPS##grp##_##fn = IN_PIN_PPS##grp##_##pin
      --     IOPorts.h INT2PIN_CLOSE  PPSInput(3, INT2, NULL)
--        IN_FN_PPS3_INT2 = IN_PIN_PPS3_NULL;
      --  IN_PIN undefined for pin = Null;

--     end INT2Pin_Close;

   procedure INT2Pin_Open is
   begin
      --     IOPorts.h INT2PIN_OPEN   PPSInput(3, INT2, RPD4)
      IN_FN_PPS3_INT2 := IN_PIN_PPS3_RPD4;

   end INT2Pin_Open;

   function INT3PIN return Positive is
   begin
      if Has_100_Pins then
         return 34;
      else
         return 23;
      end if;

   end INT3PIN;

   --     procedure INT3Pin_Close is
   --     begin
   --        IN_FN_PPS4 := IN_PIN_PPS4_INT3;
      --  IN_PIN undefined for pin = Null;

   --        end INT3Pin_Close;

   procedure INT3Pin_Open is
   begin
      --     IOPorts.h INT3PIN_OPEN   PPSInput(1, INT3, RPB10)
      IN_FN_PPS1_INT3 := IN_PIN_PPS1_RPB10;

   end INT3Pin_Open;

   function INT4PIN return Positive is
   begin
      if Has_100_Pins then
         return 78;
      else
         return 51;
      end if;

   end INT4PIN;

   --     procedure INT4Pin_Close is
   --     begin
   --        IN_FN_PPS4 := IN_PIN_PPS4_INT4;
   --  IN_FN undefined for Fn = Null;

   --        end INT4Pin_Close;

   procedure INT4Pin_Open is
   begin
      --  IOPorts.h INT4PIN_OPEN   PPSInput(2, INT4, RPD3)
      IN_FN_PPS2_INT4 := IN_PIN_PPS2_RPD3;

   end INT4Pin_Open;

   function Num_Pins return Positive is
   begin
      if Has_100_Pins then
         return Num_Pins_100_Chip;
      else
         return Num_Pins_64_Chip;
      end if;

   end Num_Pins;

   procedure PWM_Ch1_Close is
   begin
   --  #define PPSOutput(grp,pin,fn)   OUT_PIN_PPS##grp##_##pin = OUT_FN_PPS##grp##_##fn
      --   PWM_CH1_CLOSE   PPSOutput(1, RPC14, NULL)
      OUT_PIN_PPS1_RPC14 := OUT_FN_PPS1_NULL;

   end PWM_Ch1_Close;

   procedure PWM_Ch2_Close is
   begin
      --  PWM_CH2_CLOSE PPSOutput(4, RPD8, NULL)
      OUT_PIN_PPS4_RPD8 := OUT_FN_PPS4_NULL;

   end PWM_Ch2_Close;

   procedure PWM_Ch3_Close is
   begin
      --  PWM_CH3_CLOSE    PPSOutput(3, RPE3, NULL)
      OUT_PIN_PPS3_RPE3 := OUT_FN_PPS3_NULL;

   end PWM_Ch3_Close;

   procedure PWM_Ch4_Close is
   begin
      --  PWM_CH4_CLOSE    PPSOutput(4, RPD5, NULL)
      OUT_PIN_PPS4_RPD5 := OUT_FN_PPS4_NULL;

   end PWM_Ch4_Close;

   procedure PWM_Ch5_Close is
   begin
      if Has_100_Pins then
         --  PWM_CH5_CLOSE    PPSOutput(2, RPC4, NULL)
         --  RPC4R not defined for P32mx470f512h
         null;
      else
      --  PWM_CH5_CLOSE    PPSOutput(2, RPC13, NULL)
         OUT_PIN_PPS2_RPC13 := OUT_FN_PPS2_NULL;
      end if;

   end PWM_Ch5_Close;

   procedure SPI_PPS_Close is
   begin
      --  SPI_PPS_CLOSE  PPSOutput(4, RPG9, NULL)
      OUT_PIN_PPS4_RPG9 := OUT_FN_PPS4_NULL;
   end SPI_PPS_Close;

   procedure SPI_PPS_Open is
   begin
      --  PPSInput(2, SDI2, RPG7);
      IN_FN_PPS2_SDI2 := IN_PIN_PPS2_RPG7;
      if Has_100_Pins then
         --  PPSOutput(4, RPD0, SDO1)
         OUT_PIN_PPS4_RPD0 := OUT_FN_PPS4_SDO1;
      else
         --  PPSOutput(4, RPG9, SDO1)
         OUT_PIN_PPS4_RPG9 := OUT_FN_PPS4_SDO1;
      end if;

   end SPI_PPS_Open;

   procedure SPI2_PPS_Close is
   begin
      if Has_100_Pins then
         --  PPSOutput(1, RPG8, NULL)
         OUT_PIN_PPS1_RPG8 := OUT_FN_PPS1_NULL;
      else
         --  PPSOutput(2, RPG7, NULL)
         OUT_PIN_PPS2_RPG7 := OUT_FN_PPS2_NULL;
      end if;

   end SPI2_PPS_Close;

   --  #define PPSInput(grp,fn,pin) IN_FN_PPS##grp##_##fn = IN_PIN_PPS##grp##_##pin
   --  #define PPSOutput(grp,pin,fn) OUT_PIN_PPS##grp##_##pin = OUT_FN_PPS##grp##_##fn
   procedure SPI2_PPS_Open is
   begin
      if Has_100_Pins then
         --  PPSInput(2, SDI2, RPG7); PPSOutput(1, RPG8, SDO2)
         IN_FN_PPS2_SDI2 := IN_PIN_PPS2_RPG7;
         OUT_PIN_PPS1_RPG8 := OUT_FN_PPS1_SDO2;
      else
         --  PPSInput(2, SDI2, RPC13); ; PPSOutput(2, RPG7, SDO2)
         IN_FN_PPS2_SDI2 := IN_PIN_PPS2_RPC13;
         OUT_PIN_PPS2_RPG7 := OUT_FN_PPS2_NULL;
      end if;

   end SPI2_PPS_Open;

end IO_Ports;
