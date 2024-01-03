
with Ada.Numerics.Generic_Elementary_Functions;
with Ada.Strings.Unbounded; use Ada.Strings.Unbounded;
--  with Ada.Text_IO; use Ada.Text_IO;

with Command_And_Token_Tables; use Command_And_Token_Tables;
with Flash;
with Global;
with M_Misc;

package body Command_And_Token_Functions is

   package Float_Math_Functions is new
     Ada.Numerics.Generic_Elementary_Functions (Float);

   t_THEN         : Natural;
   t_ELSE         : Natural;
   t_GOTO         : Natural;
   t_EQUAL        : Natural;
   t_TO           : Natural;
   t_STEP         : Natural;
   t_WHILE        : Natural;
   t_UNTIL        : Natural;
   t_GOSUB        : Natural;
   t_AS           : Natural;
   t_FOR          : Natural;
   T_IMPLIED      : Natural;
   c_SELECT_CASE  : Natural;
   c_CASE         : Natural;
   c_CASE_ELSE    : Natural;
   c_END_SELECT   : Natural;
   c_SUB          : Natural;
   c_FUN          : Natural;
   c_IRET         : Natural;
   c_CFUN         : Natural;
   c_CSUB         : Natural;

   procedure F_Abs is
      use Global;
   begin
      F_Return := abs (E_Float);

   end F_Abs;

   procedure F_Asc is
--        use Global;
   begin
      null;

   end F_Asc;

   procedure F_ATan is
      use Float_Math_Functions;
      use Global;
   begin
      F_Return := Arctan (E_Float);

   end F_ATan;

   procedure F_Chr is
--        use Global;
   begin
      null;

   end F_Chr;

   procedure F_CInt is
--        use Global;
   begin
      null;

   end F_CInt;

   procedure F_Cos is
      use Float_Math_Functions;
      use Global;
   begin
      F_Return := Cos (E_Float);

   end F_Cos;

   procedure F_Deg is
--        use Global;
   begin
      null;

   end F_Deg;

   procedure F_Exp is
      use Float_Math_Functions;
      use Global;
   begin
      F_Return := Exp (E_Float);

   end F_Exp;

   procedure F_Hex is
--        use Global;
   begin
      null;

   end F_Hex;

   procedure F_Int is
--        use Global;
   begin
      null;

   end F_Int;

   procedure F_Fix is
--        use Global;
   begin
      null;

   end F_Fix;

   procedure F_Left is
--        use Global;
   begin
      null;

   end F_Left;

   procedure F_Right is
--        use Global;
   begin
      null;

   end F_Right;

   procedure F_Length is
--        use Global;
   begin
      null;

   end F_Length;

   procedure F_Log is
      use Float_Math_Functions;
      use Global;
   begin
      F_Return := Log (E_Float);

   end F_Log;

   procedure F_Mid is
--        use Global;
   begin
     null;

   end F_Mid;

   procedure F_Pi is
--        use Global;
   begin
      null;

   end F_Pi;

   procedure F_Radian is
--        use Global;
   begin
      null;

   end F_Radian;

   procedure F_Random is
--        use Global;
   begin
     null;

   end F_Random;

   procedure F_Sign is
--        use Global;
   begin
     null;

   end F_Sign;

   procedure F_Sine is
      use Float_Math_Functions;
      use Global;
   begin
      F_Return := Sin (E_Float);

   end F_Sine;

   procedure F_Oct is
--        use Global;
   begin
      null;

   end F_Oct;

   procedure F_Bin is
--        use Global;
   begin
      null;

   end F_Bin;

   procedure F_In_String is
--        use Global;
   begin
      null;

   end F_In_String;

   procedure F_Sq_Root is
--        use Global;
   begin
      null;

   end F_Sq_Root;

   procedure F_Tan is
      use Float_Math_Functions;
      use Global;
   begin
      F_Return := Tan (E_Float);

   end F_Tan;

   procedure F_Value is
--        use Global;
   begin
      null;

   end F_Value;

   procedure F_Evaluate is
--        use Global;
   begin
      null;

   end F_Evaluate;

   procedure F_Error_Num is
--        use Global;
   begin
     null;

   end F_Error_Num;

   procedure F_Error_Message is
--        use Global;
   begin
      null;

   end F_Error_Message;

   procedure F_Space is
--        use Global;
   begin
      null;

   end F_Space;

   procedure F_Decimal_String is
--        use Global;
   begin
      null;

   end F_Decimal_String;

   procedure F_String is
--        use Global;
   begin
      null;

   end F_String;

   procedure F_Upper_Case is
--        use Global;
   begin
     null;

   end F_Upper_Case;

   procedure F_Lower_Case is
--        use Global;
   begin
      null;

   end F_Lower_Case;

   procedure F_Version is
--        use Global;
   begin
      null;

   end F_Version;

   procedure F_Pos is
--        use Global;
   begin
      null;

   end F_Pos;

   procedure F_Tab is
--        use Global;
   begin
      null;

   end F_Tab;

    procedure F_In_Key is
--        use Global;
   begin
      null;

   end F_In_Key;

   procedure F_Arcsinus is
--        use Global;
   begin
      null;

   end F_Arcsinus;

   procedure F_Arcsine is
      use Float_Math_Functions;
      use Global;
   begin
      F_Return := Arcsin (E_Float);

   end F_Arcsine;

   procedure F_Arccos is
      use Float_Math_Functions;
      use Global;
   begin
      F_Return := Arccos (E_Float);

   end F_Arccos;

   procedure F_Max is
--        use Global;
   begin
      null;

   end F_Max;

   procedure F_Min is
--        use Global;
   begin
      null;

   end F_Min;

   function Get_Command_Value (Token : String) return Natural is
      Index : Integer := Command_Table'First - 1;
      Value : Natural := 0;
      Found : Boolean := False;
   begin
      while Index < Command_Table_Size loop
         Index := Index + 1;
         Found := Token = To_String (Command_Table (Index).Name);
         if Found then
            Value := M_Misc.C_Base_Token + Index - 1;
         end if;
      end loop;

      return Value;

   end Get_Command_Value;

   function Get_Token_Value (Token : String) return Natural is
      --        Routine_Name : constant String :=
      --                         "Command_And_Token_Tables.Get_Token_Value ";
      Index : Integer := Token_Table'First - 1;
      Value : Natural := 0;
      Found : Boolean := False;
   begin
      --        Put_Line (Routine_Name & "Token_Table Length: " &
      --                    Integer'Image (Token_Table'Length));
      while Index < Token_Table'Last loop
         --              Put_Line (Routine_Name & "index: " & Integer'Image (Index));
         Index := Index + 1;
         Found := Token = To_String (Token_Table (Index).Name);
         --           Put_Line (Routine_Name & "Found: " &  Boolean'Image (Found));
         if Found then
            --              Put_Line (Routine_Name & "token found, index: " &
            --                          Integer'Image (Index));
            Value := M_Misc.C_Base_Token + Index - 1;
         end if;
      end loop;

      --        Put_Line (Routine_Name & "done, Value: " &  Integer'Image (Value));
      return Value;

   end Get_Token_Value;

   procedure Init_Operator_Functions is
      --        Routine_Name : constant String :=
      --                         "Command_And_Token_Tables.Init_Operator_Functions ";
   begin
      --        Put_Line (Routine_Name);
      t_THEN := Get_Token_Value ("Then");
      --        Put_Line (Routine_Name & "t_THEN set: " & Integer'Image (t_THEN));
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
      T_IMPLIED := Get_Token_Value ("");

      c_SELECT_CASE := Get_Command_Value ("Select Case");
      c_CASE := Get_Command_Value ("Case");
      c_CASE_ELSE := Get_Command_Value ("Case Else");
      c_END_SELECT := Get_Command_Value ("End Select");
      c_SUB := Get_Command_Value ("Sub");
      c_FUN := Get_Command_Value ("Function");
      c_IRET := Get_Command_Value ("IReturn");
      c_CFUN := Get_Command_Value ("CFunction");
      c_CSUB := Get_Command_Value ("CSub");

   end Init_Operator_Functions;

   function tokenTHEN return Natural is
   begin
      return t_THEN;

   end tokenTHEN;

   function tokenELSE return Natural is
   begin
      return t_ELSE;

   end tokenELSE;

   function tokenGOTO return Natural is
   begin
      return t_GOTO;

   end tokenGOTO;

   function tokenEQUAL return Natural is
   begin
      return t_EQUAL;

   end tokenEQUAL;

   function tokenTO return Natural is
   begin
      return t_TO;

   end tokenTO;

   function tokenSTEP return Natural is
   begin
      return t_STEP;

   end tokenSTEP;

   function tokenWHILE return Natural is
   begin
      return t_WHILE;

   end tokenWHILE;

   function tokenUNTIL return Natural is
   begin
      return t_UNTIL;

   end tokenUNTIL;

   function tokenGOSUB return Natural is
   begin
      return t_GOSUB;

   end tokenGOSUB;

   function tokenAS   return Natural is
   begin
      return t_AS;

   end tokenAS;

   function tokenFOR  return Natural is
   begin
      return t_FOR;

   end tokenFOR;

   function tokenIMPLIED  return Natural is
   begin
      return t_IMPLIED;

   end tokenIMPLIED;

   function cmdSELECT_CASE return String is
   begin
      return To_String (Command_Table (c_SELECT_CASE).Name);

   end cmdSELECT_CASE;

   function cmdCASE return String is
   begin
      return To_String (Command_Table (c_CASE).Name);

   end cmdCASE;

   function cmdCASE_ELSE return String is
   begin
      return To_String (Command_Table (c_CASE_ELSE).Name);

   end cmdCASE_ELSE;

   function cmdEND_SELECT return String is
   begin
      return To_String (Command_Table (c_END_SELECT).Name);

   end cmdEND_SELECT;

   function cmdSUB return String is
   begin
      return To_String (Command_Table (c_SUB).Name);

   end cmdSUB;

   function cmdFUN return String is
   begin
      return To_String (Command_Table (c_FUN).Name);

   end cmdFUN;

   function cmdIRET return String is
   begin
      return To_String (Command_Table (c_IRET).Name);

   end cmdIRET;

   function cmdCFUN return String is
   begin
      return To_String (Command_Table (c_CFUN).Name);

   end cmdCFUN;

   function cmdCSUB return String is
   begin
      return To_String (Command_Table (c_CSUB).Name);

   end cmdCSUB;

   --  Get_Next_Command returns a pointer to the next command in the program.
   --  Get_Next_Command contains the logic for stepping over a line number and
   --  label (if present).
   --  p is the current place in the program to start the search from.
   --  CLine is a pointer to a char pointer which points to the start of the
   --  current line for error reporting (if NULL it will be ignored).
   --  EOFMsg is the error message to use if the end of the program is reached.
   procedure Get_Next_Command (Pos, Current_Line : in out Positive;
                               EOF_Message       : String) is
      use Flash;
      use Global;
      use M_Misc;
      OK : Boolean := True;
   begin
      while OK and then Pos <= C_Base_Token loop
         --  look for the zero marking the start of an element
         if Prog_Memory (Pos) /= Integer'Image (T_NEWLINE) then
            while Prog_Memory (Pos) /= "0" loop
               Pos := Pos + 1;
            end loop;
            Pos := Pos + 1;
         end if;

         OK :=  Prog_Memory (Pos) = "0";
         if not OK then
            if EOF_Message'Length /= 0 then
               null;
            end if;

         else
            if Prog_Memory (Pos) = Integer'Image (T_NEWLINE) then
               if Current_Line > 0 then
                  Current_Line := Pos;
               end if;
               Pos := Pos + 1;
            end if;

            if Prog_Memory (Pos) = Integer'Image (T_LINENBR) then
               Pos := Pos + 3;
            end if;

            Skip_Spaces (Pos);

            if Prog_Memory (1) = Integer'Image (T_LABEL) then
               --  skip over the label
               Pos := Pos + Integer'Value (To_String (Prog_Memory (2))) + 2;
               Skip_Spaces (Pos);
            end if;
         end if;

      end loop;

   end Get_Next_Command;

   procedure Skip_Spaces (Pos : in out Positive) is
      use Flash;
   begin
      while Prog_Memory (Pos) = To_Unbounded_String (" ") loop
         Pos := Pos + 1;
      end loop;

   end Skip_Spaces;

begin

   F_Abs_Ptr := F_Abs'Access;
   F_Asc_Ptr := F_Asc'Access;
   F_ATan_Ptr := F_ATan'Access;
   F_Chr_Ptr := F_Chr'Access;
   F_CInt_Ptr := F_CInt'Access;
   F_Cos_Ptr := F_Cos'Access;
   F_Deg_Ptr := F_Deg'Access;
   F_Exp_Ptr := F_Exp'Access;
   F_Hex_Ptr := F_Hex'Access;
   F_Oct_Ptr := F_Oct'Access;
   F_Bin_Ptr := F_Bin'Access;
   F_In_String_Ptr := F_In_String'Access;

   F_Int_Ptr := F_Int'Access;
   F_Fix_Ptr := F_Fix'Access;
   F_Left_Ptr := F_Left'Access;
   F_Right_Ptr := F_Right'Access;
   F_Length_Ptr := F_Length'Access;
   F_Log_Ptr := F_Log'Access;
   F_Mid_Ptr := F_Mid'Access;
   F_Pi_Ptr := F_Pi'Access;
   F_Radian_Ptr := F_Radian'Access;
   F_Random_Ptr := F_Random'Access;
   F_Sign_Ptr := F_Sign'Access;
   F_Sine_Ptr := F_Sine'Access;
   F_Sq_Root_Ptr := F_Sq_Root'Access;
   F_Tan_Ptr := F_Tan'Access;
   F_Value_Ptr := F_Value'Access;
   F_Evaluate_Ptr := F_Evaluate'Access;
   F_Error_Num_Ptr := F_Error_Num'Access;
   F_Error_Message_Ptr := F_Error_Message'Access;
   F_Space_Ptr := F_Space'Access;
   F_Decimal_String_Ptr := F_Decimal_String'Access;
   F_String_Ptr := F_String'Access;
   F_Upper_Case_Ptr := F_Upper_Case'Access;
   F_Lower_Case_Ptr := F_Lower_Case'Access;
   F_Version_Ptr := F_Version'Access;
   F_Pos_Ptr := F_Pos'Access;
   F_Tab_Ptr := F_Tab'Access;
   F_In_Key_Ptr := F_In_Key'Access;
   F_Arcsinus_Ptr := F_Arcsinus'Access;
   F_Arcsine_Ptr := F_Arcsine'Access;
   F_Arccos_Ptr := F_Arccos'Access;
   F_Max_Ptr := F_Max'Access;
   F_Min_Ptr := F_Min'Access;

end Command_And_Token_Functions;
