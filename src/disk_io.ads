
--  with Interfaces;

package Disk_IO is

--     subtype D_Status is Interfaces.Unsigned_8;

   type Drive_Type is (Dev_RAM, Dev_MMC, Dev_USB);
   type D_Status is (STA_NOINIT, STA_NODISK, STA_PROTECT);
--     type Disk_Status is (STA_NOINIT, STA_NODISK, STA_PROTECT);
--
--     for Disk_Status use (STA_NOINIT  => D_Status (1),
--                          STA_NODISK  => D_Status (2),
--                          STA_PROTECT => D_Status (4));

   function Disk_Initialize (Drv_Typ : Drive_Type) return D_Status;
   function Disk_Status (Drv_Typ : Drive_Type) return D_Status;

end Disk_IO;
