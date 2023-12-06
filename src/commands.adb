
with Ada.Command_Line;
with Ada.Strings;
with Ada.Strings.Unbounded; use Ada.Strings.Unbounded;

package body Commands is

   procedure Command_Input is
      use Ada.Command_Line;
      use Ada.Strings;
      Parsed_Line : Unbounded_String;
      Num_Args    : Natural;
      anArg       : Unbounded_String;
   begin
      Num_Args := Argument_Count;
      if Num_Args > 0 then
         for arg in 1 .. Num_Args loop
            anArg := To_Unbounded_String (Argument (arg));
            if anArg /= "," and anArg /= ";" then
               Trim (anArg, Left);
               if Element (anArg, 1) = '"' then
                  Delete (anArg, Length (anArg), Length (anArg));
                  Delete (anArg, 1, 1);
               end if;
            end if;

         end loop;
      end if;

   end Command_Input;

   procedure Execute_One_Line is
   begin
      null;

   end Execute_One_Line;

end Commands;
