
with Ada.Containers.Vectors;
with Ada.Strings.Unbounded; use Ada.Strings.Unbounded;

with Configuration;
with Exceptions;

package Global is

   package Token_Buffer_Package is
     new Ada.Containers.Vectors (Positive, Unbounded_String);
   subtype Token_Buffer is Token_Buffer_Package.Vector;

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
