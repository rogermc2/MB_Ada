
with Interfaces;

with Ada.Characters.Handling;
with Ada.Strings.Unbounded; use Ada.Strings.Unbounded;
with Ada.Text_IO; use Ada.Text_IO;

with Command_And_Token_Functions;
with Commands;
with Configuration;
with Global;
with M_Basic; use M_Basic;
with M_Misc;
with Support;

package body Parse_Functions is

   procedure Process_Command
     (Buffer         : in out String_Buffer; I_Pos : in out Positive;
      Match_I_Pos    : Positive; Match_Index : Integer;
      First_Nonwhite : in out Boolean; Label_Valid : in out Boolean);
   procedure Try_Command
     (Buffer      : in out String_Buffer; I_Pos : in out Positive;
      Label_Valid : in out Boolean; First_Nonwhite   : in out Boolean);

   function Get_Command_From_Input (I_Pos : in out Positive)
                                    return Unbounded_String is
      use Ada.Characters.Handling;
      --        Routine_Name  : constant String :=
      --                          "Parse_Functions.Get_Command_From_Input ";
      aChar         : Character;
      Command       : Unbounded_String;
      Done          : Boolean := False;
   begin
      while not Done loop
         aChar := Get_Input_Character (I_Pos);
         Done := not (aChar = '_' or Is_Alphanumeric (aChar));
         if not Done then
            Append (Command, aChar);
         end if;
         I_Pos := I_Pos + 1;
         Done := I_Pos > Input_Buffer_Length;
      end loop;
      --        Put_Line (Routine_Name & "Command: " & To_String (Command));

      return Command;

   end Get_Command_From_Input;

   function Get_Command_Value (Command : String) return integer is
      Routine_Name  : constant String := "Parse_Functions.Get_Command_Value ";
      Command_Value : Integer := 0;
      Found         : Boolean := False;
      index         : Natural := 0;
   begin
      while not Found and then index in Command_Table'Range loop
         index := index + 1;
         Found := Command_Table (index).Name = Command;
      end loop;

      if Found then
         Command_Value := index + M_Misc.C_Base_Token - 1;
      else
         Put_Line (Routine_Name & "unknown command " & Command);
      end if;

      return Command_Value;

   end Get_Command_Value;

   function Get_Next_Character (I_Pos : in out Positive) return Character is
   begin
      I_Pos := I_Pos + 1;
      return Get_Input_Character (I_Pos);
   end Get_Next_Character;

   procedure Process_Colon
     (Buffer           : in out String_Buffer; I_Pos : in out Positive;
      First_Nonwhite   : in out Boolean) is
      use Support;
   begin
      Buffer_Append (Buffer, "0");
      I_Pos := I_Pos + 1;
      while Get_Input_Character (I_Pos) = ':' loop
         Buffer_Append (Buffer, "0");
         I_Pos := I_Pos + 1;
      end loop;

      First_Nonwhite := True;

   end Process_Colon;

   procedure Process_Command
     (Buffer         : in out String_Buffer; I_Pos : in out Positive;
      Match_I_Pos    : Positive; Match_Index : Integer;
      First_Nonwhite : in out Boolean; Label_Valid : in out Boolean) is
      Routine_Name  : constant String := "Parse_Functions.Process_Command ";
      use Ada.Characters.Handling;
      use Support;
   begin
      Put_Line (Routine_Name);
      --  879
      if Match_Index > -1 then
         Put_Line (Routine_Name & "879");
         Buffer_Append (Buffer, Integer'Image
                        (M_Misc.C_Base_Token + Match_Index));
         --  Step over the input buffer command.
         I_Pos := Match_I_Pos;
         if Match_Index + M_Misc.C_Base_Token =
           Get_Command_Value ("Rem") then
            --  886 copy everything
            Copy_Slice (Buffer, I_Pos, Input_Buffer_Length);
         end if;

      elsif Is_Alphanumeric (Get_Input_Character (I_Pos - 1)) and then
        Get_Input_Character (I_Pos) = ' ' then
         I_Pos := I_Pos + 1;
      end if;

      First_Nonwhite := False;
      Label_Valid := False;

   end Process_Command;

   procedure Process_Double_Quote
     (Buffer : in out String_Buffer; I_Pos : in out Positive;
      aChar  : Character) is
      use Support;
   begin
      while aChar /= '"' and I_Pos <= Input_Buffer_Length loop
         I_Pos := I_Pos + 1;
      end loop;

      Buffer_Append (Buffer, """");
      I_Pos := I_Pos + 1;
      if Get_Input_Character (I_Pos) = '"' then
         I_Pos := I_Pos + 1;
      end if;

   end Process_Double_Quote;

   procedure Process_Name_Start
     (Buffer : in out String_Buffer; I_Pos : in out Positive) is
   begin
      I_Pos := I_Pos + 1;

   end Process_Name_Start;

   procedure Process_First_Nonwhite
     (Buffer      : in out String_Buffer; I_Pos : in out Positive;
      Label_Valid : in out Boolean; First_Nonwhite : in out Boolean) is
      use Support;
      Routine_Name  : constant String :=
                        "Parse_Functions.Process_First_Nonwhite ";
      aChar         : constant Character := Get_Input_Character (I_Pos);
      Match_Index   : Natural := 0;
      Match_I_Pos   : Positive;
      Label         : Unbounded_String;
      Pos2          : Positive;
      Index         : Natural := 0;
      Done          : Boolean := False;
   begin
      Put_Line (Routine_Name);
      if aChar = '?' then
         Match_Index := Get_Command_Value ("Print") - M_Misc.C_Base_Token;
         if Get_Input_Character (I_Pos + 1) = ' ' then
            --  eat a trailing space
            I_Pos := I_Pos + 1;
            Match_I_Pos := I_Pos;
         end if;

      else
         Put_Line (Routine_Name & "I_Pos: " & Integer'Image (I_Pos));
         Try_Command (Buffer, I_Pos, Label_Valid, First_Nonwhite);
      end if;

      Put_Line (Routine_Name & "857");
      --  857
      if Match_Index > 0 then
         Commands.Process_Command
           (Buffer, Match_Index, Match_I_Pos, First_Nonwhite, Label_Valid);

         --   876 test if it is a label
      elsif Label_Valid and then
        Is_Name_Start (Get_Input_Character (I_Pos)) then
         Put_Line (Routine_Name & "876");
         --  search for the first invalid char
         Pos2 := I_Pos;
         Index := 0;
         Done := False;
         while not Done and then Index <= Configuration.MAXVARLEN loop
            Index := Index + 1;
            Pos2 := Pos2 + 1;
            Done := not Is_Name_Character (Get_Input_Character (Pos2));
         end loop;
         --  Last character of name found

         --  881
         if Get_Input_Character (Pos2) = ':' then
            --  is label
            Label_Valid := False;
            Buffer_Append (Buffer, Global.T_LABEL);

            --  insert the length of the label
            Buffer_Append (Buffer, Integer'Image (Pos2 - I_Pos));

            --  copy the label
            for pos3 in reverse 1 .. Pos2 - I_Pos loop
               Append (Label, Get_Input_Character (I_Pos));
               I_Pos := I_Pos + 1;
            end loop;

            Buffer_Append (Buffer, To_String (Label));
            --  step over the terminating colon
            I_Pos := I_Pos + 1;
         end if;
      end if;
      Put_Line (Routine_Name & "done");

   end Process_First_Nonwhite;

   procedure Process_Quote (Buffer : in out String_Buffer;
                            I_Pos  : in out Positive) is
   begin
      I_Pos := I_Pos + 1;

   end Process_Quote;

   procedure Process_Variable_Name
     (Buffer         : in out String_Buffer; Pos : in out Positive;
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
            Buffer_Append (Buffer, Integer'Image (Get_Command_Value ("Let")));
         end if;
      else
         --  942 copy the variable name
         while Is_Name_Character (Get_Input_Character (Pos)) loop
            Name := Name & Get_Input_Character (Pos);
            Pos := Pos + 1;
         end loop;
         Buffer_Append (Buffer, To_String (Name));

         First_Nonwhite := False;
         Label_Valid:= False;
      end if;

   end Process_Variable_Name;

   procedure Try_Command
     (Buffer      : in out String_Buffer; I_Pos : in out Positive;
      Label_Valid : in out Boolean; First_Nonwhite : in out Boolean) is
      use Interfaces;
      use Ada.Characters.Handling;
      use Support;
--        Routine_Name  : constant String := "Parse_Functions.Try_Command ";
      In_Command    : constant String :=
                        To_String (Get_Command_From_Input (I_Pos));
      I_Pos2        : Positive;         --  tp2 an input character indeex
      Command       : Unbounded_String;
      CT_Index      : Natural := 0;      --  tp  command table index
      Match_Index   : Integer := -1;
      Match_Length  : Integer := -1;
      Match_I_Pos   : Positive;
      Index         : Natural := 0;
      Done          : Boolean := I_Pos >= Input_Buffer_Length;
      OK            : Boolean := True;
   begin
      while not Done and then CT_Index < Command_Table'Last loop
         CT_Index := CT_Index + 1;
         I_Pos2 := I_Pos + 1;  -- I_Pos2 (tp2) is I_Position of next input character
         Command := Command_Table (CT_Index).Name;

         while I_Pos2 <= Input_Buffer_Length and then
           To_Upper (In_Command) =
           To_Upper (To_String (Command)) loop
            while I_Pos2 < Input_Buffer_Length and then
              Get_Input_Character (I_Pos2) = ' '  loop
               I_Pos2 := I_Pos2 + 1;
            end loop;

            Done :=  I_Pos2 > Input_Buffer_Length;
            if not done then
               I_Pos := I_Pos + 1;

               if Get_Input_Character (I_Pos) = '(' then
                  while I_Pos2 < Input_Buffer_Length and then
                    Get_Input_Character (I_Pos2) = ' '  loop
                     I_Pos2 := I_Pos2 + 1;
                  end loop;
               end if;
               Done := I_Pos2 >= Input_Buffer_Length;
            end if;
         end loop;

         if (I_Pos2 >= Length (Command) and then
               not Is_Name_Character (Get_Input_Character (I_Pos2))) or
           Command_Table (CT_Index).Command_Type = T_FUN then
            Done := Element (Command, CT_Index) /= '(' and
              Is_Name_Character (Get_Input_Character (I_Pos2));

            if not Done and then Length (Command) > Match_Length then
               Match_I_Pos := I_Pos2;
               Match_Length := Length (Command);
               Match_Index := CT_Index;
            end if;
         end if;
      end loop;

      --  857
      if I_Pos < Input_Buffer_Length then
         if Match_Index > -1 then
            Process_Command (Buffer, I_Pos, Match_I_Pos, Match_Index,
                             Label_Valid, First_Nonwhite);

            --  875
         elsif Label_Valid and then
           Is_Name_Start (Get_Input_Character (I_Pos)) then
            I_Pos2 := I_Pos;
            OK := True;
            while OK and then Index <= Configuration.MAXVARLEN loop
               Index := Index + 1;
               I_Pos2 := I_Pos2 + 1;
               OK := Is_Name_Character (Get_Input_Character (I_Pos2));
            end loop;

            if OK and then Get_Input_Character (I_Pos2) = ':' then
               Label_Valid := False;
               Buffer_Append (Buffer, Global.T_LABEL);
               Buffer_Append (Buffer, Integer'Image (I_Pos2 - I_Pos));
               Buffer_Append (Buffer, Get_Input_Slice (I_Pos, I_Pos2 - 1));
            end if;

            I_Pos := I_Pos + 1;
         end if;
      end if;

   end Try_Command;

   --  893
   function Try_Function_Or_Keyword
     (Buffer         : in out String_Buffer; I_Pos : in out Positive;
      First_Nonwhite : in out Boolean)
      return Boolean is
      use Ada.Characters.Handling;
      use Command_And_Token_Functions;
      use Support;
      Index  : Natural := 0;
      I_Char : Character;
      I_Pos2 : Positive;
      T_Pos  : Positive;
      Name   : Unbounded_String;
      Done   : Boolean;
      Found  : Boolean := False;
   begin
      while Index <= Token_Table'Last loop
         Index := Index + 1;
         I_Pos2 := I_Pos;
         Name := Token_Table (Index).Name;
         T_Pos := 1;
         I_Char := Get_Input_Character (I_Pos);
         Done := False;
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

         --  911
         Found := Index /= Token_Table'Last;
         if Found then
            Index := Index + M_Misc.C_Base_Token;
            Buffer_Append (Buffer, To_String (Token_Table (Index).Name));
            I_Pos := I_Pos2;
         end if;

         --  921
         First_Nonwhite := Index = tokenTHEN or else Index = tokenELSE;
      end loop;

      return Found;

   end Try_Function_Or_Keyword;

   procedure Try_Number
     (Buffer         : in out String_Buffer; I_Pos : in out Positive;
      First_Nonwhite : in out Boolean) is
      use Ada.Characters.Handling;
      --        Routine_Name : constant String := "Parse_Functions.Try_Number ";
      aChar        : Character := Get_Input_Character (I_Pos);
      Number       : Unbounded_String;
      Done         : Boolean := False;
   begin
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
               if I_Pos < Input_Buffer_Length then
                  aChar := Get_Next_Character (I_Pos);
               end if;
            else
               Number := Number & aChar;
               if I_Pos < Input_Buffer_Length then
                  aChar := Get_Next_Character (I_Pos);
               end if;
            end if;
         end loop;

         Support.Buffer_Append (Buffer, To_String (Number));
         First_Nonwhite := False;

      elsif First_Nonwhite then
         null;
      end if;

   end Try_Number;

end Parse_Functions;
