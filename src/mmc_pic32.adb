
with Interfaces; use Interfaces;
with Interfaces.C;

with Ada.Text_IO; use Ada.Text_IO;

with Command_And_Token_Tables; use Command_And_Token_Tables;
with External;
with Flash;
with Global;
with P32mx470f512h;
with SPI;
with SPI_3xx_4xx;
with Timers;

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
   function Send_Command (Command : Byte; Arg : DWord) return Byte;
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
      Ty     : Byte := 0;
      OCR    : array (0 .. 3) of Byte;
      Status : D_Status;
   begin
      --  mmc_pic32.c 397
      if Drive_Num > 0 then
         Status := STA_NOINIT;
      elsif SD_Card_Stat = STA_NODISK then
         --  mmc_pic32.c 400 No card in the socket
         Status := STA_NODISK;
      else
         F_Clock_Slow;
         Deselect;  --  Initialize memory card interface
      end if;

      --  mmc_pic32.c 404 80 dummy clocks
      for n in reverse 0 .. 10 loop
         Exchange_SPI (16#FF#);
      end loop;

      if Cmd0_Send = 1 then
         Timers.Timer1 := 1000;
         if Send_Command (CMD8, 16#1AA#) = 1 then
            for n in 0 .. 3 loop
               --  Get trailing return value of R7 response.
               OCR (n) := Byte (Exchange_SPI (16#FF#));
            end loop;

            if OCR (2) = 1 and then OCR (3) = 16#AA# then
               --  mmc_pic32.c 416  The card can work at vdd range of 2.7-3.6V.
               while Timers.Timer1 /= 0 and then
                 Send_Command (CMD41, 16#40000000#) /= 0 loop
                  null;
               end loop;

               if Timers.Timer1 > 0 and then Send_Command (CMD58, 0) = 0 then
                  for n in 0 .. 3 loop
                     OCR (n) := Byte (Exchange_SPI (16#FF#));
                  end loop;

                  --  mmc_pic32.c 422
                  if (OCR (0) and 16#40#) /= 0 then
                     Ty := CT_SD2 or CT_Block;
                  else
                     Ty := CT_SD2;
                  end if;

               end if;
            end if;
         end if;
      end if;

      return Status;

   end Disk_Initialize;

   function Disk_Status (Drive_Num : Natural) return D_Status is
   begin
      if Drive_Num = 0 then
         return SD_Card_Stat;
      else
         return STA_NOINIT;
      end if;

   end Disk_Status;

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
      Routine_Name : constant String :=
        "MMC_Pic32.MDD_SDSPI_Card_Detect_State ";
      OK           : Boolean := Flash.Option.SD_CD = 0;
   begin
      Put_Line (Routine_Name & "OK: " & Boolean'Image (OK));
      if not OK and then Flash.Option.SD_CD > 0 then
         OK := External.Pin_Read (Flash.Option.SD_CD) = 0;
      else
         OK := External.Pin_Read (-Flash.Option.SD_CD) /= 0;
      end if;

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

   function Send_Command (Command : Byte; Arg : DWord) return Byte is
      Cmd      : Byte := Command;
      N        : Byte := 1;
      Done     : Boolean := False;
      Response : Byte;
   begin
      --  mmc_pic32.c 301
      if (Command and 16#80#) /= 0 then
         Cmd := Cmd and 16#7F#;
         Response := Send_Command (CMD55, 0);
         Done := Response > 1;
      end if;

      --  Select the card and wait for ready except to stop multiple block read
      if not Done and then Command /= CMD12 then
         Deselect;
         Done := not Select_Card;
         if Done then
            Response := 16#FF#;
         end if;
      end if;

      if not Done then
         --  mmc_pic32.c 319 Send command packet
         --  Start + Command index
         Exchange_SPI (16#40# or Command);
         --  Arg [31..24]
         Exchange_SPI (Byte (Shift_Right (Arg, 24) and 16#FF#));
         --  Argu[23..16]
         Exchange_SPI (Byte (Shift_Right (Arg, 16) and 16#FF#));
         --  Argu[15..8]
         Exchange_SPI (Byte (Shift_Right (Arg, 8) and 16#FF#));
         Exchange_SPI (Byte (Arg and 16#FF#));

         if Command = CMD0 then
            --  Valid CRC for CMD0(0) + Stop
            N := 16#95#;
         elsif Command = CMD8 then
            --  Valid CRC for CMD8(0x1AA) + Stop
            N := 16#87#;
         end if;
         Exchange_SPI (N);

         --  mmc_pic32.c 332 Receive command response
         if Command = CMD12 then
            --  Skip a stuff byte on stop to read
            Exchange_SPI (16#FF#);
         end if;

         --  Wait for a valid response in timeout of 10 attempts
         N := 10;
         loop
            Response := Byte (Exchange_SPI (16#FF#));
            N := N - 1;
            exit when (Response and 16#80#) = 0 or else (N = 0);
         end loop;
      end if;

      return Response;

   end Send_Command;

   function Wait_Ready return Boolean is
      use Timers;
      D : Byte;
   begin
      Timer2 := 500;
      loop
         D := Byte (Exchange_SPI (16#FF#));
         delay (0.000005);
         Timer2 := Timer2 - 1;
         exit when D = 16#FF# or Timer2 = 0;
      end loop;

      return D = 16#FF#;

   end Wait_Ready;

end MMC_Pic32;
