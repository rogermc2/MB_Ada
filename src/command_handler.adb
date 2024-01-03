
with Ada.Assertions; use Ada.Assertions;
with Ada.Strings.Unbounded; use Ada.Strings.Unbounded;
with Ada.Text_IO; use Ada.Text_IO;

with Commands;
with Global;
with M_Basic; use M_Basic;

package body Command_Handler is

    procedure Option_Cmd is
      Routine_Name : constant String := "M_Misc.Option_Cmd ";
      E_String : constant String := To_String (Global.E_UB_String);
      TP : Natural;
   begin
      Put_Line (Routine_Name & "E_String: '" & E_String & "'");
      TP := Check_String (E_String, "BASE");
      if TP > 0 then
         Assert (not Commands.Dim_Used, Routine_Name &
                   "Option must be before DIM or LOCAL");
--           Option_Base := Get_Int (E_String, 0, 1);
      end if;

   end Option_Cmd;

end Command_Handler;
