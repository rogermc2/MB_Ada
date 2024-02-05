
with Interfaces;

package body SPI_LCD is

   SPI_Buff     : Interfaces.Unsigned_32 :=
     Interfaces.Unsigned_32 (16#F805A10#);
   SPI_Stat     : Interfaces.Unsigned_32 :=
     Interfaces.Unsigned_32 (16#F805820#);
   SPI_Stat_Clr : Interfaces.Unsigned_32 :=
     Interfaces.Unsigned_32 (16#F805A14#);

   procedure SPI_Cs_High (Pin : Integer) is
      use Interfaces;
      Result : Unsigned_32;
   begin
      --  Wait for all writes to complete
      while (SPI_Stat and 16#80#) = 0 loop
         null;
      end loop;

      while not ((SPI_Stat and 16#20#) = 0) loop
         Result := SPI_Buff;
      end loop;

      SPI_Stat_Clr := 16#40#;
      if Pin > 0 then
         Pin_Set_Bit (LAT_Set);
      end if;

   end SPI_Cs_High;

   procedure Init_Display_SPI (Init : Boolean) is
   begin
      null;
   end Init_Display_SPI;

end SPI_LCD;
