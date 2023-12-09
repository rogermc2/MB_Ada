
with Ada.Strings.Unbounded; use Ada.Strings.Unbounded;

with Console;
with File_IO;
with IO_Support;
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

   function MM_Get_Line (File_Num : Natural) return String is
      use Ada.Strings;
      use IO_Support;
      aChar : Character := ' ';
      tp    : Unbounded_String;
      Done  : Boolean := False;
   begin
      if File_Num = 0 then
         tp := To_Unbounded_String (Get_Line);
         if tp = F2 then
           tp := To_Unbounded_String ("RUN");
         elsif tp = F3 then
           tp := To_Unbounded_String ("LIST");
         elsif tp = F4 then
           tp := To_Unbounded_String ("EDIT");
         elsif tp = F10 then
           tp := To_Unbounded_String ("AUTOSAVE");
         elsif tp = F3 then
           tp := To_Unbounded_String ("XMODEM RECEIVE");
         elsif tp = F3 then
           tp := To_Unbounded_String ("XMODEM SEND");
         end if;
      else
         while not Done loop
            Done := Console.Check_Abort;
            if not Done then
               Done := File_Table (File_Num).Com > Max_Com_Ports or
                 End_Of_File (File_Table (File_Num).File_ID);
               if not Done then
                  Append (tp,
                          Serial.Seral_Get_Caracter(File_Table (File_Num).Com));
               end if;
            end if;
         end loop;
      end if;

      return To_String (tp);

   end MM_Get_Line;

end Serial_File_IO;
