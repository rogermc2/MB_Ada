
with Ada.Characters.Handling;
with Ada.Strings.Unbounded; use Ada.Strings.Unbounded;
with Ada.Text_IO; use Ada.Text_IO;

with M_Basic; use M_Basic;
with M_Misc;

with Command_And_Token_Tables;

package body Parse_Functions is

   function Get_Command_From_Input (Pos : in out Positive)
                                    return Unbounded_String is
      use Ada.Characters.Handling;
      --        Routine_Name  : constant String :=
      --                          "Parse_Functions.Get_Command_From_Input ";
      aChar         : Character;
      Command       : Unbounded_String;
      Done          : Boolean := False;
   begin
      while not Done loop
         aChar := Element (In_Buffer, Pos);
         Done := not (aChar = '_' or Is_Alphanumeric (aChar));
         if not Done then
            Append (Command, aChar);
         end if;
         Pos := Pos + 1;
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

   procedure Process_Colon (Pos : in out Positive) is
   begin
      null;

   end Process_Colon;

   procedure Process_Command (Pos : in out Positive) is
   begin
      null;

   end Process_Command;

   procedure Process_Double_Quote (Pos : in out Positive; aChar : Character) is
   begin
      while aChar /= '"' and Pos <= Length (In_Buffer) loop
         Pos := Pos + 1;
      end loop;

      Token_Buffer.Append (To_Unbounded_String (""""));
      Pos := Pos + 1;
      if  Element (In_Buffer, Pos) = '"' then
         Pos := Pos + 1;
      end if;

   end Process_Double_Quote;

   procedure Process_Name_Start (Pos : in out Positive) is
   begin
      null;

   end Process_Name_Start;

   procedure Process_First_Nonwhite
     (Pos  : in out Positive; Label_Valid : Boolean) is
      use Ada.Characters.Handling;
      use Command_And_Token_Tables;
      aChar      : Character := Element (In_Buffer, Pos);
      Match_I    : Integer := -1;
      Match_L    : Integer := -1;
      Match_Pos  : Positive;
      Pos2       : Positive;
      Command    : Unbounded_String;
      In_Command : Unbounded_String;
   begin
      if aChar = '?' then
         Match_I := Get_Command_Value ("Print") - M_Misc.C_Base_Token;
         if Element (In_Buffer, Pos + 1) = ' ' then
            --  eat a trailing space
            Pos := Pos + 1;
            Match_Pos := Pos;
         end if;

      else
         In_Command := Get_Command_From_Input (Pos);
         for index in Command_Table'First + 1 .. Command_Table'Last loop
            Pos2 := Pos + 1;
            Command := Command_Table (index).Name;
            while Pos > 0 and To_Upper (To_String (In_Command)) =
              To_Upper (To_String (Command)) loop
               if Element (In_Buffer, Pos2) = ' ' then
                  Skip_Spaces (Pos2);
               else
                  Pos2 := Pos2 + 1;
               end if;
               Pos := Pos + 1;

               if Element (In_Buffer, Pos) = '(' then
                  Skip_Spaces (Pos);
               end if;
            end loop;
         end loop;

         if Match_I > -1 then
            Process_Command (Pos);
         elsif Label_Valid and
           Is_Name_Start (aChar) then
            Process_Name_Start (Pos);
         end if;
      end if;

   end Process_First_Nonwhite;

   procedure Process_Try_Number (Pos : in out Positive) is
   begin
      null;

   end Process_Try_Number;

   procedure Process_Quote (Pos : in out Positive) is
   begin
      null;

   end Process_Quote;

end Parse_Functions;
