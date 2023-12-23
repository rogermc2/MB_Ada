
with Ada.Assertions; use Ada.Assertions;
with Ada.Characters.Handling;
with Ada.Text_IO; use Ada.Text_IO;

with Command_And_Token_Tables; use Command_And_Token_Tables;
with Console;
with Flash;
with M_Basic; use M_Basic;
package body M_Misc is

   procedure Crunch_Data (Pos : Positive; aChar : Character);
   function Is_Print (aChar : Character) return Boolean;

   procedure Autosave (Current_Line_Ptr : Natural; Command_Line : String) is
      use Ada.Characters.Handling;
      Routine_Name : constant String := "M_Misc.Autosave ";
      aChar        : Character;
      OK           : Boolean := False;

      function End_Check return Boolean is
         Char_Val     : Unsigned_2Byte;
      begin
         OK := Console.Get_Console (aChar);
         Char_Val := Unsigned_2Byte (Character'Pos (aChar));
         Char_Val := Char_Val and 16#7f#;
         aChar := Character'Val (Integer (Char_Val));
         return Char_Val /= 16#1a#;
      end End_Check;

      Temp_Memory  : String (1 .. Flash.EDIT_BUFFER_SIZE);
      P_Pos        : Positive := Temp_Memory'First;
      Crunch       : Boolean := False;
   begin
      Assert (Current_Line_Ptr = 0, Routine_Name &
                "Current_Line_Ptr should be 0.");
      if Command_Line'Length > 0 then
         Crunch := To_Upper (Command_Line (Command_Line'First)) = 'C';
         Assert (Crunch, Routine_Name &"unknown command.");
      end if;

      Clear_Program;
      Crunch_Data (P_Pos, ASCII.NUL);

      while End_Check and OK loop
         if P_Pos /= Temp_Memory'First and then
           not Is_Line_Terminator (aChar) then
            Assert (P_Pos - Temp_Memory'First < Flash.EDIT_BUFFER_SIZE,
                    Routine_Name & "not enough memory");
            if Is_Print (aChar) or else aChar = ASCII.HT then
               if aChar = ASCII.HT then
                  aChar := ' ';
               end if;

               if Crunch then
                  Crunch_Data (P_Pos, aChar);
               else
                  Temp_Memory (P_Pos) := aChar;
                  P_Pos := P_Pos + 1;
               end if;

               if Is_Line_Terminator (aChar) then
                  New_Line;
               else
                  Put (aChar);
               end if;
            end if;
         end if;
      end loop;

      if OK then
         P_Pos := Temp_Memory'First;
         while OK loop
            OK := Console.Get_Console (aChar);
         end loop;

         Flash.Clear_Saved_Variables;
         M_Basic.Save_Program_To_Flash (Temp_Memory, True);

      end if;

   end Autosave;

   function Check_Interrupt return Integer is
   begin
      return 0;

   end Check_Interrupt;

   procedure Crunch_Data (Pos : Positive; aChar : Character) is
   begin
      null;

   end Crunch_Data;

   function Is_Print (aChar : Character) return Boolean is
      use Ada.Characters.Handling;
   begin
      return not Is_Control (aChar);

   end Is_Print;

end M_Misc;
