
with Interfaces; use Interfaces;

with Configuration;
with IO_Ports; use IO_Ports;
with M_Misc;
with MM_System;
with Out_Compare;
with P32mx470f512h;
with Ports;
with SPI_3xx_4xx;

package body Misc_MX470 is

   procedure  Init_Processor is
      use Configuration;
      use MM_System;
      use Out_Compare;
      use P32mx470f512h;
      use SPI_3xx_4xx;
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
      CloseOC4;
      PWM_CH4_CLOSE;
      PWM_CH5_CLOSE;

   end Init_Processor;

end Misc_MX470;
