
package Flat_File_Configuration is

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
      STR_VOLUME_ID                              : constant Positive := 1;
      Num_Volumes                                : constant Positive := 2;

   end flat_file_configuration;
