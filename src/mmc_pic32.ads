
with Disk_IO; use Disk_IO;
with Command_And_Token_Tables; use Command_And_Token_Tables;

package MMC_Pic32 is

   SD_Card_Stat : D_Status := STA_NOINIT;

   function Disk_Initialize (Drive_Num : Natural) return D_Status;
   function MDD_SDSPI_Card_Detect_State return Boolean;
   function Disk_Read
     (Drive_Num : Natural; Buffer : out Byte_Array; Sector : in out DWord;
      Count     : in out Natural) return D_Result;
   function Disk_Status (Drive_Num : Natural) return D_Status;
   function Disk_Write
     (Drive_Num : Natural; Buffer : Byte_Array; Sector : in out DWord;
      Count     : in out Natural) return D_Result;

end MMC_Pic32;
