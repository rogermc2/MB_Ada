
with Interfaces;

--  with Ada.Assertions;
with Ada.Characters.Handling;
with Ada.Strings.Unbounded; use Ada.Strings.Unbounded;
with Ada.Text_IO; use Ada.Text_IO;

with Command_And_Token_Functions;
with Configuration;
with Global;
with M_Basic; use M_Basic;
with M_Basic_Utilities; use M_Basic_Utilities;
with M_Misc;
with Support;

package body Parse_Functions is

   procedure Try_Command
     (Token_Buffer : in out String_Buffer; P : in out Positive;
      Label_Valid  : in out Boolean; First_Nonwhite : in out Boolean);

   function Check_For_Function_Or_Keyword
     (Token_Buffer   : in out String_Buffer; Ptr : in out Positive;
      First_Nonwhite : in out Boolean) return Boolean is
      use Ada.Characters.Handling;
      use Command_And_Token_Functions;
      use String_Buffer_Package;
      --        Routine_Name : constant String :=
      --                         "Parse_Functions.Check_For_Function_Or_Keyword ";
      TP2          : Positive := Ptr;  --  pointer into Input_Buffer
      TP_Index     : Positive := 1;
      TP           : Unbounded_String;  --  Token name
      TT_Index     : Natural := 0;
      In_Char      : Character;
      Token_Char   : Character;
      Done         : Boolean := False;
      OK           : Boolean := False;
   begin
      --  MMBasic  997
      while not Done and then TT_Index < Token_Table'Last loop
         TT_Index := TT_Index + 1;
         TP2 := Ptr;
         TP_Index := 1;
         TP := Token_Table (TT_Index).Name;
         if Length (TP) > 0 then
            --  Check if this token matches the input text
            In_Char := To_Upper (Get_Input_Character (TP2));
            Token_Char := To_Upper (Element (TP, TP_Index));
            while TP2 < Input_Buffer_Length and then
              Token_Char = In_Char and then TP_Index < Token_Table'Last loop
               TP2 := TP2 + 1;
               TP_Index := TP_Index + 1;
               Token_Char := Element (TP, TP_Index);
               if Token_Char = '(' then
                  Skip_In_Buffer_Spaces (TP2);
               end if;
            end loop;

            --  MMBasic  1011
            Done := TP_Index > Length (TP) and then
              (not Is_Name_End (Element (TP, TP_Index - 1)) or else
               Is_Name_Character (Get_Input_Character (TP2)));
         end if;
      end loop;

      --  MMBasic  1015
      if TT_Index < Token_Table_Size then
         TT_Index := Integer (M_Misc.C_Base_Token) + TT_Index;
         Append (Token_Buffer, Integer'Image (TT_Index));
         Ptr := TP2;
         First_Nonwhite := TT_Index = tokenTHEN or else TT_Index = tokenELSE;
         OK := True;
      end if;

      return OK;

   end Check_For_Function_Or_Keyword;

   function Get_Command_Value (Command : String) return integer is
      Routine_Name  : constant String := "Parse_Functions.Get_Command_Value ";
      Command_Value : Integer := 0;
      Found         : Boolean := False;
      index         : Natural := 0;
   begin
      while not Found and then index < Command_Table'Length loop
         index := index + 1;
         Found := To_String (Command_Table (index).Name) = Command;
      end loop;

      if Found then
         Command_Value := index +Integer (M_Misc.C_Base_Token) - 1;
      else
         Put_Line (Routine_Name & "unknown command " & Command);
      end if;

      return Command_Value;

   end Get_Command_Value;

   --     function Get_Long_Command_From_Input (I_Pos : in out Positive)
   --                                           return Unbounded_String is
   --        use Ada.Characters.Handling;
   --        --        Routine_Name  : constant String :=
   --        --                          "Parse_Functions.Get_Long_Command_From_Input ";
   --        aChar         : Character;
   --        Command       : Unbounded_String;
   --        Done          : Boolean := False;
   --     begin
   --        Command := Get_Command_From_Input (I_Pos);
   --        Skip_In_Buffer_Spaces (I_Pos);
   --        Done := I_Pos > Input_Buffer_Length;
   --
   --        while not Done loop
   --           --  get second command word
   --           aChar := Get_Input_Character (I_Pos);
   --           Done :=  aChar = ' ' or else
   --             (not (aChar = '_' or Is_Alphanumeric (aChar)));
   --           if not Done then
   --              Append (Command, aChar);
   --           end if;
   --           I_Pos := I_Pos + 1;
   --           Done := Done or else I_Pos > Input_Buffer_Length;
   --        end loop;
   --
   --        return Command;
   --
   --     end Get_Long_Command_From_Input;

   function Get_Next_Character (I_Pos : in out Positive) return Character is
   begin
      I_Pos := I_Pos + 1;
      return Get_Input_Character (I_Pos);
   end Get_Next_Character;

   procedure Process_Colon
     (Buffer : in out String_Buffer; I_Pos : in out Positive) is
      use Support;
   begin
      Buffer_Append (Buffer, "0");
      I_Pos := I_Pos + 1;
      while Get_Input_Character (I_Pos) = ':' loop
         Buffer_Append (Buffer, "0");
         I_Pos := I_Pos + 1;
      end loop;

   end Process_Colon;

   procedure Process_Command
     (Token_Buffer                : out String_Buffer; I_Pos : in out Positive;
      Match_I_Pos                 : Positive; Match_Index : Integer;
      First_Nonwhite, Label_Valid : in out Boolean) is
      Routine_Name  : constant String := "Parse_Functions.Process_Command ";
      use Ada.Characters.Handling;
      use Support;
   begin
      --  MMBasic 993
      Buffer_Append (Token_Buffer, Integer'Image
                     (Integer (M_Misc.C_Base_Token) + Match_Index));
      --  Step over the input buffer command.
      I_Pos := Match_I_Pos;
--        Put_Line (Routine_Name & "C_Base_Token, Match_Index: " &
--                    Interfaces.Unsigned_16'Image (M_Misc.C_Base_Token) & ", " &
--                    Integer'Image (Match_Index));
--        Put_Line (Routine_Name & "C_Base_Token + Match_Index: " &
--                    Integer'Image (Integer (M_Misc.C_Base_Token) + Match_Index));
      Put_Line (Routine_Name & "Buffer:");
      Support.Print_Buffer (Token_Buffer);

      --  MMBasic 995
      if Match_Index + Integer (M_Misc.C_Base_Token) =
        Get_Command_Value ("Rem") then
         --  MMBasic 996 copy everything
         Copy_Slice (Token_Buffer, I_Pos, Input_Buffer_Length);

      elsif I_Pos <= Input_Buffer_Length and then Is_Alphanumeric (Get_Input_Character (I_Pos - 1)) and then
        Get_Input_Character (I_Pos) = ' ' then
         I_Pos := I_Pos + 1;
      end if;
      --  MMBasic 1003
      First_Nonwhite := False;
      Label_Valid := False;

   end Process_Command;

   procedure Process_Double_Quote
     (Token_Buffer : in out String_Buffer; I_Pos : in out Positive) is
      use Support;
      aChar  : constant Character := ' ';
   begin
      while aChar /= '"' and I_Pos <= Input_Buffer_Length loop
         I_Pos := I_Pos + 1;
      end loop;

      Buffer_Append (Token_Buffer, """");
      I_Pos := I_Pos + 1;
      if Get_Input_Character (I_Pos) = '"' then
         I_Pos := I_Pos + 1;
      end if;

   end Process_Double_Quote;

   procedure Process_Name_Start
     (Token_Buffer   : in out String_Buffer; I_Pos : in out Positive;
      First_Nonwhite : in out Boolean; Label_Valid : in out Boolean) is
      use String_Buffer_Package;
      Routine_Name  : constant String := "Parse_Functions.Process_Name_Start ";
      TP            : Positive;
      Command       : Unbounded_String;
   begin
      if First_Nonwhite then
         TP := Skip_Var (I_Pos);
         Skip_In_Buffer_Spaces (TP);
         if Get_Input_Character (TP) = '=' then
            Append (Token_Buffer, Integer'Image (Get_Command_Value ("Let")));
         end if;
      end if;

      while I_Pos <= Input_Buffer_Length and then
        Is_Name_Character (Get_Input_Character (I_Pos)) loop
         Append (Command, Get_Input_Character (I_Pos));
         I_Pos := I_Pos + 1;
      end loop;
      Put_Line (Routine_Name & "Command: " & To_String (Command));
      Append (Token_Buffer, To_String (Command));
      Put_Line (Routine_Name & "Token Buffer:");
      Support.Print_Buffer (Token_Buffer);

      First_Nonwhite := False;
      Label_Valid := False;

   end Process_Name_Start;

   procedure Process_First_Nonwhite
     (Token_Buffer     : in out String_Buffer; I_Pos : in out Positive;
      Label_Valid      : in out Boolean;
      First_Nonwhite   : in out Boolean;
      Match_I, Match_P : in out Integer) is
      --        use Ada.Assertions;
--        Routine_Name  : constant String :=
--          "Parse_Functions.Process_First_Nonwhite ";
      aChar         : constant Character := Get_Input_Character (I_Pos);
   begin
--        Put_Line (Routine_Name & "947 Input Buffer:" & Get_Input_Buffer);
      if aChar = '?' then
         --  MMBasic 947
         Match_I := Get_Command_Value ("Print") - Integer (M_Misc.C_Base_Token);
         if Get_Input_Character (I_Pos + 1) = ' ' then
            --  949 eat a trailing space
            I_Pos := I_Pos + 1;
            Match_P := I_Pos;
         end if;

      else  --  not print short cut
         --  MMBasic 958
--           Put_Line (Routine_Name & "958 Input Buffer:" & Get_Input_Buffer);
         Try_Command (Token_Buffer, I_Pos, Label_Valid, First_Nonwhite);
--           Put_Line (Routine_Name & "Token Buffer:");
         Support.Print_Buffer (Token_Buffer);
      end if;

   end Process_First_Nonwhite;

   procedure Process_Quote (Token_Buffer : in out String_Buffer;
                            I_Pos        : in out Positive) is
      Routine_Name  : constant String := "Parse_Functions.Process_Quote ";
   begin
      I_Pos := I_Pos + 1;
      Support.Buffer_Append (Token_Buffer, "");
      Put_Line (Routine_Name & "not implemented");

   end Process_Quote;

   procedure Process_Variable_Name
     (Token_Buffer   : in out String_Buffer; Pos : in out Positive;
      First_Nonwhite : in out Boolean; Label_Valid : in out Boolean) is
      use Support;
      Pos2  : Positive;
      Name  : Unbounded_String;
   begin
      --  935
      if First_Nonwhite then
         --  First entry on the line?
         Pos2 := Skip_Var (Pos);
         if Get_Input_Character (Pos2) = '=' then
            --  an implied let
            Buffer_Append (Token_Buffer,
                           Integer'Image (Get_Command_Value ("Let")));
         end if;
      else
         --  942 copy the variable name
         while Is_Name_Character (Get_Input_Character (Pos)) loop
            Name := Name & Get_Input_Character (Pos);
            Pos := Pos + 1;
         end loop;
         Buffer_Append (Token_Buffer, To_String (Name));

         First_Nonwhite := False;
         Label_Valid:= False;
      end if;

   end Process_Variable_Name;

   procedure Try_Command
     (Token_Buffer : in out String_Buffer; P : in out Positive;
      Label_Valid  : in out Boolean; First_Nonwhite : in out Boolean) is
      use Interfaces;
      use Ada.Characters.Handling;
--        Routine_Name  : constant String := "Parse_Functions.Try_Command ";
      Line_In       : constant String := To_Upper (Get_Input_Buffer);
      TP2           : Positive;          --  Line_In ptr
      Command       : Command_Table_Item;
      Index         : Natural := 0;
      TP_Pos        : Natural := P;      --  tp  command table index
      Match_I       : Integer := -1;
      Match_L       : Integer := 0;
      Match_P       : Integer := 0;
--        Found         : Boolean := False;
   begin
      --  MMBasic 958
      while Index < Command_Table'Last loop
         Index := Index + 1;
         declare
            TP : constant String :=
              To_Upper (To_String (Command_Table (Index).Name));
         begin
            TP_Pos := 1;
            TP2 := 1;
            --  MMBasic 963  Look for the match with the largest command name
            while TP_Pos <= TP'Last and then TP2 <= Line_In'Last and then
              Line_In (TP2) = TP (TP_Pos) loop
               if TP (TP_Pos) = ' ' then
                  Skip_Spaces (Line_In, TP2);
               else
                  TP2 := TP2 + 1;
               end if;
               TP_Pos := TP_Pos + 1;

               --  971
               if TP_Pos < TP'Length and then TP (TP_Pos) = '(' then
                  Skip_Spaces (Line_In, TP2);
               end if;
            end loop;

            --  MMBasic 975
            if TP_Pos > TP'Last and then
              (TP2 = Line_In'Last + 1 or else
                 not Is_Name_Character (Get_Input_Character (TP2)) or else
                 (Command_Table (Index).Command_Type and T_FUN) =
                   T_FUN) then
               --  MMBasic 977
               if TP (TP_Pos - 1) = '(' or else TP2 = Line_In'Last + 1 or else
                 not Is_Name_Character (Line_In (TP2)) then
                  Command := Command_Table (Index);
                  if Length (Command.Name) > Match_L then
                     --  MMBasic 982
                     Match_P := TP2;
                     Match_I := Index;
                     Match_L := Length (Command.Name);
                  end if;
               end if;
            end if;
         end; -- declare block
         TP_Pos := TP_Pos + 1;
      end loop;

--        Put_Line (Routine_Name & "990 Command Name: " & To_String (Command.Name));
           --  990
      if P <= Input_Buffer_Length then
         if Match_I > -1 then
            --  Match found
            --  993 - 1004 process rest of command line
            Process_Command (Token_Buffer, P, Match_P, Match_I,
                             First_Nonwhite, Label_Valid);

            --  MMBasic 1009
         elsif Label_Valid and then
           Is_Name_Start (Get_Input_Character (P)) then
           Try_Label (Token_Buffer, P, Label_Valid);
         end if;
      end if;

   end Try_Command;

   --  893
   function Try_Function_Or_Keyword
     (Token_Buffer   : out String_Buffer; I_Pos : in out Positive;
      First_Nonwhite : in out Boolean)
      return Boolean is
      use Ada.Characters.Handling;
      use Command_And_Token_Functions;
      use Support;
      Routine_Name  : constant String :=
        "Parse_Functions.Try_Function_Or_Keyword ";
      Index         : Natural := 0;
      I_Char        : Character;
      I_Pos2        : Positive;
      T_Pos         : Positive;
      Name          : Unbounded_String;
      Done          : Boolean;
      Found         : Boolean := False;
   begin
      Put_Line (Routine_Name);
      while Index <= Token_Table'Last loop
         Index := Index + 1;
         I_Pos2 := I_Pos;
         Name := Token_Table (Index).Name;
         T_Pos := 1;
         I_Char := Get_Input_Character (I_Pos);
         Done := False;
         Put_Line (Routine_Name & "900");
         Put_Line (Routine_Name & "Element (Name, T_Pos): " &
                     Element (Name, T_Pos));
         --  900
         while not Done and then
           To_Upper (I_Char) = To_Upper (Element (Name, T_Pos)) loop
            I_Pos2 := I_Pos2 + 1;
            T_Pos := T_Pos + 1;
            if I_Char = '(' then
               I_Pos := I_Pos + 1;
               Skip_In_Buffer_Spaces (I_Pos);
            end if;

            Done := not Is_Name_End (Element (Name, T_Pos - 1)) or
              not Is_Name_Character (Get_Input_Character (I_Pos2));
         end loop;

         Put_Line (Routine_Name & "911");
         --  911
         Found := Index /= Token_Table'Last;
         if Found then
            Buffer_Append (Token_Buffer,
                           To_String (Token_Table (Index).Name));
            I_Pos := I_Pos2;
         end if;

         Put_Line (Routine_Name & "921");
         --  921
         First_Nonwhite := Index = tokenTHEN or else Index = tokenELSE;
      end loop;
      Put_Line (Routine_Name & "done");

      return Found;

   end Try_Function_Or_Keyword;

   procedure Try_Label
     (Token_Buffer : out String_Buffer; I_Pos : in out Positive;
      Label_Valid  : in out Boolean) is
      use String_Buffer_Package;
      TP    : Positive := I_Pos;
      Index : Natural := 0;
      Found : Boolean := False;
   begin
      while not Found and then TP < Input_Buffer_Length and then
        index < Configuration.MAXVARLEN loop
         Index := Index + 1;
         TP := TP + 1;
         Found := not Is_Name_Character (Get_Input_Character (TP));
      end loop;

      if Found and then Get_Input_Character (TP) = ':' then
         --  Label found
         Label_Valid := False;
         Append (Token_Buffer, Integer'Image (Global.T_LABEL));
         Append (Token_Buffer, Integer'Image (TP - I_Pos));
         Append (Token_Buffer, Get_Input_Slice (I_Pos, TP));
         I_Pos := I_Pos + 1;  --  Step over label and terminating :
      end if;

   end Try_Label;

   procedure Try_Number
     (Token_Buffer : out String_Buffer; I_Pos : in out Positive) is
      use Ada.Characters.Handling;
      use Ada.Strings;
      use String_Buffer_Package;
--        Routine_Name : constant String := "Parse_Functions.Try_Number ";
      aChar        : Character := Get_Input_Character (I_Pos);
      Number       : Unbounded_String;
      Done         : Boolean := False;
   begin
      --  MMBasic 919
      if Is_Digit (aChar) or else aChar = '.' then
         while not Done
           and then (Is_Digit (aChar) or else aChar = '.' or else aChar = 'E'
                     or else aChar = 'e') loop
            Done := I_Pos >= Input_Buffer_Length;
            if aChar = 'E' or else aChar = 'e' then
               Number := Number & aChar;
               aChar := Get_Next_Character (I_Pos);
               if aChar = '+' or else aChar = '-' then
                  Number := Number & aChar;
                  aChar := Get_Next_Character (I_Pos);
               end if;
               Trim (Number, Both);
               if I_Pos < Input_Buffer_Length then
                  aChar := Get_Next_Character (I_Pos);
               end if;
            else
               --  MMBasic 932
               Number := Number & aChar;
               Trim (Number, Both);
               if I_Pos < Input_Buffer_Length then
                  aChar := Get_Next_Character (I_Pos);
               end if;
            end if;
         end loop;

         Append (Token_Buffer, To_String (Number));

      end if;

   end Try_Number;

end Parse_Functions;
