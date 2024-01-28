
package body Disk_IO is

   function Disk_Initialize (Drv_Typ : Drive_Type) return D_Status is
      Stat : constant D_Status := STA_NOINIT;
   begin
      case Drv_Typ is
         when Dev_RAM => null;  --  RAM_Disk_Initialize;
            --  translate the result code.
         when Dev_MMC => null;  --  MMC_Disk_Initialize;
            --  translate the result code.
         when Dev_USB => null;  --  USB_Disk_Initialize;
            --  translate the result code.
      end case;

      return Stat;

   end Disk_Initialize;

   function Disk_Status (Drv_Typ : Drive_Type) return D_Status is
      Stat : constant D_Status := STA_NOINIT;
   begin
      case Drv_Typ is
         when Dev_RAM => null;  --  RAM_Disk_Status;
         when Dev_MMC => null;  --  MMC_Disk_Status;
         when Dev_USB => null;  --  USB_Disk_Status;
      end case;

      return Stat;

   end Disk_Status;

end Disk_IO;
