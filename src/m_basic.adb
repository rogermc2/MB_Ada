
with System;
with System.Storage_Elements;

with Interfaces;

with Ada.Assertions;
with Ada.Characters.Handling;
with Ada.Exceptions; use Ada.Exceptions;
with Ada.Strings;
with Ada.Text_IO; use Ada.Text_IO;
with Ada.Unchecked_Conversion;

with Arguments;
with Audio;
with C_Functions;
with Command_And_Token_Functions; use Command_And_Token_Functions;
with Commands;
with Console;
with Draw;
with Editor;
with Evaluation;
with File_IO;
with Flash;
with Global;
with M_Basic_Utilities; use M_Basic_Utilities;
with M_Misc;
with Memory;

package body M_Basic is

   Callers_Line_Ptr       : Subfunction_Ptr;
   Next_Statement         : Positive;
   Current_Comand         : aliased Unbounded_String := Null_Unbounded_String;

   --     Trace_On : Boolean := False;

   procedure Clear_Runtime;
   procedure Inc_Ptr (Pos : in out Subfunction_Ptr);
   --     function Is_Command_End (Command : String_Buffer; Pos : Positive)
   --                              return Boolean;
   procedure User_Defined_Subfunction
     (Command      : Unbounded_String; TP : Positive;
      Sub_Line_Ptr : Subfunction_Ptr);

   --  Check_String checks if the next text in an element (a basic statement)
   --  corresponds to an alphabetic string.
   --  Leading white space is skipped and the string must be terminated with a
   --  valid terminating character
   --  (space, null, comma, opening bracket or comment).
   --  Check_String returns a pointer to the next non space character
   --  after the matched string if found or 0 otherwise.
   function Check_String (aString, Token : String) return Boolean is
      use Ada.Characters.Handling;
      use Ada.Strings;
      --        Routine_Name     : constant String  := "M_Basic.Check_String ";
      U_Token          : constant String := To_Upper (Token);
      U_String         : constant String :=
        To_Upper (To_String (Trim (To_Unbounded_String (aString), Left)));
   begin
      --  MMBasic 2704
      --        Skip_Spaces (aString, S_Pos);
      --        Put_Line (Routine_Name & "aString: " & aString);
      --        while T_Pos <= Token'Length and then S_Pos <= aString'Length
      --          and then To_Upper (Token (T_Pos)) = To_Upper (aString (S_Pos))
      --        loop
      --           S_Pos := S_Pos + 1;
      --           T_Pos := T_Pos + 1;
      --        end loop;
      --
      --        if T_Pos = Token'Length + 1 and then S_Pos <= aString'Length then
      --           if aString (S_Pos) = ' ' or else aString (S_Pos) = '''
      --             or else aString (S_Pos) = '\' or else aString (S_Pos) = '('
      --           then
      --              Skip_Spaces (aString, S_Pos);
      --              Result := S_Pos;
      --           end if;
      --        end if;

      return U_String = U_Token;

   end Check_String;

   procedure Clear_Program is
   begin
      Clear_Runtime;
      Editor.Init_Editor;
      --        Trace_On := False;
   end Clear_Program;

   procedure Clear_Runtime is
   begin
      Audio.Close_Audio;
      Audio.Vol_Left                  := 100;
      Audio.Vol_Right                 := 100;
      Commands.Option_Error_Skip      := 0;
      File_IO.Option_File_Error_Abort := True;
      --  Subfunctions contains pointers to program memory elenments
      for index in Subfunctions'Range loop
         Subfunctions (index) := null;
      end loop;

   end Clear_Runtime;

   pragma Warnings (Off);
   function Copy_To_Mod is new Ada.Unchecked_Conversion
     (Flash.UB_String_Access, Modular);

   function Copy_From_Mod is new Ada.Unchecked_Conversion
     (Modular, Flash.UB_String_Access);
   pragma Warnings (On);

   --  755 For a defined function:
   --   - Create a local variable for the function's name
   --   - Save the globals being used by the current command that caused the function to be called
   --   - Invoke another instance of ExecuteProgram() to execute the body of the function
   --   - When that returns we need to restore the global variables
   --   - Get the variable's value and save that in the return value globals (fret or sret)
   --   - Return to the expression parser

   procedure Defined_Function
     (Command : in out Unbounded_String; Fun_Name : Unbounded_String;
      Pos     : in out Positive; Fa  : in out Configuration.MMFLOAT;
      I64a    : in out Long_Long_Integer; Sa : in out Unbounded_String;
      F_Type  : in out Function_Type) is
      use Interfaces;
      use Arguments;
      use Ada.Strings;
      use String_Buffer_Package;
      Routine_Name     : constant String  := "M_Basic.Defined_Function ";
      S                : constant Unbounded_String :=
        Trim (To_UB_String (Global.Command_Line), Left);
      Fun_Type         : constant Function_Type :=
        Var_Table (Var_Index).Var_Type;
      Arg_Data         : Arguments_Record;
      TP               : constant Arguments.Var_Record := Arguments.Find_Var
        (Fun_Name, Pos, Arg_Data, Fun_Type or Global.V_FUNCT);
      TTP              : Positive;
   begin
      --  766
      if (Fun_Type and T_STR) = T_STR then
         Var_Table (Var_Index).S := Null_Unbounded_String;
      end if;

      Var_Table (Var_Index).Var_Type := Var_Table (Var_Index).Var_Type or T_PTR;
      --  Point to the function's body
      TTP := Next_Statement;
      --  780
      Put_Line (Routine_Name & "780");
      Execute_Program  (To_String_Buffer (Command, Pos));
      Current_Line_Ptr := Callers_Line_Ptr;
      Global.Command_Line := To_String_Buffer (S, 1);
      Next_Statement := TTP;

      --  787
      if (Fun_Type and T_NBR) = T_NBR then
         Fa := TP.F;
      elsif (Fun_Type and T_INT) = T_INT then
         I64a := TP.Ia;
      else
         Sa := TP.S;
      end if;
      F_Type := Fun_Type;
      Memory.Temp_Memory_Is_Changed := True;
      Commands.Go_Sub_Index :=  Commands.Go_Sub_Index - 1;

   exception
      when others =>
         Put_Line (Routine_Name & "exception");
         raise;

   end Defined_Function;

   --  MMBasic 441 Defined_Subfunction function is responsible for executing a
   --  defined subroutine or function.
   --  isfun is true when executing a function.
   --  Command_Ptr is a pointer to the command name in program memory that is
   --              used by the caller.
   --  Index       is an index into subfun[i] which points to the definition of
   --              the subroutine or function.
   --  fa, i64a, sa and typ are pointers to where the return value is to be
   --                       stored (used by functions only).
   procedure Defined_Subfunction
     (Is_Fun   : Boolean; Command : in out Unbounded_String; Subfun_Index : Positive;
      Fa       : in out Configuration.MMFLOAT;
      I64a     : in out Long_Long_Integer; Sa : in out Unbounded_String;
      Fun_Type : in out Function_Type) is
      use Interfaces;
      use Ada.Characters.Handling;
      use Ada.Assertions;
      use C_Functions;
      use Conversion;
      use Flash;
      use Global;
      Routine_Name  : constant String  := "M_Basic.Defined_Subfunction ";
      --  Sub_Line_Ptr is pointer to a program memory elenment
      Sub_Line_Ptr  : constant Subfunction_Ptr := Subfunctions (Subfun_Index);
      SL_Pos        : Positive := 1;      --  p
      SL_Pos2       : Positive;           --  ttp
      SL_Pos3       : Positive;           --  pp
      Fun_Name      : Unbounded_String;
      TP            : Positive := 1;
      I_Tmp         : Long_Long_Integer;
      Found         : Boolean          := False;
      Done          : Boolean          := False;
   begin
      Assert (Sub_Line_Ptr /= null, Routine_Name & "Sub_Line_Ptr is null");
      Callers_Line_Ptr := Current_Line_Ptr;
      Fun_Type := T_NOTYPE;
      --  --  MMVasic 463
      Skip_Spaces (Sub_Line_Ptr.all, SL_Pos);
      SL_Pos2 := SL_Pos;
      --  466 copy the sub/fun name from the definition into temp storage and
      --  terminate.
      --  SL_Pos is left pointing to the end of the sub/fun name
      --  (ie, the start of the argument list in the definition)
      Current_Line_Ptr := Sub_Line_Ptr;
      Append (Fun_Name, To_String (Prog_Memory (SL_Pos)));
      SL_Pos := SL_Pos + 1;
      TP := TP + 1;   --  TP points to next Fun_Name position
      while Is_Name_Character (Element (Sub_Line_Ptr.all, SL_Pos)) loop
         Append (Fun_Name, To_String (Prog_Memory (SL_Pos)));
         SL_Pos := SL_Pos + 1;
         TP := TP + 1;
      end loop;

      --  471
      if Prog_Memory (SL_Pos) = "$" or else Prog_Memory (SL_Pos) = "%"
        or else Prog_Memory (SL_Pos) = "!"
      then
         Assert (Is_Fun, Routine_Name & "Type specification is invalid:");

         Fun_Name := Fun_Name & Prog_Memory (SL_Pos);
         SL_Pos := SL_Pos + 1;
         TP := TP + 1;
      end if;
      Fun_Name := Fun_Name & ASCII.NUL;

      --  481 Subfunctions contains pointers to program memory elenments
      Assert
        (not Is_Fun or else Prog_Memory (SL_Pos) = "("
         or else To_String (Sub_Line_Ptr.all) = cmdCFUN,
         Routine_Name & "Function definition");

      --  484 Find the end of the caller's identifier, TP is left pointing to
      --  the start of the caller's argument list
      Current_Line_Ptr := Callers_Line_Ptr;
      TP := 1;
      while TP <= Length (Command) and then
        Is_Name_Character (Element (Command, TP)) loop
         TP := TP + 1;
      end loop;

      --  471
      if Prog_Memory (SL_Pos) = "$" or else Prog_Memory (SL_Pos) = "%"
        or else Prog_Memory (SL_Pos) = "!" then
         Assert (Is_Fun, Routine_Name & "Type specification is invalid");
         Replace_Element (Command, TP, Element (Prog_Memory (SL_Pos), 1));
         SL_Pos := SL_Pos + 1;
         TP := TP + 1;
      end if;
      Replace_Element (Command, TP, ASCII.NUL);

      --  481
      Assert (not Is_Fun or else Prog_Memory (SL_Pos) = "(" or else
              To_String (Sub_Line_Ptr.all) = cmdCFUN, Routine_Name &
                "invalid function definition");

      --  485 Find the end of the caller's identifier, tp is left pointing to
      --  the start of the caller's argument list.
      Current_Line_Ptr := Callers_Line_Ptr;
      TP := 1;
      while TP <= Length (Command) and then
        Is_Name_Character (Element (Command, TP)) loop
         TP := TP + 1;
      end loop;

      if Element (Command, TP) = '$' or else Element (Command, TP) = '%'
        or else Element (Command, TP) = '!' then
         Assert (Is_Fun, Routine_Name & "Type specification is invalid");
         Replace_Element (Command, TP, Element (Prog_Memory (SL_Pos), 1));
         TP := TP + 1;
      end if;

      --  496
      Assert
        (To_Upper (To_String (Prog_Memory (SL_Pos - 1)) (1)) =
           To_Upper (Element (Command, TP - 1)),
         Routine_Name & "Inconsistent type suffix");

      --  499 If this is a function we check to find if the function's type
      --  has been specified with AS <type> and save it.
      Current_Line_Ptr := Sub_Line_Ptr;
      Fun_Type := T_NOTYPE;
      if Is_Fun then
         SL_Pos2 := Skip_Var (SL_Pos2);
         Skip_Spaces (SL_Pos2);
         if Subfunctions (SL_Pos2).all = Integer'Image (tokenAS) then
            SL_Pos2 := SL_Pos2 + 1;
            Commands.Check_Type_Specified
              (Subfunctions (SL_Pos2).all, 1, Fun_Type, True);
            Assert (Fun_Type = T_IMPLIED, Routine_Name & "invalid type");
         end if;
         Fun_Type := Fun_Type or V_FIND or V_DIM_VAR or V_LOCAL or V_EMPTY_OK;
      end if;

      --  516 from now on TP points to the caller's argument list.
      --      SL_Pos (p) points to the Prog_Memory argument list for the
      --      definition.
      Skip_Spaces (Sub_Line_Ptr.all, SL_Pos);
      Skip_Spaces (Command, TP);
      Put_Line (Routine_Name & "516 Sub_Line_Ptr: " &
                  To_String (Sub_Line_Ptr.all));

      if Sub_Line_Ptr.all = cmdCFUN then
         Put_Line (Routine_Name & "526");
         --  526
         Skip_Spaces (Sub_Line_Ptr.all, SL_Pos);
         if Prog_Memory (SL_Pos) /= "(" then
            Fun_Type := T_INT;
         else  --  find the type
            SL_Pos3 := SL_Pos;
            Found   :=
              Prog_Memory (SL_Pos3) /= ")"
              and then Prog_Memory (SL_Pos3) /= "ASCII.NUL";
            while not Found loop
               SL_Pos3 := SL_Pos3 + 1;
               Found   :=
                 Prog_Memory (SL_Pos3) /= ")"
                 and then Prog_Memory (SL_Pos3) /= "ASCII.NUL";
            end loop;

            Assert (Found, Routine_Name &
                      "syntax error, ) or ASCII.NUL expected.");
            SL_Pos3 := SL_Pos3 + 1;
            Skip_Spaces (SL_Pos3);
            --  539
            Commands.Check_Type_Specified
              (Sub_Line_Ptr.all, SL_Pos3, Fun_Type, False);
            Fun_Type := Fun_Type and not T_IMPLIED;
         end if;

         --  542
         case Fun_Type is
            when T_INT =>
               I64a := C_Functions.Call_CFunction (Sub_Line_Ptr, TP, SL_Pos,
                                                   Callers_Line_Ptr);
            when T_NBR =>
               I_Tmp := Call_CFunction (Sub_Line_Ptr, TP, SL_Pos,
                                        Callers_Line_Ptr);
               Fa    := Configuration.MMFLOAT (I_Tmp);
            when T_STR =>
               Sa := Call_CFunction (Sub_Line_Ptr, TP, SL_Pos,
                                     Callers_Line_Ptr);
               Fa := Configuration.MMFLOAT (I_Tmp);
            when others =>
               Assert (False, Routine_Name & "function name: " &
                         Element (Command, TP));
         end case;
         Memory.Temp_Memory_Is_Changed := True;
         Done := True;

         --  562
      elsif Sub_Line_Ptr.all = cmdCSUB then
         Put_Line (Routine_Name & "564");
         Call_CFunction (Sub_Line_Ptr, TP, SL_Pos, Callers_Line_Ptr);
         Memory.Temp_Memory_Is_Changed := True;
         Done := True;
      else
         --  573
         User_Defined_Subfunction (Command, TP, Sub_Line_Ptr);

      end if;

      if not Done then
         Current_Subfunction_Name := Fun_Name;
         --  746 If it is a defined command point to the first statement in the
         --  command and allow ExecuteProgram() to carry on as before.
         --  Exit from the subfunction is via cmd_return which will decrement
         --  LocalIndex.
         if not Is_Fun then
            --              Skip_Element (Sub_Line_Ptr.all, SL_Pos);
            Next_Statement := SL_Pos;
         else
            Defined_Function (Command, Fun_Name, SL_Pos, Fa, I64a, Sa,
                              Fun_Type);
         end if;
      end if;

      Put_Line (Routine_Name & "done");

   end Defined_Subfunction;

   --  There are 4 items of information that are setup before a command is run.
   --  All these are globals.

   --  int cmdtoken  This is the token number of the command
   --                (some commands can handle multiple statement types and
   --                 this helps them differentiate)

   --  char *cmdline   This is the command line terminated with a zero char
   --                  and trimmed of leading spaces.
   --                  It may exist anywhere in memory (or even ROM).

   --  char *nextstmt  This is a pointer to the next statement to be executed.
   --                  The only thing a command can do with it is save it or
   --                  change it to some other location.

   --  char *CurrentLinePtr This is read only and is set to NULL if the command
   --                       is in immediate mode.

   --  The only actions a command can do to change the program flow is to
   --  change nextstmt or execute longjmp(mark, 1) if it wants to abort the
   --  program.

   procedure Execute_Command
     (Token_Buffer     : String_Buffer; Program_Ptr : Positive;
      Save_Local_Index : in out Natural) is
      use Interfaces;
      use Ada.Assertions;
      use Ada.Strings;
      use String_Buffer_Package;
      Routine_Name       : constant String := "M_Basic.Execute_Command ";
      Command_Token      : constant Unsigned_16 :=
        Unsigned_16'Value (Token_Buffer (Program_Ptr));
      Command            : constant Unbounded_String :=
        Trim (To_Unbounded_String (Token_Buffer (Program_Ptr)), Left);
      Command_Pos        : Positive := 1;
      Command_Token_Test : Unsigned_16;
      Interupt_Check     : Integer := 0;
      Command_Ptr        : Command_And_Token_Functions.Access_Procedure;
      No_Abort           : Boolean := True;
      Done               : Boolean := Natural (Token_Buffer.Length) = 0;
   begin
      --  225
      Next_Statement := Program_Ptr;
      Global.Command_Line := Token_Buffer;
      Global.Command_Line.Delete_First;

      if not Done then
         Done := Program_Ptr >= Flash.Prog_Memory'Length;
      end if;

      if Done then
         Put_Line (Routine_Name & "No more token buffer elements");
      else
         --  ignore comment line if character is '.
         Skip_Spaces (Command, Command_Pos);
         --  228
         if Element (Command, Command_Pos) /= ''' then
            --  236 if setjmp (ErrNext) = 0 then
            Save_Local_Index := Local_Index;
            --  C_Base_Token is the base of the token numbers.
            Command_Token_Test :=
              M_Misc.C_Base_Token and Command_Token - M_Misc.C_Base_Token;

            if Command_Token >= Command_Token_Test and then
              Command_Token_Test < Unsigned_16 (Command_Table_Size) and then
              Command_Table
                (Positive (Command_Token - M_Misc.C_Base_Token)).Command_Type =
                  T_CMD then
               --  243
               T_Arg := T_CMD;   -- type of returned value
               Assert (Command_Token - M_Misc.C_Base_Token <=
                         Command_Table'Length, Routine_Name &
                         "243 Command_Token is out of Command_Table range");
               --  Execute the command
               Command_Ptr := Command_Table
                 (Integer (Command_Token - M_Misc.C_Base_Token)).Function_Ptr;
               Assert (Command_Ptr /= null, Routine_Name &
                         "247 Command_Ptr is null");
               Command_Ptr.all;

            end if;
            --              else
            --  249 do non-local jump
            --  Assert (Is_Name_Start (Command_Line (Command_Line_Pos)),
            --          Routine_Name &"Invalid character ");
            --  Index :=
            --    Find_Subfunction (Command_Line, T_NA);
            --  if Index > 0 then
            --     Put_Line (Routine_Name & "Index: " & Integer'Image (Index));
            --     Defined_Subfunction (Buffer, False, Command_Line, Index,
            --                          Fa, I64a, Sa, Null_Function);
            --  end if;
            --              end if;

            --  268
            if Commands.Option_Error_Skip > 0 then
               Commands.Option_Error_Skip := Commands.Option_Error_Skip - 1;
            end if;

            if Memory.Temp_Memory_Is_Changed then
               Memory.Clear_Temp_Memory;
            end if;

            No_Abort := Console.Check_Abort;
            Interupt_Check := M_Misc.Check_Interrupt;
            Done := not No_Abort and Interupt_Check /= 0;
         end if;
      end if;

   end Execute_Command;

   procedure Execute_Program (Token_Buffer : String_Buffer)  is
      use Ada.Strings;
      use Global;
      use String_Buffer_Package;
      Routine_Name     : constant String := "M_Basic.Execute_Program ";
      Item             : Unbounded_String;
      Save_Local_Index : Natural := 0;
      Program_Ptr      : Positive := 1;
      Item_Ptr         : Positive  := 1;
      Done             : Boolean := False;
   begin
      --  194
      while Program_Ptr <= Integer (Token_Buffer.Length) loop
         Item := To_Unbounded_String (Token_Buffer (Program_Ptr));
         Item_Ptr := 1;
         if Element (Item, Item_Ptr) = '0' then
            --  Step over the 0 indicating the start of a new element'
            Delete (Item, Item_Ptr, Item_Ptr);
         end if;

         if Element (Item, Item_Ptr) = Element
           (To_Unbounded_String (Integer'Image (T_NEWLINE)), 1) then
            Item_Ptr := Item_Ptr + 1;
         end if;

         --  217
         if Element (Item, Item_Ptr) = Element
           (Trim (To_Unbounded_String
            (Integer'Image (T_LINENBR)), Left), 1) then
            Item_Ptr := Item_Ptr + 3;
         end if;

         Skip_Spaces (Item, Item_Ptr);
         if Element (Item, 1) =
           Element (Trim (To_Unbounded_String
                    (Integer'Image (T_LABEL)), Left), 1) then
            --  skip over the label
            Item_Ptr := Item_Ptr +
              Character'Pos (Element (Item, Item_Ptr)) + 2;
            Skip_Spaces (Item, Item_Ptr);
         end if;

         --  225
         if Program_Ptr <= Positive (Token_Buffer.Length) then
            Execute_Command (Token_Buffer, Program_Ptr, Save_Local_Index);
            --  Find next statement if any
            while not Done and then
              Program_Ptr < Integer (Token_Buffer.Length) loop
               Item := To_Unbounded_String (Token_Buffer (Program_Ptr));
               Done := Element (Item, Program_Ptr) = '0';
               if not Done then
                  Program_Ptr := Program_Ptr + 1;
               end if;
            end loop;
         end if;

         --  279
         if not Done then
            Program_Ptr := Program_Ptr + 1;
         end if;
      end loop;

   exception
      when Constraint_Error =>
         Put_Line (Routine_Name & "constraint exception");
         New_Line;
         raise;
      when Error : Index_Error =>
         Put (Routine_Name & "index exception: ");
         Put (Exception_Message (Error));
         New_Line;
         raise;
      when others =>
         Put_Line (Routine_Name & "exception");
         New_Line;
         raise;

   end Execute_Program;

   --  searches the subfun[] table to locate a defined sub or fun
   --  returns with the index of the sub/function in the table or -1 if not found
   --  if type = 0 then look for a sub otherwise a function
   function Find_Subfunction
     (Token : String; Fun_Type : Function_Type) return Natural is
      use Interfaces;
      use Ada.Characters.Handling;
      use Conversion;
      use Flash;
      --        Routine_Name : constant String := "M_Basic.Find_Subfunctionm ";
      Index        : Natural := 0;
      Subfun       : Unbounded_String;
      Pos1         : Natural;
      Pos2         : Positive := 1;
      Done         : Boolean := False;
      Not_Null     : Boolean := False;
   begin
      --  394
      --        Put_Line (Routine_Name & "Token: " & Token);
      while not Done and then Index < Configuration.MAXSUBFUN loop
         Not_Null := Subfunctions (Index + 1) /= null;
         if Not_Null then
            Subfun := Subfunctions (Index + 1).all;
         end if;
         Done := Pos2 = Length (Subfun);

         Index := Index + 1;
         if Not_Null and then not Done then
            if Fun_Type = T_NOTYPE and then
              (To_String (Subfun) = cmdSUB or To_String (Subfun) = cmdCSUB) then
               null;
            elsif (To_String (Subfun) = cmdFUN) or else
              (To_String (Subfun) = cmdCFUN) then
               null;
            else
               --  411
               Pos2 := Pos2 + 1;
               Skip_Spaces (Pos2);
               --  413
               if To_Upper (Token) =
                 To_Upper (To_String (Subfunctions (index).all)) then
                  Pos1 := 2;
                  Pos2 := Pos2 + 1;
                  --  417
                  while Is_Name_Character (Token (Pos1))
                    and then To_Upper (Token (Pos1)) =
                      To_Upper (Element (Subfun, 1)) loop
                     --                        To_Upper (Element (Pos2.all, 1)) loop
                     Pos1 := Pos1 + 1;
                     --                       Inc_Ptr (Pos2);
                     Pos2 := Pos2 + 1;
                  end loop;

                  Done :=
                    (Prog_Memory (Pos1) = "$" and Prog_Memory (Pos2) = "$")
                    or else
                      (Prog_Memory (Pos1) = "%" and Prog_Memory (Pos2) = "%")
                      or else
                        (Prog_Memory (Pos1) = "!" and Prog_Memory (Pos2) = "!")
                        or else
                          (not Is_Name_Character
                             (Element (Prog_Memory (Pos1), 1)) and
                             not Is_Name_Character
                               (Element (Prog_Memory (Pos2), 1)));
               end if;
            end if;
         end if;
      end loop;

      if not Done then
         Index := 0;
      end if;

      return Index;

   end Find_Subfunction;

   function Get_C_Fun_Ptr (Pos : Positive) return Flash.UB_String_Access is
      --     function Get_C_Fun_Ptr (Pos : Program_Ptr) return Flash.UB_String_Access is
      use Flash;
      Ptr     : constant UB_String_Access :=
      --          new Unbounded_String'(Pos.all);
        new Unbounded_String'(Prog_Memory (Pos));
      Mod_Ptr : Modular := Copy_To_Mod (Ptr);
   begin
      Mod_Ptr := (Mod_Ptr + 2#11#) and not 2#11#;

      return Copy_From_Mod (Mod_Ptr);

   end Get_C_Fun_Ptr;

   --  Get_Next_Command returns a pointer to the next command in the program.
   --  Get_Next_Command contains the logic for stepping over a line number and
   --  label (if present).
   --  p is the current place in the program to start the search from.
   --  CLine is a pointer to a char pointer which points to the start of the
   --  current line for error reporting (if NULL it will be ignored).
   --  EOFMsg is the error message to use if the end of the program is reached.
   procedure Get_Next_Command
     (Pos         : in out Positive; Current_Line : in out Subfunction_Ptr;
      EOF_Message : String) is
      use Conversion;
      use Flash;
      use Global;
      use M_Misc;
      OK : Boolean := True;
   begin
      while OK and then Pos <= Integer (C_Base_Token) loop
         --  look for the zero marking the start of an element
         if Prog_Memory (Pos) /= Integer'Image (T_NEWLINE) then
            while Prog_Memory (Pos) /= "0" loop
               Pos := Pos + 1;
            end loop;
            Pos := Pos + 1;
         end if;

         OK :=  Prog_Memory (Pos) = "0";
         if not OK then
            if EOF_Message'Length /= 0 then
               null;
            end if;

         else
            if Prog_Memory (Pos) = Integer'Image (T_NEWLINE) then
               if Current_Line /= null then
                  Current_Comand := Prog_Memory (Pos);
                  Current_Line := Current_Comand'access;
               end if;
               Pos := Pos + 1;
            end if;

            if Prog_Memory (Pos) = Integer'Image (T_LINENBR) then
               Pos := Pos + 3;
            end if;

            Skip_Spaces (Pos);

            if Prog_Memory (1) = Integer'Image (T_LABEL) then
               --  skip over the label
               Pos := Pos + Integer'Value (To_String (Prog_Memory (2))) + 2;
               Skip_Spaces (Pos);
            end if;
         end if;

      end loop;

   end Get_Next_Command;

   procedure Init_Basic is
      --        Routine_Name : constant String := "M_Basic.Init_Basic ";
   begin
      Arguments.Default_Type := T_NBR;
      Clear_Program;
      Command_And_Token_Functions.Init_Operator_Functions;

   end Init_Basic;

   procedure Inc_Ptr (Pos : in out Subfunction_Ptr) is
      use System.Storage_Elements;
      use Conversion;
      Sys_A : System.Address := To_Address (Pos);
   begin
      Sys_A := Sys_A + 1;
      Pos := To_Pointer (Sys_A);
   end Inc_Ptr;

   --     function Is_Command_End (Command : String_Buffer; Pos : Positive)
   --                              return Boolean is
   --        Routine_Name : constant String := "M_Basic.Is_Command_End ";
   --        use String_Buffer_Package;
   --        Item         : constant String := Command (Pos);
   --        Done         : Boolean;
   --     begin
   --        Done := Item (Pos .. Pos + 1) = "00" or else
   --          Item (Pos .. Pos + 1) = "ff";
   --        return Done;
   --
   --     end Is_Command_End;

   --     function Is_Command_End (Command : Unbounded_String; Pos : in out Positive)
   --                              return Boolean is
   --        --        Routine_Name : constant String := "M_Basic.Is_Command_End ";
   --        Done : constant Boolean := Pos + 1 > Integer (Length (Command)) or else
   --          (Element (Command, Pos) = '0'
   --           and then Element (Command, Pos + 1) = '0')
   --          or else
   --            (Element (Command, Pos) = 'f'
   --             and then Element (Command, Pos + 1) = 'f');
   --     begin
   --        if Done then
   --           Pos := Pos + 2;
   --        end if;
   --        return Done;
   --
   --     end Is_Command_End;

   procedure Print_String (theString : String) is
   begin
      Put (theString);

   end Print_String;

   --  337 Prepare_Program_Ext cans one area (main program or the library area)
   --  for user defined subroutines and functions.
   procedure Prepare_Program_Ext
   --       (User_Mem_Start : Program_Ptr; Num_Funcs : in out Natural;
     (Num_Funcs                                  : in out Natural; C_Fun_Ptr      :
      in out Flash.UB_String_Access; Error_Abort : Boolean) is
      use Ada.Assertions;
      use Flash;
      Routine_Name : constant String := "M_Basic.Prepare_Program_Ext ";
      Prog_Pos     : Positive := 1;  --  First element array
      Term         : String := To_String (Prog_Memory (1));
      C_Fun_Pos    : Natural;
      Data         : Unbounded_String;
      Skip         : Boolean         := False;
   begin
      --  342
      while Prog_Memory (Prog_Pos) /= "ff" loop
         Get_Next_Command (Prog_Pos, Current_Line_Ptr, "");
         if Prog_Pos <= Prog_Memory'Length then
            Term := To_String (Prog_Memory (Prog_Pos));
            if Term = cmdSUB or else Term = cmdFUN or else
              Term = cmdCFUN or else Term = cmdCSUB then
               Assert (Num_Funcs <= Configuration.MAXSUBFUN,
                       Routine_Name & "Too many subroutines and functions");
               Subfunctions (Num_Funcs) := Prog_Memory (Prog_Pos)'access;
               Num_Funcs := Num_Funcs + 1;
               Prog_Pos := Prog_Pos + 1;
               --  354
               Skip_Spaces (Prog_Pos);
               Term := To_String (Prog_Memory (Prog_Pos));
               if Is_Name_Start (Term (1)) then
                  while Term (1) /= '0' loop
                     Prog_Pos := Prog_Pos + 1;
                     Term := To_String (Prog_Memory (Prog_Pos));
                     if Is_Name_Start (Term (1)) then
                        while Term (1) /= '0' loop
                           Prog_Pos := Prog_Pos + 1;
                        end loop;
                     else
                        Assert
                          (not Error_Abort, Routine_Name & "Invalid identifier");
                        Num_Funcs := Num_Funcs - 1;
                        Skip := True;
                     end if;
                  end loop;
               end if;
            end if;

            if Skip then
               Skip := False;
            else
               while Term /= "0" loop
                  Prog_Pos := Prog_Pos + 1;
                  Term := To_String (Prog_Memory (Prog_Pos));
               end loop;
            end if;
            --  FF  detected, all token bufferr subroutines and functions processed.

            --  the end of the program can have multiple zeros
            if Prog_Pos >= Prog_Memory'Length then
               Put_Line (Routine_Name & "unexpected program end");
            else
               while Term (1) /= '0' loop
                  Prog_Pos := Prog_Pos + 1;
                  Term := To_String (Prog_Memory (Prog_Pos));
               end loop;

               Prog_Pos := Prog_Pos + 1;
               Term := To_String (Prog_Memory (Prog_Pos));

               --  CFunction flash (if it exists) starts on the next word address-
               --  after the program in flash
               C_Fun_Ptr := Get_C_Fun_Ptr (Prog_Pos);
               if Num_Funcs <= Configuration.MAXSUBFUN then
                  Subfunctions (Num_Funcs) := null;
               end if;
               Current_Line_Ptr := null;

               --  380 step through the CFunction area looking for fonts to add to the
               --  font table.
               C_Fun_Pos := 0;
               while C_Fun_Ptr.all /= "ffffffff" loop
                  C_Fun_Pos := C_Fun_Pos + 1;
                  if C_Fun_Pos <= Draw.FONT_TABLE_SIZE then
                     Data := C_Fun_Ptr.all;
                     Draw.Font_Table (C_Fun_Pos) :=
                       To_Unbounded_String (Slice (Data, 3, Length (Data)));
                  end if;
                  C_Fun_Pos := C_Fun_Pos + 1;
               end loop;
            end if;
         end if;
      end loop;

   end Prepare_Program_Ext;

   procedure Prepare_Program (Error_Abort : Boolean) is
      use Ada.Assertions;
      use Ada.Characters.Handling;
      use Configuration;
      use Conversion;
      use Draw;
      use Flash;
      Routine_Name : constant String := "M_Basic.Prepare_Program ";
      Num_Funcs    : Positive        := 1;
      Index1       : Positive        := 1;
      Index2       : Natural         := 0;
      Pos1         : Subfunction_Ptr;
      Pos2         : Subfunction_Ptr;
      Done         : Boolean         := False;
   begin
      for index in FONT_BUILTIN_NBR .. FONT_TABLE_SIZE loop
         Font_Table (index) := Null_Unbounded_String;
      end loop;

      C_Function_Flash   := null;
      C_Function_Library := null;

      if Option.Program_Flash_Size /= PROG_FLASH_SIZE then
         Prepare_Program_Ext (Num_Funcs, C_Function_Library, False);
      end if;

      Prepare_Program_Ext (Num_Funcs, C_Function_Flash, False);

      if Error_Abort then
         while Index1 < MAXSUBFUN and then Subfunctions (Index1) /= null loop
            Index2 := Index1;
            while Index2 < MAXSUBFUN and then Subfunctions (Index2) /= null loop
               Index2 := Index1 + 1;
               Pos1 := Subfunctions (Index1);
               Current_Line_Ptr := Pos1;
               Inc_Ptr (Pos1);
               Skip_Spaces (Pos1);

               Pos2 := Subfunctions (Index2);
               Inc_Ptr (Pos2);
               Skip_Spaces (Pos1);

               while not Done loop
                  Assert (Is_Name_Character (Element (Pos1.all, 1))
                          or else Is_Name_Character (Element (Pos2.all, 1)),
                          Routine_Name & "error duplicate name.");
                  Done := To_Upper (Element (Pos1.all, 1)) /=
                    To_Upper (Element (Pos1.all, 2));
                  if not Done then
                     Inc_Ptr (Pos1);
                     Inc_Ptr (Pos2);
                  end if;
               end loop;
            end loop;

            Index1 := Index1 + 1;
         end loop;
      end if;

   end Prepare_Program;

   procedure Remove_Spaces (Buffer : in out Unbounded_String) is
      --        Routine_Name : constant String := "M_Basic.Remove_Spaces ";
      Pos     : Natural := 0;
      Updated : Unbounded_String;
   begin
      while Pos < Length (Buffer) loop
         Pos := Pos + 1;
         if Element (Buffer, Pos) /= ' ' then
            Append (Updated, Element (Buffer, Pos));
         end if;
      end loop;

      Buffer := Updated;

   end Remove_Spaces;

   procedure Save_Program_To_Flash (Buffer : String; Msg : Boolean) is
   begin
      null;
   end Save_Program_To_Flash;

   --  Skip_Element skips to the the zero (null) char that preceeds an element
   --     procedure Skip_Element (aLine : String_Buffer; Pos : in out Positive) is
   --        use String_Buffer_Package;
   --        Item     : Unbounded_String := To_Unbounded_String (aLine (Pos));
   --     begin
   --        while Pos < Integer (aLine.Length) and then
   --          Element (Item, 1) /= ASCII.NUL loop
   --           Item := To_Unbounded_String (aLine (Pos));
   --           Pos := Pos + 1;
   --        end loop;
   --
   --     end Skip_Element;
   --
   --     procedure Skip_Element (aLine : Unbounded_String; Pos : in out Positive) is
   --     begin
   --        while Pos < Length (aLine) and then
   --          Element (aLine, Pos) /= ASCII.NUL loop
   --           Pos := Pos + 1;
   --        end loop;
   --
   --     end Skip_Element;

   --  2413 Skip_Var skips to the end of a variable
   function Skip_Var (Var : String; Pos : Positive) return Positive is
      use Interfaces;
      use Ada.Assertions;
      Routine_Name : constant String   := "M_Basic.Skip_Var ";
      UB_Var       : constant Unbounded_String := To_Unbounded_String (Var);
      Pos2         : constant Positive := Pos;
      Pos1         : Positive := Pos;
      Pos3         : Positive;
      Index        : Positive;
      In_Quote     : Boolean           := False;
      aChar        : Character := Element (UB_Var, Pos1);
      Done         : Boolean;
   begin
      if aChar = ' ' and then Pos1 < Length (UB_Var) then
         Pos1 := Pos1 + 1;
      end if;

      if Is_Name_Start (aChar)  and then Pos1 < Length (UB_Var) then
         while Is_Name_Character (aChar) loop
            Pos1 := Pos1 + 1;
            aChar := Element (UB_Var, Pos1);
         end loop;

         --  2429 check the terminating char.
         if not (aChar = '$')
           and then not (aChar = '%')
           and then not (aChar = '|')
         then
            Pos1 := Pos1 - 1;
         end if;

         Assert
           (Pos2 - Pos1 < Configuration.MAXVARLEN,
            Routine_Name & "Variable name " & Slice (UB_Var, Pos1, Pos2) &
              " is too long");

         Pos3 := Pos1;
         aChar := Element (UB_Var, Pos3);
         if aChar = ' ' then
            Pos3 := Pos3 + 1;
         end if;

         if aChar = '(' then
            Pos1 := Pos3;
         end if;

         if aChar = '(' then
            --  2445 this is an array
            Pos1 := Pos1 + 1;
            Assert
              (Pos2 - Pos1 < Configuration.MAXVARLEN,
               Routine_Name & "Variable name " & Slice (UB_Var, Pos1, Pos2) &
                 " is too long");

            --  2456 Step over the array parameters keeping track of
            --  nested brackets.
            Index := 1;
            aChar := Element (UB_Var, Pos1);
            Done  := False;
            while not Done loop
               if aChar = '"' then
                  In_Quote := not In_Quote;
               end if;

               if Pos1 = Length (UB_Var) then

                  Assert
                    (Pos1 >= Input_Buffer_Length,
                     Routine_Name & "Expected closing bracket.");

                  Done :=
                    not In_Quote and then aChar = ')'
                    and then Index = 1;

                  if not Done and then (aChar = '('
                                        or else Token_Type (Pos1) = T_FUN)
                  then
                     Index := Index + 1;
                  end if;

                  Pos1 := Pos1 + 1;
               end if;
               Pos1 := Pos1 + 1;
            end loop;

         end if;
      end if;

      return Pos2;

   end Skip_Var;

   function Skip_Var (Pos : Positive) return Positive is
   begin
      return Skip_Var (Get_Input_Buffer, Pos);

   end Skip_Var;

   function Token_Function (Token : String) return Unbounded_String is
      use M_Misc;
      Token_Value : constant Integer := Integer'Value (Token);
      Result      : Unbounded_String;
   begin
      if Token_Value >= Integer (C_Base_Token)
        and then Token_Value < Token_Table_Size + Integer (C_Base_Token)
      then
         Result := Token_Table (Token_Value - Integer (C_Base_Token)).Name;
      else
         Result := Token_Table (1).Name;
      end if;

      return Result;

   end Token_Function;

   procedure User_Defined_Subfunction
     (Command      : Unbounded_String; TP : Positive;
      Sub_Line_Ptr : Subfunction_Ptr) is
      use Interfaces;
      use Ada.Assertions;
      use Arguments;
      use Global;
      use String_Buffer_Package;
      Routine_Name : constant String := "M_Basic.User_Defined_Subfunction ";
      Arg_Data1    : Arguments_Record;
      Arg_Data2    : Arguments_Record;
      Arg_C1       : Natural := 0;
      Arg_C2       : Natural := 0;
      Arg_Buff1    : String_Buffer;  --  indec type: Positive
      Arg_Buff2    : String_Buffer;
      Arg_V1       : Arg_Vector;     --  indec type: Positive
      Arg_V2       : Arg_Vector;
      Arg_Val      : Var_Vector;
      Arg_Type     : Function_Type := T_NOTYPE;
      Var          : Var_Record;
      C1           : Positive;
      Arg          : Unbounded_String;
      Delim        : Unbounded_String;
      Ia           : Long_Long_Integer;
      S            : Unbounded_String;
      Index_C      : Natural := 0;
      Pos          : Positive := TP;
   begin
      --  588
      Assert (Commands.Go_Sub_Index <= Configuration.MAXGOSUB, Routine_Name &
                "too many nested subroutines and functions.");
      Current_Line_Ptr := Callers_Line_Ptr;
      if TP > 0 then
         if Element (Command, TP) = '(' then
            Delim := To_Unbounded_String ("(,");
         else
            Delim := To_Unbounded_String (",");
         end if;

         Arg_Data1 :=
           Make_Args (To_String_Buffer (Command, TP), TP,
                      Configuration.MAX_ARG_COUNT, To_String (Delim));
         Arg_C1 := Arg_Data1.Arg_C;
         Arg_V1 := Arg_Data1.Arg_V;
         Arg_Buff1 := Arg_Data1.Arg_Buffer;
      end if;

      Current_Line_Ptr := Sub_Line_Ptr;
      --  595
      if TP > 0 then
         if Element (Command, TP) = '(' then
            Delim := To_Unbounded_String ("(,");
         else
            Delim := To_Unbounded_String (",");
         end if;
         Arg_Data2 :=
           Make_Args (To_String_Buffer (Command, TP), TP,
                      Configuration.MAX_ARG_COUNT, To_String (Delim));
         Arg_C2 := Arg_Data2.Arg_C;
         Arg_V2 := Arg_Data2.Arg_V;
         Arg_Buff2 := Arg_Data2.Arg_Buffer;

         Assert (Arg_C2 = 0 or else (Unsigned_16 (Arg_C2) and 1) /= 0,
                 Routine_Name & "invalid argument list, Arg_C2: " &
                   Integer'Image (Arg_C2));
         Current_Line_Ptr := Callers_Line_Ptr;
         Assert (Arg_C2 <= Arg_C1 and then
                   (Unsigned_16 (Arg_C1) and (Unsigned_16 (Arg_C1) and 1)) /= 0,
                 Routine_Name & "invalid argument list, Arg_C1: " &
                   Integer'Image (Arg_C1) & ", Arg_C2: " &
                   Integer'Image (Arg_C2));

         --  605 Step through the arguments supplied by the caller and get the
         --  value supplied which can be:
         --   missing (ie, caller did not supply that parameter)
         --   a variable, in which case a pointer is needed to that variable's
         --   data and save its index so later we can get its type.
         --   an expression, in which case evaluate the expression and get its
         --   value and type.
         --  610
         Index_C := 0;
         while Index_C < Arg_C2 loop
            C1 := Positive (Index_C + 1);
            if Index_C < Arg_C1 and then
              Element (Arg_Buff1, Arg_V1 (C1)) /= Integer'Image (0) then
               if (C1 < Integer (Arg_C1) and then
                   Is_Name_Start  (Arg_Buff1 (Arg_V1 (C1))(1))) and then
                 (Skip_Var (Arg_Buff1 (Arg_V1 (C1)), Integer (Index_C)) = 1) then
                  --  Expression is a variable or user defined function
                  if Find_Subfunction (Arg_Buff1 (Arg_V1 (C1)), 1) < 0 or else
                    Index (To_Unbounded_String (Arg_V1 (C1)), "(") > 0 then
                     --  618
                     Var_Index := 1;
                     Var.S := Find_Var
                       (To_Unbounded_String (Arg_Buff1 (Arg_V1 (C1))),
                        Var_Index, Arg_Data1, V_FIND or V_EMPTY_OK).S;
                     Var := Var_Table (Var_Index);
                     if (Var.Var_Type and T_CONST) = T_CONST then
                        Var.Var_Type := T_NOTYPE;
                     else
                        Var.Var_Type := Var.Var_Type or T_PTR;
                     end if;
                     Arg_Val (C1) := Var;
                  end if;  --  end if Find_Subfunction ...
               end if;     --  end if C1 < Integer (Arg_C1) and Is_Name_Start ...

               --  633 If argument is present and is not a pointer to a
               --      variable then evaluate it as an expression
               Var := Arg_Val (C1);
               if Var.Var_Type = T_NOTYPE or else Var.Var_Type = T_NA then
                  Arg := To_Unbounded_String (Arg_V1 (C1));
                  Evaluation.Evaluate (Arg, Var.F, Ia, S, Var.Var_Type, 0);

                  if (Var.Var_Type and T_INT) = T_INT then
                     Var.Ia := Ia;
                  elsif (Var.Var_Type and T_STR) = T_STR then
                     Var.S := S;
                  end if;
                  Arg_Val (C1) := Var;
               end if;
            end if;        --  end if Index_C < Arg_C1 ...

            Index_C := Index_C + 2;
         end loop;

         --  648 N Now step through the parameters in the definition of the
         --  sub/fun and for each one create a local variable and compare its
         --  type to the one supplied in the callers list.
         Current_Line_Ptr := Sub_Line_Ptr;
         Local_Index := Local_Index + 1;

         Index_C := 0;
         while Index_C < Arg_C2 loop
            C1 := Index_C + 1;
            Arg_Type := T_NOTYPE;
            Pos := Skip_Var (Arg_Buff2 (Arg_V2 (C1)), Pos);
            Skip_Spaces (Command, Pos);
            Index_C := Index_C + 2;

            --  657
            if Integer'Value (M_Basic_Utilities.Get_Word (Command, Pos)) =
              tokenAS then
               Pos := Pos + 1;
               Commands.Check_Type_Specified
                 (Command, Pos, Arg_Type, True);
               Assert ((Arg_Type and T_IMPLIED) = T_IMPLIED, Routine_Name &
                         "Invalid variable type: " &
                         Function_Type'Image (Arg_Type));
            end if;

            --  664
            Arg_Type :=
              Arg_Type or V_FIND or V_DIM_VAR or V_LOCAL or V_EMPTY_OK;
            Arg_Data2.Arg_C := Arg_C2;
            Arg_Data2.Arg_V := Arg_V2;
            Arg_Data2.Arg_Buffer := Arg_Buff2;
            Var := Arguments.Find_Var
              (To_Unbounded_String (Arg_Buff2 (Arg_V2 (C1))), Pos, Arg_Data2,
               Arg_Type);
            Assert (Var_Table (Var_Index).Dims (1) > 0, Routine_Name &
                      "Invalid argument list.");
            Current_Line_Ptr := Callers_Line_Ptr;

            --  671 If the definition called for an array, special processing
            --      and checking is needed.
            if Var_Table (Var_Index).Dims (1) = -1 then
               Assert (Var_Table (Arg_Var_Index (C1)).Dims (1) /= 0,
                       Routine_Name & "array expected");
               Assert (Type_Mask
                       (Var_Table (Arg_Var_Index (Var_Index)).Var_Type) =
                         Type_Mask (Var_Table (C1).Var_Type),
                       Routine_Name & "incompatible type: " &
                         Function_Type'Image (Var_Table (C1).Var_Type));
               Var_Table (Var_Index).S := To_Unbounded_String ("");

               --  680
               Var_Table (Var_Index).Dims :=
                 Var_Table (Arg_Var_Index (Var_Index)).Dims;
            end if;

            --  684 if this is a pointer check and the type is NOT the same as
            --  that requested in the sub/fun definition.
            if (Var_Table (C1).Var_Type and T_PTR) = T_PTR and then
              Type_Mask (Var_Table (Arg_Var_Index (Var_Index)).Var_Type) /=
              Type_Mask (Var_Table (C1).Var_Type) then
               Assert (Type_Mask (Var_Table (Var_Index).Var_Type and T_STR) /=
                         T_STR and then
                           (Type_Mask (Var_Table (C1).Var_Type and T_STR) /= T_STR),
                       Routine_Name & "incompatible type: " &
                         Function_Type'Image (Var_Table (C1).Var_Type));
               if (Var_Table (Arg_Var_Index (C1)).Var_Type and T_PTR) =
                 T_PTR then
                  Arg_Val (C1).Ia := Var_Table (Arg_Var_Index (C1)).Ia;
               else
                  Arg_Val (C1).Ia :=
                    Long_Long_Integer'Value
                      (To_String (Var_Table (Arg_Var_Index (C1)).S));
               end if;
               Arg_Val (C1).Var_Type := Arg_Val (C1).Var_Type and not T_PTR;
            end if;

            --  702  The argument supplied was a variable we must setup the
            --      local variable as a pointer.
            if (Arg_Val (C1).Var_Type and T_PTR) = T_PTR then
               Var_Table (Var_Index).S := Arg_Val (C1).S;
               Var_Table (Var_Index).Var_Type :=
                 Var_Table (Var_Index).Var_Type or T_PTR;
               Var_Table (Var_Index).Size :=
                 Var_Table (Arg_Var_Index (C1)).Size;

            elsif Arg_Val (C1).Var_Type /= T_NOTYPE and then
              Arg_Val (C1).Var_Type /= T_NA then
               if (Var_Table (Var_Index).Var_Type and T_STR) = T_STR and then
                 (Arg_Val (C1).Var_Type and T_STR) = T_STR then
                  Var_Table (Var_Index).S := Arg_Val (C1).S;
                  Arg_Val (C1).S := Null_Unbounded_String;

               elsif  (Var_Table (Var_Index).Var_Type and T_NBR) =
                 T_NBR and then
                 (Arg_Val (C1).Var_Type and T_NBR) = T_NBR then
                  Var_Table (Var_Index).F := Arg_Val (C1).F;

               elsif  (Var_Table (Var_Index).Var_Type and T_NBR) =
                 T_NBR and then
                 (Arg_Val (C1).Var_Type and T_INT) = T_INT then
                  Var_Table (Var_Index).F :=
                    Configuration.MMFLOAT (Arg_Val (C1).Ia);

               elsif  (Var_Table (Var_Index).Var_Type and T_INT) =
                 T_INT and then
                 (Arg_Val (C1).Var_Type and T_INT) = T_INT then
                  Var_Table (Var_Index).Ia := Arg_Val (C1).Ia;

               else
                  Assert (False, Routine_Name & "incompatible type: " &
                            Function_Type'Image (Arg_Val (C1).Var_Type));
               end if;
            end if;
         end loop;
      end if;

   end User_Defined_Subfunction;

end M_Basic;
