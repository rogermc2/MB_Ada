
with Ada.Assertions; use Ada.Assertions;
with Ada.Strings.Unbounded; use Ada.Strings.Unbounded;
with Ada.Text_IO; use Ada.Text_IO;

with Arguments;
with Commands;
with Command_And_Token_Tables; use Command_And_Token_Tables;
with Console;
with Evaluation; use Evaluation;
with Flash;
with Global;
with M_Basic; use M_Basic;
with M_Misc; use M_Misc;

package body Option_Handler is

   function Get_Arg (E_String : String; TP : Positive) return Unbounded_String is
   begin
      return To_Unbounded_String (Slice (To_Unbounded_String (E_String),
                                  TP, E_String'Length));
   end Get_Arg;

   function Do_Autorun (E_String : String) return Boolean is
      Found : constant Boolean := Check_String (E_String, "AUTORUN") > 0;
   begin
      if Found then
         if Check_String (E_String, "ON") > 0 then
            Flash.Option.Autorun := True;
            Flash.Save_Options;
         elsif
           Check_String (E_String, "OFF") > 0 then
            Flash.Option.Autorun := False;
            Flash.Save_Options;
         end if;
      end if;

      return Found;

   end Do_Autorun;

   function Do_Default (E_String : String) return Boolean is
      Found : constant Boolean := Check_String (E_String, "DEFAULT") > 0;
   begin
      if Found then
         if Check_String (E_String, "INTEGER") > 0 then
            Arguments.Default_Type := T_INT;
         elsif Check_String (E_String, "FLOAT") > 0 then
            Arguments.Default_Type := T_NBR;
         elsif Check_String (E_String, "STRING") > 0 then
            Arguments.Default_Type := T_STR;
         elsif Check_String (E_String, "NONE") > 0 then
            Arguments.Default_Type := T_NOTYPE;
         end if;
      end if;

      return Found;

   end Do_Default;

   function Do_Tab (E_String : String) return Boolean is
      Found : constant Boolean := Check_String (E_String, "TAB") > 0;
   begin
      if Found then
         if Check_String (E_String, "2") > 0 then
            Flash.Option.Tab := 2;
            Flash.Save_Options;
         elsif Check_String (E_String, "4") > 0 then
            Flash.Option.Tab := 4;
            Flash.Save_Options;
         elsif Check_String (E_String, "8") > 0 then
            Flash.Option.Tab := 8;
            Flash.Save_Options;
         end if;
      end if;

      return Found;

   end Do_Tab;

   --  MM_Misc.c 268
   procedure Option_Cmd is
      use String_Buffer_Package;
      Routine_Name : constant String := ".Option_Cmd ";
      E_String     : constant String := To_String (Global.E_UB_String);
      TP           : Natural;
      Arg          : Unbounded_String;
      Done         : Boolean := False;
   begin
      Put_Line (Routine_Name & "E_String: '" & E_String & "'");
      --  Check_String checks if the next text in an element (a basic statement)
      --  corresponds to an alphabetic string.
      TP := Check_String (E_String, "BASE");
      if TP > 0 then
         Assert (not Commands.Dim_Used, Routine_Name &
                   "BASE Option must be before DIM or LOCAL");
         Option_Base := Get_Int (Global.E_UB_String, 0, 1);
         Done := True;

      elsif Check_String (E_String, "EXPLICIT") > 0 then
         Assert (Arguments.Var_Count = 0, Routine_Name &
                   "EXPLICIT variables have been defined already.");
         Arguments.Option_Explicit := True;
         Done := True;

      elsif not Do_Default (E_String) then
         TP := Check_String (E_String, "BREAK");
         if TP > 0 then
            Arg := Get_Arg (E_String, TP);
            Global.Break_Key := Integer (Get_Integer (Arg));
            Done := True;
         elsif Do_Autorun (E_String) then
            Done := True;

         else
            TP := Check_String (E_String, "CASE");
            if TP > 0 then
               if Check_String (E_String, "LOWER") > 0 then
                  Flash.Option.List_Case := Commands.CONFIG_LOWER;
                  Flash.Save_Options;
               elsif
                 Check_String (E_String, "UPPER") > 0 then
                  Flash.Option.List_Case := Commands.CONFIG_UPPER;
                  Flash.Save_Options;
               elsif
                 Check_String (E_String, "TITLE") > 0 then
                  Flash.Option.List_Case := Commands.CONFIG_TITLE;
                  Flash.Save_Options;
               end if;
               Done := True;

            else
               Done := Do_Tab (E_String);
            end if;
         end if;
      end if;

      if not Done then
         TP := Check_String (E_String, "BAUDRATE");
         if TP > 0 then
            Arg := Get_Arg (E_String, TP);
            Flash.Option.Baud_Rate :=
              Get_Int (Arg, 100, Global.Bus_Speed / 130);
            Flash.Save_Options;
            Console.Init_Serial_Console;
            Done := True;
         else
            TP := Check_String (E_String, "PIN");
            if TP > 0 then
               Arg := Get_Arg (E_String, TP);
               Flash.Option.PIN :=
                 Get_Int (Arg, 0, 99999999);
               Flash.Save_Options;
               Done := True;
            end if;
         end if;
      end if;

      if not Done then
         TP := Check_String (E_String, "DISPLAY");
         if TP > 0 then
            Arguments.Get_Args (To_Unbounded_String (E_String),TP, 3, ",");
            Assert (not Flash.Option.DISPLAY_CONSOLE, Routine_Name &
                      "DISPLAY, LCD console cannot be hanged ");

            Arg := To_Unbounded_String (Element (Arguments.Arg_V, 1));
            Flash.Option.Height := Get_Int (Arg, 5, 100);

            if Integer (Arguments.Arg_C) = 3 then
               Arg := To_Unbounded_String  (Element (Arguments.Arg_V, 2));
               Flash.Option.Width := Get_Int (Arg, 37, 132);
               Flash.Save_Options;
               Done := True;
            end if;
         end if;
      end if;

   end Option_Cmd;

end Option_Handler;
