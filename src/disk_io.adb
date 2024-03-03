
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

   function Disk_IO_Control (Drv_Typ : Drive_Type; Command : Integer;
                             Buffer : in out String) return D_Result is
      Result : constant D_Result := Res_Not_Ready;
   begin
      case Drv_Typ is
         when Dev_RAM => null;
         when Dev_MMC => null;
         when Dev_USB => null;
      end case;

      return Result;

   end Disk_IO_Control;

   function Disk_Read (Drv_Typ : Drive_Type; Buffer : Byte_Array;
                       Sector  : DWord; Count : Natural)
                       return D_Result is
      Result : constant D_Result := Res_Not_Ready;
   begin
      case Drv_Typ is
         when Dev_RAM => null;  --  RAM_Disk_Read;
            --  Process the command for the RAM drive
         when Dev_MMC => null;  --  MMC_Disk_Read;
            --  Process the command for the MMC drive
         when Dev_USB => null;  --  USB_Disk_Read;
            --  Process the command for the USB drive
      end case;

      return Result;

   end Disk_Read;

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

   function Disk_Write (Drv_Typ : Drive_Type; Buffer : Byte_Array;
                       Sector  : DWord; Count : Natural)
                       return D_Result is
      Result : constant D_Result := Res_Not_Ready;
   begin
      case Drv_Typ is
         when Dev_RAM => null;  --  RAM_Disk_Write;
            --  translate the arguments.
         when Dev_MMC => null;  --  MMC_Disk_Write;
            --  translate the arguments.
         when Dev_USB => null;  --  USB_Disk_Write;
            --  translate the arguments.
      end case;

      return Result;

   end Disk_Write;

end Disk_IO;
