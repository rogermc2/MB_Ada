
package SPI_LCD is

   DISP_USER : constant Integer := 20;

   procedure SPI_Cs_High (Pin : Integer);
   procedure Init_Display_SPI (Init : Boolean);

end SPI_LCD;
