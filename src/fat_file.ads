
with Interfaces; use Interfaces;

with Command_And_Token_Tables;
with Disk_IO;
with Support;

package Fat_File is

   type F_Result is (FR_OK,		--  (0) Succeeded
                     FR_DISK_ERR,	--  (1) A hard error occurred in the low level disk I/O layer
                     FR_INT_ERR,	--  (2) Assertion failed
                     FR_NOT_READY,	--  (3) The physical drive cannot work
                     FR_NO_FILE,	--  (4) Could not find the file
                     FR_NO_PATH,	--  (5) Could not find the path
                     FR_INVALID_NAME,	--  (6) The path name format is invalid
                     FR_DENIED,		--  (7) Access denied due to prohibited access or directory full
                     FR_EXIST,		--  (8) Access denied due to prohibited access
                     FR_INVALID_OBJECT,	--  (9) The file/directory object is invalid
                     FR_WRITE_PROTECTED, --  (10) The physical drive is write protected
                     FR_INVALID_DRIVE,	--  (11) The logical drive number is invalid
                     FR_NOT_ENABLED,	--  (12) The volume has no work area
                     FR_NO_FILESYSTEM,	--  (13) There is no valid FAT volume
                     FR_MKFS_ABORTED,	--  (14) The f_mkfs() aborted due to any problem
                     FR_TIMEOUT,	--  (15) Could not get a grant to access the volume within defined period
                     FR_LOCKED,		--  (16) The operation is rejected according to the file sharing policy
                     FR_NOT_ENOUGH_CORE, --  (17) LFN working buffer could not be allocated
                     FR_TOO_MANY_OPEN_FILES, --  (18) Number of open files > _FS_LOCK
                     FR_INVALID_PARAMETER);  --  (19) Given parameter is invalid

   type Fat_FS is record
      FS_Type             : Natural := 0;
      Drive_Num           : Natural := 0;
      Drive_Typ           : Disk_IO.Drive_Type;
      Num_Fats            : Positive := 1;
      Win_Flag            : Boolean := False;
      Fsi_Flag            : Boolean := False;
      ID                  : Natural := 0;
      Root_Dir_Size       : Natural := 0;  --  n_rootdir
      Cluster_Size        : Natural := 0;
      Sector_Size         : Natural := 0;
      Lfn_Buffer          : Command_And_Token_Tables.String_Buffer;
      Dir_Buffer          : Command_And_Token_Tables.String_Buffer;
      Last_Cluster        : Long_Integer := 0;
      Free_Cluster        : Long_Integer := 0;
      Current_Directory   : Long_Integer := 0;
      --  Containing directory start cluster (invalid when cdir is 0)
      Cdc_Scl             : Long_Integer := 0;
      Cdc_Size            : Long_Integer := 0;  --  Size of containing directory
      --  Offset in the containing directory (invalid when cdir is 0)
      Cdc_Ofs             : Long_Integer := 0;
      Num_Fat_Entries     : Long_Integer := 0;
      Fat_Size            : Long_Integer := 0;
      Volume_Base         : Long_Integer := 0;
      Fat_Base            : Long_Integer := 0;
      Current_Dir_Cluster : Long_Integer := 0;
      Dir_Base            : Long_Integer := 0;
      Data_Base           : Long_Integer := 0;
      Win_Sector          : Long_Integer := Long_Integer (16#FFFFFFFF#);
      Win                 : Support.Byte_Vector;
   end record;

   type FA_Status is (FA_OPEN_EXISTING, FA_READ, FA_WRITE, FA_CREATE_NEW,
                      FA_CREATE_ALWAYS, FA_OPEN_ALWAYS, FA_OPEN_APPEND);
   for FA_Status use (FA_OPEN_EXISTING => 16#00#,
                      FA_READ          => 16#01#,
                      FA_WRITE         => 16#02#,
                      FA_CREATE_NEW    => 16#04#,
                      FA_CREATE_ALWAYS => 16#08#,
                      FA_OPEN_ALWAYS   => 16#10#,
                      FA_OPEN_APPEND   => 16#30#);

   function F_Mount (FS : in out Fat_FS; Path : String; Opt : Integer)
                     return F_Result;
   function Find_Volume (Path : String; RFS : in out Fat_FS;
                         Mode : in out Interfaces.Unsigned_16)
                         return F_Result;

end Fat_File;
