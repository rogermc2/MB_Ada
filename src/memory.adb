
package body Memory is

   Memory_Map : array (1 .. Mem_Size / Page_Size / Pages_Per_Word)
     of unsigned;

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

   procedure Init_Heap is
   begin
      for index in 1 .. Mem_Size loop
         Memory_Map (index) := 0;
      end loop;

   end Init_Heap;

end Memory;
