
with Interfaces;
with Ada.Assertions; use Ada.Assertions;

with M_Basic;

package body Values is

   function Do_Not
     (Prev_Token : Unbounded_String; P : in out Positive;
      Fa         : in out Configuration.MMFLOAT; Ia : in out Long_Long_Integer;
      Sa         : in out Unbounded_String; RO    : in out Integer;
      Ta         : in out Function_Type) return Unbounded_String is
      use Interfaces;
      Routine_Name : constant String := "M_Basic.Do_Not ";
      Token        : Unbounded_String;
   begin
      P := P + 1;
      Token := To_Unbounded_String (Slice (Prev_Token, P, Length (Prev_Token)));
      --  Recursion, get the next value
      Token := Get_Value (Token, Fa, Ia, Sa, RO, Ta);
      if (Ta and T_NBR) = T_NBR then
         --  Invert the returned value
         if Fa = 0.0 then
            Fa := 1.0;
         else
            Fa := 0.0;
         end if;

      elsif (Ta and T_INT) = T_INT then
         --  Invert the returned value
         if Ia = 0 then
            Ia := 1;
         else
            Ia := 0;
         end if;
      else
         Assert (False, Routine_Name & "invalid type, expected a number.");
      end if;

      M_Basic.Skip_Spaces (Token, P);

      return Token;

   end Do_Not;

   --  Evaluate evaluates an expression.
   --  Evaluate returns either the float or string in the pointer arguments
   --  *t points to an integer which holds the type of variable we are looking for
   --  if *t = T_STR or T_NBR or T_INT throw an error will be thrown if the
   --  result is not the correct type
   --  if *t = T_NOTYPE it will not throw an error and will return the type
   --  found in *t
   --  this will check that the expression is terminated correctly and throw
   --  an error if not.
   --  flags & E_NOERROR will suppress that check.
   function Evaluate
     (Expression : in out String; Fa : Configuration.MMFLOAT; Ia : Long_Long_Integer;
      Sa         : in out String; Ta : Integer; Flags : Integer) return Long_Long_Integer is
      Result   : Long_Long_Integer;
      O        : Integer;
      T        : Integer := Ta;
      Func     : Unbounded_String;
   begin
      --        Get_Value ();
      return Result;

   end Evaluate;

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
--        Routine_Name : constant String := "M_Basic.Get_Value ";
      P            : Positive := 1;
      Token        : Unbounded_String;
   begin
      --        Test_Stack_Overflow;
      M_Basic.Skip_Spaces (Expression, P);
      Token := To_Unbounded_String (Slice (Expression, P, Length (Expression)));
      if M_Basic.Token_Function (To_String (Token)) = "Not" then
         Token := Do_Not (Token, P, Fa, Ia, Sa, OO, Ta);

      elsif M_Basic.Token_Function (To_String (Token)) = "-" then
         null;
      end if;

      return Token;

   end Get_Value;

end Values;
