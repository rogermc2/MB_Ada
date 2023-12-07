
with Ada.Strings.Unbounded; use Ada.Strings.Unbounded;

with Audio;
with Configuration;
with Console;
with Draw;
with Exceptions;
with Flash;
with Global;
with M_Basic;
with M_Misc;
with Serial_File_IO;
with Timers;

package body Main_Support is

   --     subtype String1 is String (1 .. 1);
   --     subtype String3 is String (1 .. 3);
   --     subtype String4 is String (1 .. 4);
   --     subtype String5 is String (1 .. 5);

   C1    : Boolean := False;
   C2    : Boolean := False;
   C3    : Boolean := False;
   C4    : Boolean := False;
   Char1 : Character := Character'Val (0);
   Char2 : Character := Character'Val (0);
   Char3 : Character := Character'Val (0);
   Char4 : Character := Character'Val (0);

   procedure Restart is
   begin
      null;
   end Restart;

   procedure Do_PIN is
   begin
      null;
   end Do_PIN;

--     function Linux (aChar : in out Character; Out_String : in out String)
--                     return Boolean is
   --  vt100 escape code sequences
--     Up    : constant String3 := (Character'Val (27),  '[', 'A');
--     Down  : constant String3 := (Character'Val (27),  '[', 'B');
--     Right : constant String3 := (Character'Val (27),  '[', 'C');
--     Left  : constant String3 := (Character'Val (27),  '[', 'D');

   --     F1    : constant String5 := (Character'Val (27),  '[', '1', '1', '~');
   --     F2    : constant String5 := (Character'Val (27),  '[', '1', '1', '~');
   --     F3    : constant String5 := (Character'Val (27),  '[', '1', '1', '~');
   --     F4    : constant String5 := (Character'Val (27),  '[', '1', '1', '~');
--        Arrow_Key : String3;
--        UB_String : Unbounded_String := Null_Unbounded_String;
--        OK        : Boolean := True;
--     begin
--        if aChar /= 'O' then
--           --  Delay o allow the final characters to arrive even at 1200 baud.
--           while OK and then Timers.Inkey_Timer < 50 and then
--             aChar = Character'Val (0) loop
--              OK := Console.Get_Console (aChar);
--           end loop;
--
--           if aChar = 'P' then
--              aChar := Character'Val (241);  --  F1
--           elsif aChar = 'Q' then
--              aChar := Character'Val (242);  --  F2
--           elsif aChar = 'R' then
--              aChar := Character'Val (243);  --  F3
--           elsif aChar = 'S' then
--              aChar := Character'Val (244);  --  F4
--           else
--              C1 := True;
--              Char1 := 'O';
--              C2 := True;
--              Char2 := aChar;
--              aChar := Character'Val (27);  --  escape character
--           end if;
--        elsif aChar /= '[' then
--           C1 := True;
--           Char1 := aChar;
--        else
--           --  Get the third character after delay
--           while OK and then Timers.Inkey_Timer < 50 and then
--             aChar = Character'Val (0) loop
--              OK := Console.Get_Console (aChar);
--           end loop;
--
--           if aChar = 'A' then
--              Arrow_Key := Up;    --  Up
--           elsif aChar = 'B' then
--              Arrow_Key := Down;  --  Down
--           elsif aChar = 'C' then
--              Arrow_Key := Right;  --  Right
--           elsif aChar = 'D' then
--              Arrow_Key := Left;   --  Left
--           elsif aChar < '1' then
--              null;
--           end if;
--
--           UB_String := To_Unbounded_String (Arrow_Key);
--           if UB_String = Null_Unbounded_String then
--              Out_String := aChar'Image;
--           else
--              Out_String := To_String (UB_String);
--           end if;
--        end if;
--
--        return OK;
--
--     end Linux;

   function MM_Inkey (Out_String : out String) return Boolean is
      aChar     : Character;
      UB_String : constant Unbounded_String := Null_Unbounded_String;
      OK        : Boolean;
   begin
      aChar := Character'Val (0);
      --  Check if there are discarded chars from a previous sequence.
      if C1 then
         C1 := C2;
         C2 := C3;
         C3 := C4;
         C4 := False;
         aChar := Char1;
         Char1 := Char2;
         Char2 := Char3;
         Char3 := Char4;
         Char4 := Character'Val (0);
      end if;

      OK := Console.Get_Console (aChar);
      if OK then
         if aChar = Character'Val (27) then
            --  Escape character
            Timers.Inkey_Timer := 0;
            --  get the second character with a delay of 30mS to allow the next
            --  character to arrive.
            while OK and then Timers.Inkey_Timer < 30 and then
              aChar = Character'Val (0) loop
               OK := Console.Get_Console (aChar);
            end loop;

--              if OK then
--                 OK := Linux (aChar, Out_String);
--              end if;

         end if;
         Out_String := To_String (UB_String);
      end if;

      return OK;

   end MM_Inkey;

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

end Main_Support;
