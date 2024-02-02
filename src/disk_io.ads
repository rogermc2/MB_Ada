
with Command_And_Token_Tables; use Command_And_Token_Tables;

package Disk_IO is

   type Drive_Type is (Dev_RAM, Dev_MMC, Dev_USB);
   type D_Result is (Res_OK, Res_Error, Res_Write_Protected,
                     Res_Not_Ready, Res_Parameter_Invalid);
   type D_Status is (STA_NOINIT, STA_NODISK, STA_PROTECT);

   --     for D_Status use (STA_NOINIT  => 1),
   --                          STA_NODISK  => 2,
   --                          STA_PROTECT => 4);

   CTRL_SYNC        : constant Natural := 0;  --  Complete pending write process (needed at _FS_READONLY == 0)
   GET_SECTOR_COUNT : constant Natural := 1;  --  Get media size (needed at _USE_MKFS == 1)
   GET_SECTOR_SIZE  : constant Natural := 2;  --  Get sector size (needed at _MAX_SS != _MIN_SS)
   GET_BLOCK_SIZE   : constant Natural := 3;  --  Get erase block size (needed at _USE_MKFS == 1)
   CTRL_TRIM        : constant Natural := 4;  --  Inform device that the data on the block of sectors is no longer used (needed at _USE_TRIM == 1)

   --  Generic command (Not used by FatFs)
   CTRL_FORMAT      : constant Natural := 5;  --  Create physical format on the media
   CTRL_POWER_IDLE  : constant Natural := 6;  --  Put the device idle state
   CTRL_POWER_OFF   : constant Natural := 7;  --  Put the device off state
   CTRL_LOCK        : constant Natural := 8;  --  Lock media removal
   CTRL_UNLOCK      : constant Natural := 9;  --  Unlock media removal
   CTRL_EJECT       : constant Natural := 10;  --  Eject media

   --  MMC/SDC specific ioctl command
   MMC_GET_TYPE     : constant Natural := 10;  --  Get card type
   MMC_GET_CSD      : constant Natural := 11;  --  Get CSD
   MMC_GET_CID      : constant Natural := 12;  --  Get CID
   MMC_GET_OCR      : constant Natural := 13;  --  Get OCR
   MMC_GET_SDSTAT   : constant Natural := 14;  --  Get SD status
   ISDIO_READ       : constant Natural := 55;  --  Read data form SD iSDIO register
   ISDIO_WRITE      : constant Natural := 56;  --  Write data to SD iSDIO register
   ISDIO_MRITE      : constant Natural := 57;  --  Masked write data to SD iSDIO register

   --  ATA/CF specific ioctl command
   ATA_GET_REV      : constant Natural := 20;  --  Get F/W revision
   ATA_GET_MODEL    : constant Natural := 21;  --  Get model name
   ATA_GET_SN       : constant Natural := 22;

   function Disk_Initialize (Drv_Typ : Drive_Type) return D_Status;
   function Disk_IO_Control (Drv_Typ : Drive_Type; Command : Integer;
                             Buffer  : in out String) return D_Result;
   function Disk_Read (Drv_Typ : Drive_Type; Buffer : Byte_Array;
                       Sector  : Long_Integer; Count : Natural)
                       return D_Result;
   function Disk_Status (Drv_Typ : Drive_Type) return D_Status;
   function Disk_Write (Drv_Typ : Drive_Type; Buffer : Byte_Array;
                        Sector  : Long_Integer; Count : Natural)
                        return D_Result;

end Disk_IO;
