
package Command_And_Token_Functions is

   type Access_Procedure is access procedure;

   F_Abs_Ptr : Access_Procedure;
   F_Asc_Ptr : Access_Procedure;
   F_ATan_Ptr : Access_Procedure;
   F_Chr_Ptr : Access_Procedure;
   F_CInt_Ptr : Access_Procedure;
   F_Cos_Ptr : Access_Procedure;
   F_Deg_Ptr : Access_Procedure;
   F_Exp_Ptr : Access_Procedure;
   F_Hex_Ptr : Access_Procedure;
   F_Oct_Ptr : Access_Procedure;
   F_Bin_Ptr : Access_Procedure;
   F_In_String_Ptr : Access_Procedure;
   F_Int_Ptr : Access_Procedure;
   F_Fix_Ptr : Access_Procedure;
   F_Left_Ptr : Access_Procedure;
   F_Right_Ptr : Access_Procedure;
   F_Length_Ptr : Access_Procedure;
   F_Log_Ptr : Access_Procedure;
   F_Mid_Ptr : Access_Procedure;
   F_Pi_Ptr : Access_Procedure;
   F_Radian_Ptr : Access_Procedure;
   F_Random_Ptr : Access_Procedure;
   F_Sign_Ptr : Access_Procedure;
   F_Sine_Ptr : Access_Procedure;
   F_Sq_Root_Ptr : Access_Procedure;
   F_Tan_Ptr : Access_Procedure;
   F_Value_Ptr : Access_Procedure;
   F_Evaluate_Ptr : Access_Procedure;
   F_Error_Num_Ptr : Access_Procedure;
   F_Error_Message_Ptr : Access_Procedure;
   F_Space_Ptr : Access_Procedure;
   F_Decimal_String_Ptr : Access_Procedure;
   F_String_Ptr : Access_Procedure;
   F_Upper_Case_Ptr : Access_Procedure;
   F_Lower_Case_Ptr : Access_Procedure;
   F_Version_Ptr : Access_Procedure;
   F_Pos_Ptr : Access_Procedure;
   F_Tab_Ptr : Access_Procedure;
   F_In_Key_Ptr : Access_Procedure;
   F_Arcsinus_Ptr : Access_Procedure;
   F_Arcsine_Ptr : Access_Procedure;
   F_Arccos_Ptr : Access_Procedure;
   F_Max_Ptr : Access_Procedure;
   F_Min_Ptr : Access_Procedure;

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

   procedure Get_Next_Command (Pos, Current_Line : in out Positive;
                               EOF_Message       : String);
   procedure Skip_Spaces (Pos : in out Positive);

end Command_And_Token_Functions;
