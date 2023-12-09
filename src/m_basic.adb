
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
   --     lags used in the program lines
   T_CMDEND         : constant Natural:= 0;                               --  end of a command
   T_NEWLINE        : constant Natural:= 1;                             --  Single byte indicating the start of a new line
   T_LINENBR        : constant Natural:= 2;                               --  three bytes for a line number
   T_LABEL          : constant Natural:=  3;                           --  variable length indicating a label

   E_END            : constant Natural:= 255;                --  dummy last operator in an expression

   --  these constants are used in the second argument of the findvar() function, they should be or'd together
   V_FIND              : constant Natural:= 16#0000#;                   --  a straight forward find, if the variable is not found it is created and set to zero
   V_NOFIND_ERR        : constant Natural:= 16#0200#;                   --  throw an error if not found
   V_NOFIND_NULL       : constant Natural:= 16#0400#;                   --  return a null pointer if not found
   V_DIM_VAR            : constant Natural:= 16#0800#;                  --  dimension an array
   --     V_LOCAL              : constant Natural:= 16#1000#;
   --  create a local variable
   V_EMPTY_OK          : constant Natural:= 16#2000#;                   --  allow an empty array variable.  ie, var()
   V_FUNCT             : constant Natural:= 16#4000#;     --  we are defining the name of a function

   --  these flags are used in the last argument in expression()
   E_NOERROR           : Boolean := True;
   E_ERROR              : constant Natural:= 0;
   E_DONE_GETVAL        : constant Natural:= 2;

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
      Done      : Boolean := False;
      Token_Ptr : Natural := 0;
   begin
      Put_Line ("M_Basic.Execute_Program " & To_String (Tokens));
      if Length (Tokens) > 0 then
         while not Done loop
            Token_Ptr := Token_Ptr + 1;
            if Element (Tokens, Token_Ptr) = '0' then
               Token_Ptr := Token_Ptr + 1;
            end if;

            if Element (Tokens, Token_Ptr) = T_NEWLINE then
               Token_Ptr := Token_Ptr + 1;
            end if;

            Done :=  (Element (Tokens, 1) /= '0' and Element (Tokens, 2) /= '0') and
              (Character'Pos (Element (Tokens, 1)) /= 255  and
                 Character'Pos (Element (Tokens, 2)) /= 255) ;
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

   end Init_Basic;

   procedure Print_String (theString : String) is
   begin
      Put (theString);

   end Print_String;

   procedure Prepare_Program (State : Boolean) is
   begin
      null;
   end Prepare_Program;

   --     function Tokenize (aLine : String) return Global.Token_Buffer is
   function Tokenize (aLine : String) return Unbounded_String is
      aChar  : Character;
      --        Tokens :  Global.Token_Buffer;
      Tokens :  Unbounded_String;
   begin
      --  make sure that only printable characters are in the line
      for index in aLine'Range loop
         aChar := aLine (index);
         if Character'Pos (aChar) < 128 then
            aChar := ' ';
         end if;
      end loop;

      return Tokens;

   end Tokenize;

end M_Basic;
