
with M_Misc; use M_Misc;

package body Command_And_Token_Tables is

   function Get_Token_Buffer_Item (Pos : Positive) return String is
      use String_Buffer_Package;
   begin
      return Element (Token_Buffer, Pos);

   end Get_Token_Buffer_Item;

   procedure Token_Buffer_Append (Item : String) is
      use String_Buffer_Package;
   begin
      Append (Token_Buffer, Item);

   end Token_Buffer_Append;

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
