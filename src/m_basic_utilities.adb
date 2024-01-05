
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
                         Max_Args   : Positive; Arg_Buff   : String;
                         Arg_V      : String; Arg_C : out Natural;
                         Delim      : String);

   --  MMBasic 1693
   procedure Find_Var (Expression : Unbounded_String; Pos : in out Positive;
                       Action     : Function_Type) is
      use Interfaces;
      use Ada.Assertions;
      use Global;
      type Dim_Array is array (1 .. Configuration.MAXDIM) of Integer;
      Routine_Name : constant String := "M_Basic.Init_Basic ";
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

   procedure  Get_Args (Expression   : Unbounded_String; Pos : Positive;
                        Max_Num_Args : Natural; S : String) is
      use Configuration;
      Arg_Buff : String (1 .. STRINGSIZE + STRINGSIZE / 2);
      Arg_V    : String (1 .. Max_Num_Args);
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
                         Max_Args   : Positive; Arg_Buff   : String;
                         Arg_V      : String; Arg_C : out Natural;
                         Delim      : String) is
      use Ada.Assertions;
      use Command_And_Token_Functions;
      Routine_Name   : constant String := "M_Basic.Make_Args ";
      TP             : Positive := Pos;
      OP             : String := Arg_Buff;
      In_Arg         : Boolean := False;
      Expect_Cmd     : Boolean := False;
      Expect_Bracket : Boolean := False;
      Then_Token     : Natural := tokenTHEN;
      Else_Token     : Natural := tokenELSE;
      Delim_Ptr      : Positive := 1;
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

      while not Done and then TP <= Length (Expression) loop
         Done := (Expect_Bracket and then Element (Expression, TP) = ')')
           or else  Element (Expression, TP) = ''';
         if not Done then
            null;
         end if;

      end loop;

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
