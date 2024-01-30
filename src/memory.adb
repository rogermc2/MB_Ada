
package body Memory is

   procedure Clear_Temp_Memory is
   begin
      null;
   end Clear_Temp_Memory;

   function Get_Temp_Memory (Num_Bytes : Long_Integer)
                             return Byte_Array is
      Bytes : Byte_Array (1 .. Num_Bytes) := (others => 0);
   begin
      return Bytes;

   end Get_Temp_Memory;

end Memory;
