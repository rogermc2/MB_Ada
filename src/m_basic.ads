
with Ada.Strings.Unbounded; use Ada.Strings.Unbounded;

with Command_And_Token_Tables; use Command_And_Token_Tables;
with Configuration;

package M_Basic is

   MAXLINENBR       : constant integer := 65001;

   Current_Line_Ptr : Natural := 0;
   Continue_Point   : Natural := 0;
   Local_Index      : Natural := 0;
   T_Arg            : Function_Type := T_NOTYPE;

   --  Subfunctions is an array of pointers to program memory elements
   Subfunctions             : array (1 .. Configuration.MAXSUBFUN) of Natural :=
                                (others => 0);
   Current_Subfunction_Name : array (1 .. Configuration.MAXVARLEN + 1) of
     Unbounded_String;
   Current_Interrupt_Name   : array (1 .. Configuration.MAXVARLEN + 1) of
     Unbounded_String;

   function Check_String (aString, Token : String) return Natural;
   procedure Clear_Program;
   procedure Defined_Subfunction
     (Expression    : Unbounded_String; Is_Fun : Boolean; Command : String;
      Subfun_Index  : Positive; Fa     : in out Configuration.MMFLOAT;
      I64a          : in out Long_Long_Integer;
      Sa            : in out Unbounded_String;
      Fun_Type      : in out Function_Type);
   procedure Execute_Program (Token_Buffer : String_Buffer);
   function Find_Subfunction (Token : String; Fun_Type : Function_Type)
                              return Natural;
   procedure Init_Basic;
   procedure Print_String (theString : String);
   procedure Prepare_Program (Error_Abort : Boolean);
   procedure Remove_Spaces (Buffer : in out Unbounded_String);
   procedure Save_Program_To_Flash (Buffer: String; Msg : Boolean);
   function Skip_Var (Pos : in out Positive) return Positive;
   function Token_Function (Token : String) return Unbounded_String;

end M_Basic;
