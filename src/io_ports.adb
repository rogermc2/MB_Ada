
with P32_Defs; use P32_Defs;
with PPS; use PPS;

package body IO_Ports is

   Num_Pins_64_Chip  : constant Positive := 64;
   Num_Pins_100_Chip : constant Positive := 100;

   --  pps.h 223 and 476
 --  #define PPSOutput(grp,pin,fn)   OUT_PIN_PPS##grp##_##pin = OUT_FN_PPS##grp##_##fn
   procedure Com1_En_PPS_Close is
   begin
--           PPS_Output ("4", "RPB14", Character'Image (ASCII.NUL));
       OUT_PIN_PPS4_RPB14 := OUT_FN_PPS4_NULL;

   end Com1_En_PPS_Close;

   procedure Com1_Tx_PPS_Close is
   begin
--           PPS_Output ("2", "RPB1", Character'Image (ASCII.NUL));
       OUT_PIN_PPS2_RPB1 := OUT_FN_PPS2_NULL;

   end Com1_Tx_PPS_Close;

   procedure Com2_Tx_PPS_Close is
   begin
--           PPS_Output ("1", "RPB5", Character'Image (ASCII.NUL));
       OUT_PIN_PPS1_RPB5 := OUT_FN_PPS1_NULL;

   end Com2_Tx_PPS_Close;

--     procedure Com3_Tx_PPS_Close is
--     begin
--  --           PPS_Output ("3", "RPB0", Character'Image (ASCII.NUL));
--        OUT_PIN_PPS4_RPB0 := OUT_FN_PPS3_NULL;
--        --  OUT_PIN_PPS4_RPB0 only defined for 32MXGeneric
--
--     end Com3_Tx_PPS_Close;

   procedure Com4_Tx_PPS_Close is
   begin
--           PPS_Output ("2", "RPF0", Character'Image (ASCII.NUL));
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

   procedure INT1Pin_Close is
   begin
   --  PPSInput(grp,fn,pin) IN_FN_PPS##grp##_##fn = IN_PIN_PPS##grp##_##pin
--        PPS_Input ("4", "INT1", Character'Image (ASCII.NUL));
      IN_FN_PPS4_INT1 := IN_PIN_PPS4_NULL;
      --  IN_FN undefined for Fn = Null;
      end INT1Pin_Close;

   procedure INT1Pin_Open is
   begin
--        PPS_Input ("4", "INT1", "RPD1");
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
--        IN_FN_PPS4 := IN_PIN_PPS4_INT2;
      --  IN_FN undefined for Fn = Null;

--        end INT2Pin_Close;

   procedure INT2Pin_Open is
   begin
      IN_FN_PPS4_INT2 := IN_PIN_PPS4_RPD1;

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
      --  IN_FN undefined for Fn = Null;

--        end INT3Pin_Close;

   procedure INT3Pin_Open is
   begin
      IN_FN_PPS4_RPD1 := IN_PIN_PPS4_INT3;

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
      IN_FN_PPS4_RPD1 := IN_PIN_PPS4_INT4;

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
--           PPS_Output ("4", "RPB0", Character'Image (ASCII.NUL));
       OUT_PIN_PP4_RPB0 := OUT_FN_PPS4_NULL;

   end PWM_Ch1_Close;

   procedure PWM_Ch2_Close is
   begin
         PPS_Output ("2", "RPB1", Character'Image (ASCII.NUL));
       OUT_PIN_PP2_RPB1 := OUT_FN_PPS2_NULL;

   end PWM_Ch2_Close;

   procedure PWM_Ch3_Close is
   begin
--           PPS_Output ("3", "RPB2", Character'Image (ASCII.NUL));
       OUT_PIN_PP3_RPB2 := OUT_FN_PPS3_NULL;

   end PWM_Ch3_Close;

   procedure PWM_Ch4_Close is
   begin
--           PPS_Output ("1", "RPB15", Character'Image (ASCII.NUL));
       OUT_PIN_PP1_RPB15 := OUT_FN_PPS1_NULL;

   end PWM_Ch4_Close;

   procedure PWM_Ch5_Close is
   begin
--           PPS_Output ("3", "RPB13", Character'Image (ASCII.NUL));
       OUT_PIN_PP3_RPB13 := OUT_FN_PPS3_NULL;

   end PWM_Ch5_Close;

   --  PPSOutput(4, RPG9, NULL)
   procedure SPI_PPS_Close is
   begin
--           PPS_Output ("4", "RPG9", Character'Image (ASCII.NUL));
       OUT_PIN_PP4_RPG9 := OUT_FN_PPS4_NULL;
   end SPI_PPS_Close;

   procedure SPI2_PPS_Close is
   begin
      if Has_100_Pins then
         PPS_Output ("1", "RPG8", Character'Image (ASCII.NUL));
      else
         PPS_Output ("2", "RPG8", Character'Image (ASCII.NUL));
         end if;

   end SPI2_PPS_Close;

end IO_Ports;
