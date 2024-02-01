
package Flat_File_Configuration is

   Min_SS            : constant Long_Integer := 512;
   Max_SS            : constant Long_Integer := 512;
   FS_Read_Only      : constant Boolean := False;
   FS_EXFAT_Support  : constant Boolean := True;

   --   Use_Long_FileName switches the support of long file name (LFN).
   --   0: Disable support of LFN. Max_Long_FileName has no effect.
   --   1: Enable LFN with static working buffer on the BSS.
   --      Always NOT thread-safe.
   --   2: Enable LFN with dynamic working buffer on the STACK.
   --   3: Enable LFN with dynamic working buffer on the HEAP.

   --  To enable LFN, Unicode handling functions (option--unicode.c) must be
   --  added to the project.
   --  The working buffer occupies 2 x (Max_Long_FileName + 1) bytes and an
   --  additional 608 bytes when exFAT is enabled.
   --  Max_Long_FileName can be in the range from 12 to 255.
   --  It should be set 255 to support full featured LFN operations.
   --  When using stack for the working buffer, take care on stack overflow.
   --  When using heap memory for the working buffer, memory management
   --  functions, ff_memalloc() and ff_memfree(), must be added to the project.
   Use_Long_FileName : constant Natural := 2;
   Max_Long_FileName : constant Positive := 127;

   --  VOLUME_STRS defines the drive ID strings for each logical drive.
   --  The number of items must be equal to Num_Volumes.
   --  Valid characters for the drive ID strings are: A-Z and 0-9.
   VOLUME_STRS : constant array (0 .. 7) of Character :=
     ('A', 'B', 'C', 'D', 'E', 'F', 'G', 'H');
   --     type VOLUME_STRS is ('A', 'B', 'C', 'D', 'E', 'F', 'G', 'H');
   --     for VOLUME_STRS use ('A' => 0, 'B' => 1, 'C' => 2, 'D' => 3, 'E' => 4,
   --                          'F' => 5, 'G' => 6, 'H' => 7);

   --  STR_VOLUME_ID switches string support of volume ID.
   --  When _STR_VOLUME_ID is set to 1, also pre-defined strings can be used
   --  as drive number in the path name.
   Multi_Partition : constant Boolean := False;
   STR_VOLUME_ID   : constant Positive := 1;
   Num_Volumes     : constant Positive := 2;

   function Max_Dir_Buff (Num_C : Integer; SZ_DIRE : Long_Integer)
                          return Long_Integer;

end flat_file_configuration;
