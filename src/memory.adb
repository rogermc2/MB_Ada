
package body Memory is

   procedure Clear_Temp_Memory is
   begin
      null;
   end Clear_Temp_Memory;

   function Get_Temp_Memory (Num_Bytes : Positive) return Unsigned_Byte_Array is
      Byte_Array : Unsigned_Byte_Array (1 .. Num_Bytes) := (others => 0);
   begin
      return Byte_Array;

   end Get_Temp_Memory;

end Memory;
