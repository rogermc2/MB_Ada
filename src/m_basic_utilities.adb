
with Ada.Assertions;
with Ada.Characters.Handling;

with Command_And_Token_Functions;

package body M_Basic_Utilities is

   Var_Count   : Natural := 0;
   Var_Index   : Natural := 0;
   Local_Index : Natural := 0;
   Arg_Buff    : Unbounded_String;
   Arg_V       : String_Buffer;
   Arg_C       : Interfaces.Unsigned_16;
   Arg_T       : Function_Type;
   Option_Base : Natural := 0;

   function Get_Close_Bracket
     (Expression : Unbounded_String; Pos : in out Positive) return Positive is
      use Ada.Assertions;
      use Interfaces;
      Routine_Name : constant String := "M_Basic_Utilities.Get_Close_Bracket ";
      Index        : Integer := 0;
      aChar        : Character;
      In_Quote     : Boolean := False;
      Done         : Boolean := False;
   begin
      while not Done loop
         Assert (Pos <= Length (Expression), Routine_Name &
                   "closiing bracket expected");
         aChar := Element (Expression, Pos);
         if aChar = '"' then
            In_Quote := not In_Quote;
         end if;

         if not In_Quote then
            if aChar = ')' then
               Index := Index - 1;
            elsif aChar = '(' or else
              ((Token_Type (Integer'Value (Character'Image (aChar))) and T_FUN)
               = T_FUN) then
               Index := Index + 1;
            end if;
         end if;

         Pos := Pos + 1;
         Done := Index = 0;
      end loop;

      return Pos - 1;

   end Get_Close_Bracket;

   function Is_Line_Num (aChar : Character) return Boolean is
      use Ada.Characters.Handling;
   begin
      return Is_Alphanumeric (aChar);
   end Is_Line_Num;
   pragma Inline (Is_Line_Num);

   function Is_Name_Character (aChar : Character) return Boolean is
      use Ada.Characters.Handling;
      --        Routine_Name : constant String := "M_Basic.Is_Name_Character ";
   begin
      return Is_Alphanumeric (aChar) or else aChar = '_' or else aChar = ':';

   end Is_Name_Character;

   function Is_Name_End (aChar : Character) return Boolean is
   begin
      return Is_Line_Num (aChar) or else aChar = '_' or else
        aChar = '.' or else aChar = '$' or else aChar = '|' or else
        aChar = '%';

   end Is_Name_End;

   function Is_Name_Start (aChar : Character) return Boolean is
      use Ada.Characters.Handling;
      --        Routine_Name : constant String := "M_Basic.Is_Name_Start ";
   begin
      return Is_Alphanumeric (aChar) or aChar = '_';

   end Is_Name_Start;

   procedure  Make_Args
     (Expression : Unbounded_String; Pos : Positive; Max_Args : Positive;
      Arg_Buff   : in out Unbounded_String; Arg_V  : in out String_Buffer;
      Arg_C      : out Interfaces.Unsigned_16; Delim : String) is
      use Interfaces;
      use Ada.Assertions;
      use Ada.Strings;
      use Command_And_Token_Functions;
      use String_Buffer_Package;
      Routine_Name   : constant String := "M_Basic_Utilities.Make_Args ";
      Then_Token     : constant Natural := tokenTHEN;
      Else_Token     : constant Natural := tokenELSE;
      Op             : Unbounded_String := Arg_Buff;
      Op_Ptr         : Integer := 1;
      String_1       : String (1 .. 1);
      aChar          : Character;
      TP             : Positive := Pos;
      X              : Positive;
      In_Arg         : Boolean := False;
      Expect_Cmd     : Boolean := False;
      Expect_Bracket : Boolean := False;
      Delim_Ptr      : Positive := 1;
      Token          : Natural;
      T_Token        : Function_Type;
      Term           : Unbounded_String;
      Match          : Boolean := False;
      Done           : Boolean := False;

      procedure C1 is
         Routine_Name : constant String := "M_Basic_Utilities.Make_Args.C! ";
         Then_Token   : constant Natural := tokenTHEN;
         Else_Token   : constant Natural := tokenELSE;
         Token        : constant Natural
           := Integer'Value (Character'Image (Element (Expression, Pos)));
      begin
         --  MMBasic 2165
         if Token = Then_Token or else Token = Else_Token then
            Expect_Cmd := True;
         end if;

         --  MMBasic 2167
         if In_Arg then
            while Op_Ptr > Length (Arg_Buff) and
              Element (Op, Op_Ptr - 1) = ' ' loop
               Op_Ptr := Op_Ptr - 1;
            end loop;

            --  MMBasic 2173
         elsif Arg_C > 0 then
            --  otherwise we have two delimiters in a row
            --  (except for the first argument).
            --  so, create a null argument to go between the two delimiters.
            Append (Arg_V, Character'Image (Element (Op, Op_Ptr)));
            Arg_C := Arg_C + 1;
            --  ASCII.NU is C string terminator
            --           Append (Op, ASCII.NUL);
            Op_Ptr := Length (Op);
         end if;

         --  MMBasic 2179
         In_Arg := False;
         Assert (Integer (Arg_C) <= Max_Args, Routine_Name & "Too many arguments");
         Append (Arg_V, Integer'Image (Op_Ptr));
         Arg_C := Arg_C +1;
         Op_Ptr := Op_Ptr + 1;
         TP := TP + 1;
         --  ASCII.NU is C string terminator
         --        Append (Op, ASCII.NUL);

      end C1;

   begin
      --  MMBasic 2069 Test_Tack_Overflow
      Arg_C := 0;
      Skip_Spaces (Expression, TP);
      if Delim = "(" then
         Assert (Element (Expression, TP) = '(', Routine_Name &
                   "syntax error.");
         Expect_Bracket := True;
         Delim_Ptr := Delim_Ptr + 1;
         TP := TP + 1;
      end if;

      --  MMBasic 2096  Main processing loop
      while not Done loop
         Done := (Expect_Bracket and then Element (Expression, TP) = ')')
           or else Element (Expression, TP) = ''';
         if not Done then
            Term := To_Unbounded_String
              (Slice (Expression, TP, Length (Expression)));
            --  MMBasic 2110 Delim is a string of special characters that split the
            --  expression into separate terms;
            Match := False;
            for Delim_Index in Delim'Range loop
               String_1 (1) := Delim (Delim_Index);
               Match := Match or else Index (Term, String_1) > 0;
            end loop;

            --  MMBasic 2112 block moved to else  Match
            if not Match then
               --  MMBasic 2189  C1 E
               Token :=
                 Integer'Value (Character'Image (Element (Expression, Pos)));
               Expect_Cmd := Token = Then_Token or else Token = Else_Token;

               --  MMBasic 2201
               if not In_Arg then
                  --  C2 E
                  --  MMBasic 2194 moved to else
                  --  MMBasic 22202 Not a special char so start a new argument
                  Assert (Integer (Arg_C) <= Max_Args, Routine_Name &
                            "Too many arguments");
                  Append (Arg_V, To_String (Arg_Buff));
                  Arg_C := Arg_C + 1;
                  In_Arg := True;

                  aChar := Element (Expression, TP);
                  T_Token :=
                    Token_Type (Integer'Value (Character'Image (aChar)));
                  if aChar = '(' or else ((T_Token and T_FUN) = T_FUN
                                          and then (not Expect_Cmd)) then
                     --  MMBasic 2211 C3
                     X := Get_Close_Bracket (Expression, TP);
                     X := X - TP + 1;
                     for index in TP .. X loop
                        Append (Op, Element (Expression, index));
                     end loop;
                     Op_Ptr := Op_Ptr + X;
                     TP := TP + X;

                  elsif aChar = '"' then
                     --  MMBasic 2224 C4
                     while Element (Expression, TP + 1) /=  '"' loop
                        TP := TP + 1;
                        Append (Op, Element (Expression, TP));
                        Assert (TP < length (Expression), Routine_Name &
                                  "syntax error, no closing "".");
                        Op_Ptr := Op_Ptr + 1;
                     end loop;

                     --  MMBasic 2231
                     TP := TP + 1;
                     Append (Op, Element (Expression, TP));
                     Op_Ptr := Op_Ptr + 1;

                  else  --  anythin else
                     --  MMBasic 2236
                     Append (Op, Element (Expression, TP));
                     Op_Ptr := Op_Ptr + 1;
                     TP := TP + 1;
                     Expect_Cmd := False;
                  end if;  --  if aChar /= '('

               else  --  C2
                  TP := TP + 1;
               end if;  -- not In_Arg

            else
               C1;

            end if;  --  not Match
         end if;  --  First not Done

         Done := TP > Length (Expression);

      end loop;

      Assert (Expect_Bracket and then Element (Expression, TP) /= ')',
              Routine_Name & "syntax error");
      Trim (Arg_Buff, Right);
      --  ASCII.NU is C string terminator
      --        Append (Arg_Buff, ASCII.NUL);

   end Make_Args;

   procedure Skip_Spaces (aLine : String; Pos : in out Positive) is
   begin
      while Pos < aLine'Length and then aLine (Pos) = ' ' loop
         Pos := Pos + 1;
      end loop;

   end Skip_Spaces;

   procedure Skip_Spaces (Buffer : Unbounded_String; Pos : in out Positive) is
   begin
      while Element (Buffer, Pos) = ' ' loop
         Pos := Pos + 1;
      end loop;

   end Skip_Spaces;

end M_Basic_Utilities;
