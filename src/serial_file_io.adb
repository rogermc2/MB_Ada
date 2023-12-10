
with Ada.Strings.Unbounded; use Ada.Strings.Unbounded;

with Console;
with File_IO;
with IO_Support;
with M_Misc;
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

   procedure MM_Get_Line (File_Num : Integer;
                          Buffer   : M_Basic. UB_String_Buffer) is
      use Ada.Strings;
      use M_Basic;
      use M_Basic.UB_String_Buffer_Package;
      use IO_Support;
      type File_Type_Access is access File_Type;
      File_ID : File_Type;
      aChar   : Character := ' ';
      tp      : Unbounded_String;
      Done    : Boolean := False;
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

         In_Buffer.Clear;
         In_Buffer.Append (tp);
         if M_Misc.Echo_Option then
            Put_Line (To_String (Last_Element (In_Buffer)));
         end if;

      elsif File_Num > 0 then
         File_ID := new File_Table (File_Num).File_ID'Access;
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

   end MM_Get_Line;

end Serial_File_IO;
