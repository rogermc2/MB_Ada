
package Command_And_Token_Functions is

   procedure Init_Operator_Functions;
   function tokenTHEN return Integer;
   function tokenELSE return Integer;
   function tokenGOTO return Integer;
   function tokenEQUAL return Integer;
   function tokenTO return Integer;
   function tokenSTEP return Integer;
   function tokenWHILE return Integer;
   function tokenUNTIL return Integer;
   function tokenGOSUB return Integer;
   function tokenAS return Integer;
   function tokenFOR return Integer;
   function cmdSELECT_CASE return Integer;
   function cmdCASE return Integer;
   function cmdCASE_ELSE return Integer;
   function cmdEND_SELECT return Integer;
   function cmdSUB return Integer;
   function cmdFUN return Integer;
   function cmdIRET return Integer;
   function cmdCFUN return Integer;
   function cmdCSUB return Integer;

end Command_And_Token_Functions;
