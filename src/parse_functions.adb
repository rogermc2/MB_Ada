
with Interfaces;

with Ada.Characters.Handling;
with Ada.Strings.Unbounded; use Ada.Strings.Unbounded;
with Ada.Text_IO; use Ada.Text_IO;

with Command_And_Token_Functions;
--  with Commands;
with Configuration;
with Global;
with M_Basic; use M_Basic;
with M_Misc;
with Support;

package body Parse_Functions is

   procedure Try_Command
     (Buffer      : out String_Buffer; P : in out Positive;
      Label_Valid : in out Boolean; First_Nonwhite : in out Boolean);

   procedure Check_Function_Or_Keyword
     (Buffer         : in out String_Buffer; P : in out Positive;
      First_Nonwhite : in out Boolean) is
      use Ada.Characters.Handling;
      use Command_And_Token_Functions;
      use String_Buffer_Package;
      Routine_Name : constant String :=
                       "Parse_Functions.Check_Function_Or_Keyword ";
      TP2          : Positive := P;
      TP_Index     : Positive := 1;
      TP           : Unbounded_String;
      Index        : Natural := 0;
      Char1        : Character;
      Char2        : Character;
      Done         : Boolean := False;
   begin
      --  MMBasic  997
      while not Done and then Index < Token_Table'Last loop
         Index := Index + 1;
         TP2 := P;
         TP_Index := 1;
         TP := Token_Table (Index).Name;
         if Length (TP) > 0 then
--              Put_Line (Routine_Name & "Index, TP_Index: " &
--                          Integer'Image (Index) & ", " &
--                          Integer'Image (TP_Index));
--              Put_Line (Routine_Name & "Token_Table'Last, Length: " &
--                          Integer'Image (Token_Table'Last) &
--                          Integer'Image (Token_Table'Length));
--              Put_Line (Routine_Name & "TP: '" & To_String (TP) & "'");
--              Put_Line (Routine_Name & "TP2: " & Integer'Image (TP2));
            Char1 := To_Upper (Get_Input_Character (TP2));
            Char2 := To_Upper (Element (TP, TP_Index));
--              Put_Line (Routine_Name & "Char2: " & Char2);
            while TP2 < Input_Buffer_Length and then
              TP_Index < Token_Table'Last and then Char2 = Char1 loop
               TP2 := TP2 + 1;
               TP_Index := TP_Index + 1;
--                 Put_Line (Routine_Name & "TP2, TP_Index: " &
--                             Integer'Image (TP2) & ", " &
--                             Integer'Image (TP_Index));
               Char2 := Element (TP, TP_Index);
               if Char2 = '(' then
                  Skip_In_Buffer_Spaces (TP2);
               else
                  Char2 := To_Upper (Char2);
               end if;
               Char1 := To_Upper (Get_Input_Character (TP2));
--                 Put_Line (Routine_Name & "Char1, Char2: " & Char1 & ", " &
--                             Char2);
            end loop;

         --  MMBasic  1011
         Done := TP2 >= Input_Buffer_Length or else
           (Element (TP, TP_Index) = ASCII.NUL and then
                (not Is_Name_End (Element (TP, TP_Index - 1)) or else
                 Is_Name_Character (Get_Input_Character (TP2))));
         end if;
      end loop;

      Put_Line (Routine_Name & "1015");
      --  MMBasic  1015
      if Index < Token_Table_Size then
         Index := M_Misc.C_Base_Token + Index;
         Append (Buffer, Integer'Image (Index));
         P := TP2;
         First_Nonwhite := Index = tokenTHEN or else Index = tokenELSE;
      end if;

   end Check_Function_Or_Keyword;

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
         Done :=  aChar = ' ' or else
           (not (aChar = '_' or Is_Alphanumeric (aChar)));
         if not Done then
            Append (Command, aChar);
         end if;
         I_Pos := I_Pos + 1;
         Done := Done or else I_Pos > Input_Buffer_Length;
      end loop;

      return Command;

   end Get_Command_From_Input;

   function Get_Command_Value (Command : String) return integer is
      Routine_Name  : constant String := "Parse_Functions.Get_Command_Value ";
      Command_Value : Integer := 0;
      Found         : Boolean := False;
      index         : Natural := 0;
   begin
      while not Found and then index <= Command_Table'Length loop
         index := index + 1;
         Found := To_String (Command_Table (index).Name) = Command;
      end loop;

      if Found then
         Command_Value := index + M_Misc.C_Base_Token - 1;
      else
         Put_Line (Routine_Name & "unknown command " & Command);
      end if;

      return Command_Value;

   end Get_Command_Value;

   function Get_Long_Command_From_Input (I_Pos : in out Positive)
                                         return Unbounded_String is
      use Ada.Characters.Handling;
      --        Routine_Name  : constant String :=
      --                          "Parse_Functions.Get_Long_Command_From_Input ";
      aChar         : Character;
      Command       : Unbounded_String;
      Done          : Boolean := False;
   begin
      Command := Get_Command_From_Input (I_Pos);
      Skip_In_Buffer_Spaces (I_Pos);
      Done := I_Pos > Input_Buffer_Length;

      while not Done loop
         --  get second command word
         aChar := Get_Input_Character (I_Pos);
         Done :=  aChar = ' ' or else
           (not (aChar = '_' or Is_Alphanumeric (aChar)));
         if not Done then
            Append (Command, aChar);
         end if;
         I_Pos := I_Pos + 1;
         Done := Done or else I_Pos > Input_Buffer_Length;
      end loop;

      return Command;

   end Get_Long_Command_From_Input;

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
     (Buffer                      : out String_Buffer; I_Pos : in out Positive;
      Match_I_Pos                 : Positive; Match_Index : Integer;
      First_Nonwhite, Label_Valid : in out Boolean) is
      Routine_Name  : constant String := "Parse_Functions.Process_Command ";
      use Ada.Characters.Handling;
      use Support;
   begin
      --  MMBasic 957
      Buffer_Append (Buffer, Integer'Image
                     (M_Misc.C_Base_Token + Match_Index));
      --  Step over the input buffer command.
      I_Pos := Match_I_Pos;

--        Put_Line (Routine_Name & "C_Base_Token + Match_Index: " &
--                    Integer'Image (M_Misc.C_Base_Token + Match_Index));
--        Put_Line (Routine_Name & "I_Pos" & Integer'Image (I_Pos));
--        Put_Line (Routine_Name & "Input_Character (I_Pos): " &
--                    Get_Input_Character (I_Pos));
      if Match_Index + M_Misc.C_Base_Token =
        Get_Command_Value ("Rem") then
         --  MMBasic 962 copy everything
         Copy_Slice (Buffer, I_Pos, Input_Buffer_Length);

      elsif Is_Alphanumeric (Get_Input_Character (I_Pos - 1)) and then
        Get_Input_Character (I_Pos) = ' ' then
         I_Pos := I_Pos + 1;
      end if;
      First_Nonwhite := False;
      Label_Valid := False;
   end Process_Command;

   procedure Process_Double_Quote
     (Buffer : in out String_Buffer; I_Pos : in out Positive) is
      use Support;
      aChar  : constant Character := ' ';
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
     (Buffer                    : out String_Buffer; I_Pos : in out Positive;
      Label_Valid               : in out Boolean;
      First_Nonwhite            : in out Boolean;
      Match_I, Match_L, Match_P : in out Integer) is
      --        Routine_Name  : constant String :=
      --                          "Parse_Functions.Process_First_Nonwhite ";
      aChar         : constant Character := Get_Input_Character (I_Pos);
   begin
      if aChar = '?' then
         --  MMBasic 914
         Match_I := Get_Command_Value ("Print") - M_Misc.C_Base_Token;
         if Get_Input_Character (I_Pos + 1) = ' ' then
            --  eat a trailing space
            I_Pos := I_Pos + 1;
            Match_P := I_Pos;
         end if;

      else
         --  MMBasic 925
         Try_Command (Buffer, I_Pos, Label_Valid, First_Nonwhite);
      end if;

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
     (Buffer      : out String_Buffer; P : in out Positive;
      Label_Valid : in out Boolean; First_Nonwhite : in out Boolean) is
      use Interfaces;
      use Ada.Characters.Handling;
      use Support;
      Routine_Name  : constant String := "Parse_Functions.Try_Command ";
      --  In_Command is the first word of Buffer
      In_Command    : constant String :=
                        To_Upper (To_String (Get_Command_From_Input (P)));
      TP2           : Positive := P;
      Command       : Command_Table_Item;
      TP            : Natural := 0;      --  tp  command table index
      Match_Index   : Integer := -1;
      Match_Length  : Integer := -1;
      Match_I_Pos   : Integer := -1;
      Index         : Natural := 0;
      Found         : Boolean := False;
      Done          : Boolean := False;
      OK            : Boolean := True;
   begin
      --        Put_Line (Routine_Name & "In_Buffer: '" & Get_Input_Buffer & "'");
      --        Put_Line (Routine_Name & "P, TP2: " &
      --                    Integer'Image (P) & ", " & Integer'Image (TP2));
      Put_Line (Routine_Name & "In_Command: '" & In_Command & "'");

      --  MMBasic 925
      TP := 0;
      while TP < Command_Table'Last - 1 and then not Found loop
         TP := TP + 1;
         Found := To_Upper (To_String (Command_Table (TP).Name)) = In_Command;
         if Found then
            Command := Command_Table (TP);
            --              Put_Line (Routine_Name & "Command found: '" &
            --                          To_String (Command.Name) & "'");
            --  MMBasic 937
            if TP <  Length (Command.Name) and then
              Element (Command.Name, TP) = '(' then
               --  skip space between a keyword and bracket
               if TP2 < Input_Buffer_Length then
                  Skip_In_Buffer_Spaces (TP2);
               end if;
            end if;

            Match_I_Pos := TP2;
            Match_Index := TP;
            Match_Length := Length (Command.Name);
         end if;
      end loop;

      Done := TP2 >= Input_Buffer_Length;
      if not Done and then not Found then
         --  Look for a longer Command
         P := 1;
         declare
            In_Command : constant String :=
                           To_Upper (To_String (Get_Long_Command_From_Input (P)));
            CT_Name    : Unbounded_String;
         begin
            --              Put_Line (Routine_Name & "long In_Command: '" & In_Command & "'");
            TP := 0;
            while TP < Command_Table'Last - 1 and then not Found loop
               TP := TP + 1;
               CT_Name := Command_Table (TP).Name;
               Remove_Spaces (CT_Name);

               --                 Put_Line (Routine_Name & "CT_Name, In_Command: " &
               --                           To_Upper (To_String (CT_Name)) & ", " & In_Command);
               Found :=
                 To_Upper (To_String (CT_Name)) = In_Command;
               if Found then
                  Put_Line (Routine_Name & "long Command found for: '" &
                              In_Command & "'");
                  Command := Command_Table (TP);
                  --  MMBasic 937
                  if TP <  Length (Command.Name) and then
                    Element (Command.Name, TP) = '(' then
                     --  skip space between a keyword and bracket
                     if TP2 < Input_Buffer_Length then
                        Skip_In_Buffer_Spaces (TP2);
                     end if;
                  end if;
                  Match_I_Pos := TP2;
                  Match_Index := TP;
                  Match_Length := Length (Command.Name);
                  --                    Put_Line (Routine_Name & "long Command found: '" &
                  --                                To_String (Command.Name) & "'");
               end if;
            end loop;
         end;
      end if;

      if not Found then
         Put_Line ((Routine_Name & "invalid Command: " & In_Command));

      elsif not Done then
         --           Put_Line (Routine_Name & "command found Match_I_Pos" &
         --                       Integer'Image (Match_I_Pos));
         Done := TP2 >= Input_Buffer_Length;

         --           Put_Line (Routine_Name & "942,  Done: " & Boolean'Image (Done));
         --  MMBasic 942  Also part of longest match search?
         if not Done and then
           (not Is_Name_Character (Get_Input_Character (TP2)) or else
            Command.Command_Type = T_FUN) then
            --              Put_Line (Routine_Name & "TP2:" & Integer'Image (TP2));
            Put_Line (Routine_Name & "character" &
                        Get_Input_Character (TP2) & "'");
            --              Put_Line (Routine_Name & "check '('" );
            Done := Element (Command.Name, TP - 1) /= '(' and
              Is_Name_Character (Get_Input_Character (TP2));

            --              Put_Line (Routine_Name & "947,  Command.Name Length:" &
            --                          Integer'Image (Length (Command.Name)));
            --              Put_Line (Routine_Name & "947,  Done:" & Boolean'Image (Done));
            --  MMBasic 947
            if not Done and then Length (Command.Name) > Match_Length then
               Match_I_Pos := TP2;
               Match_Length := Length (Command.Name);
               Match_Index := TP;
            end if;
         end if;

         --           Put_Line (Routine_Name & "956");
         --           Put_Line (Routine_Name & "P, Match_Index:" & Integer'Image (P) &
         --                       ", " & Integer'Image (Match_Index));
         --  956
         if P < Input_Buffer_Length then
            if Match_Index > -1 then
               --                 Put_Line (Routine_Name & "Match_Index, Match_I_Pos" &
               --                             Integer'Image (Match_Index) & ", " &
               --                             Integer'Image (Match_I_Pos));
               --  Match found
               Put_Line (Routine_Name & "Process_Command");
               --  process rest of command line
               Process_Command (Buffer, P, Match_I_Pos, Match_Index,
                                First_Nonwhite, Label_Valid);

               --  MMBasic 976
            elsif Label_Valid and then
              Is_Name_Start (Get_Input_Character (P)) then
               OK := True;
               --                 Put_Line (Routine_Name & "976, Command.Name: " &
               --                             To_String (Command.Name));
               --                 Put_Line (Routine_Name & "976, TP: " & Integer'Image (TP));
               Index := 0;
               TP := 0;
               while OK and then TP < length (Command.Name) and then
                 Index <= Configuration.MAXVARLEN loop
                  Index := Index + 1;
                  TP := TP + 1;
                  OK := Is_Name_Character (Element (Command.Name, TP));
               end loop;

               --                 Put_Line (Routine_Name & "982, TP: " & Integer'Image (TP));
               --  MMBasic 982
               if OK and then Element (Command.Name, TP) = ':' then
                  Label_Valid := False;
                  Buffer_Append (Buffer, Global.T_LABEL);
                  Buffer_Append (Buffer, Integer'Image (TP - P));
                  Buffer_Append (Buffer, Get_Input_Slice (1, TP - P));
               end if;

               P := P + 1;

            end if;
         end if;
      end if;

      --  MMBasic 925
      --              while not Done and then TP < Command_Table_Size loop
      --                 TP := TP + 1;
      --                 TP2 := P;
      --           Command := Command_Table (TP).Name;
      --           Put_Line (Routine_Name & "TP, Command: " &
      --                       Integer'Image (TP) & ", " & To_String (Command));
      --           Done := To_String (Command) = "";
      --           if Done then
      --              Put_Line ((Routine_Name & "invalid Command: " & In_Command));
      --           end if;
      --
      --           Put_Line (Routine_Name & "929 P, TP2, TP: " &
      --                       Integer'Image (P) & ", " & Integer'Image (TP2) &
      --                       ", " & Integer'Image (TP));
      --           Put_Line ((Routine_Name & "Input_Buffer: " & Get_Input_Buffer));
      --           Put_Line ((Routine_Name & "Input_Buffer (TP2): " &
      --                       Get_Input_Buffer (TP2)));
      --           Put_Line ((Routine_Name & "Command (TP): " & Element (Command, TP)));
      --           --  MMBasic 929  look for match with longest command name
      --           while not Done and then TP2 <= Input_Buffer_Length and then
      --             To_Upper (Get_Input_Buffer (TP2)) =
      --               To_Upper (Element (Command, TP)) loop
      --              if Get_Input_Character (TP) = ' '  then
      --                 Skip_In_Buffer_Spaces (TP2);
      --              else
      --                 TP2 := TP2 + 1;
      --              end if;
      --              TP := TP + 1;
      --
      --              Done := TP2 > Input_Buffer_Length and then
      --                P >= Input_Buffer_Length;
      --           if not Done then
      --              Put_Line (Routine_Name & "937");
      --              --  MMBasic 937
      --              if Element (Command, TP) = '(' and then
      --                TP2 < Input_Buffer_Length then
      --                 Skip_In_Buffer_Spaces (TP2);
      --              end if;
      --           end if;
      --           Done := TP2 >= Input_Buffer_Length;
      --              end loop;
      --           Put_Line (Routine_Name & "P, TP2: " &
      --                       Integer'Image (P) & ", " & Integer'Image (TP2));
      --        Done := TP2 >= Input_Buffer_Length;
      --  MMBasic 942
      --        if (not Done and then
      --              not Is_Name_Character (Get_Input_Character (TP2))) or
      --          Command_Table (TP).Command_Type = T_FUN then
      --           Done := Element (Command, TP - 1) /= '(' and
      --             Is_Name_Character (Get_Input_Character (TP2));
      --
      --           if not Done and then Length (Command) > Match_Length then
      --              Match_I_Pos := TP2;
      --              Match_Length := Length (Command);
      --              Match_Index := TP;
      --           end if;
      --        end if;
      --            Put_Line (Routine_Name & "end outer loop done");
      --     end loop;
      --
      --     Put_Line (Routine_Name & "956");
      --  956
      --              if P < Input_Buffer_Length then
      --                 if Match_Index > -1 then
      --                    --  Match found
      --                    Process_Command (Buffer, P, Match_I_Pos, Match_Index,
      --                                     Label_Valid, First_Nonwhite);
      --
      --                    --  976
      --                 elsif Label_Valid and then
      --                   Is_Name_Start (Get_Input_Character (P)) then
      --                    OK := True;
      --                    while OK and then Index <= Configuration.MAXVARLEN loop
      --                       Index := Index + 1;
      --                       TP := TP + 1;
      --                       OK := Is_Name_Character (Element (Command, TP));
      --                    end loop;
      --
      --                    if OK and then Element (Command, TP) = ':' then
      --                       Label_Valid := False;
      --                       Buffer_Append (Buffer, Global.T_LABEL);
      --                       Buffer_Append (Buffer, Integer'Image (TP - P));
      --                       Buffer_Append (Buffer, Get_Input_Slice (1, TP - P));
      --                    end if;
      --
      --                    P := P + 1;
      --                 end if;
      --              end if;

      Put_Line (Routine_Name & "done,  Command.Name: " &
                  To_String (Command.Name));

   end Try_Command;

   --  893
   function Try_Function_Or_Keyword
     (Buffer         : out String_Buffer; I_Pos : in out Positive;
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
            --              Index := Index + M_Misc.C_Base_Token;
            Buffer_Append (Buffer, To_String (Token_Table (Index).Name));
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
     (Buffer      : out String_Buffer; I_Pos : in out Positive;
      Label_Valid : in out Boolean) is
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
         Append (Buffer, Global.T_LABEL);
         Append (Buffer, Integer'Image (TP - I_Pos));
         Append (Buffer, Get_Input_Slice (I_Pos, TP));
         I_Pos := TP + 1;  --  Step over label and terminating :
      end if;

   end Try_Label;

   procedure Try_Number
     (Buffer : out String_Buffer; I_Pos : in out Positive) is
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
      end if;

   end Try_Number;

end Parse_Functions;
