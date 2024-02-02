
package SPI_3xx_4xx is

   type SPI_Channel is (SPI_Channel_1, SPI_Channel_2, SPI_Channels);

   procedure SPI_Channel_Set_Brg (Channel : SPI_Channel; Brg : Natural);
   function SPI_Brg_Value (Src_Clock, SPI_Clock : Natural) return Integer;
   pragma Inline (SPI_Brg_Value);

end SPI_3xx_4xx;
