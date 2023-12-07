
with Audio;
with Configuration;
with Draw;
with Exceptions;
with Flash;
with Global;
with M_Basic;
with M_Misc;
with Serial_File_IO;

package body Main_Support is

   procedure Do_PIN is
   begin
      null;
   end Do_PIN;

   procedure Process_Commands is
   begin
      loop
         if Flash.Option.DISPLAY_CONSOLE then
            Draw.Set_Font (Global.Prompt_Font);
            Draw.GUI_Fcolour := Global.Prompt_Fcolour;
            Draw.GUI_Bcolour := Global.Prompt_Bcolour;
            if Draw.Current_X /= 0 then
               --  Prompt should be on a new line.
               M_Basic.Print_String ("\r\n");
            end if;
         end if;

         if M_Basic.Current_Line_Ptr > 0 then
            Audio.Close_Audio;
            Audio.Vol_Left := 100;
            Audio.Vol_Right := 100;
         end if;

         Global.MM_Abort := False;
         Global.Break_Key := Configuration.BREAK_KEY;
         M_Misc.Echo_Option := True;
         M_Basic.Local_Index := 0;  --  Should not be needed but ensures that all
         --  space will be cleared.
         M_Basic.Current_Line_Ptr := 0;
         if Global.MM_Char_Pos > 1 then
            --  Prompt should be on a new line.
            M_Basic.Print_String ("\r\n");
         end if;

         while Flash.Option.PIN /= 0 and not Global.Ignore_PIN loop
            Do_PIN;
         end loop;

         Global.Except_Code := Exceptions.EXCEP_IRQ;
         M_Basic.Prepare_Program (False);

         declare
            aLine       : constant String := Serial_File_IO.MM_Get_Line (1);
            Line_Length : constant Natural := aLine'Length;
         begin
            if Line_Length > 0 then
               M_Basic.Execute_Program (M_Basic.Tokenize (aLine));
            end if;
         end;

      end loop;

   end Process_Commands;

   procedure Restart is
   begin
      null;
   end Restart;

end Main_Support;
