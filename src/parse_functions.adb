
with Ada.Characters.Handling;
with Ada.Strings.Unbounded; use Ada.Strings.Unbounded;
with Ada.Text_IO; use Ada.Text_IO;

with Commands;
with Configuration;
with Global;
with M_Basic; use M_Basic;
with M_Misc;

with Command_And_Token_Tables;
with Command_And_Token_Functions;

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
      use Command_And_Token_Tables;
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
      use M_Basic.String_Buffer_Package;
   begin
      Append (Token_Buffer, "0");
      I_Pos := I_Pos + 1;
      while Element (In_Buffer, I_Pos) = ':' loop
         Append (Token_Buffer, "0");
         I_Pos := I_Pos + 1;
      end loop;

      First_Nonwhite := True;

   end Process_Colon;

   procedure Process_Command
     (I_Pos                       : in out Positive;
      First_Nonwhite, Label_Valid : in out Boolean;
      Match_I_Pos                 : Positive; Match_Index : Integer) is
      use Ada.Characters.Handling;
      use Command_And_Token_Tables;
      use M_Basic.String_Buffer_Package;
      aChar  : Character;
      Remark : Unbounded_String;
   begin
      --  879
      if Match_Index > -1 then
         Append (Token_Buffer,
                 Integer'Image (M_Misc.C_Base_Token + Match_Index));
         --  Step over the input buffer command.
         I_Pos := Match_I_Pos;
         if Match_Index + M_Misc.C_Base_Token =
           Get_Command_Value ("Rem") then
            --  886 copy everything
            Append (Token_Buffer,
                    Slice (In_Buffer, Match_I_Pos, Length (In_Buffer)));
            while I_Pos <= Length (In_Buffer) loop
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
      use M_Basic.String_Buffer_Package;
   begin
      while aChar /= '"' and I_Pos <= Length (In_Buffer) loop
         I_Pos := I_Pos + 1;
      end loop;

      Append (Token_Buffer, """");
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
      use M_Basic.String_Buffer_Package;
      aChar        : constant Character := Element (In_Buffer, I_Pos);
      Match_Index  : Natural := 0;
      Match_I_Pos  : Positive;
      Label        : Unbounded_String;
      Pos2         : Positive;
      Index        : Natural := 0;
      Done         : Boolean := False;
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

      --  857
      if Match_Index > 0 then
         Commands.Process_Command (Match_Index, Match_I_Pos,
                                   First_Nonwhite, Label_Valid);

         --   876 test if it is a label
      elsif Label_Valid and then
        Is_Name_Start (Element (In_Buffer, I_Pos)) then
         --  search for the first invalid char
         Pos2 := I_Pos;
         Index := 0;
         Done := False;
         while not Done and then Index <= Configuration.MAXVARLEN loop
            Index := Index + 1;
            Pos2 := Pos2 + 1;
            Done := not Is_Name_Character (Element (In_Buffer, Pos2));
         end loop;
         --  Last character of name found

         --  881
         if Element (In_Buffer, Pos2) = ':' then
            --  is label
            Label_Valid := False;
            Append (Token_Buffer, Global.T_LABEL);

            --  insert the length of the label
            Append (Token_Buffer, Integer'Image (Pos2 - I_Pos));

            --  copy the label
            for pos3 in reverse 1 .. Pos2 - I_Pos loop
               Append (Label, Element (In_Buffer, I_Pos));
               I_Pos := I_Pos + 1;
            end loop;
            Append (Token_Buffer, To_String (Label));
            --  step over the terminating colon
            I_Pos := I_Pos + 1;
         end if;
      end if;

   end Process_First_Nonwhite;

   procedure Process_Try_Number (I_Pos : in out Positive) is
   begin
      null;

   end Process_Try_Number;

   procedure Process_Quote (I_Pos : in out Positive) is
   begin
      null;

   end Process_Quote;

   procedure Try_Command
     (I_Pos                         : in out Positive;
      Label_Valid, First_Nonwhite   : in out Boolean) is
      use Ada.Characters.Handling;
      use Command_And_Token_Tables;
      use M_Basic.String_Buffer_Package;
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
           Command_Table (CT_Index).Command_Type = T_FUN then
            Done := Element (Command, CT_Index) /= '(' and
              Is_Name_Character (Element (In_Buffer, I_Pos2));

            if not Done and then Length (Command) > Match_Length then
               Match_I_Pos := I_Pos2;
               Match_Length := Length (Command);
               Match_Index := CT_Index;
            end if;
         end if;
      end loop;

      --  857
      if Match_Index > -1 then
         Process_Command (I_Pos, Label_Valid, First_Nonwhite,
                          Match_I_Pos, Match_Index);

         --  875
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

   --  893
   function Try_Function_Or_Keyword
     (I_Pos : in out Positive; First_Nonwhite : in out Boolean)
      return Boolean is
      use Ada.Characters.Handling;
      use Command_And_Token_Tables;
      use Command_And_Token_Functions;
      use M_Basic.String_Buffer_Package;
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
         I_Char := Element (In_Buffer, I_Pos);
         Done := False;
         --  900
         while not Done and then
           To_Upper (I_Char) = To_Upper (Element (Name, T_Pos)) loop
            I_Pos2 := I_Pos2 + 1;
            T_Pos := T_Pos + 1;
            if I_Char = '(' then
               I_Pos := I_Pos + 1;
               Skip_Spaces (I_Pos);
            end if;

            Done := not Is_Name_End (Element (Name, T_Pos - 1)) or
              not Is_Name_Character (Element (In_Buffer, I_Pos2));
         end loop;

         --  911
         Found := Index /= Token_Table'Last;
         if Found then
            Index := Index + M_Misc.C_Base_Token;
            Append (Token_Buffer, To_String (Token_Table (Index).Name));
            I_Pos := I_Pos2;
         end if;

         --  921
         First_Nonwhite := Index = tokenTHEN or else Index = tokenELSE;
      end loop;

      return Found;

   end Try_Function_Or_Keyword;

   procedure Process_Variable_Name
     (Pos                         : in out Positive;
      First_Nonwhite, Label_Valid : in out Boolean) is
      use M_Basic.String_Buffer_Package;
      Pos2  : Positive;
      Name  : Unbounded_String;
   begin
      --  935
      if First_Nonwhite then
         --  First entry on the line?
         Pos2 := Skip_Var (Pos);
         if Element (In_Buffer, Pos2) = '=' then
            --  an implied let
            Append (Token_Buffer, Integer'Image (Get_Command_Value ("Let")));
         end if;
      else
         --  942 copy the variable name
         while Is_Name_Character (Element (In_Buffer, Pos)) loop
            Name := Name & Element (In_Buffer, Pos);
            Pos := Pos + 1;
         end loop;
         Append (Token_Buffer, To_String (Name));

         First_Nonwhite := False;
         Label_Valid:= False;
      end if;

   end Process_Variable_Name;

end Parse_Functions;
