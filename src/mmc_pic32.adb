
with Interfaces; use Interfaces;
with Interfaces.C;

with Ada.Text_IO; use Ada.Text_IO;

with Configuration;
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

   Card_Type   : Byte := 0;
   SPI_Speed   : Positive;

   procedure CS_Low;
   procedure Deselect;
   procedure Exchange_SPI (Data_Out : Byte);
   function Exchange_SPI (Data_Out : Byte) return Integer;
   pragma Inline (Exchange_SPI);
   procedure F_Clock_Slow;
   function Receiver_Datablock
     (Buffer : out Unsigned_Buffer; Buffer_Pos : Positive; Num_Bytes : Natural)
      return Natural;
   procedure Rcvr_SPI_Multi (Buffer : out Unsigned_Buffer;
                             Count  : in out Natural);
   procedure Send_Command (Command : Byte; Arg : DWord);
   function Send_Command (Command : Byte; Arg : DWord) return Byte;
   function Transmit_Datablock
     (Buffer : Unsigned_Buffer; Buffer_Pos : Positive; Token  : Byte)
      return Natural;
   procedure Transmit_SPI_Multi (Buffer : Unsigned_Buffer;
                                 Count  : in out Natural);
   function Wait_Ready return Boolean;
   procedure Xchg_SPI (Data : Byte);
   function Xchg_SPI (Data : Byte) return Byte;

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
      Ty      : Byte := 0;
      OCR     : array (0 .. 3) of Byte;
      Command : Byte := 0;
      Status  : D_Status;
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
         else
            if Send_Command (CMD41, 0) <= 1 then
               Ty := CT_SD1;
               Command := Byte (ACMD41);
            else
               Ty := CT_MMC;
               Command := CMD1;
            end if;
            while Timers.Timer1 /= 0 and then
              Send_Command (Command, 0) /= 0 loop
               null;
            end loop;
            if Timers.Timer1 = 0 or else Send_Command (CMD16, 512) /= 0 then
               Ty := 0;
            end if;
         end if;
      end if;

      Card_Type := Ty;
      Deselect;
      if Ty /= 0 then
         Status :=
           D_Status'Enum_Val (D_Status'Enum_Rep (SD_Card_Stat) -
                                  D_Status'Enum_Rep (STA_NOINIT));
         --           FCLK_Fast;
      end if;

      return Status;

   end Disk_Initialize;

   function Disk_Read (Drive_Num : Natural; Buffer : out Unsigned_Buffer;
                       Sector    : in out DWord; Count : in out Natural)
                       return D_Result is
      Pos    : Positive := 1;
      Done   : Boolean := False;
      Result : D_Result := Res_Parameter_Invalid;
   begin
      if Drive_Num = 0 or Count > 0 then
         if SD_Card_Stat = STA_NOINIT then
            Result := Res_Not_Ready;
         elsif (Card_Type and CT_BLOCK) = 0 then
            Sector := 512 * Sector;
            if Count = 1 then
               --  Read a single block
               if Send_Command (CMD17, Sector) = 0 and then
                 Receiver_Datablock (Buffer, Pos, 512) > 0 then
                  Count := 0;
               elsif Send_Command (CMD18, Sector) = 0 then
                  --  Read multiple blocks
                  while not Done and then Count > 0 loop
                     Done := Receiver_Datablock (Buffer, Pos, 512) = 0;
                     Pos := Pos + 512;
                     Count := Count - 1;
                  end loop;
                  Send_Command (CMD12, 0);
               end if;
            end if;
         end if;
      end if;

      return Result;

   end Disk_Read;

   function Disk_Status (Drive_Num : Natural) return D_Status is
   begin
      if Drive_Num = 0 then
         return SD_Card_Stat;
      else
         return STA_NOINIT;
      end if;

   end Disk_Status;

   function Disk_Write (Drive_Num : Natural; Buffer : Unsigned_Buffer;
                        Sector    : in out DWord; Count : in out Natural)
                        return D_Result is
      Pos    : Positive := 1;
      Token  : Byte;
      Done   : Boolean := False;
      Result : D_Result := Res_Parameter_Invalid;
   begin
      if Drive_Num /= 0 or Count > 0 then
         Result := Res_Parameter_Invalid;
      elsif SD_Card_Stat = STA_NOINIT then
         Result := Res_Not_Ready;
      elsif SD_Card_Stat = STA_PROTECT then
         Result := Res_Write_Protected;
      elsif (Card_Type and CT_BLOCK) = 0 then
         Sector := 512 * Sector;
         if Count = 1 then
            --  Write a single block
            Token := 16#FE#;
            if Send_Command (CMD24, Sector) = 0 and then
              Transmit_Datablock (Buffer, 1, Token) > 0 then
               Count := 0;
            end if;

         else
            if (Card_Type and CT_BLOCK) /= 0 then
               Send_Command (CMD23, DWord (Count));
            end if;

            if Send_Command (CMD25, Sector) = 0 then
               --  Write multiple blocks
               Token := 16#FC#;
               while not Done and then Count > 0 loop
                  Done := Transmit_Datablock (Buffer, Pos, Token) = 0;
                  Pos := Pos + 512;
                  Count := Count - 1;
               end loop;
               Send_Command (CMD12, 0);
            end if;
         end if;
      end if;

      return Result;

   end Disk_Write;

   --  xchg_spi
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
      Clr : Integer;
   begin
      SPI2BUF := Unsigned (Data_Out);
      while (SPI2STAT and 16#80#) = 0 loop
         null;
      end loop;

      Clr := Integer (SPI2BUF);
      return Clr;

   end Exchange_SPI;

   procedure F_Clock_Slow is
      use SPI_3xx_4xx;
   begin
      SPI_Speed := 100000;
      SPI_Channel_Set_Brg (SPI_Channel_2,
                           SPI_Brg_Value (Configuration.Bus_Speed, SPI_Speed));
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

   function Receiver_Datablock
     (Buffer : out Unsigned_Buffer; Buffer_Pos : Positive; Num_Bytes : Natural)
      return Natural is
      Token  : Byte := 16#FF#;
      BTR    : Natural := 0;
      Result : Natural := 0;
   begin
      Timers.Timer1 := 100;
      while Token = 16#FF# and then Timers.Timer1 > 0 loop
         Token := Xchg_SPI (16#FF#);
      end loop;

      if Token = 16#FE# then
         Rcvr_SPI_Multi (Buffer, BTR);
         Token := Xchg_SPI (16#FF#);  --  Discard CRC
         Token := Xchg_SPI (16#FF#);
         Result := 1;
      end if;

      return Result;

   end Receiver_Datablock;

   procedure Rcvr_SPI_Multi (Buffer : out Unsigned_Buffer;
                             Count  : in out Natural) is
      use Interfaces.C;
      use p32mx470f512h;
      Old_SPI2CON : constant unsigned := SPI2CON;
      index       : Natural := Count;
   begin
      if Count < 16 then
         while Count > 0 loop
            SPI2BUF := 16#FF#;
            while (SPI2STAT and 16#80#) = 0 loop
               null;
            end loop;
            Buffer.Append (SPI2BUF);
            SPI2BUF := 16#FF#;
            while (SPI2STAT and 16#80#) = 0 loop
               null;
            end loop;
            Buffer.Append (SPI2BUF);
            Count := Count - 2;
         end loop;
      else
         SPI2CON := Old_SPI2CON or SPI2CON_ENHBUF_MASK;
         --  Preload the output buffer
         for j in 1 .. 10 loop
            SPI2BUF := 16#FF#;
            Count := Count - 1;
         end loop;

         while index > 0 loop
            if (SPI2STAT and 16#20#) = 0 then
               --  Something is in the receiver buffer so read it
               Buffer.Append (SPI2BUF);
               index := index - 1;
            end if;

            if (index - Count < 10) and then Count > 0  then
               --  Top of the output buffer is not too far ahead
               SPI2BUF := 16#FF#;
               Count := Count - 1;
            end if;
         end loop;

         SPI2CON := Old_SPI2CON;

      end if;

   end Rcvr_SPI_Multi;

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

   procedure Send_Command (Command : Byte; Arg : DWord) is
      Result : constant Byte := Send_Command (Command, Arg);
   begin
      null;
   end Send_Command;

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

   function Transmit_Datablock (Buffer : Unsigned_Buffer; Buffer_Pos : Positive;
                                Token  : Byte) return Natural is
      BTR      : Natural := 0;
      Response : Byte := 0;
      Result   : Natural := 0;
   begin
      if Wait_Ready then
         Xchg_SPI (Token);

         if Token /= 16#FD# then
            Transmit_SPI_Multi (Buffer, BTR);
            Xchg_SPI (16#FF#);  --  Dummy CRC
            Xchg_SPI (16#FF#);
            Response := Xchg_SPI (16#FF#);
            if Natural (Response and 16#1F#) = 5 then
               Result := 1;
            end if;
         end if;
      end if;

      return Result;

   end Transmit_Datablock;

   procedure Transmit_SPI_Multi (Buffer : Unsigned_Buffer;
                                 Count  : in out Natural) is
   begin
      null;
   end Transmit_SPI_Multi;

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

   procedure Xchg_SPI (Data : Byte) is
      use Interfaces.C;
      use P32mx470f512h;
   begin
      SPI2BUF := unsigned (Data);
      while (SPI2STAT and 16#80#) = 0 loop
         null;
      end loop;

   end Xchg_SPI;

   function Xchg_SPI (Data : Byte) return Byte is
      use Interfaces.C;
      use P32mx470f512h;
   begin
      SPI2BUF := unsigned (Data);
      while (SPI2STAT and 16#80#) = 0 loop
         null;
      end loop;

      return Byte (SPI2BUF);

   end Xchg_SPI;

end MMC_Pic32;
