
--  with Interfaces.C.Strings;

with Ada.Assertions; use Ada.Assertions;
with Ada.Directories; use Ada.Directories;
with Ada.Strings.Unbounded; use Ada.Strings.Unbounded;
with Ada.Text_IO; use Ada.Text_IO;

with Command_And_Token_Tables; use Command_And_Token_Tables;
with Global; use Global;
with M_Basic; use M_Basic;
with File_IO; use File_IO;

package body File_IO_Handler is

   Max_Files : constant Positive := 200;

   procedure Files_Cmd is
      use Conversion;
      use String_Buffer_Package;
      Routine_Name : constant String := "File_IO_Handler.Files_Cmd";
      Current_Dir  : constant String := Current_Directory;
      Dir          : Directory_Entry_Type;
      Dir_Search   : Search_Type;
      File_Count   : Natural := 0;
      P            : String_Buffer;
   begin
      Put_Line (Routine_Name);
      Assert (Current_Line_Ptr = null, Routine_Name &
                "null Current_Line_Ptr is invalid in a program");
      if Command_Line.Is_Empty then
         Append (P, "*");
      else
         P := Command_Line;
      end if;

      if not Init_SD_Card then
         Put_Line (Routine_Name & To_String (File_IO.F_Error_Message (2)));
      end if;

      Start_Search (Dir_Search, Current_Dir, "*.gpr");
      if More_Entries (Dir_Search) then
         Put_Line (Routine_Name & "Directory " & Current_Dir);
         while More_Entries (Dir_Search) and then File_Count > Max_Files loop
            Get_Next_Entry(Dir_Search, Dir);
            File_Count := File_Count + 1;
            Put_Line (Full_Name (Dir));
         end loop;

         if File_Count = 0 then
            Put_Line (Routine_Name & "Directory " & Current_Dir & " is empty.");
         elsif File_Count > Max_Files then
            New_Line;
            Put_Line (Routine_Name & "Too many files to list");
         end if;
         New_Line;

      else
         Put_Line (Routine_Name & "Directory " & Current_Dir & " is empty");
      end if;

   end Files_Cmd;

end File_IO_Handler;
