
with Ada.Containers.Vectors;
with Ada.Strings.Unbounded; use Ada.Strings.Unbounded;

with Configuration;
with Exceptions;

package Global is

   package Token_Buffer_Package is
     new Ada.Containers.Vectors (Positive, Unbounded_String);
   subtype Token_Buffer is Token_Buffer_Package.Vector;

   --     lags used in the program lines--  end of a command
   T_CMDEND         : constant Character:= Character'Val (0);
   --  Single byte indicating the start of a new line
   T_NEWLINE        : constant Character:= Character'Val (1);
   --  three bytes for a line number
   T_LINENBR        : constant Character:= Character'Val (2);
   --  variable length indicating a label
   T_LABEL          : constant Character:= Character'Val (3);

   --  dummy last operator in an expression
   E_END            : constant Character:= Character'Val (16#FF#);

   --  these constants are used in the second argument of the findvar()
   --  function, they should be or'd together
   V_FIND              : constant Natural:= 0;
   --  a straight forward find, if the variable is not found
   --  it is created and set to zero
   --  throw an error if not found
   V_NOFIND_ERR        : constant Natural:= 16#0200#;
   --  return a null pointer if not found
   V_NOFIND_NULL       : constant Natural:= 16#0400#;
   --  dimension an array
   V_DIM_VAR           : constant Natural:= 16#0800#;
   --  create a local variable
   V_LOCAL             : constant Natural:= 16#1000#;
   --  allow an empty array variable.  ie, var()
   V_EMPTY_OK          : constant Natural:= 16#2000#;
   --  define the name of a function
   V_FUNCT             : constant Natural:= 16#4000#;

   --  these flags are used in the last argument in expression()
   E_NOERROR           : Boolean := True;
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
