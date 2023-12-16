
with System;

package Command_And_Token_Functions is

   procedure Init_Operator_Functions;
   function tokenTHEN return System.Address;
   function tokenELSE return System.Address;
   function tokenGOTO return System.Address;
   function tokenEQUAL return System.Address;
   function tokenTO return System.Address;
   function tokenSTEP return System.Address;
   function tokenWHILE return System.Address;
   function tokenUNTIL return System.Address;
   function tokenGOSUB return System.Address;
   function tokenAS return System.Address;
   function tokenFOR return System.Address;
   function cmdSELECT_CASE return System.Address;
   function cmdCASE return System.Address;
   function cmdCASE_ELSE return System.Address;
   function cmdEND_SELECT return System.Address;
   function cmdSUB return System.Address;
   function cmdFUN return System.Address;
   function cmdIRET return System.Address;
   function cmdCFUN return System.Address;
   function cmdCSUB return System.Address;

end Command_And_Token_Functions;
