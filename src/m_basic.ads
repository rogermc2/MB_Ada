
with System;

with Ada.Containers.Vectors;
with Ada.Strings.Unbounded; use Ada.Strings.Unbounded;

with Command_And_Token_Tables; use Command_And_Token_Tables;
with Configuration;
with Operators; use Operators;

package M_Basic is

   package UB_String_Buffer_Package is
     new Ada.Containers.Vectors (Positive, Unbounded_String);
   subtype UB_String_Buffer is UB_String_Buffer_Package.Vector;

   MAXLINENBR   : constant integer := 65001;

   In_Buffer    : Unbounded_String;
   Token_Buffer : UB_String_Buffer;
   --     In_Buffer_Ptr    : Positive := 1;
   --     Token_Buffer_Ptr : Positive := 1;

   Command_Table : array (1 .. Num_Commands + Num_Functions + Num_Operators) of
     Command_Table_Item;

   Current_Line_Ptr : Natural := 0;
   Continue_Point   : Natural := 0;
   Local_Index      : Natural := 0;

   Subfunctions     : array (1 .. Configuration.MAXSUBFUN) of System.Address;

   procedure Clear_Program;
   procedure Execute_Program (Tokens : UB_String_Buffer);
   function Find_Subfunction (Token : Unbounded_String; Fun_Type : Integer)
                              return System.Address;
   procedure Init_Basic;
   function Is_Name_Start (aChar : Character) return Boolean;
   pragma Inline (Init_Basic);
   procedure Print_String (theString : String);
   procedure Prepare_Program (State : Boolean);
   procedure Skip_Spaces (Pos : in out Positive);
   procedure Tokenize (From_Console : Boolean);

end M_Basic;
