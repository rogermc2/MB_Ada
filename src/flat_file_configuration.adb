
package body Flat_File_Configuration is

   function Max_Dir_Buff (Num_C : Integer; SZ_DIRE : Long_Integer)
                          return Long_Integer is
   begin
      return Long_Integer (Num_C + 44) / 15 * SZ_DIRE;

   end Max_Dir_Buff;

end flat_file_configuration;
