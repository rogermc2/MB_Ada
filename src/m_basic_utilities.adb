
with Interfaces;

with Ada.Assertions;
with Ada.Characters.Handling;

with Command_And_Token_Functions;
with Configuration;
with Global;

package body M_Basic_Utilities is

   Var_Count        : Natural := 0;

   procedure  Get_Args (Expression   : Unbounded_String; Pos : Positive;
                        Max_Num_Args : Natural; S : String);
   procedure  Make_Args (Expression : Unbounded_String; Pos : Positive;
                         Max_Args   : Positive;
                         Arg_Buff   : in out Unbounded_String;
                         Arg_V      : in out Unbounded_String;
                         Arg_C      : out Natural; Delim : String);

   --  MMBasic 1693
   procedure Find_Var (Expression : Unbounded_String; Pos : in out Positive;
                       Action     : Function_Type) is
      use Interfaces;
      use Ada.Assertions;
      use Global;
      type Dim_Array is array (1 .. Configuration.MAXDIM) of Integer;
      Routine_Name : constant String := "M_Basic_Utilities.Find_Var ";
      PP           : Positive;
      Dim          : Dim_Array := (others => 0);
      Name         : Unbounded_String;
      S            : Unbounded_String;
      Name_Length  : Natural := 0;
      V_Type       : Function_Type := T_NA;
      D_Num        : Integer := 0;
      I_Free       : Natural := Var_Count;
   begin
      --  Test_Stack_Overflow of pic32 stack
      Skip_Spaces (Expression, Pos);
      Assert (Is_Name_Start (Element (Expression, Pos)), Routine_Name &
                "invalid variable name.");

      while Is_Name_Character (Element (Expression, Pos)) loop
         Append (S, Element (Expression, Pos));
         Pos := Pos + 1;
         Name_Length := Name_Length + 1;
         Assert (Name_Length <= Configuration.MAXVARLEN, Routine_Name &
                   "invalid variable name, too long.");
      end loop;

      --  MMBasic 1608 Make sure that there are a multiple of four bytes
      --  with a valid name or set to 0.
      while Name_Length mod 4 /= 0 loop
         Append (S, '0');
      end loop;

      if Element (Expression, Pos) = '$' then
         Assert ((Action and T_IMPLIED) /= T_IMPLIED or else
                   (Action and T_STR) = T_STR, Routine_Name &
                   "conflicting variable type.");
         V_Type := T_STR;
         Pos := Pos + 1;
      elsif Element (Expression, Pos) = '%' then
         Assert ((Action and T_IMPLIED) /= T_IMPLIED or else
                   (Action and T_INT) = T_INT, Routine_Name &
                   "conflicting variable type.");
         V_Type := T_INT;
         Pos := Pos + 1;
      elsif Element (Expression, Pos) = '!' then
         Assert ((Action and T_IMPLIED) /= T_IMPLIED or else
                   (Action and T_NBR) = T_NBR, Routine_Name &
                   "conflicting variable type.");
         V_Type := T_NBR;
         Pos := Pos + 1;
      else
         --  MMBasic 1750
         Assert ((Action and Global.V_DIM_VAR) /= Global.V_DIM_VAR or else
                 Default_Type /= T_NOTYPE or else
                   (Action and T_IMPLIED) = T_IMPLIED, Routine_Name &
                   "variable type has not been specified.");
         V_Type := T_NOTYPE;
      end if;

      if Element (Expression, Pos) = '(' then
         PP := Pos + 1;
         Skip_Spaces (Expression, PP);
         if (Action and V_EMPTY_OK) = V_EMPTY_OK and then
           Element (Expression, Pos) = ')' then
            D_Num := -1;
         else
            Get_Args (Expression, Pos, 2 * Configuration.MAXDIM, "(,");
         end if;
      end if;

   end Find_Var;

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

   procedure  Get_Args (Expression   : Unbounded_String; Pos : Positive;
                        Max_Num_Args : Natural; S : String) is
      use Configuration;
      Arg_Buff : Unbounded_String;
      Arg_V    : Unbounded_String;
      Arg_C    : Natural;
   begin
      Make_Args (Expression, Pos, Max_Num_Args, Arg_Buff, Arg_V, Arg_C, S);

   end Get_Args;

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

   procedure  Make_Args (Expression : Unbounded_String; Pos : Positive;
                         Max_Args   : Positive;
                         Arg_Buff   : in out Unbounded_String;
                         Arg_V      : in out Unbounded_String;
                         Arg_C      : out Natural; Delim : String) is
      use Interfaces;
      use Ada.Assertions;
      use Ada.Strings;
      use Command_And_Token_Functions;
      Routine_Name   : constant String := "M_Basic.Make_Args ";
      Then_Token     : constant Natural := tokenTHEN;
      Else_Token     : constant Natural := tokenELSE;
      String_1       : String (1 .. 1);
      aChar          : Character;
      TP             : Positive := Pos;
      X              : Positive;
      In_Arg         : Boolean := False;
      Expect_Cmd     : Boolean := False;
      Expect_Bracket : Boolean := False;
      Delim_Ptr      : Positive := 1;
      Term           : Unbounded_String;
      Match          : Boolean := False;
      Done           : Boolean := False;
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
      while not Done and then TP <= Length (Expression) loop
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
               --  MMBasic 2137
               Term := To_Unbounded_String
                 (Slice (Expression, TP, Length (Expression)));
               Expect_Cmd := Term = Integer'Image (Then_Token) or else
                 Term = Integer'Image (Else_Token);

               --  MMBasic 2141
               if In_Arg then
                  --  MMBasic 2143 moved to else
                  --  MMBasic 2150 Not a special char so start a new argument
                  Assert (Arg_C < Max_Args, Routine_Name & "Too many arguments");
                  Append (Arg_V, Arg_Buff);
                  Arg_C := Arg_C + 1;
                  In_Arg := True;

                  --  If an opening bracket, copy everything until we hit the matching
                  --  closing bracket.
                  --  This includes special characters such as , and ; and keeps track of
                  --  any nested brackets.
                  --  MMBasic 2158
                  aChar := Element (Expression, TP);
                  if (aChar = '(') or else
                    (((Token_Type (Integer'Value (Character'Image (aChar))) and T_FUN) =
                          T_FUN) and not Expect_Cmd) then
                     X := Get_Close_Bracket (Expression, TP);
                     X := X - TP + 1;
                     for index in TP .. X loop
                        Append (Arg_Buff, Element (Expression, index));
                     end loop;
                     --  MMBasic 2170
                     aChar := Element (Expression, TP);
                     Done := False;
                     if (aChar = '"') then
                        while not Done loop
                           Append (Arg_Buff, aChar);
                           TP := TP + 1;
                           Assert (TP <= Length (Expression), Routine_Name &
                                     "syntax error");
                           aChar := Element (Expression, TP);
                           Done := aChar /= '"';
                        end loop;
                        --  MMBasic 2178
                        Append (Arg_Buff, aChar);
                        TP := TP + 1;
                     end if;

                     Assert (TP <= Length (Expression), Routine_Name &
                               "syntax error");
                     Append (Arg_Buff, aChar);
                     TP := TP + 1;
                  else
                     TP := TP + 1;
                  end if;

                  --  MMBasic 2115
                  if In_Arg then
                     Trim (Arg_Buff, Right);
                     Append (Arg_Buff, ASCII.NUL);

                  elsif Arg_C /= 0 then
                     --  MMBasic 2123
                     Arg_C := Arg_C + 1;
                     Append (Arg_V, Arg_Buff);
                  end if;

                  In_Arg := False;
                  Assert (Arg_C < Max_Args, Routine_Name & "Too many arguments");
                  Arg_C := Arg_C + 1;
                  Append (Arg_V, Arg_Buff);
                  Append (Arg_V, Element (Expression, TP));
                  TP := TP + 1;
                  Append (Arg_Buff, ASCII.NUL);
               elsif Element (Expression, TP) = ' ' then
                  --  MMBasic 2143
                  TP := TP + 1;
               end if;  --  if in_arg

            else  --  Match
               Expect_Cmd := Expect_Cmd and
                 (Term = Integer'Image (Then_Token) or else
                  Term = Integer'Image (Else_Token));
            end if;  --  not Match
         end if;  --  First not Done

         Expect_Cmd := False;
      end loop;

      Assert (Expect_Bracket and then Element (Expression, TP) /= ')',
              Routine_Name & "syntax error");
      Trim (Arg_Buff, Right);
      Append (Arg_Buff, ASCII.NUL);

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
