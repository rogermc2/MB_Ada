
with Configuration;
with Console;
with Flash;
with IO_Support;
with M_Misc;
with Serial;

package body Serial_File_IO is

   function Process_File (File_Num : Positive) return Unbounded_String;

   function MMF_Get_Character
     (File_Num : Integer; File_ID : File_Type; isConsole : Boolean := False)
      return Character
   is

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
   procedure MM_Get_Line (File_Num : Integer; Buffer : in out Unbounded_String)
   is
      use M_Misc;
      use IO_Support;
      --  Routine_Name : constant String := "Serial_File_IO.MM_Get_Line ";
   begin
      if File_Num = 0 then
         Buffer := To_Unbounded_String (Get_Line);
         if Buffer = F2 then
            Buffer := To_Unbounded_String ("RUN");
         elsif Buffer = F3 then
            Buffer := To_Unbounded_String ("LIST");
         elsif Buffer = F4 then
            Buffer := To_Unbounded_String ("EDIT");
         elsif Buffer = F10 then
            Buffer := To_Unbounded_String ("AUTOSAVE");
         elsif Buffer = F3 then
            Buffer := To_Unbounded_String ("XMODEM RECEIVE");
         elsif Buffer = F3 then
            Buffer := To_Unbounded_String ("XMODEM SEND");
         end if;

         if M_Misc.Echo_Option then
            Put_Line (To_String (Buffer));
         end if;

      elsif File_Num > 0 then
         Buffer := Process_File (File_Num);
      end if;

   end MM_Get_Line;

   function Process_File (File_Num : Positive) return Unbounded_String is
      use M_Misc;
      Routine_Name : constant String := "Serial_File_IO.Process_File ";
--        File_ID      : File_Type;
      tp           : Unbounded_String;
      aChar        : Character       := ' ';
      Num_Chars    : Natural         := 0;
      Done         : Boolean         := False;
   begin
      Open (File_Table (File_Num).File_ID, In_File,
            To_String (File_Table (File_Num).Name));

      while not Done loop
         Done := Console.Check_Abort;
         if not Done then
            Done :=
              File_Table (File_Num).Com > Max_Com_Ports or
              End_Of_File (File_Table (File_Num).File_ID);

            if not Done then
               aChar :=
                 MMF_Get_Character (File_Num, File_Table (File_Num).File_ID);
               if aChar = Character'Val (9) then
                  --  expand tabs to spaces.
                  while Num_Chars <= Configuration.MAXSTRLEN and
                    Num_Chars mod Flash.Option.Tab > 0
                  loop
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

      Close (File_Table (File_Num).File_ID);

      return tp;

   end Process_File;

end Serial_File_IO;
