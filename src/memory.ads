
with Command_And_Token_Tables; use Command_And_Token_Tables;

package Memory is

   Temp_Memory_Is_Changed : Boolean := False;

   procedure Clear_Temp_Memory;
   function Get_Temp_Memory (Num_Bytes : Long_Integer) return Byte_Array;

end Memory;
