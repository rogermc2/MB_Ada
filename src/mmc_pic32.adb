
with Interfaces.C;

with Command_And_Token_Tables; use Command_And_Token_Tables;
with Flash;
with Global;
with P32mx470f512h;
with SPI;
with SPI_3xx_4xx;

package body MMC_Pic32 is

   SPI_Speed : Positive;

   procedure CS_Low;
   procedure Deselect;
   procedure Exchange_SPI (Data_Out : Byte);
   function Exchange_SPI (Data_Out : Byte) return Integer;
   pragma Inline (Exchange_SPI);
   procedure F_Clock_Slow;

   function Cmd0_Send return Integer is
      Trys          : Integer := 100;
      Response      : Integer;
      Response_Trys : Integer := 10;
   begin
      loop
         Deselect;
         CS_Low;
         Trys := Trys - 1;
         Exchange_SPI (16#40#);
         for count in 1 .. 4 loop
            Exchange_SPI (0);
         end loop;
         Exchange_SPI (16#95#);

         loop
            Response := Exchange_SPI (16#FF#);
            Response_Trys := Response_Trys -1;
            exit when Response_Trys = 0 or else (Response = 1);
         end loop;

         exit when (Trys = 0 or else (Response = 1));
      end loop;

      return Response;
   end ;

   procedure CS_High is
   begin
      SPI.SPI_Cs_High (Flash.Option.SDCARD_CS);
   end CS_High;

   procedure CS_Low is
   begin
      SPI.SPI_Cs_Low (Flash.Option.SDCARD_CS);
   end CS_Low;

   procedure Deselect is
   begin
      CS_High;
      Exchange_SPI (16#FF#);

   end Deselect;

   function Disk_Initialize (Drive_Num : Natural) return D_Status is
      Ty     : Byte := 0;
      Status : D_Status;
   begin
      if Drive_Num > 0 then
         Status := STA_NOINIT;
      elsif SD_Card_Stat = STA_NODISK then
         --  mmc_pic32.c No card in the socket
         Status := STA_NODISK;
      else
         F_Clock_Slow;
         Deselect;  --  Initialize memory card interface
      end if;

      --  mmc_pic32.c 80 dummy clocks
      for n in reverse 0 .. 10 loop
         Exchange_SPI (16#FF#);
      end loop;

      return Status;

   end Disk_Initialize;

   procedure Exchange_SPI (Data_Out : Byte) is
      use Interfaces.C;
      use P32mx470f512h;
   begin
      SPI2BUF := Unsigned (Data_Out);
      while (SPI2STAT and 16#80#) = 0 loop
         null;
      end loop;

   end Exchange_SPI;

   function Exchange_SPI (Data_Out : Byte) return Integer is
      use Interfaces.C;
      use P32mx470f512h;
      Cl : Integer;
   begin
      SPI2BUF := Unsigned (Data_Out);
      while (SPI2STAT and 16#80#) = 0 loop
         null;
      end loop;

      Cl := Integer (SPI2BUF);
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
