
with Ada.Strings.Unbounded; use Ada.Strings.Unbounded;
with Ada.Text_IO; use Ada.Text_IO;

with Audio;
with Command_And_Token_Tables; use Command_And_Token_Tables;
with Configuration;
with Draw;
with Exceptions;
with Flash;
with Global;
with M_Basic;
with M_Misc;
with Memory;
with Serial_File_IO;

package body Support is

   procedure Copy_Slice (Pos1 : in out Positive; Pos2 : Positive) is
   begin
      Token_Buffer_Append (Slice (In_Buffer, Pos1, Pos2));
      while Pos1 <= Pos2 loop
         Pos1 := Pos1 + 1;
      end loop;

end Copy_Slice;

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

      --  300
      Global.Except_Code := Exceptions.EXCEP_IRQ;
      M_Basic.Prepare_Program (False);

      if not Global.Error_In_Prompt and M_Basic.Find_Subfunction
        ("MM.PROMPT", T_NOTYPE) /= 0 then
         Global.Error_In_Prompt := True;
         Clear_Token_Buffer;
         Token_Buffer_Append ("MM.PROMPT\0");
         M_Basic.Execute_Program;
      else
         M_Basic.Print_String ("> ");
      end if;

      Global.Error_In_Prompt := False;
      Serial_File_IO.MM_Get_Line (0, In_Buffer);
      if Length (In_Buffer) > 0 then
         Put_Line ("Process_Commands  ");
         M_Basic.Tokenize (True);
         M_Basic.Execute_Program;
      end if;

   end loop;

end Process_Commands;

procedure Restart is
begin
   null;
end Restart;

end Support;
