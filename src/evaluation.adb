
with Interfaces;
with Ada.Assertions; use Ada.Assertions;

with Command_And_Token_Functions; use Command_And_Token_Functions;
with Global;
with M_Basic;

package body Evaluation is

   --  MMBasic 1101 doexpr
   function Do_Expression
     (Expression : in out Unbounded_String; Fa : in out Configuration.MMFLOAT;
      Ia         : in out Long_Long_Integer; Sa : in out Unbounded_String;
      OO         : in out Natural; Ta : in out Function_Type)
      return Unbounded_String is
      use Interfaces;
      use Configuration;
      Routine_Name : constant String := "M_Basic.Do_Expression ";
      New_Exp : Unbounded_String;
      Fa1     : Configuration.MMFLOAT := Fa;
      Fa2	  : Configuration.MMFLOAT := 0.0;
      Ia1     : Long_Long_Integer := Ia;
      Ia2     : Long_Long_Integer := 0;
      --  O1      : Natural := OO;
      O2      : Natural := 0;
      --  Sa1     : Unbounded_String := Sa;
      Sa2     : Unbounded_String;
      T1      : Function_Type := Ta;
      T2      : Function_Type := T_NA;
      Func    : Access_Procedure;
      Done    : Boolean := False;
   begin
      --  MMBasic 1116
      New_Exp := Get_Value (Expression, Fa2, Ia2, Sa2, O2, T2);
      while not Done loop
         if OO /= Global.E_END and then
           Token_Table (OO).Precedence > Token_Table (OO).Precedence then
            --  MMBasic 1155
            New_Exp := Do_Expression (New_Exp, Fa, Ia, Sa, OO, Ta);
         else
            --  MMBasic 1120
            Assert ((T1 and T_STR) = (T2 and T_STR), Routine_Name &
                   "incompatible exptesion types.");
            T_Arg := Token_Table (OO).Command_Type and (T_NBR or T_INT);
            if T_Arg = T_NBR then
               if (T1 and T_INT) = T_INT then
                  Fa1 := MMFloat (Ia1);
                  T1 := T_NBR;
               end if;
               if (T2 and T_INT) = T_INT then
                  Fa2 := MMFloat (Ia2);
                  T2 := T_NBR;
               end if;

            elsif T_Arg = T_INT then
               if (T1 and T_NBR) = T_NBR then
                  Ia1 := Long_Long_Integer (Fa1);
                  T1 := T_INT;
               end if;
               if (T2 and T_NBR) = T_NBR then
                  Ia2 := Long_Long_Integer (Fa2);
                  T2 := T_INT;
               end if;
            end if;

            if T_Arg = (T_NBR or T_INT) then
               if (T1 and T_NBR) = T_NBR and then (T2 and T_INT) = T_INT then
                  Fa2 := MMFloat (Ia2);
                  T2 := T_NBR;
               end if;
               if (T1 and T_INT) = T_INT and then (T2 and T_NBR) = T_NBR then
                  Fa1 := MMFloat (Ia1);
                  T1 := T_NBR;
               end if;
            end if;

            Assert ((Token_Table (OO).Command_Type and T_OPER) = T_OPER,
                    Routine_Name & "invalid operator.");

            F_Arg1 := Fa1;
            F_Arg2 := Fa2;
            S_Arg1 := Sa;
            S_Arg2 := Sa2;
            I_Arg1 := Ia1;
            I_Arg2 := Ia2;
            T_Arg  := T1;
            Func := Token_Table (OO).Function_Ptr;
            Func.all;

            Fa := F_Ret;
            Ia := I_Ret;
            Sa := S_Ret;

            OO := O2;
            Ta := T_Arg;

            Done := True;
         end if;
      end loop;

      return New_Exp;

   end Do_Expression;

   function Do_Not
     (Prev_Token : Unbounded_String; P : in out Positive;
      Fa         : in out Configuration.MMFLOAT; Ia : in out Long_Long_Integer;
      Sa         : in out Unbounded_String; RO    : in out Natural;
      Ta         : in out Function_Type) return Unbounded_String is
      use Interfaces;
      Routine_Name : constant String := "M_Basic.Do_Not ";
      Token        : Unbounded_String;
   begin
      P := P + 1;
      --  Terminate recursion when end of Prev_Token processd.
      if P <= Length (Prev_Token) then
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
      end if;

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
     (Expression : in out Unbounded_String; Fa : in out Configuration.MMFLOAT;
      Ia         : in out Long_Long_Integer; Sa : in out Unbounded_String;
      Ta         : in out Function_Type; Flags : Integer)
      return Long_Long_Integer is
      use Interfaces;
      OO         : Natural := 0;
      New_Exp    : Unbounded_String :=
        Get_Value (Expression, Fa, Ia, Sa, OO, Ta);
      Result     : Long_Long_Integer;
   begin
      while OO /= Global.E_END loop
         New_Exp := Do_Expression (New_Exp, Fa, Ia, Sa, OO, Ta);
      end loop;
      if (Ta and T_NBR) = T_NBR then
         Result := Long_Long_Integer (Fa);
      else
         Result := Ia;
      end if;

      return Result;

   end Evaluate;

   function Get_Int (aString : Unbounded_String; Lo, Hi : Natural)
                     return Integer is
      Result : Integer;
   begin

      return Result;

   end Get_Int;

   function Get_Integer (aString : in out Unbounded_String) return Long_Long_Integer is
      T   : Function_Type := T_INT;
      F   : Configuration.MMFLOAT := 0.0;
      S   : Unbounded_String;
      I64 : Long_Long_Integer := 0;
   begin
      I64 := Evaluate (aString, F, I64, S, T, 0);

      return I64;

   end Get_Integer;

   function Get_Value
     (Expression : Unbounded_String; Fa : in out Configuration.MMFLOAT;
      Ia         :  in out Long_Long_Integer; Sa : in out Unbounded_String;
      OO         :  in out Natural; Ta : in out Function_Type)
      return Unbounded_String is
      --        Routine_Name : constant String := "M_Basic.Get_Value ";
      P            : Positive := 1;
      Data         : Unbounded_String;
   begin
      --        Test_Stack_Overflow;
      M_Basic.Skip_Spaces (Expression, P);
      Data := To_Unbounded_String (Slice (Expression, P, Length (Expression)));
      if M_Basic.Token_Function (To_String (Data)) = "Not" then
         Data := Do_Not (Data, P, Fa, Ia, Sa, OO, Ta);

      elsif M_Basic.Token_Function (To_String (Data)) = "-" then
         null;
      end if;

      return Data;

   end Get_Value;

end Evaluation;
