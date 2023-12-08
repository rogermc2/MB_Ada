
with Global;

with System;

with Configuration;

package M_Basic is

   Current_Line_Ptr : Natural := 0;
   Continue_Point   : Natural := 0;
   Local_Index      : Natural := 0;

   Subfunctions     : array (1 .. Configuration.MAXSUBFUN) of System.Address;

   procedure Clear_Program;
   procedure Execute_Program (Tokens : Global.Token_Buffer);
   function Find_Subfunction (Tokens : Global.Token_Buffer; Fun_Type : Integer)
                              return System.Address;
   procedure Init_Basic;
   procedure Print_String (theString : String);
   procedure Prepare_Program (State : Boolean);
   function Tokenize (aLine : String) return String;

end M_Basic;
