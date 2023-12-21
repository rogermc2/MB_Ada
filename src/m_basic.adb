
with Interfaces;

with Ada.Assertions;
with Ada.Characters.Handling;
with Ada.Strings;
with Ada.Text_IO; use Ada.Text_IO;
with Ada.Unchecked_Conversion;

with C_Functions;
with Command_And_Token_Functions;
with Commands;
with Draw;
with Editor;
with Flash;
with Global;
WITH M_Misc;
with Memory;
with Parse_Functions;

package body M_Basic is

   --     Trace_On : Boolean := False;

   procedure Clear_Runtime;

   procedure Clear_Program is
   begin
      Clear_Runtime;
      Editor.Init_Editor;
      --        Trace_On := False;
   end Clear_Program;

   procedure Clear_Runtime is
   begin
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

   procedure Defined_Subfunction
     (Is_Fun : Boolean; Command_Ptr : Positive; Index  : Positive;
      Fa     : in out Configuration.MMFLOAT; I64a : in out Long_Long_Integer;
      Sa     : in out Unbounded_String; Fun_Type : in out Function_Type) is
      use Ada.Characters.Handling;
      use Ada.Assertions;
      use C_Functions;
      use Command_And_Token_Functions;
      use Global;
      use String_Buffer_Package;
      Routine_Name       : constant String := "M_Basic.Defined_Subfunction";
      --        Command            : constant String := Element (Token_Buffer, Command_Ptr);
      Callers_Line_Ptr   : constant Positive := Current_Line_Ptr;
      Sub_Line_Ptr       : constant Positive := Subfunctions (Index);
      Pos                : Positive := Sub_Line_Ptr + 1;  --  p
      Pos2               : Positive;                      --  ttp
      Pos3               : Positive;                      --  pp
      Fun_Name           : String_Buffer;
      Name_Ptr           : Positive;                      --  tp
      I_Tmp              : Long_Long_Integer;
      --        Sub_Name : constant Unbounded_String := To_Unbounded_String (Name);
      Found              : Boolean := False;
   begin
      Fun_Type := T_NOTYPE;
      Skip_Token_Buffer_Spaces (Pos);
      Pos2 := Pos;
      Current_Line_Ptr := Sub_Line_Ptr;
      Append (Fun_Name, Get_Token_Buffer_Item (Pos));
      Pos := Pos + 1;
      Name_Ptr := 1;

      if Get_Token_Buffer_Item (Pos) = "$" or else
        Get_Token_Buffer_Item (Pos) = "%" or else
        Get_Token_Buffer_Item (Pos) = "!" then
         Assert (Is_Fun, Routine_Name & "Type specification is invalid:");

         Append (Fun_Name, Get_Token_Buffer_Item (Pos));
         Pos := Pos + 1;
         Name_Ptr := Name_Ptr + 1;
      end if;
      --        Assert (Is_Fun and then Element (Token_Buffer, Pos) = "(" and then
      --                Subfunctions (Sub_Line_Ptr) = cmdCFUN,
      --                Routine_Name & "Function definition");

      --  479 Find the end of the caller's identifier, Name_Ptr is left pointing to
      --  the start of the caller's argument list
      Current_Line_Ptr := Callers_Line_Ptr;

      Name_Ptr := Command_Ptr + 1;
      while Is_Name_Character (Element (Fun_Name, Name_Ptr) (1)) loop
         Name_Ptr := Name_Ptr + 1;
      end loop;

      Assert (Is_Fun and then Element (Fun_Name, Name_Ptr) /= "$" and then
              Element (Fun_Name, Name_Ptr) /= "%" and then
              Element (Fun_Name, Name_Ptr) /= "!",
              Routine_Name & "Type specification is invalid");

      --  490
      Pos := Pos + 1;
      Assert (To_Upper (Get_Token_Buffer_Item (Pos - 1)) =
                To_Upper (Element (Fun_Name, Name_Ptr - 1)),
              Routine_Name & "Inconsistent type suffix");

      --  494 If this is a function we check to find if the function's type
      --  has been specified with AS <type> and save it.
      Current_Line_Ptr := Sub_Line_Ptr;
      Fun_Type := T_NOTYPE;
      if Is_Fun then
         Pos2 := Skip_Var (Pos2);
         Skip_Token_Buffer_Spaces (Pos2);
         if Get_Token_Buffer_Item (Pos2) = Integer'Image (tokenAS) then
            Pos2 := Pos2 + 1;
            Commands.Check_Type_Specified (Pos2, Fun_Type, True);
            Assert (Fun_Type = T_IMPLIED, Routine_Name & "invalid type");
         end if;
         Fun_Type := Fun_Type or V_FIND or V_DIM_VAR or V_LOCAL or V_EMPTY_OK;
      end if;

      --  511 from now on Name_Ptr (tp) = the caller's argument list
      --                  Pos      (p)  = the argument list for the definition
      Skip_Token_Buffer_Spaces (Pos);
      Skip_Spaces (Fun_Name, Name_Ptr);

      if Get_Token_Buffer_Item (Sub_Line_Ptr) = cmdCFUN then
         --  521
         --           Skip_Spaces (Token_Buffer, Pos);
         if Get_Token_Buffer_Item (Pos) = ")" then
            Pos3 := Pos;
            Found := Get_Token_Buffer_Item (Pos3) /= ")" and then
              Get_Token_Buffer_Item (Pos3) /= "0";
            while not Found loop
               Pos3 := Pos3 + 1;
               Found := Get_Token_Buffer_Item (Pos3) /= ")" and then
                 Get_Token_Buffer_Item (Pos3) /= "0";
            end loop;

            Assert (Found, Routine_Name & "syntax error, ) or 0 expected.");
            Pos3 := Pos3 + 1;
            Skip_Token_Buffer_Spaces (Pos3);
            Commands.Check_Type_Specified (Pos3, Fun_Type, False);
            Fun_Type := Fun_Type and not T_IMPLIED;
         else
            Fun_Type := T_INT;
         end if;

         --  537
         case Fun_Type is
            when T_INT => I64a :=
                 Call_CFunction (Sub_Line_Ptr, Name_Ptr, Pos, Callers_Line_Ptr);
            when T_NBR => I_Tmp :=
                 Call_CFunction (Sub_Line_Ptr, Name_Ptr, Pos, Callers_Line_Ptr);
               Fa := Configuration.MMFLOAT (I_Tmp);
            when T_STR => Sa :=
                 Call_CFunction (Sub_Line_Ptr, Name_Ptr, Pos, Callers_Line_Ptr);
               Fa := Configuration.MMFLOAT (I_Tmp);
            when others =>
               Assert (False, Routine_Name & "function name: " &
                         Element (Fun_Name, Name_Ptr));
         end case;
      end if;

      --  553
      Memory.Temp_Memory_Is_Changed := True;

   end Defined_Subfunction;

   procedure Execute_Command (Token_Ptr : in out Positive) is
      use Ada.Assertions;
      Routine_Name       : constant String := "M_Basic.Execute_Command";
      Next_Statement_Ptr : Positive := Token_Ptr + 1;
      Command_Line_Ptr   : Positive := Token_Ptr + 1;
      Null_Function      : Function_Type := T_NA;
      Fa                 : Configuration.MMFLOAT := 0.0;
      I64a               : Long_Long_Integer := 0;
      Sa                 : Unbounded_String := To_Unbounded_String ("");
      Index              : Positive;
      Done               : Boolean := False;
   begin
      --  228
      Skip_Token_Buffer_Spaces (Command_Line_Ptr);
      Skip_Token_Buffer_Element (Next_Statement_Ptr);

      while not Done loop
         if Integer'Value (Get_Token_Buffer_Item (Token_Ptr)) /= 0 and then
           Get_Token_Buffer_Item (Token_Ptr) /= "'" then
            --  239 Do setjmp
            --           if Set_Jump (Err_Next) = 0 then
            --              null;
            --           else  --  249 do non-local jump
            Assert (Is_Name_Start (Get_Token_Buffer_Item (Token_Ptr)(1)),
                    Routine_Name &"Invalid character ");
            Index :=
              Find_Subfunction (Get_Token_Buffer_Item (Token_Ptr), T_NA);
            if Index > 0 then
               Defined_Subfunction (False, Token_Ptr, Index,
                                    Fa, I64a, Sa, Null_Function);
            end if;

            --           end if;

            --  268
            --           if Option_Error_Skip > then
            --              Option_Error_Skip := Option_Error_Skip - 1;
            --           end if;

            --           if Temp_Memory_Has_Changed then
            --              Clear_Temp_Memory;
            --           end if;

            --           Check_Abort;
            --           Check_Interrupt;
            --        end if;

            --  276
            Token_Ptr := Next_Statement_Ptr;
         end if;

         Done := Get_Token_Buffer_Item (1) = "00" or else
           Get_Token_Buffer_Item (1) = "FF";

      end loop;

   end Execute_Command;

   procedure Execute_Program is
      use Global;
      Token_Ptr : Positive := 1;
      Done      : Boolean := False;
   begin
      Put_Line ("M_Basic.Execute_Program ");
      --  194
      Skip_Token_Buffer_Spaces (Token_Ptr);

      if Token_Buffer_Not_Empty then
         while not Done and then Token_Ptr <= Positive (Token_Buffer_Length) loop
            if Get_Token_Buffer_Item (Token_Ptr) = "0" then
               token_Ptr := Token_Ptr + 1;
            end if;

            --  199
            if Get_Token_Buffer_Item (Token_Ptr) = T_NEWLINE then
               Current_Line_Ptr := Token_Ptr;
               Token_Ptr := Token_Ptr + 1;
            end if;

            --  217
            if Get_Token_Buffer_Item (Token_Ptr) = T_LINENBR then
               Token_Ptr := Token_Ptr + 3;
            end if;
            Skip_Token_Buffer_Spaces (Token_Ptr);

            if Get_Token_Buffer_Item (1) = T_LABEL then
               --  skip over the label
               Token_Ptr := Integer'Value (Get_Token_Buffer_Item (2)) + 2;
               Skip_Token_Buffer_Spaces (Token_Ptr);
            end if;

            if Integer'Value (Get_Token_Buffer_Item (1)) /= 0 then
               Execute_Command (Token_Ptr);
            end if;

            Done := Get_Token_Buffer_Item (1) /= "00" and
              Get_Token_Buffer_Item (1) /= "FF";
            Token_Ptr := Token_Ptr + 1;
         end loop;
      end if;

   end Execute_Program;

   --  searches the subfun[] table to locate a defined sub or fun
   --  returns with the index of the sub/function in the table or -1 if not found
   --  if type = 0 then look for a sub otherwise a function
   function Find_Subfunction (Token : String; Fun_Type : Function_Type)
                              return Natural is
      use Command_And_Token_Functions;
      use Ada.Characters.Handling;
      use Flash;
      --        Routine_Name : constant String := "M_Basic.Find_Subfunction";
      Index    : Natural := 0;
      Pos1     : Natural;
      Pos2     : Natural;
      Done     : Boolean := False;
   begin
      --  394
      while not Done and then index < Configuration.MAXSUBFUN loop
         Index := Index + 1;
         --           Put_Line (Routine_Name & "Index "& Integer'Image (Index));
         Pos2 := Subfunctions (index);
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

               Done := (Prog_Memory (Pos1) = "$" and Prog_Memory (Pos2) = "$")
                 or else
                   (Prog_Memory (Pos1) = "%" and Prog_Memory (Pos2) = "%")
                   or else
                     (Prog_Memory (Pos1) = "!" and Prog_Memory (Pos2) = "!")
                     or else
                       (not Is_Name_Character (Element (Prog_Memory (Pos1), 1)) and
                          not Is_Name_Character (Element (Prog_Memory (Pos2), 1)));
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
   begin
      return Is_Alphanumeric (aChar) or else aChar = '_' or else aChar = ':';

   end Is_Name_Character;

   function Is_Name_Start (aChar : Character) return Boolean is
      use Ada.Characters.Handling;
   begin
      return Is_Alphanumeric (aChar) or aChar = '_';

   end Is_Name_Start;

   function Is_Name_End (aChar : Character) return Boolean is
   begin
      return Is_Line_Num (aChar) or else aChar = '_' or else
        aChar = '.' or else aChar = '$' or else aChar = '|' or else
        aChar = '%';

   end Is_Name_End;

   procedure Parse_Line (Pos : Positive) is
      use Ada.Characters.Handling;
      use Parse_Functions;
      Buff_Length    : constant Positive := Input_Buffer_Length;
      Ptr            : Positive := Pos;
      aChar          : Character;
      First_Nonwhite : Boolean := True;
      Label_Valid    : Boolean := True;
   begin
      while Ptr <= Buff_Length loop
         aChar := Get_Input_Character (Ptr);
         if aChar = ' ' then
            Ptr := Ptr + 1;
         elsif aChar = '"' then
            Process_Double_Quote (Ptr, aChar);
         elsif aChar = ''' then
            Process_Quote (Ptr);
         elsif aChar = ':' then
            Process_Colon (Ptr, First_Nonwhite);
         elsif Is_Digit (aChar) or aChar = '.' then
            --  not white space or string or comment so try a number
            Process_Try_Number (Ptr);
         elsif First_Nonwhite then
            Process_First_Nonwhite (Ptr, Label_Valid, First_Nonwhite);
            --  892 not First_Nonwhite
         elsif Try_Function_Or_Keyword (Ptr, First_Nonwhite) then
            null;
         elsif Is_Name_Start (Get_Input_Character (Ptr)) then
            --  934
            Process_Variable_Name (Ptr, First_Nonwhite, Label_Valid);
         elsif Get_Input_Character (Ptr) = '(' then
            --  953 special case where the character to copy is an
            --  opening parenthesis.
            --  Search back to see if the previous non space char was the end
            --  of an identifier.
            --  If it is, remove any spaces following the identifier to enable
            --  programmers to put spaces after function names or
            --  array identifiers without causing confusing errors.
            null;
         end if;

      end loop;

   end Parse_Line;

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
      use Command_And_Token_Functions;
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
      end if;

      --  CFunction flash (if it exists) starts on the next word address-
      --  after the program in flash
      C_Fun_Ptr := Get_C_Fun_Ptr (Pos);
      if Num_Funcs <= Configuration.MAXSUBFUN then
         Subfunctions (Num_Funcs) := 0;
      end if;
      Current_Line_Ptr := 0;
      Put_Line (Routine_Name & "looking for fonts");

      --  380 step through the CFunction area looking for fonts to add to the
      --  font table.
      C_Fun_Pos := 0;
      while C_Fun_Ptr.all /= "ffffffff" loop
         Put_Line (Routine_Name & "C_Fun_Pos:" & Integer'Image (C_Fun_Pos));
         C_Fun_Pos := C_Fun_Pos + 1;
         if C_Fun_Pos <= Draw.FONT_TABLE_SIZE then
            Data := C_Fun_Ptr.all;
            Draw.Font_Table (C_Fun_Pos) :=
              To_Unbounded_String (Slice (Data, 3, Length (Data)));
         end if;
         C_Fun_Pos := C_Fun_Pos + 1;
         --           C_Fun_Ptr := C_Fun_Ptr + (C_Fun_Ptr.all)'Length;
      end loop;
      Put_Line (Routine_Name & "done");

   end Prepare_Program_Ext;

   procedure Prepare_Program (Error_Abort : Boolean) is
      use Ada.Assertions;
      use Ada.Characters.Handling;
      use Configuration;
      use Draw;
      use Flash;
      Routine_Name : constant String := "M_Basic.Prepare_Program ";
      Num_Funcs    : Positive := 1;
      --        Dump         : Natural := 0;
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

   --  Skip_Element skips to the the zero char that preceeds an element
   --     procedure Skip_Element (Buffer : String_Buffer; Pos : in out Positive) is
   --        use String_Buffer_Package;
   --     begin
   --        while  Integer'Value (Element (Buffer, Pos)) /= 0 loop
   --           Pos := Pos + 1;
   --        end loop;
   --
   --     end Skip_Element;

   procedure Skip_Spaces (Buffer : Unbounded_String; Pos : in out Positive) is
   begin
      while  Element (Buffer, Pos) = ' ' loop
         Pos := Pos + 1;
      end loop;

   end Skip_Spaces;

   --  2413 Skip_Var skips to the end of a variable
   function Skip_Var (Pos : in out Positive) return Positive is
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

   function Token_Function (Index : Positive) return System.Address is

   begin
      if Index >= M_Misc.C_Base_Token and then
        Index < Token_Table'Length then
         return Token_Table (Index - M_Misc.C_Base_Token + 1).Function_Ptr;
      else
         return Token_Table (Token_Table'First).Function_Ptr;
      end if;

   end Token_Function;

   procedure Tokenize (From_Console : Boolean) is
      use Interfaces;
      use Ada.Characters.Handling;
      use Ada.Strings;
      aChar          : Character;
      In_Ptr         : Positive := 1;
      Line_Num       : Unsigned_64;
      OK             : Boolean := True;
   begin
      --  make sure that only printable characters are in the line
      for index in 1 .. Input_Buffer_Length loop
         aChar := Get_Input_Character (index);
         if Character'Pos (aChar) < 32 or Character'Pos (aChar) > 127 then
            Replace_In_Buffer_Character (index, ' ');
         end if;
      end loop;

      Clear_Token_Buffer;
      if not From_Console then
         Token_Buffer_Append (Global.T_NEWLINE);
      end if;
      Trim_Input_Buffer (Left);

      --  if it a digit and not an 8 digit hex number
      --  (ie, it is CFUNCTION data) then try for a line number
      while OK and then In_Ptr <= 8 loop
         OK := OK and Is_Hexadecimal_Digit (Get_Input_Character (In_Ptr));
         In_Ptr := In_Ptr + 1;
      end loop;

      if Is_Digit (Get_Input_Character (1)) and In_Ptr <= 8 then
         Line_Num := Unsigned_64'Value (Get_Input_Slice (1, In_Ptr - 1));
         if not From_Console and Line_Num > 1 and
           Line_Num <= Unsigned_64 (MAXLINENBR) then
            Token_Buffer_Append (Global.T_LINENBR);
            Token_Buffer_Append (Unsigned_64'Image (Shift_Right (Line_Num, 8)));
            Token_Buffer_Append (Unsigned_64'Image (Line_Num and 16#FF#));
         end if;
      end if;

      --  Process the rest of the line
      Parse_Line (In_Ptr);

   end Tokenize;

end M_Basic;
