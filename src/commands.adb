
with Ada.Assertions; use Ada.Assertions;
with Ada.Characters.Handling;
with Ada.Command_Line;
with Ada.Strings;

with M_Basic_Utilities;
with M_Misc;
with Parse_Functions;
with Support;

package body Commands is

   procedure Check_Type_Specified
     (Expression         : Unbounded_String; Pos : Positive;
      Fun_Type           : in out Interfaces.Unsigned_16;
      Allow_Default_Type : Boolean) is
      Routine_Name : constant String := "Commands.Check_Type_Specified ";
      Term         : constant String :=
                       Slice (Expression, Pos, Length (Expression));
   begin
      if Term = "INTEGER" then
         Fun_Type := T_INT or T_IMPLIED;
      elsif Term = "STRING" then
         Fun_Type := T_STR or T_Implied;
      elsif Term = "FLOAT" then
         Fun_Type := T_NBR or T_Implied;
      else
         Assert (Allow_Default_Type, Routine_Name & "variable type");
         Fun_Type := M_Basic_Utilities.Default_Type;
      end if;

   end Check_Type_Specified;

   procedure Command_Input is
      use Ada.Command_Line;
      use Ada.Strings;
      --        Parsed_Line : Unbounded_String;
      Num_Args    : Natural;
      anArg       : Unbounded_String;
   begin
      Num_Args := Argument_Count;
      if Num_Args > 0 then
         for arg in 1 .. Num_Args loop
            anArg := To_Unbounded_String (Argument (arg));
            if anArg /= "," and anArg /= ";" then
               Trim (anArg, Left);
               if Element (anArg, 1) = '"' then
                  Delete (anArg, Length (anArg), Length (anArg));
                  Delete (anArg, 1, 1);
               end if;
            end if;

         end loop;
      end if;

   end Command_Input;

   procedure Execute_One_Line is
   begin
      null;

   end Execute_One_Line;

   procedure Process_Command
     (Buffer                      : in out String_Buffer; Match_Index  : Positive; Pos : in out Positive;
      First_Nonwhite, Label_Valid : in out Boolean) is
      use Ada.Characters.Handling;
      use M_Misc;
      use Parse_Functions;
      use Support;
   begin
      Buffer_Append (Buffer, Integer'Image (C_Base_Token + Match_Index));

      if C_Base_Token + Match_Index = Get_Command_Value ("Rem") then
         Buffer_Append (Buffer, Get_Input_Slice (Pos, Input_Buffer_Length));

      elsif Is_Alphanumeric (Get_Input_Character (Pos - 1)) and then
        Get_Input_Character (Pos) = ' ' then
         --  if the command is followed by a space skip over it
         --  (llist will restore the space)
         Pos := Pos + 1;
      end if;

      First_Nonwhite := False;
      Label_Valid := False;

   end Process_Command;

end Commands;
