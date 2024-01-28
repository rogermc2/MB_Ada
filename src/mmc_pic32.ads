
with Disk_IO; use Disk_IO;

package MMC_Pic32 is

   SD_Card_Stat : Disk_Status := STA_NOINIT;

   function MDD_SDSPI_Card_Detect_State return Boolean;

end MMC_Pic32;
