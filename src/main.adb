
with System;

with Interfaces.C; use Interfaces.C;

with Ada.Strings.Unbounded; use Ada.Strings.Unbounded;
with Ada.Text_IO; use Ada.Text_IO;

with Audio;
with Command_And_Token_Tables; use Command_And_Token_Tables;
with Configuration;
with Draw;
with Editor;
with Exceptions;
with File_IO;
with Flash;
with Global;
with I2C;
with Keyboard;
with M_Basic;
with M_Misc;
with Misc_MX470;
with P32mx470f512h;
with SPI_LCD;
with SSD_1963;
with Support; use Support;
with Touch;
with Watchdog_Timer;

procedure Main is
   use System;
   use String_Buffer_Package;
   Program_Name    : constant String := "Main ";
   Startup_Token   : constant String := "MM.Startup";
   Token_Buffer    : String_Buffer;
   Watchdog_Set    : Boolean := False;
   Basic_Running   : Boolean := True;
   Error_In_Prompt : Boolean := False;
begin
   Initialize;

   if P32mx470f512h.RCON = 64 then
      Restart;
   else
      --        if Debug_Mode then
      --           null;
      --        else
      Put_Line ("Ada Port Of Micromite Plus MMBasic");
      --        end if;
   end if;

   Setup;

   --  298
   if Except_Cause /= Cause_MM_Startup then
      M_Basic.Clear_Program;
      M_Basic.Prepare_Program (True);

      Except_Cause := Cause_MM_Startup;
      Clear_Buffer (Token_Buffer);
      Buffer_Append (Token_Buffer, Startup_Token);

      --  311
      if M_Basic.Find_Subfunction (Startup_Token, T_NOTYPE) /= 0 then
         Put_Line (Program_Name  & "Startup_Token found");
         Buffer_Append (Token_Buffer,Startup_Token);
         Buffer_Append (Token_Buffer, "/0");
         M_Basic.Execute_Program (Token_Buffer);
      else
         Put_Line (Program_Name &
                     "Startup_Token not found,Token_Buffer_Length: " &
                     Integer'Image (Buffer_Length (Token_Buffer)));
         Put_Line (Program_Name & "Token_Buffer (1): " &
                     Buffer_Item (Token_Buffer, 1));
      end if;
   end if;

   --  Autorun code

   Except_Cause := Cause_Nothing;
   Put_Line (Program_Name  & "Process_Commands");
   loop
      Process_Commands;

      if not Global.Error_In_Prompt and M_Basic.Find_Subfunction
        ("MM.PROMPT", T_NOTYPE) /= 0 then
         Global.Error_In_Prompt := True;
         Clear_Buffer (Token_Buffer);
         Buffer_Append (Token_Buffer, "MM.PROMPT\0");
         M_Basic.Execute_Program (Token_Buffer);
      else
         --  Print prompt
         M_Basic.Print_String ("> ");
      end if;

      Global.Error_In_Prompt := False;
      Load_Input_Buffer (0);
      if Input_Buffer_Length > 0 then
         Put_Line ("Process_Commands  ");
         M_Basic.Tokenize (Token_Buffer, True);
         M_Basic.Execute_Program (Token_Buffer);
      end if;

   end loop;

exception
   when others =>
      Put_Line (Program_Name);

end Main;
