
with Interfaces; use Interfaces;

with Ada.Strings.Unbounded; use Ada.Strings.Unbounded;

with Command_And_Token_Tables; use Command_And_Token_Tables;
with Configuration;
with Exceptions;

package Global is

   Bus_Speed    : Positive := 38400;
   F_Arg_1      : Float := 0.0;
   F_Arg_2      : Float := 0.0;
   F_Return     : Float := 0.0;
   I_Arg_1      : Integer := 0;
   I_Arg_2      : Integer := 0;
   I_Return     : Integer := 0;
   E_Float      : Float := 0.0;
   E_Integer    : Integer := 0;
   S_Arg_1      : Unbounded_String;
   S_Arg_2      : Unbounded_String;
   S_Return     : Unbounded_String;
   Command_Line : String_Buffer;
   UB_Return    : Unbounded_String;

   --  Flags used in the program lines
   --  end of a command
   T_CMDEND         : constant Natural := 0;
   --  Single byte indicating the start of a new line
   T_NEWLINE        : constant Positive := 1;
   --  three bytes for a line number
   T_LINENBR        : constant Positive := 2;
   --  variable length indicating a label
   T_LABEL          : constant Positive := 3;

   --  dummy last operator in an expression
   E_END            : constant Positive:= 255;

   --  these constants are used in the second argument of the findvar()
   --  function, they should be or"d together
   V_FIND              : constant Unsigned_16:= 0;
   --  a straight forward find, if the variable is not found
   --  it is created and set to zero
   --  throw an error if not found
   V_NOFIND_ERR        : constant Unsigned_16:= 16#0200#;
   --  return a null pointer if not found
   V_NOFIND_NULL       : constant Unsigned_16:= 16#0400#;
   --  dimension an array
   V_DIM_VAR           : constant Unsigned_16:= 16#0800#;
   --  create a local variable
   V_LOCAL             : constant Unsigned_16:= 16#1000#;
   --  allow an empty array variable.  ie, var()
   V_EMPTY_OK          : constant Unsigned_16:= 16#2000#;
   --  define the name of a function
   V_FUNCT             : constant Unsigned_16:= 16#4000#;

   --  these flags are used in the last argument in expression()
   E_NOERROR           : constant Unsigned_16 := 1;
   E_ERROR             : constant Natural:= 0;
   E_DONE_GETVAL       : constant Natural:= 2;

   Except_Code     : Exceptions.Exception_Code := Exceptions.EXCEP_IRQ;
   Break_Key       : Integer := Configuration.BREAK_KEY;
   Ignore_PIN      : Boolean := False;
   MM_Abort        : Boolean := False;
   MM_Char_Pos     : Positive := 1;
   Prompt_Font     : Natural := 0;
   Prompt_Fcolour  : Natural := 0;
   Prompt_Bcolour  : Natural := 0;
   Error_In_Prompt : Boolean := False;

end Global;
