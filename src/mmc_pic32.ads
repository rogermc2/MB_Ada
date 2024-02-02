
with Disk_IO; use Disk_IO;

package MMC_Pic32 is

   SD_Card_Stat : D_Status := STA_NOINIT;

   function Disk_Initialize (Drive_Num : Natural) return D_Status;
   function MDD_SDSPI_Card_Detect_State return Boolean;

end MMC_Pic32;
