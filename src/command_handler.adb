
--  with Ada.Strings.Unbounded; use Ada.Strings.Unbounded;
with Ada.Text_IO; use Ada.Text_IO;

with Command_And_Token_Tables;
with Flash;
with Global;
with M_Basic;
with Support;

package body Command_Handler is

   procedure List_Program (Prog : Flash.Prog_Memory_Array; All_Of : Boolean);

   --  Commands.c 180
   procedure List_Cmd is
      Routine_Name : constant String := "Command_Handler.List_Cmd ";
      use Global;
      use Command_And_Token_Tables.String_Buffer_Package;
--        Command_Line : constant String := To_String (Global.Command_Line);
--        P            : Natural := 0;
      P            : Boolean := False;
   begin
--        Put_Line (Routine_Name & "Command_Line: '" & Command_Line & "'");
      Put_Line (Routine_Name & "Command_Line:");
      Support.Print_Buffer (Command_Line);
--        if Command_Line'Length > 0  then
      if Integer (Command_Line.Length) > 0  then
         P := M_Basic.Check_String (Element (Command_Line, 1), "ALL");
--           P := M_Basic.Check_String (Command_Line, "ALL");
      end if;

--        if P > 0 then
      if P then
         List_Program (Flash.Prog_Memory, True);
         --           Check_End (P);
      else
         List_Program (Flash.Prog_Memory, False);
         --           Check_End (Command_Line);
      end if;

   end List_Cmd;

   --  Commands.c 209
   procedure List_Program (Prog : Flash.Prog_Memory_Array; All_Of : Boolean) is
      Routine_Name : constant String := "Command_Handler.List_Program ";
   begin
      Put_Line (Routine_Name & "not implemented");
   end List_Program;

end Command_Handler;
