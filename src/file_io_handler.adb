
--  with Interfaces.C.Strings;

with Ada.Assertions; use Ada.Assertions;

with Command_And_Token_Tables; use Command_And_Token_Tables;
with Global; use Global;
with M_Basic; use M_Basic;

package body File_IO_Handler is

   procedure Files_Cmd is
      use Conversion;
      use String_Buffer_Package;
      Routine_Name : constant String := "File_IO_Handler.Files_Cmd";
      File_Count   : Natural := 0;
      P            : String_Buffer;
   begin
      Assert (Current_Line_Ptr = null, Routine_Name &
                "null Current_Line_Ptr is invalid in a program");
      if Command_Line.Is_Empty then
         Append (P, "*");
      else
         P := Command_Line;
      end if;

   end Files_Cmd;

end File_IO_Handler;
