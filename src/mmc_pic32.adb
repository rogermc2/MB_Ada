
with Interfaces.C;

with Command_And_Token_Tables; use Command_And_Token_Tables;
with Flash;
with Global;
with P32mx470f512h;
with SPI;
with SPI_3xx_4xx;

package body MMC_Pic32 is

   SPI_Speed : Positive;

   function Exchange_SPI (Data_Out : Byte) return Byte;
   pragma Inline (Exchange_SPI);
   procedure F_Clock_Slow;

   procedure CS_High is
   begin
      SPI.SPI_Cs_High (Flash.Option.SDCARD_CS);
   end CS_High;

   procedure Deselect is
      Dummy : Byte;
   begin
      CS_High;
      Dummy := Exchange_SPI (16#FF#);

   end Deselect;

   function Disk_Initialize (Drive_Num : Natural) return D_Status is
      Status : D_Status;
   begin
      if Drive_Num > 0 then
         Status := STA_NOINIT;
      elsif SD_Card_Stat = STA_NODISK then
         Status := STA_NODISK;
      else
         F_Clock_Slow;
         Deselect;
      end if;

      return Status;

   end Disk_Initialize;

   function Exchange_SPI (Data_Out : Byte) return Byte is
      use Interfaces.C;
      use P32mx470f512h;
      Cl : Byte;
   begin
      SPI2BUF := Unsigned (Data_Out);
      while (SPI2STAT and 16#80#) = 0 loop
         null;
      end loop;

      Cl := Byte (SPI2BUF);
      return Cl;

   end Exchange_SPI;

   procedure F_Clock_Slow is
      use SPI_3xx_4xx;
   begin
      SPI_Speed := 100000;
      SPI_Channel_Set_Brg (SPI_Channel_2,
                           SPI_Brg_Value (Global.Bus_Speed, SPI_Speed));
   end F_Clock_Slow;

   function MDD_SDSPI_Card_Detect_State return Boolean is
      OK : constant Boolean := Flash.Option.SD_CD = 0;
   begin
      --        if not OK and then Flash.Option.SD_CD > 0 then
      --           OK := not Pin_Read (Flash.Option.SD_CD);
      --        else
      --           OK := Pin_Read (-Flash.Option.SD_CD);
      --        end if;

      return OK;

   end MDD_SDSPI_Card_Detect_State;

end MMC_Pic32;
