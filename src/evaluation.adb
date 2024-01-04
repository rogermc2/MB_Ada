
with Interfaces;
with Ada.Assertions; use Ada.Assertions;
with Ada.Strings;

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
      New_Exp      : Unbounded_String;
      Fa1          : Configuration.MMFLOAT := Fa;
      Fa2	         : Configuration.MMFLOAT := 0.0;
      Ia1          : Long_Long_Integer := Ia;
      Ia2          : Long_Long_Integer := 0;
      --  O1      : Natural := OO;
      O2           : Natural := 0;
      --  Sa1     : Unbounded_String := Sa;
      Sa2          : Unbounded_String;
      T1           : Function_Type := Ta;
      T2           : Function_Type := T_NA;
      Func         : Access_Procedure;
      Done         : Boolean := False;
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
   procedure Evaluate
     (Expression : in out Unbounded_String; Fa : in out Configuration.MMFLOAT;
      Ia         : in out Long_Long_Integer; Sa : in out Unbounded_String;
      Ta         : in out Function_Type; Flags : Interfaces.Unsigned_16) is
      use Interfaces;
      use Ada.Strings;
      Routine_Name : constant String := "M_Basic.Evaluate ";
      O            : Natural := 0;
      S            : Unbounded_String;
      T            : Function_Type := Ta;
   begin
      --  1122 get the left hand side of the expression,
      --  the operator is returned in o
      Expression := Get_Value (Expression, Fa, Ia, S, O, T);
      while O /= Global.E_END loop
         Expression := Do_Expression (Expression, Fa, Ia, S, O, T);
      end loop;

      Assert ((T and T_STR) /= T_STR or else
                not (((Ta and T_NBR) = T_NBR) or else
                    ((Ta and T_INT) = T_INT)), Routine_Name &
                "expected a nmber.");
      Assert ((T and T_STR) /= T_STR or else
                not (((T and T_NBR) = T_NBR) or else
                    ((T and T_INT) = T_INT)), Routine_Name & "expected a str.");
      Assert (O = Global.E_END, Routine_Name & "invalid number of arguments.");

      if (Ta and T_NBR) = T_NBR and then (T and T_INT) = T_INT then
         Fa := Configuration.MMFLOAT (Ia);
      elsif (Ta and T_INT) = T_INT and then (T and T_NBR) = T_NBR then
         Ia := Long_Long_Integer (Fa);
      end if;

      Ta := T;
      Sa := S;

      if (Flags and Global.E_NOERROR) /= Global.E_NOERROR then
         Expression := Trim (Expression, Left);
         Assert (Length (Expression) = 0 or else
                 Element (Expression, 1) = ',' or else
                 Element (Expression, 1) = ')' or else
                 Element (Expression, 1) = ''',
                 Routine_Name & "invalid syntax");
      end if;

   end Evaluate;

   function Get_Int (Expression : in out Unbounded_String; Lo, Hi : Integer)
                     return Integer is
      Routine_Name : constant String := "M_Basic.Get_Int ";
      Value        : constant Integer := Integer (Get_Integer (Expression));
   begin
      Assert (Value >= Lo and then Value <= Hi, Routine_Name &
                Integer'Image (Value) & " is invalid, should be in the range " &
                Integer'Image (Lo) & " -" & Integer'Image (Hi));
      return Value;

   end Get_Int;

   function Get_Integer (Expression : in out Unbounded_String)
                         return Long_Long_Integer is
      use Interfaces;
      T    : Function_Type := T_INT;
      F    : Configuration.MMFLOAT := 0.0;
      S    : Unbounded_String;
      I64  : Long_Long_Integer := 0;
   begin
      Evaluate (Expression, F, I64, S, T, 0);

      if (T and T_NBR) = T_NBR then
         return Long_Long_Integer (F);
      else
         return I64;
      end if;

   end Get_Integer;

   function Get_Value
     (Expression : Unbounded_String; Fa : in out Configuration.MMFLOAT;
      Ia         :  in out Long_Long_Integer; Sa : in out Unbounded_String;
      OO         :  in out Natural; Ta : in out Function_Type)
      return Unbounded_String is
      use Interfaces;
      use M_Basic;
      Routine_Name : constant String := "M_Basic.Get_Value ";
      P            : Positive := 1;
      TP           : Positive := P;
      Data         : Unbounded_String;
      Data_TP      : Unbounded_String;
      Op           : Unbounded_String;
      Op_Val       : Unsigned_16;
      Temp         : Function_Type;
      Func         : Access_Procedure;
   begin
      --        Test_Stack_Overflow;
      M_Basic.Skip_Spaces (Expression, P);
      Data := To_Unbounded_String (Slice (Expression, P, Length (Expression)));
      Op := Token_Function (To_String (Data));
      Op_Val := Unsigned_16'Value (To_String (Op));

      if Op = "Not" then
         Data := Do_Not (Data, P, Fa, Ia, Sa, OO, Ta);

      elsif Op = "-" then
         null;
      elsif (Op_Val and (T_FUN or T_FNA)) = (T_FUN or T_FNA) then
         if (Op_Val and T_FUN) = T_FUN then
            --  Do_Close_Bracket ();
            null;
         end if;
         P := P + 1;
         Data_TP := To_Unbounded_String (Slice (Data, TP, Length (Data)));
         T_Arg := Type_Mask (Data_TP);
         Temp := T_Arg;
         Op := Token_Function (To_String (Data_TP));
         Func := Token_Table (Integer'Value (To_String (Op))).Function_Ptr;
         Func.all;

         Assert (Temp and T_Arg /= 0, Routine_Name & "internal error.");
      elsif Op = "(" then
         null;
      end if;

      return Data;

   end Get_Value;

end Evaluation;
