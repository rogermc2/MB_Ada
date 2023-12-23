
with Ada.Strings;
--  with Ada.Text_IO; use Ada.Text_IO;
with Ada.Unchecked_Conversion;

with M_Misc; use M_Misc;
with Serial_File_IO;

package body Command_And_Token_Tables is

   In_Buffer    : Unbounded_String;

   function Get_Input_Character (Pos : Positive) return Character is
   begin
      return Element (In_Buffer, Pos);

   end Get_Input_Character;

   function Get_Input_Slice (Pos1, Pos2 : Positive) return String is
   begin
      return Slice (In_Buffer, Pos1, Pos2);

   end Get_Input_Slice;

   function Input_Buffer_Length return Natural is
   begin
      return Length (In_Buffer);

   end Input_Buffer_Length;

   procedure Load_Input_Buffer (File_Num : Natural) is
   begin
      Serial_File_IO.MM_Get_Line (File_Num, In_Buffer);

   end Load_Input_Buffer;

   procedure Replace_In_Buffer_Character (Pos : Positive; aChar : Character) is
   begin
      Replace_Element (In_Buffer, Pos, aChar);

   end Replace_In_Buffer_Character;

   procedure Skip_In_Buffer_Spaces (Pos : in out Positive) is
   begin
      while  Element (In_Buffer, Pos) = ' ' loop
         Pos := Pos + 1;
      end loop;

   end Skip_In_Buffer_Spaces;

   procedure Skip_Spaces (Buffer : String_Buffer; Pos : in out Positive) is
      use String_Buffer_Package;
   begin
      while  Element (Buffer, Pos)(1) = ' ' loop
         Pos := Pos + 1;
      end loop;

   end Skip_Spaces;

   --  Skip_Element skips to the the zero char that preceeds an element
   procedure Skip_Buffer_Element (Buffer : String_Buffer;
                                  Pos    : in out Positive) is
      --        Routine_Name : constant String :=
      --                         "Command_And_Token_Tables.Skip_Token_Buffer_Element";
      use String_Buffer_Package;
   begin
      while Pos <= Integer (Buffer.Length) and then
        Buffer (Pos)(1) /= '0' loop
         Pos := Pos + 1;
      end loop;

   end Skip_Buffer_Element;

   procedure Skip_Buffer_Spaces (Buffer : in out String_Buffer;
                                 Pos    : in out Positive) is
      use String_Buffer_Package;
   begin
      while Pos <= Integer (Length (Buffer)) and then
        Element (Buffer, Pos)(1) = ' ' loop
         Pos := Pos + 1;
      end loop;

   end Skip_Buffer_Spaces;

   procedure Buffer_Append (Buffer : in out String_Buffer; Item : String) is
      use String_Buffer_Package;
   begin
      Append (Buffer, Item);

   end Buffer_Append;

   function Buffer_Length (Buffer : String_Buffer) return Natural is
   begin
      return Natural (Buffer.Length);

   end Buffer_Length;

   function Buffer_Not_Empty (Buffer : String_Buffer) return Boolean is
      use String_Buffer_Package;
   begin
      return not Is_Empty (Buffer);

   end Buffer_Not_Empty;

   function Token_Type (Index : Integer) return Function_Type is
      T_Type : Function_Type := T_NA;
   begin
      if Index < Token_Table'Length + C_Base_Token and then
        Index >= C_Base_Token then
         T_Type := Token_Table (Index).Command_Type;
      end if;

      return T_Type;

   end Token_Type;

   procedure Trim_Input_Buffer (Side : Ada.Strings.Trim_End) is
   begin
      Trim (In_Buffer, Side);

   end Trim_Input_Buffer;

end  Command_And_Token_Tables;
