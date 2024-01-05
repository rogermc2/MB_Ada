
with Interfaces;

with Ada.Assertions;
with Ada.Characters.Handling;

with Configuration;
with Global;

package body M_Basic_Utilities is

   Var_Count        : Natural := 0;

   --  MMBasic 1693
   procedure Find_Var (Expression : Unbounded_String; Pos : in out Positive;
                       Action     : Function_Type) is
      use Interfaces;
      use Ada.Assertions;
      use Ada.Characters.Handling;
      type Dim_Array is array (1 .. Configuration.MAXDIM) of Integer;
      Routine_Name : constant String := "M_Basic.Init_Basic ";
      Dim          : Dim_Array := (others => 0);
      Name         : Unbounded_String;
      S            : Unbounded_String;
      Name_Length  : Natural := 0;
      V_Type       : Function_Type := T_NA;
      D_Num        : Natural := 0;
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
         Assert ((Action and Global.V_DIM_VAR) /= Global.V_DIM_VAR or else
                 Default_Type /= T_NOTYPE or else
                 (Action and T_IMPLIED) = T_IMPLIED, Routine_Name &
                "variable type has not been specified.");
         V_Type := T_NOTYPE;
      end if;

   end Find_Var;

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
