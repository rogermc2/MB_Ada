
with M_Misc; use M_Misc;

package body Command_And_Token_Tables is

   Token_Buffer : String_Buffer;

   procedure Clear_Token_Buffer is
      use String_Buffer_Package;
      begin
      Token_Buffer := Empty_Vector;

   end Clear_Token_Buffer;

   function Get_Token_Buffer_Item (Pos : Positive) return String is
      use String_Buffer_Package;
   begin
      return Element (Token_Buffer, Pos);

   end Get_Token_Buffer_Item;

   procedure Skip_Spaces (Buffer : String_Buffer; Pos : in out Positive) is
      use String_Buffer_Package;
   begin
      while  Element (Buffer, Pos)(1) = ' ' loop
         Pos := Pos + 1;
      end loop;

   end Skip_Spaces;

   --  Skip_Element skips to the the zero char that preceeds an element
   procedure Skip_Token_Buffer_Element (Pos : in out Positive) is
      use String_Buffer_Package;
   begin
      while  Integer'Value (Element (Token_Buffer, Pos)) /= 0 loop
         Pos := Pos + 1;
      end loop;

   end Skip_Token_Buffer_Element;

   procedure Skip_Token_Buffer_Spaces (Pos : in out Positive) is
      use String_Buffer_Package;
   begin
      while  Element (Token_Buffer, Pos)(1) = ' ' loop
         Pos := Pos + 1;
      end loop;

   end Skip_Token_Buffer_Spaces;

   procedure Token_Buffer_Append (Item : String) is
      use String_Buffer_Package;
   begin
      Append (Token_Buffer, Item);

   end Token_Buffer_Append;

   function Token_Buffer_Length return Natural is
      begin
      return Natural (Token_Buffer.Length);

   end Token_Buffer_Length;

   function Token_Buffer_Not_Empty return Boolean is
      use String_Buffer_Package;
      begin
      return not Is_Empty (Token_Buffer);

      end Token_Buffer_Not_Empty;

   function Token_Type (Index : Integer) return Function_Type is
      T_Type : Function_Type := T_NA;
   begin
      if Index < Token_Table'Length + C_Base_Token and then
        Index >= C_Base_Token then
         T_Type := Token_Table (Index).Command_Type;
      end if;

      return T_Type;

   end Token_Type;

end  Command_And_Token_Tables;
