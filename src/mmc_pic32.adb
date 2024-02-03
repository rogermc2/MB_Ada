
with Interfaces; use Interfaces;
with Interfaces.C;

with Command_And_Token_Tables; use Command_And_Token_Tables;
with Flash;
with Global;
with P32mx470f512h;
with SPI;
with SPI_3xx_4xx;

package body MMC_Pic32 is

   --  Definitions for MMC/SDC command
   CMD0   : constant Byte := 0;  --  GO_IDLE_STATE
   CMD1   : constant Byte := 1;  --  SEND_OP_COND
   ACMD41 : constant Unsigned_16 := 41 or 16#80#;  --  SEND_OP_COND;
   CMD8   : constant Byte := 8;  --  SEND_IF_COND
   CMD9   : constant Byte := 9;  --  SEND_CSD
   CMD10  : constant Byte := 10;  --  SEND_CID
   CMD12  : constant Byte := 12;  --  STOP_TRANSMISSION
   ACMD13 : constant Unsigned_16 := 13 or 16#80#;  --  SD_STATUS;
   CMD16  : constant Byte := 16;  --  SET_BLOCKLEN
   CMD17  : constant Byte := 17;  --  READ_SINGLE_BLOCK
   CMD18  : constant Byte := 18;  --  READ_MULTIPLE_BLOCK
   CMD23  : constant Byte := 23;  --  SET_BLOCK_COUNT
   ACMD23 : constant Unsigned_16 := 23 or 16#80#;  --  SET_WR_BLK_ERASE_COUNT
   CMD24  : constant Byte := 24;  --  WRITE_BLOCK
   CMD25  : constant Byte := 25;  --  WRITE_MULTIPLE_BLOCK
   CMD41  : constant Byte := 41;  --  SEND_OP_COND
   CMD55  : constant Byte := 55;  --  APP_CMD
   CMD58  : constant Byte := 58;  --  READ_OCR

   SPI_Speed : Positive;

   procedure CS_Low;
   procedure Deselect;
   procedure Exchange_SPI (Data_Out : Byte);
   function Exchange_SPI (Data_Out : Byte) return Integer;
   pragma Inline (Exchange_SPI);
   procedure F_Clock_Slow;
   function Send_Command (Command : Byte; Arg : Long_Integer) return Byte;
   function Wait_Ready return Boolean;

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
      Timer1 : Integer := 1000;
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

      if Cmd0_Send = 1 then
         if Send_Command (CMD8, 16#1AA#) = 1 then
            null;
         end if;
      end if;

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

   function Select_Card return Boolean is
      Result : Boolean := False;
   begin
      CS_Low;
      Delay (0.000005);
      Exchange_SPI (16#FF#);
      Result := Wait_Ready;
      Deselect;

      return Result;

   end Select_Card;

   function Send_Command (Command : Byte; Arg : Long_Integer) return Byte is
      Cmd    : Byte := Command;
      Done   : Boolean := False;
      Result : Byte;
   begin
      if (Command and 16#80#) /= 0 then
         Cmd := Cmd and 16#7F#;
         Result := Send_Command (CMD55, 0);
         Done := Result > 1;
      elsif Command /= CMD12 then
         Deselect;
         Done := not Select_Card;
         if Done then
            Result := 16#FF#;
         end if;
      end if;

      return Result;

   end Send_Command;

   function Wait_Ready return Boolean is
      D      : Byte;
      Timer2 : Natural := 500;
   begin
      loop
         D := Byte (Exchange_SPI (16#FF#));
         delay (0.000005);
         Timer2 := Timer2 - 1;
         exit when D = 16#FF# or Timer2 = 0;
      end loop;

      return D = 16#FF#;

   end Wait_Ready;

end MMC_Pic32;
