
with Interfaces; use Interfaces;

with Ada.Containers;

with Configuration;
with Flash;
with GUI;
with IO_Ports; use IO_Ports;
with M_Misc;
with MM_System;
with Out_Compare;
with P32mx470f512h;
with Ports;
with SPI_3xx_4xx;
with UART;

package body Misc_MX470 is

   procedure  Init_Processor is
      use Ada.Containers;
      use Configuration;
      use MM_System;
      use Out_Compare;
      use P32mx470f512h;
      use SPI_3xx_4xx;
      use UART;
      use GUI;
      use GUI_Controls_Package;
      Control_Data : S_Ctrl_Data;
      Controls     : Controls_Vector :=
        To_Vector (Control_Data, Count_Type (Flash.Option.Max_Controls));
   begin
      --  initial setup of the I/O ports, default all pins to digital input
      --        if not Has_64_Pins then
      --           ANSELACLR := Unsigned_32 (16#FFFFFFFF#);
      --           LATACLR := Unsigned_32 (16#FFFFFFFF#);
      --           CNPUACLR := Unsigned_32 (16#FFFFFFFF#);
      --           CNPDACLR := Unsigned_32 (16#FFFFFFFF#);
      --           TRISACLR := Unsigned_32 (16#FFFFFFFF#);
      --        end if;

      TRISBSET := 16#ffffffff#;
      TRISCSET := 16#ffffffff#;
      TRISDSET := 16#ffffffff#;
      TRISESET :=  16#ffffffff#;
      TRISFSET := 16#ffffffff#;
      TRISGSET := 16#ffffffff#;
      ANSELBCLR := 16#ffffffff#;
      ANSELCCLR := 16#ffffffff#;
      ANSELDCLR := 16#ffffffff#;
      ANSELECLR := 16#ffffffff#;
      ANSELFCLR := 16#ffffffff#;
      ANSELGCLR := 16#ffffffff#;
      LATBCLR := 16#ffffffff#;
      LATCCLR := 16#ffffffff#;
      LATDCLR := 16#ffffffff#;
      LATECLR := 16#ffffffff#;
      LATFCLR := 16#ffffffff#;
      LATGCLR := 16#ffffffff#;
      CNENBCLR := 16#ffffffff#;
      CNENCCLR := 16#ffffffff#;
      CNENDCLR := 16#ffffffff#;
      CNENECLR := 16#ffffffff#;
      CNENFCLR := 16#ffffffff#;
      CNENGCLR := 16#ffffffff#;
      CNCONBCLR := 16#ffffffff#;
      CNCONCCLR := 16#ffffffff#;
      CNCONDCLR := 16#ffffffff#;
      CNCONECLR := 16#ffffffff#;
      CNCONFCLR := 16#ffffffff#;
      CNCONGCLR := 16#ffffffff#;
      CNPUBCLR := 16#ffffffff#;
      CNPUCCLR := 16#ffffffff#;
      CNPUDCLR := 16#ffffffff#;
      CNPUECLR := 16#ffffffff#;
      CNPUFCLR := 16#ffffffff#;
      CNPUGCLR := 16#ffffffff#;
      CNPDBCLR := 16#ffffffff#;
      CNPDCCLR := 16#ffffffff#;
      CNPDDCLR := 16#ffffffff#;
      CNPDECLR := 16#ffffffff#;
      CNPDFCLR := 16#ffffffff#;
      CNPDGCLR := 16#ffffffff#;

      Ports.mJTAG_Port_Enable (False);                                --  turn off jtag
      Bus_Speed := SYSTEM_Config (M_Misc.Clock_Speed, SYS_CFG_ALL);  --  set wait states, bus speed, etc for the best performance

--        SpiChnClose (SPI_CHANNEL1);
      Close_SPI_Channel (SPI_CHANNEL_1);
      SPI_PPS_CLOSE;     --  SPI is not reset by the watchdog
--        SpiChnClose (SPI_CHANNEL2);
      Close_SPI_Channel (SPI_CHANNEL_2);
      SPI2_PPS_CLOSE;    --  SPI is not reset by the watchdog
      Close_OC1;
      PWM_CH1_CLOSE;
      PWM_CH2_CLOSE;
      PWM_CH3_CLOSE;  --  nor the output compare (PWM)
      Close_OC4;
      PWM_CH4_CLOSE;
      PWM_CH5_CLOSE;

      --   Clear all UARTs (again not reset by the watchdog)
      UART_Enable (UART1, UART_ENABLE_FLAGS (UART_DISABLE or UART_PERIPHERAL));
      COM4_TX_PPS_CLOSE;
      UART_Enable (UART2, UART_ENABLE_FLAGS (UART_DISABLE or UART_PERIPHERAL));
      COM1_TX_PPS_CLOSE;
      COM1_EN_PPS_CLOSE;
      UART_Enable (UART3, UART_ENABLE_FLAGS (UART_DISABLE or UART_PERIPHERAL));
      COM2_TX_PPS_CLOSE;
      UART_Enable (UART4, UART_ENABLE_FLAGS (UART_DISABLE or UART_PERIPHERAL));
      COM3_TX_PPS_CLOSE;

      Flash.Load_Options;

      --  Set the base of the usable memory
      --      RAMBase = (void *)MRoundUp((unsigned int)&_splim + (Option.MaxCtrls * sizeof(struct s_ctrl)));

      --  Setup a pointer to the base of the GUI controls table
      --      Ctrl = (struct s_ctrl *)&_splim;

--        INTEnableSystemMultiVectoredInt();      // allow vectored interrupts

   end Init_Processor;

end Misc_MX470;
