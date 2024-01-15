
with System;
with System.Storage_Elements;

with Interfaces;

with Ada.Assertions;
with Ada.Characters.Handling;

with Command_And_Token_Tables; use Command_And_Token_Tables;

package body M_Basic_Utilities is

   function Get_Close_Bracket
     (Expression : Unbounded_String; Pos : in out Positive) return Positive is
      use Ada.Assertions;
      use Interfaces;
      Routine_Name : constant String := "M_Basic_Utilities.Get_Close_Bracket ";
      Index        : Integer := 0;
      aChar        : Character;
      In_Quote     : Boolean := False;
      Done         : Boolean := False;
   begin
      while not Done loop
         Assert (Pos <= Length (Expression), Routine_Name &
                   "closiing bracket expected");
         aChar := Element (Expression, Pos);
         if aChar = '"' then
            In_Quote := not In_Quote;
         end if;

         if not In_Quote then
            if aChar = ')' then
               Index := Index - 1;
            elsif aChar = '(' or else
              ((Token_Type (Integer'Value (Character'Image (aChar))) and T_FUN)
               = T_FUN) then
               Index := Index + 1;
            end if;
         end if;

         Pos := Pos + 1;
         Done := Index = 0;
      end loop;

      return Pos - 1;

   end Get_Close_Bracket;

   function Get_Word (Expression : Unbounded_String; Pos : Positive)
                      return String is
      aChar : Character;
      C_Pos : Positive;
      Pos2  : Positive := Pos;
      OK    : Boolean := True;
      Word  : Unbounded_String;
   begin
      while OK and then Pos2 <= Length (Expression) loop
         aChar := Element (Expression, Pos2);
         C_Pos := Character'Pos (aChar);
         OK := (C_Pos >= 65 and then C_Pos <= 90) or else
           (C_Pos >= 97 and then C_Pos <= 122) or else
           (C_Pos >= 48 and then C_Pos <= 57) or else
           aChar ='_';
         if OK then
            Word := Word & aChar;
         end if;
         Pos2 := Pos2 + 1;
      end loop;

      return To_String (Word);

   end Get_Word;

   function Is_Line_Num (aChar : Character) return Boolean is
      use Ada.Characters.Handling;
   begin
      return Is_Alphanumeric (aChar);
   end Is_Line_Num;
   pragma Inline (Is_Line_Num);

   function Is_Name_Character (aChar : Character) return Boolean is
      use Ada.Characters.Handling;
      --        Routine_Name : constant String := "M_Basic.Is_Name_Character ";
   begin
      return Is_Alphanumeric (aChar) or else aChar = '_' or else aChar = ':';

   end Is_Name_Character;

   function Is_Name_End (aChar : Character) return Boolean is
   begin
      return Is_Line_Num (aChar) or else aChar = '_' or else
        aChar = '.' or else aChar = '$' or else aChar = '|' or else
        aChar = '%';

   end Is_Name_End;

   function Is_Name_Start (aChar : Character) return Boolean is
      use Ada.Characters.Handling;
      --        Routine_Name : constant String := "M_Basic.Is_Name_Start ";
   begin
      return Is_Alphanumeric (aChar) or aChar = '_';

   end Is_Name_Start;

   procedure Skip_Spaces (aLine : String; Pos : in out Positive) is
   begin
      while Pos < aLine'Length and then aLine (Pos) = ' ' loop
         Pos := Pos + 1;
      end loop;

   end Skip_Spaces;

   procedure Skip_Spaces (Buffer : Unbounded_String; Pos : in out Positive) is
   begin
      while Element (Buffer, Pos) = ' ' loop
         Pos := Pos + 1;
      end loop;

   end Skip_Spaces;

   procedure Skip_Spaces (Pos : in out M_Basic.Subfunction_Ptr) is
      use System.Storage_Elements;
      use M_Basic;
      Pos_SA : System.Address;
   begin
      while Element (Pos.all, 1) = ' ' loop
         Pos_SA := Conversion.To_Address (Pos);
         Pos_SA := Pos_SA + 1;
         Pos := Conversion.To_Pointer (Pos_SA);
      end loop;

   end Skip_Spaces;

end M_Basic_Utilities;
