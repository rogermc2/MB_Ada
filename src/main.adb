
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
with M_Basic_Utilities;
with M_Misc;
with Misc_MX470;
with P32mx470f512h;
with SPI_LCD;
with SSD_1963;
with Support; use Support;
with Tokenizer;
with Touch;
with Watchdog_Timer;

procedure Main is
   use System;
   use String_Buffer_Package;
   use M_Basic_Utilities;
   Program_Name    : constant String := "Main ";
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

   Support.Execute;

exception
   when others => Put_Line (Program_Name);

end Main;
