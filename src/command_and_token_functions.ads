
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
   function cmdSELECT_CASE return Natural;
   function cmdCASE return Natural;
   function cmdCASE_ELSE return Natural;
   function cmdEND_SELECT return Natural;
   function cmdSUB return Natural;
   function cmdFUN return Natural;
   function cmdIRET return Natural;
   function cmdCFUN return Natural;
   function cmdCSUB return Natural;

   function Get_Next_Command
     (Pos, Current_Line : in out Positive; EOF_Message : String)
      return Positive;

end Command_And_Token_Functions;
