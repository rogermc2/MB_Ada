
with Ada.Strings.Unbounded; use Ada.Strings.Unbounded;

with Command_And_Token_Tables; use Command_And_Token_Tables;
with Configuration;

package Values is

   function Get_Int (aString : String; Lo, Hi : Natural) return Integer;
   function Get_Integer (aString : String; Lo, Hi : Natural)
                         return Long_Long_Integer;
   function Get_Value
     (Expression : Unbounded_String; Fa : in out Configuration.MMFLOAT;
      Ia         :  in out Long_Long_Integer; Sa : in out Unbounded_String;
      OO         :  in out Integer; Ta : in out Function_Type)
      return Unbounded_String;

end Values;
