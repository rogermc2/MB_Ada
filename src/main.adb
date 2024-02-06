
with Interfaces.C;
with Ada.Text_IO; use Ada.Text_IO;

with P32mx470f512h;
with Support; use Support;

procedure Main is
   use Interfaces.C;
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

   Support.Execute_MM_Basic;

exception
   when others => Put_Line (Program_Name);

end Main;
