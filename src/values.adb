
with Interfaces;
with Ada.Assertions;

with M_Basic;
with Support;

package body Values is

   function Get_Int (aString : String; Lo, Hi : Natural) return Integer is
      Result : Integer;
   begin

      return Result;

   end Get_Int;

   function Get_Integer (aString : String; Lo, Hi : Natural)
                         return Long_Long_Integer is
      theType : Function_Type := T_INT;
      F       : Configuration.MMFLOAT;
      I64     : Long_Long_Integer;
      S       : Unbounded_String;
   begin

      return I64;

   end Get_Integer;

   function Get_Value
     (Expression : Unbounded_String; Fa : in out Configuration.MMFLOAT;
      Ia         :  in out Long_Long_Integer; Sa : in out Unbounded_String;
      OO         :  in out Integer; Ta : in out Function_Type)
      return Unbounded_String is
      use Interfaces;
      use Ada.Assertions;
      use String_Buffer_Package;
      Routine_Name : constant String := "M_Basic.Get_Value ";
      F            : Configuration.MMFLOAT := 0.0;
      I64          : Long_Long_Integer := 0;
      S            : Unbounded_String;
      theType      : Function_Type := T_NOTYPE;  -- t
      P            : Positive := 1;
      Ro           : Positive;
      Token        : Unbounded_String;
   begin
      --        Test_Stack_Overflow;
      M_Basic.Skip_Spaces (Expression, P);
      Token := To_Unbounded_String (Slice (Expression, P, Length (Expression)));
      if M_Basic.Token_Function (To_String (Token)) = "Not" then
         P := P + 1;
         --  Recursion, get the next value
         Token := Get_Value (Token, F, I64, S, RO, theType);
         if theType and T_NBR = T_NBR then
            --  Invert the returned value
            if F = 0.0 then
               F := 1.0;
            else
               F := 0.0;
            end if;

         elsif theType and T_INT = T_INT then
            --  Invert the returned value
            if I64 = 0 then
               I64 := 1;
            else
               I64 := 0;
            end if;
         else
            Assert (False, Routine_Name & "invalid type, expected a number.");
         end if;

         M_Basic.Skip_Spaces (Expression, P);
         Fa := F;
         Ia := I64;
         Sa := S;
         Ta := theType;
         OO := Ro;

      elsif M_Basic.Token_Function (To_String (Token)) = "-" then
         null;
      end if;

      return Token;

   end Get_Value;

end Values;
