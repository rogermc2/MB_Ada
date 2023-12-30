with Interfaces;

with Ada.Characters.Handling;
with Ada.Strings;
--  with Ada.Strings.Unbounded; use Ada.Strings.Unbounded;
with Ada.Text_IO; use Ada.Text_IO;

with Command_And_Token_Functions; use Command_And_Token_Functions;
--  with Configuration;
with Global;
with M_Basic;
with M_Misc;
with Parse_Functions;
with Support;

package body Tokenizer is

   MAXLINENBR       : constant integer := 65001;

   function Get_Token_Function (Index : Positive) return Access_Procedure is

   begin
      if Index >= M_Misc.C_Base_Token and then
        Index < Token_Table'Length then
         return Token_Table (Index - M_Misc.C_Base_Token + 1).Function_Ptr;
      else
         return Token_Table (Token_Table'First).Function_Ptr;
      end if;

   end Get_Token_Function;

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
            Buffer_Append (Buffer, Global.T_LINENBR);
            Buffer_Append (Buffer, Unsigned_64'Image (Shift_Right (Line_Num, 8)));
            Buffer_Append (Buffer, Unsigned_64'Image (Line_Num and 16#FF#));
         end if;
      end if;

   end Less_Than_8_Digits;

   procedure Parse_Line (Buffer : out String_Buffer; Ptr : in out Positive) is
      use Ada.Characters.Handling;
      use Parse_Functions;
--        Routine_Name   : constant String := "Tokenizer.Parse_Line ";
      aChar          : Character;
      First_Nonwhite : Boolean := True;
      Label_Valid    : Boolean := True;
      Match_I        : Integer := -1;
      Match_L        : Integer := -1;
      Match_P        : Integer := -1;
      Done           : Boolean;
   begin
      while Ptr < Input_Buffer_Length loop
         Done := False;
         aChar := Get_Input_Character (Ptr);

         if aChar = ' ' then
            Ptr := Ptr + 1;
            Done := True;
         elsif aChar = '"' then
            Process_Double_Quote (Buffer, Ptr);
            Done := True;
         elsif aChar = ''' then
            --  MMBasic 862  copy anything after a comment
            Process_Quote (Buffer, Ptr);
            Done := True;
         elsif aChar = ':' then
            --  MMBasic 871
            Process_Colon (Buffer, Ptr);
            First_Nonwhite := True;
            Done := True;
         elsif Is_Digit (aChar) or aChar = '.' then
            --  MMBasic 887
            --  not white space or string or comment so try a number
            Try_Number (Buffer, Ptr);
            First_Nonwhite := False;
            Done := True;
         elsif First_Nonwhite then
            --  MMBasic  907 - 955
            Process_First_Nonwhite (Buffer, Ptr, Label_Valid, First_Nonwhite,
                                    Match_I, Match_L, Match_P);
            --  MMBasic  958
            if Match_I > -1 then
               Process_Command (Buffer, Match_I, Match_P);
               First_Nonwhite := False;
               Label_Valid := False;
               Done := True;
            end if;

         elsif Label_Valid and then
           M_Basic.Is_Name_Start (Get_Input_Character (Ptr)) then
            null;
         end if;

      end loop;

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
         Buffer_Append (Buffer, Global.T_NEWLINE);
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
