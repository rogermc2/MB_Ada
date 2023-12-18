
with Ada.Assertions; use Ada.Assertions;
with Ada.Characters.Handling;
with Ada.Command_Line;
with Ada.Strings;
with Ada.Strings.Unbounded; use Ada.Strings.Unbounded;

with M_Basic;
with M_Misc;
with Parse_Functions;

package body Commands is

   function Check_Type_Specified
     (Pos                : Positive; Fun_Type : in out Unsigned_2Byte;
      Allow_Default_Type : Boolean) return Positive is
      use M_Basic;
      use M_Basic.String_Buffer_Package;
      Routine_Name : constant String := "Commands.Check_Type_Specified ";
      Pos2 : Positive;
   begin
      if Element (Token_Buffer, Pos) = "INTEGER" then
         Fun_Type := T_INT or T_IMPLIED;
      elsif Element (Token_Buffer, Pos) = "STRING" then
         Fun_Type := T_STR or T_Implied;
      elsif Element (Token_Buffer, Pos) = "FLOAT" then
         Fun_Type := T_NBR or T_Implied;
      else
      Assert (Allow_Default_Type, Routine_Name & "variable type");
      Pos2 := Pos;
         Fun_Type := Default_Type;
      end if;

      return Pos2;

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
     (Match_Index                 : Positive; Pos : in out Positive;
      First_Nonwhite, Label_Valid : in out Boolean) is
      use Ada.Characters.Handling;
      use M_Basic;
      use M_Misc;
      use Parse_Functions;
      use M_Basic.String_Buffer_Package;
   begin
      Append (Token_Buffer, Integer'Image (C_Base_Token + Match_Index));

      if C_Base_Token + Match_Index = Get_Command_Value ("Rem") then
         Append (Token_Buffer, Slice (In_Buffer, Pos, Length(In_Buffer)));

      elsif Is_Alphanumeric (Element (In_Buffer, Pos - 1)) and then
        Element (In_Buffer, Pos) = ' ' then
         --  if the command is followed by a space skip over it
         --  (llist will restore the space)
         Pos := Pos + 1;
      end if;

      First_Nonwhite := False;
      Label_Valid := False;

   end Process_Command;

end Commands;
