
with System;

with Ada.Strings.Unbounded; use Ada.Strings.Unbounded;

with Command_And_Token_Tables; use Command_And_Token_Tables;
with M_Misc;
with Operators; use Operators;

package body Command_And_Token_Functions is

   t_THEN          : Integer;
   t_ELSE          : Integer;
   t_GOTO          : Integer;
   t_EQUAL         : Integer;
   t_TO            : Integer;
   t_STEP          : Integer;
   t_WHILE         : Integer;
   t_UNTIL         : Integer;
   t_GOSUB         : Integer;
   t_AS            : Integer;
   t_FOR           : Integer;
   c_SELECT_CASE   : Integer;
   c_CASE          : Integer;
   c_CASE_ELSE     : Integer;
   c_END_SELECT    : Integer;
   c_SUB           : Integer;
   c_FUN           : Integer;
   c_IRET          : Integer;
   c_CFUN          : Integer;
   c_CSUB          : Integer;

   function Get_Command_Value (Token : String) return Integer is
      Index : Integer := Command_Table'First - 1;
      Value : Integer := 0;
      Found : Boolean := False;
   begin
      while Index <= Command_Table'Last loop
         Index := Index + 1;
         Found := Token = To_String (Command_Table (Index).Name);
         if Found then
            Value := M_Misc.C_Base_Token + Index - 1;
         end if;
      end loop;

      return Value;

   end Get_Command_Value;

   function Get_Token_Value (Token : String) return Integer is
      Index : Integer := Token_Table'First - 1;
      Value : Integer := 0;
      Found : Boolean := False;
   begin
      while Index <= Token_Table'Last loop
         Index := Index + 1;
         Found := Token = To_String (Token_Table (Index).Name);
         if Found then
            Value := M_Misc.C_Base_Token + Index - 1;
         end if;
      end loop;

      return Value;

   end Get_Token_Value;

   procedure Init_Operator_Functions is
   begin
      t_THEN := Get_Token_Value ("Then");
      t_ELSE := Get_Token_Value ("Else");
      t_GOTO := Get_Token_Value ("GoTo");
      t_EQUAL:= Get_Token_Value (":=");
      t_TO   := Get_Token_Value ("To");
      t_STEP := Get_Token_Value ("Step");
      t_WHILE := Get_Token_Value ("While");
      t_UNTIL := Get_Token_Value ("Until");
      t_GOSUB := Get_Token_Value ("GoSub");
      t_AS := Get_Token_Value ("As");
      t_FOR := Get_Token_Value ("For");
      c_SELECT_CASE := Get_Command_Value ("Select Case");
      c_CASE := Get_Command_Value ("Case");
      c_CASE_ELSE := Get_Command_Value ("Case Else");
      c_END_SELECT := Get_Command_Value ("End Select");
      c_SUB := Get_Command_Value ("Sub");
      c_FUN := Get_Command_Value ("Function");
      c_IRET := Get_Command_Value ("IReturn");
      c_CFUN := Get_Command_Value ("CFunction");
      c_CSUB := Get_Command_Value ("CSub");

      for index in Function_Types'Range loop
         Command_Table (index) := Function_Types (index);
      end loop;

      for index in Command_Types'Range loop
         Command_Table (Function_Types'Length + index) := Command_Types (index);
      end loop;

      for index in Operator_Types'Range loop
         Command_Table
           (Function_Types'Length + Command_Types'Length + index) :=
           Operator_Types (index);
      end loop;

      Command_Table (Command_Table'Last) :=
        (To_Unbounded_String (""), T_NA, T_NA, T_NA, T_NA, 0,
         System.Null_Address);

      for index in Token_Table'Range loop
         Token_Table (index) := Command_Table (index);
      end loop;
   end Init_Operator_Functions;

   function tokenTHEN return Integer is
   begin
      return t_THEN;
   end tokenTHEN;

   function tokenELSE return Integer is
   begin
      return t_ELSE;
   end tokenELSE;

   function tokenGOTO return Integer is
   begin
      return t_GOTO;
   end tokenGOTO;

   function tokenEQUAL return Integer is
   begin
      return t_EQUAL;
   end tokenEQUAL;

   function tokenTO return Integer is
   begin
      return t_TO;
   end tokenTO;

   function tokenSTEP return Integer is
   begin
      return t_STEP;
   end tokenSTEP;

   function tokenWHILE return Integer is
   begin
      return t_WHILE;
   end tokenWHILE;

   function tokenUNTIL return Integer is
   begin
      return t_UNTIL;
   end tokenUNTIL;

   function tokenGOSUB return Integer is
   begin
      return t_GOSUB;
   end tokenGOSUB;

   function tokenAS   return Integer is
   begin
      return t_AS;
   end tokenAS;

   function tokenFOR  return Integer is
   begin
      return t_FOR;
   end tokenFOR;

   function cmdSELECT_CASE return Integer is
   begin
      return c_SELECT_CASE;
   end cmdSELECT_CASE;

   function cmdCASE   return Integer is
   begin
      return c_CASE;
   end cmdCASE;

   function cmdCASE_ELSE return Integer is
   begin
      return c_CASE_ELSE;
   end cmdCASE_ELSE;

   function cmdEND_SELECT return Integer is
   begin
      return c_END_SELECT;
   end cmdEND_SELECT;

   function cmdSUB    return Integer is
   begin
      return c_SUB;
   end cmdSUB;

   function cmdFUN    return Integer is
   begin
      return c_FUN;
   end cmdFUN;

   function cmdIRET   return Integer is
   begin
      return c_IRET;
   end cmdIRET;

   function cmdCFUN   return Integer is
   begin
      return c_CFUN;
   end cmdCFUN;

   function cmdCSUB   return Integer is
   begin
      return c_CSUB;
   end cmdCSUB;

end Command_And_Token_Functions;
