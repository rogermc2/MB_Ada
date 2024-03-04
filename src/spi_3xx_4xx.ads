
package SPI_3xx_4xx is

   type SPI_Channel is (SPI_Channels, SPI_Channel_1, SPI_Channel_2);

   SPI_Def_Channel_1 : constant Positive := 1;
   SPI_Def_Channel_2 : constant Positive := 2;

   procedure Close_SPI_Channel (Channel : SPI_Channel);
   procedure SPI_Channel_Set_Brg (Channel : SPI_Channel; Brg : Natural);
   function SPI_Brg_Value (Src_Clock, SPI_Clock : Natural) return Integer;
   pragma Inline (SPI_Brg_Value);

end SPI_3xx_4xx;
