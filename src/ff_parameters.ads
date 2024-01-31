
with Command_And_Token_Tables; use Command_And_Token_Tables;

package FF_Parameters is

   --  Additional file attribute bits for internal use
   AM_VOL  : constant := 16#08#;  --  Volume label
   AM_LFN  : constant := 16#0F#;  --  LFN entry
   AM_MASK  : constant := 16#3F#;  --  Mask of defined bits

   --  Additional file access control and file status flags for internal use
   FA_SEEKEND   : constant Integer := 16#20#;  --  Seek to end of the file on file open
   FA_MODIFIED : constant Integer := 16#40#;  --  File has been modified
   FA_DIRTY : constant Integer := 16#80#;  --  FIL.buf[] needs to be written-back

   --  Name status flags in fn[]
   NSFLAG : constant Integer := 11;  --  Index of the name status byte
   NS_LOSS  : constant := 16#01#;  --  Out of 8.3 format
   NS_LFN  : constant := 16#02#;  --  Force to create LFN entry
   NS_LAST  : constant := 16#04#;  --  Last segment
   NS_BODY  : constant := 16#08#;  --  Lower case flag (body)
   NS_EXT  : constant Integer := 16#10#;  --  Lower case flag (ext)
   NS_DOT   : constant Integer := 16#20#;  --  Dot entry
   NS_NOLFN  : constant Integer := 16#40#;  --  Do not find LFN
   NS_NONAME  : constant Integer := 16#80#;  --  Not followed

   --  Limits and boundaries
   MAX_DIR   : constant Integer := 16#200000#;  --  Max size of FAT directory
   MAX_DIR_EX  : constant Integer := 16#10000000#;  --  Max size of exFAT directory
   MAX_FAT12  : constant Integer := 16#FF5#;  --  Max FAT12 clusters (differs from specs, but correct for real DOS/Windows behavior)
   MAX_FAT16  : constant Integer := 16#FFF5#;  --  Max FAT16 clusters (differs from specs, but correct for real DOS/Windows behavior)
   MAX_FAT32 : constant := 16#0FFFFFF5#;  --  Max FAT32 clusters (not specified, practical limit)
   MAX_EXFAT  : constant DWord := 16#7FFFFFFD#;  --  Max exFAT clusters (differs from specs, implementation limit)

   --  FatFs refers the FAT structure as simple byte array instead of structure member
   --  because the C structure is not binary compatible between different platforms

   BS_JmpBoot   : constant Integer := 0;  --  x86 jump instruction (3-byte)
   BS_OEMName  : constant Integer := 3;  --  OEM name (8-byte)
   BPB_BytsPerSec : constant Integer := 11;  --  Sector size [byte] (WORD)
   BPB_SecPerClus : constant Integer := 13;  --  Cluster size [sector] (BYTE)
   BPB_RsvdSecCnt : constant Integer := 14;  --  Size of reserved area [sector] (WORD)
   BPB_NumFATs  : constant Integer := 16;  --  Number of FATs (BYTE)
   BPB_RootEntCnt : constant Integer := 17;  --  Size of root directory area for FAT12/16 [entry] (WORD)
   BPB_TotSec16 : constant Integer := 19;  --  Volume size (16-bit) [sector] (WORD)
   BPB_Media  : constant Integer := 21;  --  Media descriptor byte (BYTE)
   BPB_FATSz16  : constant Integer := 22;  --  FAT size (16-bit) [sector] (WORD)
   BPB_SecPerTrk : constant Integer := 24;  --  Track size for int13h [sector] (WORD)
   BPB_NumHeads : constant Integer := 26;  --  Number of heads for int13h (WORD)
   BPB_HiddSec  : constant Integer := 28;  --  Volume offset from top of the drive (DWORD)
   BPB_TotSec32 : constant Integer := 32;  --  Volume size (32-bit) [sector] (DWORD)
   BS_DrvNum  : constant Integer := 36;  --  Physical drive number for int13h (BYTE)
   BS_NTres  : constant Integer := 37;  --  Error flag (BYTE)
   BS_BootSig  : constant Integer := 38;  --  Extended boot signature (BYTE)
   BS_VolID  : constant Integer := 39;  --  Volume serial number (DWORD)
   BS_VolLab  : constant Integer := 43;  --  Volume label string (8-byte)
   BS_FilSysType   : constant Integer := 54;  --  File system type string (8-byte)
   BS_BootCode    : constant Integer := 62;  --  Boot code (448-byte)
   BS_55AA     : constant Long_Integer := 510;  --  Signature word (WORD)

   BPB_FATSz32  : constant Integer := 36;  --  FAT32: FAT size [sector] (DWORD)
   BPB_ExtFlags32 : constant Integer := 40;  --  FAT32: Extended flags (WORD)
   BPB_FSVer32  : constant Integer := 42;  --  FAT32: File system version (WORD)
   BPB_RootClus32 : constant Integer := 44;  --  FAT32: Root directory cluster (DWORD)
   BPB_FSInfo32 : constant Integer := 48;  --  FAT32: Offset of FSINFO sector (WORD)
   BPB_BkBootSec32  : constant Integer :=  50;  --  FAT32: Offset of backup boot sector (WORD)
   BS_DrvNum32    : constant Integer := 64;  --  FAT32: Physical drive number for int13h (BYTE)
   BS_NTres32    : constant Integer := 65;  --  FAT32: Error flag (BYTE)
   BS_BootSig32   : constant Integer := 66;  --  FAT32: Extended boot signature (BYTE)
   BS_VolID32    : constant Integer := 67;  --  FAT32: Volume serial number (DWORD)
   BS_VolLab32    : constant Integer := 71;  --  FAT32: Volume label string (8-byte)
   BS_FilSysType32 : constant Integer := 82;  --  FAT32: File system type string (8-byte)
   BS_BootCode32   : constant Integer := 90;  --  FAT32: Boot code (420-byte)

   BPB_ZeroedEx : constant Long_Integer := 11;  --  exFAT: MBZ field (53-byte)
   BPB_VolOfsEx   : constant Integer := 64;  --  exFAT: Volume offset from top of the drive [sector] (QWORD)
   BPB_TotSecEx   : constant Long_Integer := 72;  --  exFAT: Volume size [sector] (QWORD)
   BPB_FatOfsEx : constant Long_Integer := 80;  --  exFAT: FAT offset from top of the volume [sector] (DWORD)
   BPB_FatSzEx  : constant Long_Integer := 84;  --  exFAT: FAT size [sector] (DWORD)
   BPB_DataOfsEx : constant Long_Integer := 88;  --  exFAT: Data offset from top of the volume [sector] (DWORD)
   BPB_NumClusEx   : constant Long_Integer := 92;  --  exFAT: Number of clusters (DWORD)
   BPB_RootClusEx   : constant Integer := 96;  --  exFAT: Root directory start cluster (DWORD)
   BPB_VolIDEx  : constant Integer := 100;  --  exFAT: Volume serial number (DWORD)
   BPB_FSVerEx  : constant Long_Integer := 104;  --  exFAT: File system version (WORD)
   BPB_VolFlagEx : constant Integer := 106;  --  exFAT: Volume flags (BYTE)
   BPB_ActFatEx : constant Integer := 107;  --  exFAT: Active FAT flags (BYTE)
   BPB_BytsPerSecEx  : constant Long_Integer := 108;  --  exFAT: Log2 of sector size in unit of byte (BYTE)
   BPB_SecPerClusEx  : constant Long_Integer := 109;  --  exFAT: Log2 of cluster size in unit of sector (BYTE)
   BPB_NumFATsEx : constant Long_Integer := 110;  --  exFAT: Number of FATs (BYTE)
   BPB_DrvNumEx : constant Integer := 111;  --  exFAT: Physical drive number for int13h (BYTE)
   BPB_PercInUseEx : constant Integer := 112;  --  exFAT: Percent in use (BYTE)
   BPB_RsvdEx  : constant Integer := 113;  --  exFAT: Reserved (7-byte)
   BS_BootCodeEx : constant Integer := 120;  --  exFAT: Boot code (390-byte)

   DIR_Name    : constant Integer := 0;  --  Short file name (11-byte)
   DIR_Attr  : constant Integer := 11;  --  Attribute (BYTE)
   DIR_NTres  : constant Integer := 12;  --  Lower case flag (BYTE)
   DIR_CrtTime10 : constant Integer := 13;  --  Created time sub-second (BYTE)
   DIR_CrtTime  : constant Integer := 14;  --  Created time (DWORD)
   DIR_LstAccDate : constant Integer := 18;  --  Last accessed date (WORD)
   DIR_FstClusHI : constant Integer := 20;  --  Higher 16-bit of first cluster (WORD)
   DIR_ModTime  : constant Integer := 22;  --  Modified time (DWORD)
   DIR_FstClusLO : constant Integer := 26;  --  Lower 16-bit of first cluster (WORD)
   DIR_FileSize : constant Integer := 28;  --  File size (DWORD)
   LDIR_Ord    : constant Integer := 0;  --  LFN: LFN order and LLE flag (BYTE)
   LDIR_Attr  : constant Integer := 11;  --  LFN: LFN attribute (BYTE)
   LDIR_Type  : constant Integer := 12;  --  LFN: Entry type (BYTE)
   LDIR_Chksum  : constant Integer := 13;  --  LFN: Checksum of the SFN (BYTE)
   LDIR_FstClusLO : constant Integer := 26;  --  LFN: MBZ field (WORD)
   XDIR_Type    : constant Integer := 0;  --  exFAT: Type of exFAT directory entry (BYTE)
   XDIR_NumLabel : constant Integer := 1;  --  exFAT: Number of volume label characters (BYTE)
   XDIR_Label  : constant Integer := 2;  --  exFAT: Volume label (11-WORD)
   XDIR_CaseSum : constant Integer := 4;  --  exFAT: Sum of case conversion table (DWORD)
   XDIR_NumSec  : constant Integer := 1;  --  exFAT: Number of secondary entries (BYTE)
   XDIR_SetSum  : constant Integer := 2;  --  exFAT: Sum of the set of directory entries (WORD)
   XDIR_Attr  : constant Integer := 4;  --  exFAT: File attribute (WORD)
   XDIR_CrtTime : constant Integer := 8;  --  exFAT: Created time (DWORD)
   XDIR_ModTime : constant Integer := 12;  --  exFAT: Modified time (DWORD)
   XDIR_AccTime : constant Integer := 16;  --  exFAT: Last accessed time (DWORD)
   XDIR_CrtTime10 : constant Integer := 20;  --  exFAT: Created time subsecond (BYTE)
   XDIR_ModTime10 : constant Integer := 21;  --  exFAT: Modified time subsecond (BYTE)
   XDIR_CrtTZ  : constant Integer := 22;  --  exFAT: Created timezone (BYTE)
   XDIR_ModTZ  : constant Integer := 23;  --  exFAT: Modified timezone (BYTE)
   XDIR_AccTZ  : constant Integer := 24;  --  exFAT: Last accessed timezone (BYTE)
   XDIR_GenFlags : constant Integer := 33;  --  exFAT: General secondary flags (WORD)
   XDIR_NumName : constant Integer := 35;  --  exFAT: Number of file name characters (BYTE)
   XDIR_NameHash : constant Integer := 36;  --  exFAT: Hash of file name (WORD)
   XDIR_ValidFileSize  : constant Integer := 40;  --  exFAT: Valid file size (QWORD)
   XDIR_FstClus   : constant Integer := 52;  --  exFAT: First cluster of the file data (DWORD)
   XDIR_FileSize   : constant Integer := 56;  --  exFAT: File/Directory size (QWORD)

   SZDIRE   : constant Integer := 32;  --  Size of a directory entry
   DDEM     : constant Integer := 16#E5#;  --  Deleted directory entry mark set to DIR_Name[0]
   RDDEM    : constant := 16#05#;  --  Replacement of the character collides with DDEM
   LLEF     : constant Integer := 16#40#;  --  Last long entry flag in LDIR_Ord

   FSI_LeadSig    : constant Integer := 0;  --  FAT32 FSI: Leading signature (DWORD)
   FSI_StrucSig : constant Integer := 484;  --  FAT32 FSI: Structure signature (DWORD)
   FSI_Free_Count : constant Integer := 488;  --  FAT32 FSI: Number of free clusters (DWORD)
   FSI_Nxt_Free : constant Integer := 492;  --  FAT32 FSI: Last allocated cluster (DWORD)

   MBR_Table  : constant Integer := 446;  --  MBR: Offset of partition table in the MBR
   SZ_PTE   : constant Integer := 16;  --  MBR: Size of a partition table entry
   PTE_Boot    : constant Integer := 0;  --  MBR PTE: Boot indicator
   PTE_StHead  : constant Integer := 1;  --  MBR PTE: Start head
   PTE_StSec  : constant Integer := 2;  --  MBR PTE: Start sector
   PTE_StCyl  : constant Integer := 3;  --  MBR PTE: Start cylinder
   PTE_System  : constant Long_Integer := 4;  --  MBR PTE: System ID
   PTE_EdHead    : constant Integer := 5;  --  MBR PTE: End head
   PTE_EdSec    : constant Integer := 6;  --  MBR PTE: End sector
   PTE_EdCyl    : constant Integer := 7;  --  MBR PTE: End cylinder
   PTE_StLba  : constant Long_Integer := 8;  --  MBR PTE: Start in LBA
   PTE_SizLba  : constant Integer := 12;  --  MBR PTE: Size in LBA

end FF_Parameters;
