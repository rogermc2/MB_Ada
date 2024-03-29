with Interfaces;

with Ada.Assertions; use Ada.Assertions;
with Ada.Characters.Handling;
with Ada.Strings;
with Ada.Text_IO; use Ada.Text_IO;

with Global;
with M_Basic_Utilities;
with Parse_Functions; use Parse_Functions;
with Support;

package body Tokenizer is

   MAXLINENBR       : constant integer := 65001;

   --     function Get_Token_Function (Index : Positive) return Access_Procedure is

   --     begin
   --        if Index >= M_Misc.C_Base_Token and then
   --          Index < Token_Table'Length then
   --           return Token_Table (Index - M_Misc.C_Base_Token + 1).Function_Ptr;
   --        else
   --           return Token_Table (Token_Table'First).Function_Ptr;
   --        end if;
   --
   --     end Get_Token_Function;

   procedure Less_Than_8_Digits
     (Buffer       : out String_Buffer; In_Ptr : in out Positive;
      From_Console : Boolean) is
      use Interfaces;
      use Ada.Characters.Handling;
      use Support;
      Routine_Name  : constant String := "Tokenizer.Less_Than_8_Digits ";
      Index         : Natural := 0;
      Line_Num      : Unsigned_64 := 0;
      OK            : Boolean := False;
   begin
      --  MMBasic 806 if it is a digit and not an 8 digit hex number
      --  (ie, it is CFUNCTION data) then try for a line number
      if Input_Buffer_Length >= 8 then
         OK := True;
         while OK and then Index < 8 loop
            Index := Index + 1;
            OK := OK and then
              Is_Hexadecimal_Digit (Get_Input_Character (Index));
         end loop;
      end if;

      --  MMBasic 809
      if Is_Digit (Get_Input_Character (In_Ptr)) and Index < 8 then
         Put_Line (Routine_Name & "809 Is_Digit");
         while In_Ptr < Input_Buffer_Length and then
           Is_Digit (Get_Input_Character (In_Ptr)) loop
            In_Ptr := In_Ptr + 1;
         end loop;

         --  In_Ptr points to the character after the number unless
         --  Input_Buffer_Length = 1
         if In_Ptr = 1 then
            --  String1 :=  Support.To_String (Get_Input_Character (1));
            Line_Num :=
              Unsigned_64'Value (Character'Image (Get_Input_Character (1)));
         else
            Line_Num := Unsigned_64'Value (Get_Input_Slice (1, In_Ptr - 1));
         end if;

         if not From_Console and Line_Num > 1 and
           Line_Num <= Unsigned_64 (MAXLINENBR) then
            Buffer_Append (Buffer, Integer'Image (Global.T_LINENBR));
            Buffer_Append (Buffer, Unsigned_64'Image (Shift_Right (Line_Num, 8)));
            Buffer_Append (Buffer, Unsigned_64'Image (Line_Num and 16#FF#));
         end if;
      end if;

   end Less_Than_8_Digits;

   procedure Parse_Line (Token_Buffer : in out String_Buffer;
                         Ptr          : in out Positive) is
      use Ada.Characters.Handling;
      use String_Buffer_Package;
      Routine_Name           : constant String := "Tokenizer.Parse_Line ";
      aChar                  : Character;
      First_Nonwhite         : Boolean := True;
      Label_Valid            : Boolean := True;
      Match_I                : Integer := -1;
      Match_P                : Integer := -1;
      Last_Ptr               : Positive := Ptr;
      OK                     : Boolean := True;
   begin
      while OK and then Ptr < Input_Buffer_Length loop
         Last_Ptr := Ptr;
         aChar := Get_Input_Character (Ptr);
         --           delay (1.0);
         if aChar = ' ' then
            Ptr := Ptr + 1;
         elsif aChar = '"' then
            Put_Line (Routine_Name & '"');
            Process_Double_Quote (Token_Buffer, Ptr);
         elsif aChar = ''' then
            --  MMBasic 892  copy anything after a comment
            Put_Line (Routine_Name & "'");
            Process_Quote (Token_Buffer, Ptr);
         elsif aChar = ':' then
            --  MMBasic 904
            Put_Line (Routine_Name & ':');
            Process_Colon (Token_Buffer, Ptr);
            First_Nonwhite := True;
         elsif Is_Digit (aChar) or aChar = '.' then
            --  MMBasic 921 not white space or string or comment so try number.
            Try_Number (Token_Buffer, Ptr);
            First_Nonwhite := False;
         elsif First_Nonwhite then
            --  MMBasic  939 - 1026
            Process_First_Nonwhite (Token_Buffer, Ptr, Label_Valid,
                                    First_Nonwhite, Match_I, Match_P);
            if Ptr > Integer (Length (Token_Buffer)) then
               Put_Line (Routine_Name & "no more input buffer characters." );
--              else
--                 Put_Line (Routine_Name & "958 First_Nonwhite, Ptr: " &
--                             Get_Input_Character(Ptr));
            end if;

            --  MMBasic 1029
         elsif Check_For_Function_Or_Keyword
           (Token_Buffer, Ptr, First_Nonwhite) then
            Assert (Ptr > Last_Ptr, Routine_Name &
                      "Check_For_Function_Or_Keywords did not increment Ptr");
            --  MMBasic  1067
         elsif M_Basic_Utilities.Is_Name_Start (aChar) then
            Process_Name_Start (Token_Buffer, Ptr, First_Nonwhite, Label_Valid);
            --  MMBasic  1086
         elsif aChar = '(' then
            Put_Line (Routine_Name & "1086 aChar = '(' not implemented: ");
            Ptr := Ptr + 1;
         else  --  1098 None of the above so just copy the one character
            Support.Buffer_Append (Token_Buffer, Support.To_String (aChar));
            Label_Valid := False;
            First_Nonwhite := False;
            Ptr := Ptr + 1;
         end if;

         OK := Ptr > Last_Ptr;
         if not OK then
            Put_Line (Routine_Name & "command " & Get_Input_Buffer &
                        " not recognized");
         end if;
      end loop;

      --  1108 Terminates with three null characters.
      --        Append (Token_Buffer, "000");

   end Parse_Line;

   --  MMBasic 811 Tokenize:
   --  takes an input string in inpbuf[] and copies it to tknbuf[] and:
   --  converts the line number to a binary number,
   --  converts a label to the token format,
   --  converts keywords to tokens,
   --  converts the colon to a zero (null) char.
   --  The result in tknbuf[] is terminated with double zero (null) chars.
   --  If From_Console is true then do not add a line number
   procedure Tokenize (Token_Buffer : out String_Buffer;
                       From_Console : Boolean) is
      use Ada.Strings;
      use Support;
      --        Routine_Name   : constant String := "Tokenizer.Tokenize ";
      aChar          : Character;
      In_Ptr         : Positive := 1;  --  tp
   begin
      --  MMBasic 819 make sure that only printable characters are in the line
      for index in 1 .. Input_Buffer_Length loop
         aChar := Get_Input_Character (index);
         if Character'Pos (aChar) < 32 or Character'Pos (aChar) > 127 then
            Replace_In_Buffer_Character (index, ' ');
         end if;
      end loop;

      Support.Clear_Buffer (Token_Buffer);
      --  MMBasic 831
      if not From_Console then
         Buffer_Append (Token_Buffer, Integer'Image (Global.T_NEWLINE));
      end if;
      Trim_Input_Buffer (Left);

      --  834 Get line number if given
      Less_Than_8_Digits (Token_Buffer, In_Ptr, From_Console);

      --        Put_Line (Routine_Name & "841 In_Buffer: " & Get_Input_Buffer);
      --  841 Process the rest of the line
      if Input_Buffer_Length > In_Ptr then
         Parse_Line (Token_Buffer, In_Ptr);
      end if;

   end Tokenize;

end Tokenizer;
