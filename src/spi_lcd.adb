
with System.Storage_Elements;

with Interfaces;

with External;

package body SPI_LCD is
   use System.Storage_Elements;

   Buff_Address     : constant System.Address := To_Address (16#F805A10#);
   SPI_Buff         : Interfaces.Unsigned_32;
   for SPI_Buff'Address use Buff_Address;

   Stat_Address     : constant System.Address := To_Address (16#F805820#);
   SPI_Stat         : Interfaces.Unsigned_32 := 0;
   for SPI_Stat'Address use Stat_Address;

   Stat_Clr_Address : constant System.Address := To_Address (16#F805A14#);
   SPI_Stat_Clr     : Interfaces.Unsigned_32 := 0;
   for SPI_Stat_Clr'Address use Stat_Clr_Address;

   procedure SPI_Cs_High (Pin : Integer) is
      use Interfaces;
      use External;
      Data : Unsigned_32;
   begin
      --  Wait for all writes to complete
      while (SPI_Stat and 16#80#) = 0 loop
         null;
      end loop;

      --  Empty the receiver fifo buffer.
      while not ((SPI_Stat and 16#20#) = 0) loop
         Data := SPI_Buff;
      end loop;

      --  Clear the overflow bit
      SPI_Stat_Clr := 16#40#;
      if Pin > 0 then
         --  Set CS high
         Pin_Set_Bit (Pin, Unsigned_32 (LATSET));
      end if;

   end SPI_Cs_High;

   procedure Init_Display_SPI (Init : Boolean) is
   begin
      null;
   end Init_Display_SPI;

end SPI_LCD;
