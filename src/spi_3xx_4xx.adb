
package body SPI_3xx_4xx is

   procedure SPI_Channel_Set_Brg (Channel : SPI_Channel; Brg : Natural) is
   begin
      null;

   end SPI_Channel_Set_Brg;

   function SPI_Brg_Value (Src_Clock, SPI_Clock : Natural) return Integer is
   begin
      return Src_Clock / (2 * SPI_Clock) - 1;

   end SPI_Brg_Value;

end SPI_3xx_4xx;
