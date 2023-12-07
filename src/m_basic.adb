
with Ada.Strings.Unbounded; use Ada.Strings.Unbounded;
with Ada.Text_IO; use Ada.Text_IO;

package body M_Basic is

   type Token_Table_Item is record
      Token : Unbounded_String;
   end record;

   Command_Table_Size : constant Positive := 100;
   Token_Table_Size   : constant Positive := 100;

   Command_Table : array (1 .. Command_Table_Size) of Token_Table_Item;
   Token_Table   : array (1 .. Token_Table_Size) of Token_Table_Item;

   Start_Edit_Point : Positive := 1;
   Start_Edit_Char  : Positive := 1;
   Trace_On         : Boolean := False;

   tokenTHEN        : Integer;
   tokenELSE        : Integer;
   tokenGOTO        : Integer;
   tokenEQUAL       : Integer;
   tokenTO          : Integer;
   tokenSTEP        : Integer;
   tokenWHILE       : Integer;
   tokenUNTIL       : Integer;
   tokenGOSUB       : Integer;
   tokenAS          : Integer;
   tokenFOR         : Integer;
   cmdSELECT_CASE   : Integer;
   cmdCASE          : Integer;
   cmdCASE_ELSE     : Integer;
   cmdEND_SELECT    : Integer;
   cmdSUB           : Integer;
   cmdFUN           : Integer;
   cmdIRET          : Integer;
   cmdCFUN          : Integer;
   cmdCSUB          : Integer;

   procedure Clear_Runtime;

   procedure Clear_Program is
   begin
      Clear_Runtime;
      Start_Edit_Point := 1;
      Start_Edit_Char := 1;
      Trace_On := False;
   end Clear_Program;

   procedure Clear_Runtime is
   begin
      null;
   end Clear_Runtime;

   procedure Execute_Program (Name : String) is
   begin
      Put_Line ("M_Basic.Execute_Program " & Name);
      null;
   end Execute_Program;

   function Find_Subfunction (Name : String; Fun_Type : Integer)
                              return Integer is
   begin
      Put_Line ("M_Basic.Find_Subfunction " & Name);

      return 0;
   end Find_Subfunction;

   function Get_Command_Value (Token : String) return Integer is
   begin
      return 0;
   end Get_Command_Value;

   function Get_Token_Value (Token : String) return Integer is
   begin
      return 0;
   end Get_Token_Value;

   procedure Init_Basic is
   begin
      Clear_Program;

      tokenTHEN := Get_Token_Value ("Then");
      tokenELSE := Get_Token_Value ("Else");
      tokenGOTO := Get_Token_Value ("GoTo");
      tokenEQUAL:= Get_Token_Value (":=");
      tokenTO   := Get_Token_Value ("To");
      tokenSTEP := Get_Token_Value ("Step");
      tokenWHILE := Get_Token_Value ("While");
      tokenUNTIL := Get_Token_Value ("Until");
      tokenGOSUB := Get_Token_Value ("GoSub");
      tokenAS := Get_Token_Value ("As");
      tokenFOR := Get_Token_Value ("For");
      cmdSELECT_CASE := GetCommandValue ("Select Case");
      cmdCASE := GetCommandValue ("Case");
      cmdCASE_ELSE := GetCommandValue ("Case Else");
      cmdEND_SELECT := GetCommandValue ("End Select");
      cmdSUB := GetCommandValue ("Sub");
      cmdFUN := GetCommandValue ("Function");
      cmdIRET := GetCommandValue ("IReturn");
      cmdCFUN := GetCommandValue ("CFunction");
      cmdCSUB := GetCommandValue ("CSub");

      return 0;

   end Init_Basic;

   procedure Print_String (theString : String) is
   begin
      null;
   end Print_String;

   procedure Prepare_Program (State : Boolean) is
   begin
      null;
   end Prepare_Program;

   function Tokenize (aLine : String) return String is
   begin
      return "";
   end Tokenize;

end M_Basic;
