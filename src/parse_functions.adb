
with Ada.Strings.Unbounded; use Ada.Strings.Unbounded;
with Ada.Text_IO; use Ada.Text_IO;

with M_Basic; use M_Basic;

package body Parse_Functions is

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
      Match_I : Integer := -1;
      Match_L : Integer := -1;
   begin
         if Match_I > -1 then
            Process_Command (Pos);
         elsif Label_Valid and Is_Name_Start (Pos) then
            Process_Name_Start (Pos);
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
