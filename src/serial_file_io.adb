
with Ada.Text_IO; use Ada.Text_IO;

with Configuration;
with Console;
with Flash;
with IO_Support;
with M_Misc;
with Serial;

package body Serial_File_IO is

   function MMF_Get_Character (File_Num  : Integer; File_ID : File_Type;
                              isConsole : Boolean := False) return Character is

      Routine_Name : constant String := "Serial_File_IO.MMF_Get_Character ";
      aChar        : Character;
   begin
      if isConsole then
         aChar := Console.MM_Get_Character;
      elsif not Is_Open (File_ID) then
         --          Error ("file number is not open");
         Put_Line (Routine_Name & "File is not open");
      elsif File_Table (File_Num).Com > Max_Com_Ports then
         Get (File_ID, aChar);
      else
         aChar := Serial.Serial_Get_Caracter (File_Table (File_Num).Com);
      end if;

      return aChar;

   end MMF_Get_Character;

   --  MM_Get_Line gets a line from the keyboard or a serial file handle
   --  File_Num == 0 means console input
   procedure MM_Get_Line (File_Num : Integer;
                          Buffer   : in out M_Basic.UB_String_Buffer) is
      use M_Basic;
      use M_Basic.UB_String_Buffer_Package;
      use M_Misc;
      use IO_Support;
      Routine_Name : constant String := "Serial_File_IO.MM_Get_Line ";
      File_ID   : File_Type;
      aChar     : Character := ' ';
      Num_Chars : Natural := 0;
      tp        : Unbounded_String;
      Done      : Boolean := False;
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

         Buffer.Clear;
         Buffer.Append (tp);
         if M_Misc.Echo_Option then
            Put_Line (To_String (Last_Element (Buffer)));
         end if;

      elsif File_Num > 0 then
         Open (File_ID, In_File, To_String (File_Table (File_Num).Name));
         while not Done loop
            Done := Console.Check_Abort;
            if not Done then
               Done := File_Table (File_Num).Com > Max_Com_Ports or
                 End_Of_File (File_ID);

               if not Done then
                  aChar := MMF_Get_Character (File_Num, File_ID);
                  if aChar = Character'Val (9) then
                     --  expand tabs to spaces.
                     while Num_Chars <= Configuration.MAXSTRLEN and
                       Num_Chars mod Flash.Option.Tab > 0 loop
                        Num_Chars := Num_Chars + 1;
                        if Num_Chars < Configuration.MAXSTRLEN then
                           Put_Line (Routine_Name & "Line is too long");
                        else
                           Append (tp, ' ');
                           if File_Num = 0 and Echo_Option then
                              Put (' ');
                           end if;
                        end if;
                     end loop;

                  elsif aChar = Character'Val (10) then  -- newline
                     Done := True;
                  else
                     Append (tp, aChar);
                  end if;

               end if;
            end if;
         end loop;

         Close (File_ID);
      end if;

   end MM_Get_Line;

end Serial_File_IO;
