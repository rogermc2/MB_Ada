with Interfaces;

with Ada.Assertions; use Ada.Assertions;
with Ada.Characters.Handling;
with Ada.Strings;
--  with Ada.Strings.Unbounded; use Ada.Strings.Unbounded;
with Ada.Text_IO; use Ada.Text_IO;

--  with Command_And_Token_Functions; use Command_And_Token_Functions;
--  with Configuration;
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
     (Buffer       : in out String_Buffer; In_Ptr : in out Positive;
      From_Console : Boolean) is
      use Interfaces;
      use Ada.Characters.Handling;
      use Support;
      String1       : String (1 .. 1);
      Index         : Natural := 0;
      Line_Num      : Unsigned_64 := 0;
      OK            : Boolean := True;
   begin
      --  MMBasic 806 if it is a digit and not an 8 digit hex number
      --  (ie, it is CFUNCTION data) then try for a line number
      if Input_Buffer_Length >= 8 then
         while OK and then Index < 8 loop
            Index := Index + 1;
            OK := OK and then
              Is_Hexadecimal_Digit (Get_Input_Character (Index));
         end loop;
      end if;

      --  MMBasic 809
      if Is_Digit (Get_Input_Character (In_Ptr)) and Index < 8 then
         while In_Ptr < Input_Buffer_Length and then
           Is_Digit (Get_Input_Character (In_Ptr)) loop
            In_Ptr := In_Ptr + 1;
         end loop;

         --  In_Ptr points to the character after the number unless
         --  Input_Buffer_Length = 1
         if In_Ptr = 1 then
            String1(1) := Get_Input_Character (1);
            Line_Num := Unsigned_64'Value (String1);
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

   procedure Parse_Line (Buffer : out String_Buffer; Ptr : in out Positive) is
      use Ada.Characters.Handling;
      use String_Buffer_Package;
      Routine_Name           : constant String := "Tokenizer.Parse_Line ";
      aChar                  : Character;
      First_Nonwhite         : Boolean := True;
      Label_Valid            : Boolean := True;
      Match_I                : Integer := -1;
      Match_P                : Integer := -1;
      Last_Ptr               : Positive := Ptr;
   begin
      Put_Line (Routine_Name & "Token Buffer start: ");
      Support.Print_Buffer (Buffer);
      while Ptr <= Input_Buffer_Length loop
         Put_Line (Routine_Name & "Last_Ptr : " & Integer'Image (Last_Ptr));
         Last_Ptr := Ptr;
         aChar := Get_Input_Character (Ptr);
         Put_Line (Routine_Name & "Ptr, aChar, First_Nonwhite: " &
                     Integer'Image (Ptr) & ", " & aChar & ", " &
                     Boolean'Image (First_Nonwhite) );
         Put_Line (Routine_Name & "Input_Buffer_Length : " &
                     Integer'Image (Input_Buffer_Length));
--           Put_Line (Routine_Name & "Token Buffer:");
--           Support.Print_Buffer (Buffer);
--           delay (1.0);
         if aChar = ' ' then
            Put_Line (Routine_Name & "aChar = ' '");
            Ptr := Ptr + 1;
         elsif aChar = '"' then
            Put_Line (Routine_Name & '"');
            Process_Double_Quote (Buffer, Ptr);
         elsif aChar = ''' then
            --  MMBasic 862  copy anything after a comment
            Put_Line (Routine_Name & "'");
            Process_Quote (Buffer, Ptr);
         elsif aChar = ':' then
            --  MMBasic 871
            Put_Line (Routine_Name & ':');
            Process_Colon (Buffer, Ptr);
            First_Nonwhite := True;
         elsif Is_Digit (aChar) or aChar = '.' then
            --  MMBasic 887
            --  not white space or string or comment so try a number
            Put_Line (Routine_Name & "Try number");
            Try_Number (Buffer, Ptr);
            First_Nonwhite := False;
         elsif First_Nonwhite then
            --  MMBasic  907 - 955
            Put_Line (Routine_Name & "First_Nonwhite, Match_P: " &
                        Integer'Image (Match_P));
            Process_First_Nonwhite (Buffer, Ptr, Label_Valid, First_Nonwhite,
                                    Match_I, Match_P);
            Put_Line (Routine_Name & "First_Nonwhite processed");
            if Ptr <= Integer (Length (Buffer)) then
               Put_Line (Routine_Name & "First_Nonwhite, Ptr: " &
                           Get_Input_Character(Ptr));
            else
               Put_Line (Routine_Name & "no more input buffer characters." );
            end if;

            --  MMBasic  958
            if Match_I > -1 then
               Put_Line (Routine_Name & "Process_Command");
               Process_Command (Buffer, Ptr, Match_I, Match_P,
                                First_Nonwhite, Label_Valid);
               Put_Line (Routine_Name & "Command processed");
               Assert (Ptr > Last_Ptr, Routine_Name & "Ptr not incremented");
            end if;

            --  MMBasic  976
         elsif Label_Valid and then
           M_Basic_Utilities.Is_Name_Start (Get_Input_Character (Ptr)) then
            Put_Line (Routine_Name & "Label_Valid and Name_Start: " &
                        Get_Input_Character (Ptr));
            Try_Label (Buffer, Ptr, Label_Valid);
            --  MMBasic  997
         elsif Check_For_Function_Or_Keyword (Buffer, Ptr, First_Nonwhite) then
--              Put_Line (Routine_Name & "Function_Or_Keyword check,  Ptr: " &
--                       Integer'Image (Ptr));
            Assert (Ptr > Last_Ptr, Routine_Name &
                      "Check_For_Function_Or_Keywords did not increment Ptr");
            --  MMBasic  1035
         elsif M_Basic_Utilities.Is_Name_Start (aChar) then
            Process_Name_Start (Buffer, Ptr, First_Nonwhite, Label_Valid);
            --              Put_Line (Routine_Name & "Name_Start processed, Buffer");
            --              Support.Print_Buffer (Buffer);
            --  MMBasic  1054
         elsif aChar = '(' then
            Put_Line (Routine_Name & "aChar = '(' not implemented: ");
            Ptr := Ptr + 1;
         else  --  None of the above so just copy the one character
            Put_Line (Routine_Name & "else aChar: " & Character'image (aChar));
            Support.Buffer_Append (Buffer, Character'image (aChar));
            Label_Valid := False;
            First_Nonwhite := False;
            Ptr := Ptr + 1;
         end if;

         Put_Line (Routine_Name & "end loop, First_Nonwhite: " &
                     Boolean'Image (First_Nonwhite) & ", Ptr: " &
                     Integer'image (Ptr) & ", aChar: " &
                     Character'image (aChar));
         New_Line;
         Assert (Ptr > Last_Ptr, Routine_Name & "Ptr was not incremented");
      end loop;

      Append (Buffer, "000");

      Put_Line (Routine_Name & "done, Buffer:");
      Support.Print_Buffer (Buffer);
      New_Line;

   end Parse_Line;

   --  Tokenize:
   --  takes an input string in inpbuf[] and copy it to tknbuf[] and:
   --  converts the line number to a binary number
   --  converts a label to the token format
   --  converts keywords to tokens
   --  converts the colon to a zero char
   --  the result in tknbuf[] is terminated with double zero chars
   --  if From_Console is true then do not add a line number
   procedure Tokenize (Buffer : out String_Buffer; From_Console : Boolean) is
      use Ada.Strings;
      use Support;
      Routine_Name   : constant String := "Tokenizer.Tokenize ";
      aChar          : Character;
      In_Ptr         : Positive := 1;  --  tp
   begin
      --  MMBasic 786 make sure that only printable characters are in the line
      for index in 1 .. Input_Buffer_Length loop
         aChar := Get_Input_Character (index);
         if Character'Pos (aChar) < 32 or Character'Pos (aChar) > 127 then
            Replace_In_Buffer_Character (index, ' ');
         end if;
      end loop;

      Support.Clear_Buffer (Buffer);
      --  MMBasic 798
      if not From_Console then
         Buffer_Append (Buffer, Integer'Image (Global.T_NEWLINE));
      end if;
      Trim_Input_Buffer (Left);

      Less_Than_8_Digits (Buffer, In_Ptr, From_Console);

      Put_Line (Routine_Name & "834 In_Buffer: " & Get_Input_Buffer);
      --  834 Process the rest of the line
      if Input_Buffer_Length > In_Ptr then
         Parse_Line (Buffer, In_Ptr);
      end if;

   end Tokenize;

end Tokenizer;
