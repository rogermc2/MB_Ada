
with Interfaces;

with Ada.Assertions;
with Ada.Characters.Handling;
with Ada.Strings;
with Ada.Text_IO; use Ada.Text_IO;
with Ada.Unchecked_Conversion;

with Audio;
with C_Functions;
with Command_And_Token_Functions; use Command_And_Token_Functions;
with Commands;
with Console;
with Draw;
with Editor;
with File_IO;
with Flash;
with Global;
with M_Misc;
with Memory;
with Support;

package body M_Basic is

   --     Save_Local_Index   : Natural := 0;
   --     Trace_On : Boolean := False;

   procedure Clear_Runtime;
   procedure Skip_Element (aLine : String; Pos : in out Positive);
   procedure Skip_Spaces (aLine : String; Pos : in out Positive);

   --  Check_String checks if the next text in an element (a basic statement)
   --  corresponds to an alpha string.
   --  Leading white space is skipped and the string must be terminated with a
   --  valid terminating character
   --  (space, null, comma, opening bracket or comment).
   --  Check_String returns a pointer to the next non space character
   --  after the matched string if found or 0 otherwise.
   function Check_String (aString, Token : String) return Natural is
      use Ada.Characters.Handling;
      S_Pos  : Positive := 1;
      T_Pos  : Positive := 1;
      Result : Natural := 0;
   begin
      Skip_Spaces (aString, S_Pos);
      while T_Pos <= Token'Length and then
        To_Upper (Token (T_Pos)) = To_Upper (aString (S_Pos)) loop
         S_Pos := S_Pos + 1;
         T_Pos := T_Pos + 1;
      end loop;

      if T_Pos = Token'Length then
         if aString (S_Pos) = ' ' or else aString (S_Pos) = ''' or else
           aString (S_Pos) = '\'  or else aString (S_Pos) = '(' then
            Skip_Spaces (aString, S_Pos);
            Result := S_Pos;
         end if;
      end if;

      return Result;

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
      Audio.Vol_Left := 100;
      Audio.Vol_Right := 100;
      Commands.Option_Error_Skip := 0;
      File_IO.Option_File_Error_Abort := True;
      --  Subfunctions contains pointers to program memory elenments
      for index in Subfunctions'Range loop
         Subfunctions (Index) := 0;
      end loop;

   end Clear_Runtime;

   pragma Warnings (Off);
   function Copy_To_Mod is new
     Ada.Unchecked_Conversion (Flash.UB_String_Access, Modular);

   function Copy_From_Mod is new
     Ada.Unchecked_Conversion (Modular, Flash.UB_String_Access);
   pragma Warnings (On);

   --  Defined_Subfunction function is responsible for executing a defined
   --  subroutine or function.
   --  isfun is true when executing a function.
   --  Command_Ptr is a pointer to the command name in program memory that is
   --              used by the caller.
   --  Index       is an index into subfun[i] which points to the definition of
   --              the subroutine or function.
   --  fa, i64a, sa and typ are pointers to where the return value is to be
   --                       stored (used by functions only).
   procedure Defined_Subfunction
     (Buffer        : String_Buffer; Is_Fun : Boolean; Command : String;
      Subfun_Index  : Positive; Fa     : in out Configuration.MMFLOAT;
      I64a          : in out Long_Long_Integer;
      Sa            : in out Unbounded_String;
      Fun_Type      : in out Function_Type) is
      use Interfaces;
      use Ada.Characters.Handling;
      use Ada.Assertions;
      use C_Functions;
      use Flash;
      use Global;
      Routine_Name       : constant String := "M_Basic.Defined_Subfunction ";
      Callers_Line_Ptr   : constant Natural := Current_Line_Ptr;
      --  Sub_Line_Ptr is pointer to a program memory elenment
      Sub_Line_Ptr       : constant Natural := Subfunctions (Subfun_Index);
      SL_Pos             : Positive := 1;      --  p points to Subfunctions
      --  character
      SL_Pos2            : Positive;           --  ttp
      SL_Pos3            : Positive;           --  pp
      Fun_Name           : Unbounded_String;
      Fun_Name_Pos       : Positive := 1;      --  tp
      I_Tmp              : Long_Long_Integer;
      --        Sub_Name : constant Unbounded_String := To_Unbounded_String (Name);
      Found              : Boolean := False;
   begin
      Assert (Sub_Line_Ptr > 0, Routine_Name & "Sub_Line_Ptr = 0");
      Fun_Type := T_NOTYPE;
      --  462
      Skip_Spaces (SL_Pos);
      SL_Pos2 := SL_Pos;
      --  465 copy the sub/fun name from the definition into temp storage and
      --  terminate.
      --  SL_Pos is left pointing to the end of the sub/fun name
      --  (ie, the start of the argument list in the definition)
      Current_Line_Ptr := Sub_Line_Ptr;
      Append (Fun_Name, To_String (Prog_Memory (SL_Pos)));
      SL_Pos := SL_Pos + 1;
      Fun_Name_Pos := Fun_Name_Pos + 1;
      Put_Line (Routine_Name & "465 Subfun_Index; " &
                  Integer'Image (Subfun_Index));
      Put_Line (Routine_Name & "465 Sub_Line_Ptr; " &
                  Integer'Image (Sub_Line_Ptr));

      --  473
      if Command (Command'First) = '$' or else
        Command (Command'First) = '%' or else
        Command (Command'First) = '!' then
         Assert (Is_Fun, Routine_Name & "Type specification is invalid:");

         Fun_Name := Fun_Name & Command (Command'First);
         SL_Pos := SL_Pos + 1;
      end if;
      Fun_Name_Pos := Command'First + 1;

      --  484 Subfunctions contains pointers to program memory elenments
      Assert (not Is_Fun or else Command (Fun_Name_Pos) = '(' or else
              Prog_Memory (Subfunctions (Sub_Line_Ptr)) = cmdCFUN,
              Routine_Name & "Function definition");

      --  488 Find the end of the caller's identifier, Fun_Name_Pos is left pointing to
      --  the start of the caller's argument list
      Current_Line_Ptr := Callers_Line_Ptr;

      Fun_Name_Pos := 2;
      while Fun_Name_Pos < Integer (Length (Fun_Name)) and then
        Is_Name_Character (Element (Fun_Name, Fun_Name_Pos)) loop
         Fun_Name_Pos := Fun_Name_Pos + 1;
      end loop;

      Put_Line (Routine_Name & "check Type specification for Fun_Name_Pos: " &
                  Integer'Image (Fun_Name_Pos));
      Put_Line (Routine_Name & "Fun_Name length: " &
                  Integer'Image (Integer (Length (Fun_Name))));
      --  477
      if Element (Fun_Name, Fun_Name_Pos) = '$' or else
        Element (Fun_Name, Fun_Name_Pos) = '%' or else
        Element (Fun_Name, Fun_Name_Pos) = '!' then
         Assert (Is_Fun, Routine_Name & "Type specification is invalid");
      else
         Append (Fun_Name, Command (SL_Pos));
         SL_Pos := SL_Pos + 1;
         Fun_Name_Pos := Fun_Name_Pos + 1;
      end if;

      --  499
      Assert (To_Upper (To_String (Prog_Memory (SL_Pos - 1))(1)) =
                To_Upper (Element (Fun_Name, Fun_Name_Pos - 1)),
              Routine_Name & "Inconsistent type suffix");

      --  503 If this is a function we check to find if the function's type
      --  has been specified with AS <type> and save it.
      Current_Line_Ptr := Sub_Line_Ptr;
      Fun_Type := T_NOTYPE;
      if Is_Fun then
         SL_Pos2 := Skip_Var (SL_Pos2);
         Skip_Spaces (SL_Pos2);
         if Prog_Memory (Subfunctions (SL_Pos2)) = Integer'Image (tokenAS) then
            SL_Pos2 := SL_Pos2 + 1;
            Commands.Check_Type_Specified (Buffer, SL_Pos2, Fun_Type, True);
            Assert (Fun_Type = T_IMPLIED, Routine_Name & "invalid type");
         end if;
         Fun_Type := Fun_Type or V_FIND or V_DIM_VAR or V_LOCAL or V_EMPTY_OK;
      end if;

      --  511 from now on Fun_Name_Pos (tp) points to the caller's argument list
      --      SL_Pos   (p) points to the Prog_Memory argument list
      --                  for the definition.
      Skip_Spaces (SL_Pos);
      Skip_Spaces (Fun_Name, Fun_Name_Pos);
      Put_Line (Routine_Name & "511 Sub_Line_Ptr: " &
                  Integer'Image (Sub_Line_Ptr));

      if Prog_Memory (Sub_Line_Ptr) = cmdCFUN then
         Put_Line (Routine_Name & "521");
         --  521
         if Command (Fun_Name_Pos) = ')' then
            SL_Pos3 := SL_Pos;
            Found := Prog_Memory (SL_Pos3) /= ")" and then
              Prog_Memory (SL_Pos3) /= "0";
            while not Found loop
               SL_Pos3 := SL_Pos3 + 1;
               Found := Prog_Memory (SL_Pos3) /= ")" and then
                 Prog_Memory (SL_Pos3) /= "0";
            end loop;

            Assert (Found, Routine_Name & "syntax error, ) or 0 expected.");
            SL_Pos3 := SL_Pos3 + 1;
            Skip_Spaces (SL_Pos3);
            Commands.Check_Type_Specified (Buffer, SL_Pos3, Fun_Type, False);
            Fun_Type := Fun_Type and not T_IMPLIED;
         else
            Fun_Type := T_INT;
         end if;

         --  537
         case Fun_Type is
            when T_INT => I64a :=
                 Call_CFunction (Sub_Line_Ptr, Fun_Name_Pos, SL_Pos,
                                 Callers_Line_Ptr);
            when T_NBR => I_Tmp :=
                 Call_CFunction (Sub_Line_Ptr, Fun_Name_Pos, SL_Pos,
                                 Callers_Line_Ptr);
               Fa := Configuration.MMFLOAT (I_Tmp);
            when T_STR => Sa :=
                 Call_CFunction (Sub_Line_Ptr, Fun_Name_Pos, SL_Pos,
                                 Callers_Line_Ptr);
               Fa := Configuration.MMFLOAT (I_Tmp);
            when others =>
               Assert (False, Routine_Name & "function name: " &
                         Element (Fun_Name, Fun_Name_Pos));
         end case;
      end if;

      --  553
      Memory.Temp_Memory_Is_Changed := True;
      Put_Line (Routine_Name & "done");

   end Defined_Subfunction;

   procedure Execute_Command (Buffer : String_Buffer; Command : Unbounded_String) is
      use Interfaces;
      use Ada.Assertions;
      use String_Buffer_Package;
      Routine_Name       : constant String := "M_Basic.Execute_Command ";
      Command_Line       : constant String := To_String (Command);
      Next_Statement_Pos : Positive := 1;
      Command_Line_Pos   : Positive := 1;   --  p
      Token              : Integer;
      Null_Function      : Function_Type := T_NOTYPE;
      --        Command_Token      : Unbounded_String;
      Fa                 : Configuration.MMFLOAT := 0.0;
      I64a               : Long_Long_Integer := 0;
      Sa                 : Unbounded_String := To_Unbounded_String ("");
      Index              : Positive;
      Save_Local_Index   : Natural := 0;
      Interupt_Check     : Integer := 0;
      T_Arg              : Function_Type := T_NOTYPE;
      Command_Ptr        : Command_And_Token_Functions.Access_Procedure;
      No_Abort           : Boolean := True;
      Done               : Boolean := False;
   begin
      Put_Line (Routine_Name);
      --  228
      Skip_Spaces (Command_Line, Command_Line_Pos);
      Skip_Element (Command_Line, Next_Statement_Pos);
      Done := Command_Line_Pos >= Flash.Prog_Memory'Length or else
        Command_Line (Command_Line_Pos) = '\';  --  ignore comment line

      if Done then
         Put_Line (Routine_Name & "No more token buffer elements");
      else
         if Command_Line (Command_Line_Pos) /= '0' and then
           Command_Line (Command_Line_Pos) /= ''' then
            --  239
            --              if setjmp (ErrNext) = 0 then
            Save_Local_Index := Local_Index;
            Token := Integer'Value (Element (Buffer, Command_Line_Pos));
            --  C_Base_Token is the base of the token numbers.
            Put_Line (Routine_Name & "239 Token > C_Base_Token: " &
                        Boolean'Image (Token > M_Misc.C_Base_Token ));
            --              Put_Line
            --                (Routine_Name & "Token - C_Base_Token < Command_Table_Size: "
            --                 & Boolean'Image
            --                   (Token - M_Misc.C_Base_Token < Command_Table_Size));
            --              Put_Line
            --                (Routine_Name & "Command_Table " &
            --                "(Token - C_Base_Token).Command_Type = T_CMD: " &
            --                   Boolean'Image (Token > M_Misc.C_Base_Token ));

            if Token > M_Misc.C_Base_Token and then
              Token - M_Misc.C_Base_Token < Command_Table_Size
              and then Command_Table
                (Token - M_Misc.C_Base_Token).Command_Type = T_CMD
            then
               --  246
               T_Arg := T_CMD;
               --  Execute the command
               Put_Line (Routine_Name &
                           "247 Executing command, Token, Command_Table index: "
                            & Integer'Image (Token) & ", " &
                           Integer'Image (Token - M_Misc.C_Base_Token));
               Command_Ptr :=
                 Command_Table (Token - M_Misc.C_Base_Token).Function_Ptr;
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
            Put_Line (Routine_Name & "268 ");
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

         --  276
         Command_Line_Pos := Next_Statement_Pos;

         Done := (Command_Line (Command_Line_Pos) = '0' and then
                  Command_Line (Command_Line_Pos + 1) = '0') or else
           (Command_Line (Command_Line_Pos) = 'f' and then
            Command_Line (Command_Line_Pos + 1) = 'f');
      end if;

   end Execute_Command;

   procedure Execute_Program (Buffer : String_Buffer) is
      use Global;
      use String_Buffer_Package;
      Routine_Name : constant String := "M_Basic.Execute_Program ";
      Program_Ptr  : Positive := 1;
      Done         : Boolean := False;
   begin
      if not Is_Empty (Buffer) then
         Put_Line (Routine_Name & "Buffer");
         Support.Print_Buffer (Buffer);
         --  194
         Skip_Spaces (Buffer.First_Element, Program_Ptr);
         --           Put_Line (Routine_Name & "Buffer length: " &
         --                       Integer'Image (Positive (Buffer.Last_Index)));
         while not Done and then Program_Ptr <= Positive (Buffer.Last_Index) loop
            if Buffer (Program_Ptr) = "0" then
               Program_Ptr := Program_Ptr + 1;
            end if;

            --  199
            if Buffer (Program_Ptr) = T_NEWLINE then
               Current_Line_Ptr := Program_Ptr;
               Program_Ptr := Program_Ptr + 1;
            end if;

            --  217
            if Buffer (Program_Ptr) = T_LINENBR then
               Program_Ptr := Program_Ptr + 3;
            end if;
            Skip_Spaces (Buffer (Program_Ptr), Program_Ptr);

            if Buffer (1) = T_LABEL then
               --  skip over the label
               Program_Ptr := Program_Ptr +
                 Integer'Value (Element (Buffer, Program_Ptr)) + 2;
               Skip_Spaces (Buffer (Program_Ptr), Program_Ptr);
            end if;

            Put_Line (Routine_Name & "225");
            --  225
            if Program_Ptr <= Positive (Buffer.Length) then
               Execute_Command
                 (Buffer, To_Unbounded_String (Element (Buffer, Program_Ptr)));
            end if;

            --  279
            Done := Buffer.First_Element = "00" and
              Buffer.First_Element = "ff";
            Program_Ptr := Program_Ptr + 1;
         end loop;
      else
         Put_Line (Routine_Name & "Buffer is empty");
      end if;
      Put_Line (Routine_Name & "done");

   exception
      when others =>
         Put_Line (Routine_Name & "exception");
         raise;

   end Execute_Program;

   --  searches the subfun[] table to locate a defined sub or fun
   --  returns with the index of the sub/function in the table or -1 if not found
   --  if type = 0 then look for a sub otherwise a function
   function Find_Subfunction (Token : String; Fun_Type : Function_Type)
                              return Natural is
      use Interfaces;
      use Ada.Characters.Handling;
      use Flash;
      Routine_Name : constant String := "M_Basic.Find_Subfunctionm ";
      Index        : Natural := 0;
      Pos1         : Natural;
      Pos2         : Natural;
      Done         : Boolean := False;
   begin
      --  394
      Put_Line (Routine_Name & "Token: " & Token);
      while not Done and then index < Configuration.MAXSUBFUN loop
         Pos2 := Subfunctions (Index + 1);
         Done := Pos2 = 0;

         if not Done then
            Index := Index + 1;
            if Fun_Type = T_NOTYPE and then
              (Prog_Memory (Pos2) = cmdSUB or Prog_Memory (Pos2) = cmdCSUB) then
               null;
            elsif (Prog_Memory (Pos2) = cmdFUN or
                     Prog_Memory (Pos2) = cmdCFUN) then
               null;
            else
               --  412
               Pos2 := Pos2 + 1;
               Skip_Spaces (Pos2);
               --  418
               if To_Upper (Token) =
                 To_Upper (Integer'Image (Subfunctions (index))) then
                  Pos1 := 2;
                  Pos2 := Pos2 + 1;
                  --  422
                  while Is_Name_Character (Token (Pos1))  and then
                    To_Upper (Token (Pos1)) = To_Upper (Token (Pos2)) loop
                     Pos1 := Pos2 + 1;
                     Pos2 := Pos2 + 1;
                  end loop;

                  Done :=
                    (Prog_Memory (Pos1) = "$" and Prog_Memory (Pos2) = "$")
                    or else
                      (Prog_Memory (Pos1) = "%" and Prog_Memory (Pos2) = "%")
                      or else
                        (Prog_Memory (Pos1) = "!" and Prog_Memory (Pos2) = "!")
                        or else
                          (not Is_Name_Character (Element (Prog_Memory (Pos1), 1)) and
                             not Is_Name_Character (Element (Prog_Memory (Pos2), 1)));
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
      use Flash;
      Ptr     : constant UB_String_Access :=
                  new Unbounded_String'(Prog_Memory (Pos));
      Mod_Ptr : Modular := Copy_To_Mod (Ptr);
   begin
      Mod_Ptr := (Mod_Ptr + 2#11#) and not 2#11#;

      return Copy_From_Mod (Mod_Ptr);

   end Get_C_Fun_Ptr;

   procedure Init_Basic is
      Routine_Name : constant String := "M_Basic.Init_Basic ";
   begin
      Default_Type := T_NBR;
      Clear_Program;
      Put_Line (Routine_Name);
      Command_And_Token_Functions.Init_Operator_Functions;

   end Init_Basic;

   function Is_Line_Num (aChar : Character) return Boolean is
      use Ada.Characters.Handling;
   begin
      return Is_Alphanumeric (aChar);
   end Is_Line_Num;
   pragma Inline (Is_Line_Num);

   function Is_Name_Character (aChar : Character) return Boolean is
      use Ada.Characters.Handling;
      --        Routine_Name : constant String := "M_Basic.Is_Name_Character ";
   begin
      return Is_Alphanumeric (aChar) or else aChar = '_' or else aChar = ':';

   end Is_Name_Character;

   function Is_Name_End (aChar : Character) return Boolean is
   begin
      return Is_Line_Num (aChar) or else aChar = '_' or else
        aChar = '.' or else aChar = '$' or else aChar = '|' or else
        aChar = '%';

   end Is_Name_End;

   function Is_Name_Start (aChar : Character) return Boolean is
      use Ada.Characters.Handling;
      --        Routine_Name : constant String := "M_Basic.Is_Name_Start ";
   begin
      return Is_Alphanumeric (aChar) or aChar = '_';

   end Is_Name_Start;

   procedure Print_String (theString : String) is
   begin
      Put (theString);

   end Print_String;

   --  Prepare_Program_Ext cans one area (main program or the library area)
   --  for user defined subroutines and functions.
   procedure Prepare_Program_Ext
     (User_Mem_Start : Positive; Num_Funcs : in out Natural;
      C_Fun_Ptr      : in out Flash.UB_String_Access; Error_Abort : Boolean) is
      use Ada.Assertions;
      use Flash;
      Routine_Name : constant String := "M_Basic.Prepare_Program_Ext ";
      Pos          : Positive := User_Mem_Start;
      C_Fun_Pos    : Natural;
      Data         : Unbounded_String;
      Skip         : Boolean := False;
   begin
      while Prog_Memory (Pos) /= "ff" loop
         Get_Next_Command (Pos, Current_Line_Ptr, "");
         if Pos > 0 then
            if Prog_Memory (Pos) = cmdSUB or else
              Prog_Memory (Pos) = cmdFUN or else
              Prog_Memory (Pos) = cmdCFUN or else
              Prog_Memory (Pos) = cmdCSUB then
               Assert (Num_Funcs <= Configuration.MAXSUBFUN, Routine_Name &
                         "Too many subroutines and functions");
               Subfunctions (Num_Funcs) := Pos;
               Num_Funcs := Num_Funcs + 1;
               Pos := Pos + 1;
               Skip_Spaces (Pos);

               if Is_Name_Start (Element (Prog_Memory (Pos), 1)) then
                  while Element (Prog_Memory (Pos), 1) /= '0' loop
                     Pos := Pos + 1;
                  end loop;
               else
                  Assert (not Error_Abort, Routine_Name & "Invalid identifier");
                  Num_Funcs := Num_Funcs - 1;
                  Skip := True;
               end if;
            end if;
         end if;

         if Skip then
            Skip := False;
         else
            while Prog_Memory (Pos) /= "0" loop
               Pos := Pos + 1;
            end loop;
         end if;
      end loop;
      --  FF  detected, all token bufferr subroutines and functions processed.

      --  the end of the program can have multiple zeros
      if Pos >= Prog_Memory'Length then
         Put_Line (Routine_Name & "unexpected program end");
      else
         while Element (Prog_Memory (Pos), 1) /= '0' loop
            Pos := Pos + 1;
         end loop;
         Pos := Pos + 1;

         --  CFunction flash (if it exists) starts on the next word address-
         --  after the program in flash
         C_Fun_Ptr := Get_C_Fun_Ptr (Pos);
         if Num_Funcs <= Configuration.MAXSUBFUN then
            Subfunctions (Num_Funcs) := 0;
         end if;
         Current_Line_Ptr := 0;

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
            --           C_Fun_Ptr := C_Fun_Ptr + (C_Fun_Ptr.all)'Length;
         end loop;
      end if;

   end Prepare_Program_Ext;

   procedure Prepare_Program (Error_Abort : Boolean) is
      use Ada.Assertions;
      use Ada.Characters.Handling;
      use Configuration;
      use Draw;
      use Flash;
      Routine_Name : constant String := "M_Basic.Prepare_Program ";
      Num_Funcs    : Positive := 1;
      Index1       : Positive := 1;
      Index2       : Natural := 0;
      Pos1         : Positive;
      Pos2         : Positive;
      Done         : Boolean := False;
   begin
      for index in FONT_BUILTIN_NBR .. FONT_TABLE_SIZE loop
         Font_Table (index) := Null_Unbounded_String;
      end loop;

      C_Function_Flash := null;
      C_Function_Library := null;

      if Option.Program_Flash_Size /= PROG_FLASH_SIZE then
         Prepare_Program_Ext
           (Prog_Memory'Length + Option.Program_Flash_Size, Num_Funcs,
            C_Function_Library, False);
      end if;

      Prepare_Program_Ext (Prog_Memory'Length, Num_Funcs, C_Function_Flash,
                           False);

      if Error_Abort then
         while Index1 < MAXSUBFUN and then
           Subfunctions (Index1) > 0 loop
            Index2 := Index1;
            while Index2 < MAXSUBFUN and then
              Subfunctions (Index2) > 0 loop
               Index2 := Index1 + 1;
               Pos1 := Subfunctions (Index1);
               Current_Line_Ptr := Pos1;
               Pos1 := Pos1 + 1;
               Skip_In_Buffer_Spaces (Pos1);

               Pos2 := Subfunctions (Index2);
               Pos2 := Pos2 + 1;
               Skip_In_Buffer_Spaces (Pos2);

               while not Done loop
                  Assert (Is_Name_Character (Get_Input_Character (Pos1)) or else
                          Is_Name_Character (Get_Input_Character (Pos2)),
                          Routine_Name & "error duplicate name.");
                  Done := To_Upper (Get_Input_Character (Pos1)) /=
                    To_Upper (Get_Input_Character (Pos2));
                  if not Done then
                     Pos1 := Pos1 + 1;
                     Pos2 := Pos2 + 1;
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

      Buffer :=  Updated;

   end Remove_Spaces;

   procedure Save_Program_To_Flash (Buffer: String; Msg : Boolean) is
   begin
      null;
   end Save_Program_To_Flash;

   --  Skip_Element skips to the the zero char that preceeds an element
   procedure Skip_Element (aLine : String;
                           Pos   : in out Positive) is
   begin
      while Pos < aLine'Length and then aLine (Pos) /= '0' loop
         Pos := Pos + 1;
      end loop;

   end Skip_Element;

   procedure Skip_Spaces (Buffer : Unbounded_String; Pos : in out Positive) is
   begin
      while Element (Buffer, Pos) = ' ' loop
         Pos := Pos + 1;
      end loop;

   end Skip_Spaces;

   procedure Skip_Spaces (aLine : String; Pos : in out Positive) is
   begin
      while Pos < aLine'Length and then aLine (Pos) = ' ' loop
         Pos := Pos + 1;
      end loop;

   end Skip_Spaces;

   --  2413 Skip_Var skips to the end of a variable
   function Skip_Var (Pos : in out Positive) return Positive is
      use Interfaces;
      use Ada.Assertions;
      Routine_Name : constant String := "M_Basic.Skip_Var ";
      Pos2         : constant Positive := Pos;
      Pos3         : Positive;
      Index        : Positive;
      In_Quote     : Boolean := False;
      Done         : Boolean;
   begin
      if Get_Input_Character (Pos) = ' ' then
         Pos := Pos + 1;
      end if;

      if Is_Name_Start (Get_Input_Character (Pos)) then
         while Is_Name_Character (Get_Input_Character (Pos)) loop
            Pos := Pos + 1;
         end loop;

         --  2429 check the terminating char.
         if not (Get_Input_Character (Pos) = '$') and then
           not (Get_Input_Character ( Pos) = '%') and then
           not (Get_Input_Character (Pos) = '|') then
            Pos := Pos - 1;
         end if;

         Assert (Pos2 - Pos < Configuration.MAXVARLEN,
                 Routine_Name & "Variable name " &
                   Get_Input_Slice (Pos, Pos2) & " is too long");

         Pos3 := Pos;
         if Get_Input_Character (Pos3) = ' ' then
            Pos3 := Pos3 + 1;
         end if;

         if Get_Input_Character (Pos3) = '(' then
            Pos := Pos3;
         end if;

         if Get_Input_Character (Pos) = '(' then
            --  2445 this is an array
            Pos := Pos + 1;
            Assert (Pos2 - Pos < Configuration.MAXVARLEN,
                    Routine_Name & "Variable name " &
                      Get_Input_Slice (Pos, Pos2) & " is too long");

            --  2456 Step over the array parameters keeping track of
            --  nested brackets.
            Index := 1;
            Done := False;
            while not Done loop
               if Get_Input_Character (Pos) = '"' then
                  In_Quote := not In_Quote;
               end if;

               if Pos = Input_Buffer_Length then

                  Assert (Pos >= Input_Buffer_Length,
                          Routine_Name & "Expected closing bracket.");

                  Done := not In_Quote and then
                    Get_Input_Character (Pos) = ')' and then
                    Index = 1;

                  if not Done and then
                    (Get_Input_Character (Pos) = '(' or else
                     Token_Type (Pos) = T_FUN) then
                     Index := Index + 1;
                  end if;

                  Pos := Pos + 1;
               end if;
               Pos := Pos + 1;
            end loop;

         end if;
      end if;

      return Pos2;

   end Skip_Var;

end M_Basic;
