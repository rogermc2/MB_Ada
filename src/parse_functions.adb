
with Ada.Characters.Handling;
with Ada.Strings.Unbounded; use Ada.Strings.Unbounded;
with Ada.Text_IO; use Ada.Text_IO;

with Configuration;
with Global;
with M_Basic; use M_Basic;
with M_Misc;

with Command_And_Token_Tables;

package body Parse_Functions is

   procedure Process_Command
     (I_Pos       : in out Positive; First_Nonwhite, Label_Valid : in out Boolean;
      Match_I_Pos : Positive;  Match_Index : Integer);
   procedure Try_Command
     (I_Pos                         : in out Positive;
      Label_Valid, First_Nonwhite   : in out Boolean);

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
         aChar := Element (In_Buffer, I_Pos);
         Done := not (aChar = '_' or Is_Alphanumeric (aChar));
         if not Done then
            Append (Command, aChar);
         end if;
         I_Pos := I_Pos + 1;
      end loop;

      return Command;

   end Get_Command_From_Input;

   function Get_Command_Value (Command : String) return integer is
      --        use Command_And_Token_Tables;
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

   procedure Process_Colon (I_Pos            : in out Positive;
                            First_Nonwhite   : in out Boolean) is
   begin
      Append (Token_Buffer, '0');
      I_Pos := I_Pos + 1;
      while Element (In_Buffer, I_Pos) = ':' loop
         Append (Token_Buffer, '0');
         I_Pos := I_Pos + 1;
      end loop;

      First_Nonwhite := True;

   end Process_Colon;

   procedure Process_Command
     (I_Pos       : in out Positive; First_Nonwhite, Label_Valid : in out Boolean;
      Match_I_Pos : Positive; Match_Index : Integer) is
      use Ada.Characters.Handling;
      aChar : Character;
   begin
      if Match_Index > -1 then
         Append (Token_Buffer,
                 Token_Table (Match_Index + M_Misc.C_Base_Token).Name);
         --  Step over the input buffer command.
         I_Pos := Match_I_Pos;
         if Match_Index + M_Misc.C_Base_Token =
           Get_Command_Value ("Rem") then
            while I_Pos <= Length (In_Buffer) loop
               aChar := Element (In_Buffer, I_Pos);
               Append (Token_Buffer, aChar);
               I_Pos := I_Pos + 1;
            end loop;
         end if;

      elsif Is_Alphanumeric (Element (In_Buffer, I_Pos - 1)) and then
        Element (In_Buffer, I_Pos) = ' ' then
         I_Pos := I_Pos + 1;
      end if;

      First_Nonwhite := False;
      Label_Valid := False;

   end Process_Command;

   procedure Process_Double_Quote (I_Pos : in out Positive; aChar : Character) is
   begin
      while aChar /= '"' and I_Pos <= Length (In_Buffer) loop
         I_Pos := I_Pos + 1;
      end loop;

      Append (Token_Buffer, '"');
      I_Pos := I_Pos + 1;
      if  Element (In_Buffer, I_Pos) = '"' then
         I_Pos := I_Pos + 1;
      end if;

   end Process_Double_Quote;

   procedure Process_Name_Start (I_Pos : in out Positive) is
   begin
      null;

   end Process_Name_Start;

   procedure Process_First_Nonwhite
     (I_Pos : in out Positive; Label_Valid, First_Nonwhite : in out Boolean) is
      --        use Ada.Characters.Handling;
      --        use Command_And_Token_Tables;
      aChar        : constant Character := Element (In_Buffer, I_Pos);
      Match_Index  : Integer := -1;
      Match_I_Pos  : Positive;
   begin
      if aChar = '?' then
         Match_Index := Get_Command_Value ("Print") - M_Misc.C_Base_Token;
         if Element (In_Buffer, I_Pos + 1) = ' ' then
            --  eat a trailing space
            I_Pos := I_Pos + 1;
            Match_I_Pos := I_Pos;
         end if;

      else
         Try_Command (I_Pos, Label_Valid, First_Nonwhite);
      end if;

   end Process_First_Nonwhite;

   procedure Try_Command
     (I_Pos                         : in out Positive;
      Label_Valid, First_Nonwhite   : in out Boolean) is
      use Ada.Characters.Handling;
      use Command_And_Token_Tables;
      I_Pos2         : Positive;         --  tp2 an input character indeex
      Command        : Unbounded_String;
      In_Command     : Unbounded_String;
      CT_Index       : Natural;          --  tp  command table index
      Match_Index    : Integer := -1;
      Match_Length   : Integer := -1;
      Match_I_Pos    : Positive;
      Index          : Natural :=0 ;
      Done           : Boolean := False;
      OK             : Boolean := True;
   begin
      In_Command := Get_Command_From_Input (I_Pos);
      CT_Index := 0;
      Done := False;

      while not Done and then CT_Index < Command_Table'Last loop
         CT_Index := CT_Index +1;
         I_Pos2 := I_Pos + 1;  -- I_Pos2 (tp2) is I_Position of next input character
         Command := Command_Table (CT_Index).Name;
         while I_Pos2 < Length (In_Buffer) and then
           To_Upper (To_String (In_Command)) =
             To_Upper (To_String (Command)) loop
            while I_Pos2 < Length (In_Buffer) and then
              Element (In_Buffer, I_Pos2) = ' '  loop
               I_Pos2 := I_Pos2 + 1;
            end loop;
            I_Pos := I_Pos + 1;

            if Element (In_Buffer, I_Pos) = '(' then
               while I_Pos2 < Length (In_Buffer) and then
                 Element (In_Buffer, I_Pos2) = ' '  loop
                  I_Pos2 := I_Pos2 + 1;
               end loop;
            end if;
         end loop;

         if (I_Pos2 >= Length (Command) and then
               not Is_Name_Character (Element (In_Buffer, I_Pos2))) or
           Command_Table (CT_Index).Command_Type1 = T_FUN then
            Done := Element (Command, CT_Index) /= '(' and
              Is_Name_Character (Element (In_Buffer, I_Pos2));

            if not Done and then Length (Command) > Match_Length then
               Match_I_Pos := I_Pos2;
               Match_Length := Length (Command);
               Match_Index := CT_Index;
            end if;
         end if;
      end loop;

      if Match_Index > -1 then
         Process_Command (I_Pos, Label_Valid, First_Nonwhite,
                          Match_I_Pos, Match_Index);

      elsif Label_Valid and then
        Is_Name_Start (Element (In_Buffer, I_Pos)) then
         Index := 0;
         I_Pos2 := I_Pos;
         OK := True;
         while OK and then Index <= Configuration.MAXVARLEN loop
            Index := Index + 1;
            I_Pos2 := I_Pos2 + 1;
            OK := Is_Name_Character (Element (In_Buffer, I_Pos2));
         end loop;

         if OK and then Element (In_Buffer, I_Pos2) = ':' then
            Label_Valid := False;
            Append (Token_Buffer, Global.T_LABEL);
            Append (Token_Buffer, Integer'Image (I_Pos2 - I_Pos));
            Append (Token_Buffer, Slice (In_Buffer, I_Pos, I_Pos2 - 1));
         end if;

         I_Pos := I_Pos + 1;
      end if;

   end Try_Command;

   procedure Process_Try_Number (I_Pos : in out Positive) is
   begin
      null;

   end Process_Try_Number;

   procedure Process_Quote (I_Pos : in out Positive) is
   begin
      null;

   end Process_Quote;

end Parse_Functions;
