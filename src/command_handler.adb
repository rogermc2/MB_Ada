
with Ada.Strings.Unbounded; use Ada.Strings.Unbounded;
with Ada.Text_IO; use Ada.Text_IO;

with Flash;
with Global;
with M_Basic;

package body Command_Handler is

   procedure List_Program (Prog : Flash.Prog_Memory_Array; All_Of : Boolean);

   --  Commands.c 180
   procedure List_Cmd is
      Routine_Name : constant String := "Option_Handler.List_Cmd ";
      E_String     : constant String := To_String (Global.E_UB_String);
      P            : Natural := 0;
   begin
      Put_Line (Routine_Name & "E_String: '" & E_String & "'");
      if E_String'Length > 0  then
         P := M_Basic.Check_String (E_String, "ALL");
      end if;

      if P > 0 then
         List_Program (Flash.Prog_Memory, True);
         --           Check_End (P);
      else
         List_Program (Flash.Prog_Memory, False);
         --           Check_End (E_String);
      end if;

   end List_Cmd;

   --  Commands.c 209
   procedure List_Program (Prog : Flash.Prog_Memory_Array; All_Of : Boolean) is
      Routine_Name : constant String := "Option_Handler.List_Program ";
   begin
      Put_Line (Routine_Name & "not implemented");
   end List_Program;

end Command_Handler;
