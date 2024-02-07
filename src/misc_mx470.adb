
with Interfaces; use Interfaces;

with IO_Ports; use IO_Ports;
with P32mx470f512h;

package body Misc_MX470 is

   procedure  Init_Processor is
      use P32mx470f512h;
   begin
     --  initial setup of the I/O ports, default all pins to digital input
      if not Has_64_Pins then
         ANSELACLR := Unsigned_32 (16#FFFFFFFF#);
         LATACLR := Unsigned_32 (16#FFFFFFFF#);
         CNPUACLR := Unsigned_32 (16#FFFFFFFF#);
         CNPDACLR := Unsigned_32 (16#FFFFFFFF#);
         TRISACLR := Unsigned_32 (16#FFFFFFFF#);
      end if;

      TRISBSET := 16#ffffffff#;
        TRISCSET := 16#ffffffff#;
        TRISDSET := 16#ffffffff#;
        TRISESET :=  16#ffffffff#;
        TRISFSET := 16#ffffffff#;
        TRISGSET := 16#ffffffff#;
    ANSELBCLR := ANSELCCLR := ANSELDCLR := ANSELECLR := ANSELFCLR := ANSELGCLR := 16#ffffffff#;
    LATBCLR := LATCCLR := LATDCLR := LATECLR := LATFCLR := LATGCLR := 16#ffffffff#;
    CNENBCLR := CNENCCLR := CNENDCLR := CNENECLR := CNENFCLR := CNENGCLR := 16#ffffffff#;
    CNCONBCLR := CNCONCCLR := CNCONDCLR := CNCONECLR := CNCONFCLR := CNCONGCLR := 16#ffffffff#;
    CNPUBCLR := CNPUCCLR := CNPUDCLR := CNPUECLR := CNPUFCLR := CNPUGCLR := 16#ffffffff#;
    CNPDBCLR  = CNPDCCLR := CNPDDCLR := CNPDECLR := CNPDFCLR := CNPDGCLR := 16#ffffffff#;

   end Init_Processor;

end Misc_MX470;
