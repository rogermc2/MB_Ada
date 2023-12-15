
with System;

--  with Ada.Containers.Vectors;
with Ada.Strings.Unbounded; use Ada.Strings.Unbounded;

with Command_And_Token_Tables; use Command_And_Token_Tables;
with Configuration;
with Operators; use Operators;

package M_Basic is

   --     package UB_String_Buffer_Package is
   --       new Ada.Containers.Vectors (Positive, Unbounded_String);
   --     subtype UB_String_Buffer is UB_String_Buffer_Package.Vector;

   MAXLINENBR   : constant integer := 65001;

   In_Buffer             : Unbounded_String;
   --     Function Token_Buffer : UB_String_Buffer;
   Token_Buffer          : Unbounded_String;
   --     In_Buffer_Ptr    : Positive := 1;
   --     Function Token_Buffer_Ptr : Positive := 1;

   Command_Table         : array (1 .. Num_Functions + Num_Commands +
                                    Num_Operators + 1) of Command_Table_Item;
   Token_Table           : array (1 .. Num_Functions + Num_Commands +
                                    Num_Operators + 1) of Command_Table_Item;

   Current_Line_Ptr : Natural := 0;
   Continue_Point   : Natural := 0;
   Local_Index      : Natural := 0;

   Subfunctions     : array (1 .. Configuration.MAXSUBFUN) of System.Address;

   procedure Clear_Program;
   procedure Execute_Program (Tokens : Unbounded_String);
   function Find_Subfunction (Token : Unbounded_String; Fun_Type : Integer)
                              return System.Address;
   procedure Init_Basic;
   function Is_Name_Character (aChar : Character) return Boolean;
   pragma Inline (Is_Name_Character);
   function Is_Name_End (aChar : Character) return Boolean;
   pragma Inline (Is_Name_End);
   function Is_Name_Start (aChar : Character) return Boolean;
   pragma Inline (Is_Name_Start);
   procedure Print_String (theString : String);
   procedure Prepare_Program (State : Boolean);
   procedure Skip_Spaces (Pos : in out Positive);
   function Skip_Var (Pos : in out Positive) return Positive;
   function Token_Function (Index : Positive) return System.Address;
   procedure Tokenize (From_Console : Boolean);

   function tokenTHEN return Integer;
   function tokenELSE return Integer;
   function tokenGOTO return Integer;
   function tokenEQUAL return Integer;
   function tokenTO return Integer;
   function tokenSTEP return Integer;
   function tokenWHILE return Integer;
   function tokenUNTIL return Integer;
   function tokenGOSUB return Integer;
   function tokenAS   return Integer;
   function tokenFOR  return Integer;
   function cmdSELECT_CASE return Integer;
   function cmdCASE   return Integer;
   function cmdCASE_ELSE return Integer;
   function cmdEND_SELECT return Integer;
   function cmdSUB    return Integer;
   function cmdFUN    return Integer;
   function cmdIRET   return Integer;
   function cmdCFUN   return Integer;
   function cmdCSUB   return Integer;

end M_Basic;
