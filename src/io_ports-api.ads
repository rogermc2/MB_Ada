
package IO_Ports.API is

   procedure Init_Processor;
   pragma Import (C, Init_Processor, "InitProcessor");

--     procedure Com1_En_PPS_Close;
--     pragma Import (C, Com1_En_PPS_Close, "Com1_En_PPS_Close");
--
--     procedure Com1_Tx_PPS_Close;
--     pragma Import (C, Com1_Tx_PPS_Close, "Com1_Tx_PPS_Close");
--
--     procedure Com2_Tx_PPS_Close;
--     pragma Import (C, Com2_Tx_PPS_Close, "Com2_Tx_PPS_Close");
--
--     procedure Com3_Tx_PPS_Close;
--     pragma Import (C, Com3_Tx_PPS_Close, "Com3_Tx_PPS_Close");
--
--     procedure Com4_Tx_PPS_Close;
--     pragma Import (C, Com4_Tx_PPS_Close, "Com4_Tx_PPS_Close");
--
--     procedure INT1Pin_Close;
--     pragma Import (C, INT1Pin_Close, "INT1Pin_Close");
--
--     procedure INT1Pin_Open;
--     pragma Import (C, INT1Pin_Open, "INT1Pin_Open");
--
--     procedure PWM_Ch1_Close;
--     pragma Import (C, PWM_Ch1_Close, "PWM_Ch1_Close");
--
--     procedure PWM_Ch2_Close;
--     pragma Import (C, PWM_Ch2_Close, "PWM_Ch2_Close");
--
--     procedure PWM_Ch3_Close;
--     pragma Import (C, PWM_Ch3_Close, "PWM_Ch3_Close");
--
--     procedure PWM_Ch4_Close;
--     pragma Import (C, PWM_Ch4_Close, "PWM_Ch4_Close");
--
--     procedure PWM_Ch5_Close;
--     pragma Import (C, PWM_Ch5_Close, "PWM_Ch5_Close");
--
--     procedure SPI_PPS_Close ;
--     pragma Import (C, SPI_PPS_Close, "SPI_PPS_Close");
--
--     procedure SPI2_PPS_Close;
--     pragma Import (C, SPI2_PPS_Close, "SPI2_PPS_Close");

end IO_Ports.API;
