
with Interfaces;

with Ada.Assertions;
with Ada.Characters.Handling;
with Ada.Strings;
with Ada.Text_IO; use Ada.Text_IO;

with Command_And_Token_Tables; use Command_And_Token_Tables;
with Command_And_Token_Functions;
with Draw;
with Editor;
with Global;
WITH M_Misc;
with Parse_Functions;

package body M_Basic is

   --     Trace_On : Boolean := False;

   procedure Clear_Runtime;

   procedure Clear_Program is
   begin
      Clear_Runtime;
      Editor.Init_Editor;
      --        Trace_On := False;
   end Clear_Program;

   procedure Clear_Runtime is
   begin
      for index in Subfunctions'Range loop
         Subfunctions (Index) := 0;
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
      use Command_And_Token_Functions;
      --        Sub_Name : constant Unbounded_String := To_Unbounded_String (Name);
      Index    : Natural := 0;
      Pos2     : Positive;
   begin
      --        Put_Line ("M_Basic.Find_Subfunction ");
      --  350
      while index <= Configuration.MAXSUBFUN loop
         Index := Index + 1;
         Pos2 := Subfunctions (index);
         if Fun_Type = 0 and then
           (Pos2 = cmdSUB or Pos2 = cmdCSUB) then
            null;
         elsif (Pos2 = cmdFUN or Pos2 = cmdCFUN) then
            null;
         else
            Pos2 := Pos2 + 1;
            Skip_Spaces (Pos2);
         end if;
         --           Done := Subfunctions (Index) = Sub_Address;
      end loop;

      return System.Null_Address;

   end Find_Subfunction;

   procedure Init_Basic is
   begin
      Clear_Program;
      Command_And_Token_Functions.Init_Operator_Functions;

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
            --  892 not First_Nonwhite
         elsif Try_Function_Or_Keyword (Ptr, First_Nonwhite) then
            null;
         elsif Is_Name_Start (Element (In_Buffer, Ptr)) then
            --  934
            Process_Variable_Name (Ptr, First_Nonwhite, Label_Valid);
         elsif Element (In_Buffer, Ptr) = '(' then
            --  953 special case where the character to copy is an
            --  opening parenthesis.
            --  Search back to see if the previous non space char was the end
            --  of an identifier.
            --  If it is, remove any spaces following the identifier to enable
            --  programmers to put spaces after function names or
            --  array identifiers without causing confusing errors.
            null;
         end if;

      end loop;

   end Parse_Line;

   procedure Print_String (theString : String) is
   begin
      Put (theString);

   end Print_String;

   procedure Prepare_Program_Ext
     (Pos, Index  : in out Positive; C_Fun_Ptr : System.Address;
      Error_Abort : Boolean) is
      use System;
      use Command_And_Token_Functions;
   begin
      while Pos <= 255 loop
         Pos := Get_Next_Command (Pos, Current_Line_Ptr, Null_Address);
      end loop;

   end Prepare_Program_Ext;

 procedure Prepare_Program (Error_Abort : Boolean) is
   use Draw;
   begin
      for index in FONT_BUILTIN_NBR .. FONT_TABLE_SIZE loop
         Font_Table (index) := System.Null_Address;
      end loop;

   end Prepare_Program;
   procedure Skip_Spaces (Pos : in out Positive) is
   begin
      while  Element (In_Buffer, Pos) = ' ' loop
         Pos := Pos + 1;
      end loop;

   end Skip_Spaces;

   --  2413 Skip_Var skips to the end of a variable
   function Skip_Var (Pos : in out Positive) return Positive is
      use Ada.Assertions;
      Routine_Name : String := "M_Basic.Skip_Var ";
      Pos2         : constant Positive := Pos;
      Pos3         : Positive;
      Index        : Positive;
      In_Quote     : Boolean := False;
      Done         : Boolean;
   begin
      if Element (In_Buffer, Pos) = ' ' then
         Pos := Pos + 1;
      end if;

      if Is_Name_Start (Element (In_Buffer, Pos)) then
         while Is_Name_Character (Element (In_Buffer, Pos)) loop
            Pos := Pos + 1;
         end loop;

         --  2429 check the terminating char.
         if not (Element (In_Buffer, Pos) = '$') and then
           not (Element (In_Buffer, Pos) = '%') and then
           not (Element (In_Buffer, Pos) = '|') then
            Pos := Pos - 1;
         end if;

         Assert (Pos2 - Pos < Configuration.MAXVARLEN,
                 Routine_Name & "Variable name " &
                   Slice (In_Buffer, Pos, Pos2) & " is too long");

         Pos3 := Pos;
         if Element (In_Buffer, Pos3) = ' ' then
            Pos3 := Pos3 + 1;
         end if;

         if Element (In_Buffer, Pos3) = '(' then
            Pos := Pos3;
         end if;

         if Element (In_Buffer, Pos) = '(' then
            --  2445 this is an array
            Pos := Pos + 1;
            Assert (Pos2 - Pos < Configuration.MAXVARLEN,
                    Routine_Name & "Variable name " &
                      Slice (In_Buffer, Pos, Pos2) & " is too long");

            --  2456 Step over the array parameters keeping track of
            --  nested brackets.
            Index := 1;
            Done := False;
            while not Done loop
               if Element (In_Buffer, Pos) = '"' then
                  In_Quote := not In_Quote;
               end if;

               if Pos = Length (In_Buffer) then

                  Assert (Pos >= Length (In_Buffer),
                          Routine_Name & "Expected closing bracket.");

                  Done := not In_Quote and then
                    Element (In_Buffer, Pos) = ')' and then
                    Index = 1;

                  if not Done and then
                    (Element (In_Buffer, Pos) = '(' or else
                     Token_Type (Pos) = T_FUN) then
                     Index := Index + 1;
                  end if;

                  Pos := Pos + 1;
               end if;
               Pos := Pos + 1;
            end loop;

         end if;
      end if;

      return Pos2;

   end Skip_Var;

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

end M_Basic;
