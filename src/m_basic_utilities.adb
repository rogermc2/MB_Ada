
with Interfaces;

with Ada.Assertions;
with Ada.Characters.Handling;

with Command_And_Token_Functions;
with Evaluation;
with Global;

package body M_Basic_Utilities is

   Var_Count   : Natural := 0;
   Local_Index : Natural := 0;
   Arg_Buff    : Unbounded_String;
   Arg_V       : String_Buffer;
   Arg_C       : Interfaces.Unsigned_16;
   Arg_T       : Function_Type;
   Option_Base : Natural := 0;

   procedure  Get_Args (Expression   : Unbounded_String; Pos : Positive;
                        Max_Num_Args : Natural; S : String);
   procedure  Make_Args
     (Expression : Unbounded_String; Pos : Positive; Max_Args : Positive;
      Arg_Buff   : in out Unbounded_String; Arg_V : in out String_Buffer;
      Arg_C      : out Interfaces.Unsigned_16; Delim : String);

   --  MMBasic 1693
   procedure Find_Var (Expression : Unbounded_String; Pos : in out Positive;
                       Action     : Function_Type) is
      use Interfaces;
      use Ada.Assertions;
      use Ada.Characters.Handling;
      use Global;
      use String_Buffer_Package;
      use Var_Package;
      type Dim_Array is array (1 .. Configuration.MAXDIM) of Integer;
      Routine_Name : constant String := "M_Basic_Utilities.Find_Var ";
      PP           : Positive;
      Dim          : Dim_Array := (others => 0);
      F            : Configuration.MMFLOAT := 0.0;
      I64          : Long_Long_Integer := 0;
      T_Arg        : Function_Type := T_NOTYPE;
      Arg          : Unbounded_String;
      Name         : Unbounded_String;
      TP_Name      : Unbounded_String;
      IP_Name      : Unbounded_String;
      S            : Unbounded_String;   --  New variable name
      Name_Length  : Natural := 0;
      V_Type       : Function_Type := T_NA;
      D_Num        : Integer := 0;
      I_Free       : Natural;
      Item         : Var_Record;
      Tmp          : Integer;
      Index        : Positive := 1;
      Var_Index    : Natural := 0;
      IP           : Positive := 1;
      TP           : Positive := 1;
      J            : Natural;
      Done         : Boolean := False;
   begin
      --  Test_Stack_Overflow of pic32 stack
      Skip_Spaces (Expression, Pos);
      Assert (Is_Name_Start (Element (Expression, Pos)), Routine_Name &
                "invalid variable name.");

      while Is_Name_Character (Element (Expression, Pos)) loop
         Append (S, To_Upper (Element (Expression, Pos)));
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
         V_Type := Arg_T;
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

      --  MMBasic 1756
      if Element (Expression, Pos) = '(' then
         PP := Pos + 1;
         Skip_Spaces (Expression, PP);
         if (Action and V_EMPTY_OK) = V_EMPTY_OK and then
           Element (Expression, Pos) = ')' then
            D_Num := -1;

         else
            Get_Args (Expression, Pos, 2 * Configuration.MAXDIM, "(,");
            Assert ((Arg_C and 1) /= 0, Routine_Name & "invalid dimensions.");
         end if;

         --  MMBasic 1772
         D_Num := Integer (Arg_C / 2) + 1;
         Assert (D_Num <= Configuration.MAXDIM, Routine_Name &
                   "invalid dimensions.");
         Index := 1;
         while Index < Integer (Arg_C / 2) loop
            Arg := To_Unbounded_String (Arg_V (Index));
            Evaluation.Evaluate (Arg, F, I64, S, T_Arg, 0);
            if T_Arg = T_STR then
               --  Force later error
               D_Num := Configuration.MAXDIM;
            elsif  T_Arg = T_NBR then
               I64 := Long_Long_Integer (F);
            end if;

            Dim (Index / 2) := Integer (I64);
            Assert (Dim (Index / 2) < Option_Base, Routine_Name &
                      "invalid dimension.");
            Index := Index + 2;
         end loop;
      end if;

      --  MMBasic 1796
      --  ASCII.NU is C string terminator
      --        Append (S, ASCII.NUL);

      --  The variable name is now known and, if it is an array, the parameters
      --  search the table looking for a match.
      --  The search is exitted with:
      --     var_index  the index of the variable and
      --     tmp        the index if we are in a sub/fun (otherwise -1).

      --  If NOT in a sub/fun:
      --    var_index < varcnt  means a previously created variable was found.
      --    var_index >= varcnt means no matching variable was found.
      --    tmp                 is always  -1.

      --  If we ARE in a sub/fun:
      --    tmp   is the index of a matching global variable
      --          (or -1 if no global found)
      --    var_index < varcnt  means that a local variable was found
      --    var_index >= varcnt a local variable was not found
      --        (in that case check tmp which might have the index of a global)

      --  In either case:
      --    I_Free contains the index of a free slot that can be used if the
      --    variable needs to be created.

      --  MMBasic 1812
      Tmp := -1;
      Done := False;
      Var_Index := 0;
      while not Done and then Var_Index < Var_Count loop
         Var_Index := Var_Index + 1;
         Item := Element (Var_Table, Var_Index);
         if Item.Var_Type = T_NOTYPE then
            I_Free := Var_Index;
         else
            TP_Name := Name;
            IP_Name := Item.Name;
            IP := 1;
            TP := 1;
            if IP_Name = TP_Name then
               IP := IP + 1;
               TP := TP + 1;
               J := Name_Length - 4;
               while J > 0 and then IP_Name = TP_Name loop
                  J := J - 4;
                  IP := IP + 1;
                  TP := TP + 1;
               end loop;

               if J = 0 and then (TP >= Length (TP_Name) or else
                                 Name_Length = Configuration.MAXVARLEN) then
                  --  MMBasic 1835 A matching name has been found.
                  Done := Item.Level = 0 and then Local_Index = 0;
               else
                  Tmp := Var_Index;
               end if;
            else
               --  MMBasic 1835 this is a subroutine or function.
               Done := Item.Level = Local_Index;

            end if;
         end if;

      end loop;

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
   begin
      --  MMBasic.h 142
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
