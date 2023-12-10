
with Ada.Strings.Unbounded; use Ada.Strings.Unbounded;

with M_Basic;

package Serial_File_IO is

   type File_Data is record
      Com  : Natural := 0;
      Name : Unbounded_String;
   end record;

   Max_Com_Ports  : constant Positive := 4;
   Max_Open_Files : constant Positive := 10;

   File_Table     : array (1 .. Max_Open_Files) of File_Data;

   procedure MM_Get_Line (File_Num : Integer;
                          Buffer   : in out M_Basic. UB_String_Buffer);

end Serial_File_IO;
