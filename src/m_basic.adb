
with Interfaces;
with Ada.Characters.Handling;
with Ada.Strings;
with Ada.Text_IO; use Ada.Text_IO;

with Global;
with Parse_Functions;

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

   procedure Execute_Program (Tokens : UB_String_Buffer) is
      use Global;
      use UB_String_Buffer_Package;
      Done      : Boolean := False;
      Token_Ptr : Natural := 0;
   begin
      Put_Line ("M_Basic.Execute_Program ");
      if not Is_Empty (Tokens) then
         while not Done loop
            Token_Ptr := Token_Ptr + 1;
            if Element (Tokens, Token_Ptr) = "0" then
               Token_Ptr := Token_Ptr + 1;
            end if;

            if Element (Tokens, Token_Ptr) = T_NEWLINE then
               Token_Ptr := Token_Ptr + 1;
            end if;

            Done :=  (Element (Tokens, 1) /= "0" and
                        Element (Tokens, 2) /= "0") and
              (Element (Tokens, 1) /= "255"  and
                   Element (Tokens, 2) /= "255") ;
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

   function Is_Name_Start (aChar : Character) return Boolean is
      use Ada.Characters.Handling;
   begin
      return Is_Alphanumeric (aChar) or aChar = '_';

   end Is_Name_Start;

   function Is_Name_Character (aChar : Character) return Boolean is
      use Ada.Characters.Handling;
   begin
      return Is_Alphanumeric (aChar) or aChar = '_';

   end Is_Name_Character;

   procedure Parse_Line (Pos : Positive) is
      use Ada.Characters.Handling;
      use M_Basic.UB_String_Buffer_Package;
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
            Process_Colon (Ptr);
         elsif Is_Digit (aChar) or aChar = '.' then
            --  not white space or string or comment so try a number
            Process_Try_Number (Ptr);
         elsif First_Nonwhite then
            Process_First_Nonwhite (Ptr, Label_Valid);
         else
            null;
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

   procedure Tokenize (From_Console : Boolean) is
      use Interfaces;
      use Ada.Characters.Handling;
      use Ada.Strings;
      use M_Basic.UB_String_Buffer_Package;
      aChar    : Character;
      In_Ptr   : Positive := 1;
      Line_Num : Unsigned_64;
      OK       : Boolean := True;
   begin
      --  make sure that only printable characters are in the line
      for index in 1 .. Length (In_Buffer) loop
         aChar := Element (In_Buffer, index);
         if Character'Pos (aChar) < 32 or Character'Pos (aChar) > 127 then
            Replace_Element (In_Buffer, index, ' ');
         end if;
      end loop;

      Token_Buffer.Clear;
      if not From_Console then
         Token_Buffer.Append (Global.T_NEWLINE);
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
            Token_Buffer.Append (Global.T_LINENBR);
            Token_Buffer.Append (To_Unbounded_String ((Unsigned_64'Image
                                 (Shift_Right (Line_Num, 8)))));
            Token_Buffer.Append (To_Unbounded_String ((Unsigned_64'Image
                                 (Line_Num and 16#FF#))));
         end if;
      end if;

      --  Process the rest of the line
      Parse_Line (In_Ptr);

   end Tokenize;

end M_Basic;
