
with Ada.Strings;
with Ada.Strings.Unbounded; use Ada.Strings.Unbounded;

with Console;
with File_IO;
with Serial;

package body Serial_File_IO is

   function MMF_Get_Character (File_Num : Natural) return Character is
      aChar : Character;
   begin
      if File_Num = 0 then
         aChar := Console.MM_Get_Character;
      elsif File_Table (File_Num).Com < 1 then
         --          Error ("file number is not open");
         null;
      elsif File_Table (File_Num).Com > Max_Com_Ports then
         aChar := File_IO.File_Get_Character (File_Num);
      else
         aChar := Serial.Seral_Get_Caracter (File_Table (File_Num).Com);
      end if;

      return aChar;

   end MMF_Get_Character;

   function MM_Get_Line (File_Num : Positive) return String is
      use Ada.Strings;
      aChar : Character := ' ';
      aLine : Unbounded_String;
      Done  : Boolean := False;
   begin
      while not Done loop
         Done := Console.Check_Abort;
         if not Done then
            Done := File_Table (File_Num).Com > Max_Com_Ports or
              End_Of_File (File_Table (File_Num).File_ID);
            if not Done then
               Append (aLine,
                       Serial.Seral_Get_Caracter(File_Table (File_Num).Com));
            end if;
         end if;
      end loop;

      return To_String (aLine);

   end MM_Get_Line;

end Serial_File_IO;
