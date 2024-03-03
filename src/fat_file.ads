
with Command_And_Token_Tables; use Command_And_Token_Tables;
with Disk_IO;
with FF_Parameters; use FF_Parameters;
with Flat_File_Configuration; use Flat_File_Configuration;

package Fat_File is

   type FS_FAT_Format is (FS_FAT_Unknown, FS_FAT12, FS_FAT16, FS_FAT32,
                          FS_EXFAT);
   for FS_FAT_Format use (FS_FAT_Unknown => 0, FS_FAT12 => 1, FS_FAT16 => 2,
                          FS_FAT32 => 3, FS_EXFAT => 4);

   type FS_Format_Check is (Check_FAT, Check_EXFAT, Check_Not_FAT, Check_Not_BS,
                            Check_Disk_Error);
   for FS_Format_Check use (Check_FAT => 0, Check_EXFAT => 1,
                            Check_Not_FAT => 2, Check_Not_BS => 3,
                            Check_Disk_Error => 4);

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

   subtype Win_Range is Long_Integer range 1 .. Long_Integer'Max_Size_In_Storage_Elements;

   type LFN_Buff is array (0 .. Max_Long_FileName + 1) of Word;
   type Dir_Buff is array (0 .. Max_Dir_Buff (Max_Long_FileName, SZDIRE)) of Byte;

   type Fat_FS (Win_Size : Win_Range := 1) is record
      FS_Type             : FS_FAT_Format := FS_FAT_Unknown;
      Drive_Num           : Natural := 0;
      Drive_Typ           : Disk_IO.Drive_Type;
      Num_Fats            : Byte := 1;
      Win_Flag            : Boolean := False;
      Fsi_Flag            : Word := 0;
      ID                  : Natural := 0;
      Root_Dir_Size       : DWord := 0;  --  n_rootdir
      Cluster_Size        : Byte := 0;
      --  diskio.h #define GET_SECTOR_SIZE 2, needed when _MAX_SS != _MIN_SS
      Sector_Size         : Long_Integer := 2;
      Lfn_Buffer          : LFN_Buff;
      Dir_Buffer          : Dir_Buff;
      Last_Cluster        : Long_Integer := 0;
      Free_Cluster        : Long_Integer := 0;
      Current_Directory   : Long_Integer := 0;
      --  Containing directory start cluster (invalid when cdir is 0)
      Cdc_Scl             : Long_Integer := 0;
      Cdc_Size            : Long_Integer := 0;  --  Size of containing directory
      --  Offset in the containing directory (invalid when cdir is 0)
      Cdc_Ofs             : Long_Integer := 0;
      Num_Fat_Entries     : DWord := 0;
      Fat_Size            : DWord := 0;
      Volume_Base         : DWord := 0;
      Fat_Base            : DWord := 0;
      Current_Dir_Cluster : Long_Integer := 0;
      Dir_Base            : DWord := 0;
      Data_Base           : DWord := 0;
      Win_Sector          : DWord := DWord (16#FFFFFFFF#);
      Win                 : Byte_Array (1 .. Win_Size);
   end record;

   type FA_Status is (FA_OPEN_EXISTING, FA_READ, FA_WRITE, FA_CREATE_NEW,
                      FA_CREATE_ALWAYS, FA_OPEN_ALWAYS, FA_OPEN_APPEND);
   for FA_Status use (FA_OPEN_EXISTING => Word (16#00#),
                      FA_READ          => Word (16#01#),
                      FA_WRITE         => Word (16#02#),
                      FA_CREATE_NEW    => Word (16#04#),
                      FA_CREATE_ALWAYS => Word (16#08#),
                      FA_OPEN_ALWAYS   => Word (16#10#),
                      FA_OPEN_APPEND   => Word (16#30#));

   function Check_File_System (FS : in out Fat_FS; Sect : in out DWord)
                               return FS_Format_Check;
   function F_Mount (FS : in out Fat_FS; Path : String; Opt : Integer)
                     return F_Result;
   function Find_Volume (Path : String; RFS : out Fat_FS; Mode : in out Word)
                         return F_Result;

end Fat_File;
