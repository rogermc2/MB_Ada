
with Ada.Strings.Unbounded; use Ada.Strings.Unbounded;
with Ada.Text_IO; use Ada.Text_IO;

with Commands_And_Tokens_Tables; use Commands_And_Tokens_Tables;

package body M_Basic is

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
      for index in Subfunctions'Range loop
         Subfunctions (Index) := System.Null_Address;
      end loop;

   end Clear_Runtime;

   procedure Defined_Subfunction (Is_Fun : Boolean; Command : Unbounded_String;
                                 Index  : Positive; Fa : Configuration.MMFLOAT;
                                 Sa     : String; SF_Type : Fun_Type) is
      --        use System;
--        Sub_Name : constant Unbounded_String := To_Unbounded_String (Name);
--        Done     : Boolean := False;
   begin
      null;

   end Defined_Subfunction;

   procedure Execute_Program (Tokens : Global.Token_Buffer) is
   begin
      Put_Line ("M_Basic.Execute_Program ");
      null;
   end Execute_Program;

   function Find_Subfunction (Tokens : Global.Token_Buffer; Fun_Type : Integer)
                              return System.Address is
      use System;
--        Sub_Name : constant Unbounded_String := To_Unbounded_String (Name);
      Index    : Natural := 0;
      Done     : Boolean := False;
   begin
      Put_Line ("M_Basic.Find_Subfunction ");
      while index <= Configuration.MAXSUBFUN and not Done loop
         Done := True;
--           Done := Subfunctions (Index) = Sub_Address;
      end loop;

      return System.Null_Address;

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
      cmdSELECT_CASE := Get_Command_Value ("Select Case");
      cmdCASE := Get_Command_Value ("Case");
      cmdCASE_ELSE := Get_Command_Value ("Case Else");
      cmdEND_SELECT := Get_Command_Value ("End Select");
      cmdSUB := Get_Command_Value ("Sub");
      cmdFUN := Get_Command_Value ("Function");
      cmdIRET := Get_Command_Value ("IReturn");
      cmdCFUN := Get_Command_Value ("CFunction");
      cmdCSUB := Get_Command_Value ("CSub");

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
