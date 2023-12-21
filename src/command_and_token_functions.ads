
--  with Command_And_Token_Tables; use Command_And_Token_Tables;

package Command_And_Token_Functions is

   procedure Init_Operator_Functions;
   function tokenTHEN return Natural;
   function tokenELSE return Natural;
   function tokenGOTO return Natural;
   function tokenEQUAL return Natural;
   function tokenTO return Natural;
   function tokenSTEP return Natural;
   function tokenWHILE return Natural;
   function tokenUNTIL return Natural;
   function tokenGOSUB return Natural;
   function tokenAS return Natural;
   function tokenFOR return Natural;
   function tokenIMPLIED  return Natural;
   function cmdSELECT_CASE return String;
   function cmdCASE return String;
   function cmdCASE_ELSE return String;
   function cmdEND_SELECT return String;
   function cmdSUB return String;
   function cmdFUN return String;
   function cmdIRET return String;
   function cmdCFUN return String;
   function cmdCSUB return String;

   function Get_Next_Command
     (Pos, Current_Line : in out Positive; EOF_Message : String)
      return Positive;

   procedure Skip_Spaces (Pos : in out Positive);


end Command_And_Token_Functions;
