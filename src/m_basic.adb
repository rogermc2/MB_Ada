
with Interfaces;
with Ada.Characters.Handling;
with Ada.Strings;
with Ada.Text_IO; use Ada.Text_IO;

with Global;
WITH M_Misc;
with Parse_Functions;

package body M_Basic is

   Start_Edit_Point : Positive := 1;
   Start_Edit_Char  : Positive := 1;
   Trace_On         : Boolean := False;

   t_THEN        : Integer;
   t_ELSE        : Integer;
   t_GOTO        : Integer;
   t_EQUAL       : Integer;
   t_TO          : Integer;
   t_STEP        : Integer;
   t_WHILE       : Integer;
   t_UNTIL       : Integer;
   t_GOSUB       : Integer;
   t_AS          : Integer;
   t_FOR         : Integer;
   c_SELECT_CASE   : Integer;
   c_CASE          : Integer;
   c_CASE_ELSE     : Integer;
   c_END_SELECT    : Integer;
   c_SUB           : Integer;
   c_FUN           : Integer;
   c_IRET          : Integer;
   c_CFUN          : Integer;
   c_CSUB          : Integer;

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

   procedure Execute_Program (Tokens : Unbounded_String) is
      use Global;
      --        use UB_String_Buffer_Package;
      Done      : Boolean := False;
      token_Ptr : Natural := 0;
   begin
      Put_Line ("M_Basic.Execute_Program ");
      --        if not Is_Empty (Tokens) then
      if Length (Tokens) > 0 then
         while not Done loop
            token_Ptr := Token_Ptr + 1;
            if Element (Tokens, Token_Ptr) = '0' then
               token_Ptr := Token_Ptr + 1;
            end if;

            if Element (Tokens, Token_Ptr) = T_NEWLINE then
               token_Ptr := Token_Ptr + 1;
            end if;

            Done := Slice (Tokens, 1, 2) /= "00" and
              Slice (Tokens, 1, 2) /= "255255" ;
         end loop;
      end if;

   end Execute_Program;

   function Find_Subfunction (Token : Unbounded_String; Fun_Type : Integer)
                              return System.Address is
      use System;
      --        Sub_Name : constant Unbounded_String := To_Unbounded_String (Name);
      Index    : Natural := 0;
      Done     : Boolean := False;
   begin
      --        Put_Line ("M_Basic.Find_Subfunction ");
      while index <= Configuration.MAXSUBFUN and not Done loop
         Index := Index + 1;
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

   end Init_Basic;

   function Is_Line_Num (aChar : Character) return Boolean is
      use Ada.Characters.Handling;
   begin
      return Is_Alphanumeric (aChar);
   end Is_Line_Num;
   pragma Inline (Is_Line_Num);

   function Is_Name_Character (aChar : Character) return Boolean is
      use Ada.Characters.Handling;
   begin
      return Is_Alphanumeric (aChar) or else aChar = '_' or else aChar = ':';

   end Is_Name_Character;

   function Is_Name_Start (aChar : Character) return Boolean is
      use Ada.Characters.Handling;
   begin
      return Is_Alphanumeric (aChar) or aChar = '_';

   end Is_Name_Start;

   function Is_Name_End (aChar : Character) return Boolean is
   begin
      return Is_Line_Num (aChar) or else aChar = '_' or else
        aChar = '.' or else aChar = '$' or else aChar = '|' or else
        aChar = '%';

   end Is_Name_End;

   procedure Parse_Line (Pos : Positive) is
      use Ada.Characters.Handling;
      use Parse_Functions;
      Buff_Length    : constant Positive := Length (In_Buffer);
      Ptr            : Positive := Pos;
      aChar          : Character;
      First_Nonwhite : Boolean := True;
      Label_Valid    : Boolean := True;
   begin
      while Ptr <= Buff_Length loop
         aChar := Element (In_Buffer, Ptr);
         if aChar = ' ' then
            Ptr := Ptr + 1;
         elsif aChar = '"' then
            Process_Double_Quote (Ptr, aChar);
         elsif aChar = ''' then
            Process_Quote (Ptr);
         elsif aChar = ':' then
            Process_Colon (Ptr, First_Nonwhite);
         elsif Is_Digit (aChar) or aChar = '.' then
            --  not white space or string or comment so try a number
            Process_Try_Number (Ptr);
         elsif First_Nonwhite then
            Process_First_Nonwhite (Ptr, Label_Valid, First_Nonwhite);
         else
            --  891
            Try_Function_Or_Keyword (Ptr);
         end if;

      end loop;

   end Parse_Line;

   procedure Print_String (theString : String) is
   begin
      Put (theString);

   end Print_String;

   procedure Prepare_Program (State : Boolean) is
   begin
      null;
   end Prepare_Program;

   procedure Skip_Spaces (Pos : in out Positive) is
   begin
      while  Element (In_Buffer, Pos) = ' ' loop
         Pos := Pos + 1;
      end loop;

   end Skip_Spaces;

   function Token_Function (Index : Positive) return System.Address is

   begin
      if Index >= M_Misc.C_Base_Token and then
        Index < Token_Table'Length then
         return Token_Table (Index - M_Misc.C_Base_Token + 1).Function_Ptr;
      else
         return Token_Table (Token_Table'First).Function_Ptr;
      end if;

   end Token_Function;

   procedure Tokenize (From_Console : Boolean) is
      use Interfaces;
      use Ada.Characters.Handling;
      use Ada.Strings;
      aChar          : Character;
      In_Ptr         : Positive := 1;
      Line_Num       : Unsigned_64;
      OK             : Boolean := True;
   begin
      --  make sure that only printable characters are in the line
      for index in 1 .. Length (In_Buffer) loop
         aChar := Element (In_Buffer, index);
         if Character'Pos (aChar) < 32 or Character'Pos (aChar) > 127 then
            Replace_Element (In_Buffer, index, ' ');
         end if;
      end loop;

      Token_Buffer := Null_Unbounded_String;
      if not From_Console then
         Append (Token_Buffer, Global.T_NEWLINE);
      end if;
      Trim (In_Buffer, Left);

      --  if it a digit and not an 8 digit hex number
      --  (ie, it is CFUNCTION data) then try for a line number
      while OK and then In_Ptr <= 8 loop
         OK := OK and Is_Hexadecimal_Digit (Element (In_Buffer, In_Ptr));
         In_Ptr := In_Ptr + 1;
      end loop;

      if Is_Digit (Element (In_Buffer, 1)) and In_Ptr <= 8 then
         Line_Num := Unsigned_64'Value (Slice (In_Buffer, 1, In_Ptr - 1));
         if not From_Console and Line_Num > 1 and
           Line_Num <= Unsigned_64 (MAXLINENBR) then
            Append (Token_Buffer, Global.T_LINENBR);
            Append (Token_Buffer,To_Unbounded_String ((Unsigned_64'Image
                    (Shift_Right (Line_Num, 8)))));
            Append (Token_Buffer, To_Unbounded_String ((Unsigned_64'Image
                    (Line_Num and 16#FF#))));
         end if;
      end if;

      --  Process the rest of the line
      Parse_Line (In_Ptr);

   end Tokenize;

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

end M_Basic;
