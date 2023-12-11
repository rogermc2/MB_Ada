
with System;

with Ada.Text_IO; use Ada.Text_IO;

with Audio;
with Configuration;
with Draw;
with Exceptions;
with Flash;
with Global;
with M_Misc;
with Memory;
with Serial_File_IO;

package body Support is

   procedure Do_PIN is
   begin
      null;
   end Do_PIN;

   procedure Process_Commands (Tokens : in out M_Basic.UB_String_Buffer) is
      use System;
      use M_Basic;
      use M_Basic.UB_String_Buffer_Package;
   begin
      loop
         if Flash.Option.DISPLAY_CONSOLE then
            Draw.Set_Font (Global.Prompt_Font);
            Draw.GUI_Fcolour := Global.Prompt_Fcolour;
            Draw.GUI_Bcolour := Global.Prompt_Bcolour;
            if Draw.Current_X /= 0 then
               --  Prompt should be on a new line.
               --                 M_Basic.Print_String ("\r\n");
               New_Line;
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
         Memory.Clear_Temp_Memory;  --  space will be cleared.
         M_Basic.Current_Line_Ptr := 0;

         if Global.MM_Char_Pos > 1 then
            --  Prompt should be on a new line.
            --              M_Basic.Print_String ("\r\n");
            New_Line;
         end if;

         while Flash.Option.PIN /= 0 and not Global.Ignore_PIN loop
            Do_PIN;
         end loop;

         Global.Except_Code := Exceptions.EXCEP_IRQ;
         Prepare_Program (False);

         if not Global.Error_In_Prompt and M_Basic.Find_Subfunction
           (To_Unbounded_String ("MM.PROMPT"), 0) /= System.Null_Address then
            Global.Error_In_Prompt := True;
            Token_Buffer.Clear;
            Token_Buffer.Append (To_Unbounded_String ("MM.PROMPT"));
            Token_Buffer.Append (To_Unbounded_String ("\"));
            Token_Buffer.Append (To_Unbounded_String ("0"));
            M_Basic.Execute_Program (Tokens);
         else
            M_Basic.Print_String ("> ");
         end if;

         Global.Error_In_Prompt := False;
         Serial_File_IO.MM_Get_Line (0, In_Buffer);
         if Length (In_Buffer) > 0 then
            Put_Line ("Process_Commands  ");
            M_Basic.Tokenize (True);
            M_Basic.Execute_Program (Tokens);
         end if;

      end loop;

   end Process_Commands;

   procedure Restart is
   begin
      null;
   end Restart;

end Support;
