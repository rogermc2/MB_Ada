
with Ada.Assertions; use Ada.Assertions;
with Ada.Characters.Handling;
with Ada.Strings.Unbounded; use Ada.Strings.Unbounded;

with Command_And_Token_Tables; use Command_And_Token_Tables;
with Flash;
with M_Basic; use M_Basic;
package body M_Misc is

   procedure Crunch_Data (Pos : Positive; Num : Natural);

   procedure Autosave (Current_Line_Ptr : Natural; Command_Line : String) is
      use Ada.Characters.Handling;
      Routine_Name : constant String := "M_Misc.Autosave ";
      Buffer       : Unbounded_String;
      Temp_Memory  : Unsigned_Byte_Array (1 .. Flash.EDIT_BUFFER_SIZE);
      P_Pos        : Positive := Temp_Memory'First;
      Buff_Pos     : Positive := Temp_Memory'First;
      Crunch       : Boolean := False;
   begin
      Assert (Current_Line_Ptr = 0, Routine_Name &
                "Current_Line_Ptr should be 0.");
      if Command_Line'Length > 0 then
         Crunch := To_Upper (Command_Line (1)) = 'C';
         Assert (Crunch, Routine_Name &"unknown command.");
      end if;

      Clear_Program;

   end Autosave;

   function Check_Interrupt return Integer is
   begin
      return 0;

   end Check_Interrupt;

   procedure Crunch_Data (Pos : Positive; Num : Natural) is
   begin
      null;

   end Crunch_Data;

end M_Misc;
