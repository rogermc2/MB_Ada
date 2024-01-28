
with Interfaces;

package Disk_IO is

   subtype D_Status is Interfaces.Unsigned_8;

   type Disk_Status is (STA_NOINIT, STA_NODISK, STA_PROTECT);

   for Disk_Status use (STA_NOINIT  => D_Status (1),
                        STA_NODISK  => D_Status (2),
                        STA_PROTECT => D_Status (4));

end Disk_IO;
