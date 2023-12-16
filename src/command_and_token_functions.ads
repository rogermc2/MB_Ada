
package Command_And_Token_Functions is

   procedure Init_Operator_Functions;
   function tokenTHEN return Positive;
   function tokenELSE return Positive;
   function tokenGOTO return Positive;
   function tokenEQUAL return Positive;
   function tokenTO return Positive;
   function tokenSTEP return Positive;
   function tokenWHILE return Positive;
   function tokenUNTIL return Positive;
   function tokenGOSUB return Positive;
   function tokenAS return Positive;
   function tokenFOR return Positive;
   function cmdSELECT_CASE return Positive;
   function cmdCASE return Positive;
   function cmdCASE_ELSE return Positive;
   function cmdEND_SELECT return Positive;
   function cmdSUB return Positive;
   function cmdFUN return Positive;
   function cmdIRET return Positive;
   function cmdCFUN return Positive;
   function cmdCSUB return Positive;

end Command_And_Token_Functions;
