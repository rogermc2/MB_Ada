
with Interfaces;

with Ada.Assertions;
with Ada.Characters.Handling;
with Ada.Text_IO; use Ada.Text_IO;

with Command_And_Token_Functions;
with Evaluation;
with Global;
with M_Basic;
with M_Basic_Utilities; use M_Basic_Utilities;
with M_Misc;
with Support;

package body Arguments is

   type Dim_Array is array (1 .. Configuration.MAXDIM) of Integer;

   procedure Do_AA (IP, TP      : in out Natural; Var_I : in out Natural;
                    Name_Length : Natural; I_Free : in out Natural;
                    Tmp         : in out Integer; Name  : Unbounded_String) is
      use Interfaces;
      --        Routine_Name : constant String := "Arguments.Do_AA ";
      Item         : Var_Record;
      TP_Name      : Unbounded_String;
      IP_Name      : Unbounded_String;
      J            : Natural;
      Done         : Boolean := False;
   begin
      --  The variable name is now known and, if it is an array, the parameters
      --  search the table looking for a match.
      --  The search is exitted with:
      --     var_index  the index of the variable and
      --     tmp        the index if we are in a sub/fun (otherwise -1).

      --    var_index < varcnt  means a previously created variable was found.
      --    var_index >= varcnt means no matching variable was found.
      --    tmp                 is always  -1.

      --  If we ARE in a sub/fun:
      --    tmp   is the index of a matching global variable
      --          (or -1 if no global found)
      --    var_index < varcnt  means that a local variable was found
      --    var_index >= varcnt a local variable was not found
      --        (in that case check tmp which might have the index of a global)

      --  In either case:
      --    I_Free contains the index of a free slot that can be used if the
      --    variable needs to be created.

      --  MMBasic 1812
      Var_I := 0;
      while not Done and then Var_I < Var_Count loop
         Var_I := Var_I + 1;
         Item := Element (Var_Table, Var_I);
         if Item.Var_Type = T_NOTYPE then
            I_Free := Var_I;
         else
            TP_Name := Name;
            IP_Name := Item.Name;
            IP := 1;
            TP := 1;
            if IP_Name = TP_Name then
               IP := IP + 1;
               TP := TP + 1;
               J := Name_Length - 4;
               while J > 0 and then IP_Name = TP_Name loop
                  J := J - 4;
                  IP := IP + 1;
                  TP := TP + 1;
               end loop;

               if J = 0 and then (TP >= Length (TP_Name) or else
                                  Name_Length = Configuration.MAXVARLEN) then
                  --  MMBasic 1835 A matching name has been found.
                  Done := Item.Level = 0 and then M_Basic.Local_Index = 0;
               else
                  Tmp := Var_I;
               end if;
            else
               --  MMBasic 1843 this is a subroutine or function.
               Done := Item.Level = M_Basic.Local_Index;
            end if;
         end if;

      end loop;

   end Do_AA;

   function Do_BA (Var_I, V_Index : in out Natural; D_Num : Integer;
                   V_Type         : Function_Type; Name : Unbounded_String;
                   Dim            : Dim_Array; Action  : Function_Type;
                   Result         : out Var_Record) return Boolean is
      use Interfaces;
      use Ada.Assertions;
      use Global;
      use M_Misc;   --  for Option_Base
      Routine_Name : constant String := "Arguments.Do_BA ";
      Item         : Var_Record;
      Item_2       : Var_Record;
      J            : Natural;
      Nbr          : Positive;
      Done         : Boolean := False;
   begin
      --  MMBasic 1870
      if Var_I <= Var_Count then
         Item := Element (Var_Table, Var_I);
         if Length (Item.Name) > 0 then
            Var_Index := Var_I;
            V_Index := Var_I;
            Var_I := 0;
            Done := False;
            while Var_I < Configuration.MAXDIM and then not Done loop
               Var_I := Var_I + 1;
               Item := Element (Var_Table, V_Index);
               Done := Item.Dims (Var_I) /= 0;
               if not Done then
                  if D_Num = -1 then
                     Assert (Var_I /= 0 and then Var_I /= D_Num, Routine_Name &
                               "invalid array dimensions.");
                  end if;

                  --  MMBasic 1888
                  if V_Type = T_NA then
                     Assert (Item.Var_Type /= T_NA and then
                               (Default_Type /= T_NA or else T_IMPLIED /= T_NA),
                             Routine_Name & To_String (Name) &
                               "has been declared already.");
                  else
                     Assert (Item.Var_Type /= T_NA and then V_Type /= T_NA,
                             Routine_Name & To_String (Name) &
                               "has been declared already.");
                  end if;

                  if D_Num = -1 or else Item.Var_Type = T_PTR or else
                    Item.Var_Type = T_STR then
                     --  if it is a string or pointer just return the pointer
                     --  to the data.
                     Result.S := item.S;
                     Done := True;
                  elsif Item.Var_Type = T_INT then
                     --  must be an integer so point to its value
                     Result.Ia := item.Ia;
                     Done := True;

                  else
                     --  must be a straight number (floa).
                     Result.F := item.F;
                     Done := True;
                  end if;

                  if not Done then
                     Assert ((Action and V_DIM_VAR) /= V_DIM_VAR, Routine_Name &
                               "cannot redimension an array.");
                     Item_2 := Element (Var_Table, V_Index);
                     for Var_I in 1 ..D_Num loop
                        Item := Element (Var_Table, Var_I);
                        Assert (Item.Dims (Var_I) <= Item_2.Dims (Var_I) and then
                                Dim (Var_I) > Option_Base, Routine_Name &
                                  "index is out of bounds.");
                     end loop;

                     --  MMBasic 1921
                     Nbr := Dim (1) - Option_Base;
                     J := 1;
                     Item := Element (Var_Table, V_Index);
                     for Var_I in 2 ..D_Num loop
                        J := J * Item.Dims (Var_I - 1) + 1 - Option_Base;
                        Nbr := Nbr + J * (Dim (Var_I) - Option_Base);
                     end loop;

                     --  MMBasic 1930
                     if (Item.Var_Type and T_INT) = T_INT then
                        Result.Ia := Item.Ia;
                        Done := True;
                     else
                        Result.S := Item.S;
                        Done := True;
                     end if;

                  end if;
               end if;
            end loop;
         end if;
      end if;

      return Done;

   end Do_BA;

   procedure Do_YA (Expression : Unbounded_String; Pos : in out Positive;
                    V_Type     : in out Function_Type; Action : Function_Type;
                    Name       : Unbounded_String; I_Free : Natural;
                    D_Num      : Integer; Dim : Dim_Array) is
      use Interfaces;
      use Ada.Assertions;
      use Global;
      use M_Basic.Conversion;
      Routine_Name  : constant String := "Arguments.Do_YA ";
      --        aChar        : Character;
      S             : Unbounded_String;   --  New variable name
      Var_I         : Natural;
      X             : Integer;
      V_Index       : Positive;
      Number        : Positive;
      Var_Item      : Var_Record;
      Done          : Boolean := False;
   begin
      if V_Type = T_NA then
         if (Action and T_IMPLIED) = T_IMPLIED then
            V_Type := Action and (T_NBR or T_INT or T_STR);
         else
            V_Type := Default_Type;
         end if;
      end if;

      --  MMBasic 1955, now scan the sub/fun table to make sure that there
      --  is not a sub/fun with the same name.
      if (Action and V_FUNCT) /= V_FUNCT then
         Var_I := 0;
         Done := False;
         while not Done  and then Var_I <= Configuration.MAXSUBFUN loop
            Var_I := Var_I + 1;
            Done := M_Basic.Subfunctions (Var_I) = null;
            if not Done then
               X :=
                 Integer'Value (To_String (M_Basic.Subfunctions (Var_I).all));
               X := X + 1;
               --  Skip_Spaces (X);
               --  MMBasic 1955
               S := Name;
               --  Assert (To_Upper (X) /= To_Upper (X), Routine_Name &
               --          "a subroutine has the same name: " & Name);
            end if;
         end loop;
      end if;

      --        String_Size := Configuration.MAXSTRLEN;
      --  MMBasic 1984  If it is an array we must be dimensioning it.
      --  If it is a string array skip over the dimension values and look
      --  for the LENGTH keyword.
      --  If found then find the string size and change the vartbl entry.
      if (Action and V_DIM_VAR) = V_DIM_VAR then

         if (V_Type and T_STR) = T_STR then
            Var_I := 0;
            Done := False;
            if Element (Expression, Pos) = '(' then
               while not Done loop
                  if Element (Expression, Pos) = '(' then
                     Var_I := Var_I + 1;
                  end if;

                  if (Token_Type (Pos) and T_FUN) = T_FUN then
                     Var_I := Var_I + 1;
                  end if;

                  if Element (Expression, Pos) = ')' then
                     Var_I := Var_I - 1;
                  end if;

                  Pos := Pos + 1;
                  Done := Var_I = 0;
               end loop;
            end if;

            --  MMBasic 2002
            Skip_Spaces (Expression, Pos);
            --              Pos := M_Basic.Check_String
            --                (Slice (Expression, Pos, Length (Expression)), "Length");
            --              if Pos > 0 then
            --                 String_Size :=
            --                   Evaluation.Get_Int (S, 1, Configuration.MAXSTRLEN);
            --              else
            --                 aChar := Element (Expression, Pos);
            --  op_invalid is a pointer (Access_Procedure) to the
            --  op_invalid routine.
            --                    Assert (aChar = ',' or else Pos > Length (Expression) or else
            --                            M_Basic.Token_Function (Character'Image (aChar)) =
            --                              op_invalid, Routine_Name & "unexpected text: " &
            --                              Slice (Expression, Pos, Length (Expression)));
            --              end if;
         end if;
      end if;

      --  At this point we need to create the variable.
      --  As a result of the previous search ifree is the index to the entry
      --  that we should use.
      --  If adding to the top, increment the number of vars and inform the
      --  memory manager.
      --  MMBasic 2016
      if I_Free = Var_Count then
         Var_Count := Var_Count + 1;
      end if;

      Var_Index := I_Free;
      V_Index := I_Free;
      S := Name;
      Var_Item := Element (Var_Table, I_Free);
      Var_Item.Name := Var_Item.Name & S;

      Var_Item.Var_Type := V_Type or (Action and (T_IMPLIED or T_CONST));
      if (Action and V_LOCAL) = V_LOCAL then
         Var_Item.Level := M_Basic.Local_Index;
      else
         Var_Item.Level := 0;
      end if;

      for j in 1 .. Configuration.MAXDIM loop
         Var_Item.Dims (j) := 0;
      end loop;

      --  MMBasic 2042
      Var_Item := Element (Var_Table, V_Index);
      if D_Num = 0 then
         if V_Type = T_NBR then
            Var_Item.F := 0.0;
            Done := True;
         elsif V_Type = T_INT then
            Var_Item.Ia := 0;
            Done := True;
         end if;
         Replace_Element (Var_Table, V_Index, Var_Item);

      elsif D_Num = -1 then
         Var_Item := Element (Var_Table, V_Index);
         Var_Item.Dims (1) := 0;
         Replace_Element (Var_Table, V_Index, Var_Item);
         Done := True;
      else
         --  MMBasic 2065 D_Num > 0
         Number := 1;
         for index in 1 .. D_Num loop
            Assert (Dim (index) > M_Misc.Option_Base, Routine_Name &
                      "invalid dimension: " & Integer'Image (Dim (index)));
            Var_Item.Dims (index) := Dim (index);
            Number := Number * (Dim (index) + 1 - M_Misc.Option_Base);
         end loop;
      end if;

      if not Done then
         --  MMBasic 2079 Set Var_Table (I_Free) items to indicate that this
         --  variable has not been allocated.
         Var_Item := Element (Var_Table, I_Free);
         Var_Item.S := Null_Unbounded_String;
         --           Var_Item.Var_Type := T_NOTYPE;
         --           Name := Var_Item.Name;
         --           Var_Item.Name := Null_Unbounded_String;
         --           Dim_J := Var_Item.Dims (1);
         --           Var_Item.Dims (1) := 0;

         --  MMBasic 2087  C memory allocation.
         --  MMBasic 2098
         Var_Item.Var_Type := V_Type or (Action and (T_IMPLIED or T_CONST));
         Replace_Element (Var_Table, I_Free, Var_Item);
      end if;

   end Do_YA;

   --  MMBasic 1721 Find_Var finds or creates a variable.
   --  the action parameter can be the following (these can be ORed together)
   --  V_FIND    a straight forward find, if the variable is not found it is created and set to zero
   --  V_NOFIND_ERR    throw an error if not found
   --  V_NOFIND_NULL   return a null pointer if not found
   --  V_DIM_VAR    dimension an array
   --  V_LOCAL   create a local variable
   --  there are four types of variable:
   --   T_NOTYPE a free slot that was used but is now free for reuse
   --   T_STR string variable
   --   T_NBR holds a float
   --   T_INT integer variable
   function Find_Var
     (Expression : Unbounded_String; Pos : in out Positive;
      Arg_Data   : in out Arguments_Record; Action : Function_Type)
      return Var_Record is
      use Interfaces;
      use Ada.Assertions;
      use Ada.Characters.Handling;
      use Global;
      use Arg_Package;
      use String_Buffer_Package;
      Routine_Name   : constant String := "Arguments.Find_Var ";
      PP             : Positive;
      Dim            : Dim_Array := (others => 0);
      F              : Configuration.MMFLOAT := 0.0;
      I64            : Long_Long_Integer := 0;
      T_Arg          : Function_Type := T_NOTYPE;
      Arg            : Unbounded_String;
      Name           : Unbounded_String;
      S              : Unbounded_String;   --  New variable name
      Name_Length    : Natural := 0;
      V_Type         : Function_Type := T_NA;
      D_Num          : Integer := 0;
      I_Free         : Natural := Var_Count;
      Tmp            : Integer;
      Index          : Positive := 1;
      Arg_Buff_Index :  Positive;
      V_Index        : Natural := 0;
      Var_I          : Natural := 0;
      IP             : Positive := 1;
      TP             : Positive := 1;
      Done           : Boolean := False;
      Result         : Var_Record;
   begin
      --  Test_Stack_Overflow of pic32 stack
      Skip_Spaces (Expression, Pos);
      Assert (Is_Name_Start (Element (Expression, Pos)), Routine_Name &
                "invalid variable name.");

      while Is_Name_Character (Element (Expression, Pos)) loop
         Append (S, To_Upper (Element (Expression, Pos)));
         Pos := Pos + 1;
         Name_Length := Name_Length + 1;
         Assert (Name_Length <= Configuration.MAXVARLEN, Routine_Name &
                   "invalid variable name, too long.");
      end loop;

      --  MMBasic 1608 Make sure that there are a multiple of four bytes
      --  with a valid name or set to 0.
      while Name_Length mod 4 /= 0 loop
         Append (S, '0');
      end loop;

      if Element (Expression, Pos) = '$' then
         Assert ((Action and T_IMPLIED) /= T_IMPLIED or else
                   (Action and T_STR) = T_STR, Routine_Name &
                   "conflicting variable type.");
         V_Type := Arg_T;
         Pos := Pos + 1;

      elsif Element (Expression, Pos) = '%' then
         Assert ((Action and T_IMPLIED) /= T_IMPLIED or else
                   (Action and T_INT) = T_INT, Routine_Name &
                   "conflicting variable type.");
         V_Type := T_INT;
         Pos := Pos + 1;

      elsif Element (Expression, Pos) = '!' then
         Assert ((Action and T_IMPLIED) /= T_IMPLIED or else
                   (Action and T_NBR) = T_NBR, Routine_Name &
                   "conflicting variable type.");
         V_Type := T_NBR;
         Pos := Pos + 1;

      else
         --  MMBasic 1750
         Assert ((Action and Global.V_DIM_VAR) /= Global.V_DIM_VAR or else
                 Default_Type /= T_NOTYPE or else
                   (Action and T_IMPLIED) = T_IMPLIED, Routine_Name &
                   "variable type has not been specified.");
         V_Type := T_NOTYPE;
      end if;

      --  MMBasic 1756
      if Element (Expression, Pos) = '(' then
         PP := Pos + 1;
         Skip_Spaces (Expression, PP);
         if (Action and V_EMPTY_OK) = V_EMPTY_OK and then
           Element (Expression, Pos) = ')' then
            D_Num := -1;

         else
            Arg_Data := Get_Args (To_String_Buffer (Expression, Pos),
                                  Pos, 2 * Configuration.MAXDIM, "(,");
            Assert ((Unsigned_16 (Arg_Data.Arg_C) and 1) /= 0, Routine_Name &
                      "invalid dimensions.");
         end if;

         --  MMBasic 1772
         D_Num := Arg_Data.Arg_C / 2 + 1;
         Assert (D_Num <= Configuration.MAXDIM, Routine_Name &
                   "invalid dimensions.");
         Index := 1;
         while Index < Arg_Data.Arg_C / 2 loop
            Arg_Buff_Index := Element (Arg_Data.Arg_V, Index);
            Arg := To_Unbounded_String
              (Element (Arg_Data.Arg_Buffer, Arg_Buff_Index));
            Evaluation.Evaluate (Arg, F, I64, S, T_Arg, 0);
            if T_Arg = T_STR then
               --  Force later error
               D_Num := Configuration.MAXDIM;
            elsif  T_Arg = T_NBR then
               I64 := Long_Long_Integer (F);
            end if;

            Dim (Index / 2) := Integer (I64);
            Assert (Dim (Index / 2) < M_Misc.Option_Base, Routine_Name &
                      "invalid dimension.");
            Index := Index + 2;
         end loop;
      end if;

      --  MMBasic 1796
      Tmp := -1;
      Do_AA (IP, TP, Var_I, Name_Length, I_Free, Tmp, Name);

      --  MMBasic 1849
      if (Action and V_LOCAL) = V_LOCAL then
         Assert (Var_I >= Var_Count, Routine_Name & To_String (Name) &
                   " has been declared already.");
      elsif (Action and V_DIM_VAR) = V_DIM_VAR then
         if Var_I <= Var_Count or else Tmp >= 0 then
            Assert (Var_I >= Var_Count, Routine_Name & To_String (Name) &
                      " has been declared already.");
         end if;
      elsif Var_I >= Var_Count and then Tmp >= 0 then
         --  MMBasic 1862 we are not declaring the variable
         --  If the variable was not found and there is a global,
         --  this must be in a sub so use the global.
         Var_I := Tmp;
      end if;

      --  MMBasic 1870
      Done := Do_BA (Var_I, V_Index, D_Num, V_Type, Name, Dim, Action, Result);

      if not Done then
         --  MMBasic 1941  No existng variable has been found.
         if (Action and V_NOFIND_ERR) = V_NOFIND_ERR then
            Put_Line (Routine_Name & "Cannot find " & To_String (Name));
         end if;

         --           if (Action and V_NOFIND_NULL) = V_NOFIND_NULL then
         --              return null
         --           end if;

         if (Option_Explicit or else D_Num /= 0) and then
           (Action and V_DIM_VAR) /= V_DIM_VAR then
            Put_Line (Routine_Name & To_String (Name) &
                        " has not been declared");
         end if;

         Do_YA (Expression, Pos, V_Type, Action, Name, I_Free, D_Num, Dim);
      end if;

      return Result;

   end Find_Var;

   function Get_Args (Expression   : String_Buffer; Pos : Positive;
                      Max_Num_Args : Natural; Delim : String)
                      return Arguments_Record is
   begin
      --  MMBasic.h 142
      return Make_Args (Expression, Pos, Max_Num_Args, Delim);

   end Get_Args;

   --  MMBasic.2150 Make_Args arguments are:
   --   Expression (*p) the string to be broken into arguments.
   --   Max_Args        the maximum number of arguments that are expected.
   --   Arg_Buff        the buffer where the returned strings will be stored.
   --   Arg_V           a list of indexes into Arg_Buff.
   --   Arg_C           an integer containing the number of arguments found.
   --   Delimp          a string  containing the characters to be used in
   --                   spliiting up the line.
   --                   If the first char of that string is an opening bracket
   --                  '(' this function will expect the arg list to be
   --                   enclosed in brackets.
   function Make_Args (Expression : String_Buffer; Pos : Positive;
                       Max_Args   : Positive; Delimiters : String)
                       return Arguments_Record is
      use Interfaces;
      use Ada.Assertions;
      use Ada.Strings;
      use Command_And_Token_Functions;
      use String_Buffer_Package;
      use Arg_Package;
      Routine_Name   : constant String := "Arguments.Make_Args ";
      Then_Token     : constant Natural := tokenTHEN;
      Else_Token     : constant Natural := tokenELSE;
      Arg_Buff_Ptr   : Integer := 1;    --  Op
      String_1       : String (1 .. 1);
      TP             : Positive := Pos;
      In_Arg         : Boolean := False;
      Expect_Cmd     : Boolean := False;
      Expect_Bracket : Boolean := False;
      Delim_Ptr      : Positive := 1;
      Token          : Natural;
      T_Token        : Function_Type;
      Term           : Unbounded_String;
      Delim_Index    : Natural := 0;
      Delim_Pos      : Natural := 0;
      Delim_Found    : Boolean := False;
      Done           : Boolean := False;
      Result         : Arguments_Record;

      procedure Process_Delim is  --  C1
         Routine_Name : constant String := "Arguments.Make_Args.Process_Delim ";
         Then_Token   : constant Natural := tokenTHEN;
         Else_Token   : constant Natural := tokenELSE;
         Delim        : constant String := Expression (TP);
      begin
         --  MMBasic 2208
         if Delim not in Delimiters then
            Expect_Cmd := Integer'Value (Delim) = Then_Token or else
              Integer'Value (Delim) = Else_Token;
         end if;

         --  MMBasic 2210
         if In_Arg then
            Term := To_Unbounded_String (Delim);
            Trim (Term, Both);

            --  MMBasic 2216
         elsif Result.Arg_C > 0 then
            --  otherwise we have two delimiters in a row
            --  (except for the first argument).
            --  so, create a null argument to go between the two delimiters.
            Result.Arg_V.Replace_Element (Result.Arg_C, TP);
            TP := TP + 1;
            Result.Arg_C := Result.Arg_C + 1;
            Arg_Buff_Ptr := Result.Arg_Buffer.Last_Index + 1;
         end if;

         --  MMBasic 2222
         In_Arg := False;
         Assert (Result.Arg_C <= Max_Args, Routine_Name & "Too many arguments");

         Append (Result.Arg_V, Arg_Buff_Ptr);
         Result.Arg_C := Result.Arg_C + 1;
         --  MMBasic 2226
         Append (Result.Arg_Buffer, To_String (Term));
         Arg_Buff_Ptr := Arg_Buff_Ptr + 1;
         TP := TP + 1;    --  step over delimiter?
         Arg_Buff_Ptr := Arg_Buff_Ptr + 1;

      end Process_Delim;

   begin
      --  MMBasic 2182 Test_Stack_Overflow
      Result.Arg_C := 0;
      if Delimiters = "(" then
         Assert (Expression (TP) = "(", Routine_Name &
                   "'(' syntax error.");
         Expect_Bracket := True;
         Delim_Ptr := Delim_Ptr + 1;
         TP := TP + 1;
      end if;

      --  MMBasic 2191  Main processing loop
      while not Done loop
         --  MMBasic 2194
         Done := (Expect_Bracket and then Element (Expression, TP) = ")")
           or else Element (Expression, TP) = "'";
         if not Done then
            Term := To_Unbounded_String (Expression (TP));
            --  MMBasic 2205 Delim is a string of special characters that split
            --  the expression into separate terms;
            Delim_Found := False;
            Delim_Index := 0;
            while not Delim_Found and then Delim_Index < Delimiters'Last loop
               Delim_Index := Delim_Index + 1;
               String_1 := Support.To_String (Delimiters (Delim_Index));
               Delim_Pos := Index (Term, String_1);
               Delim_Found := Delim_Pos > 0;
            end loop;

            --  MMBasic 2206 block moved to else  Delim_Found
            if not Delim_Found then
               --  MMBasic 2231  C1 E
               Token := Integer'Value (Element (Expression, TP));
               --  MMBasic 2234
               Expect_Cmd := Token = Then_Token or else Token = Else_Token;

               --  MMBasic 2244
               if not In_Arg then
                  --  C2 E
                  --  MMBasic 2237 moved to else
                  --  MMBasic 2244 Not a special char so start a new argument
                  Assert (Integer (Result.Arg_C) < Max_Args, Routine_Name &
                            "2246 Too many arguments");
                  --  Arg_C is a pointer into Argbuff, yet to be loaded
                  Result.Arg_C := Result.Arg_C + 1;
                  Append (Result.Arg_V, Result.Arg_C);
                  In_Arg := True;

                  --  MMBasic 2252 If an opening bracket '(', copy everything
                  --  until the matching closing bracket.
                  --  This includes special characters such as , and ; and
                  --  keeps track of any nested brackets.
                  T_Token := Token_Type (Integer'Value (Expression (TP)));
                  if String_1 = "(" or else ((T_Token and T_FUN) = T_FUN
                                             and then (not Expect_Cmd)) then
                     --  MMBasic 2256 C3
                     --  MMBasic 2259 copy everything until the matching closing bracket.
                     while (TP < Integer (Length (Expression))) and then
                       (Element (Expression, TP) /= ")") loop
                        Append (Result.Arg_Buffer, Element (Expression, TP));
                        TP := TP + 1;
                        Arg_Buff_Ptr := Arg_Buff_Ptr + 1;
                     end loop;
                     Assert (TP <= Integer (Length (Expression)) or else
                             Last_Element (Expression) = ")", Routine_Name
                             & "syntax error, closing braket missing");

                  elsif String_1 = """" then
                     --  MMBasic 2265 C4 if quote mark " copy everything until
                     --  the closing quote including special characters such
                     --   as , and ;.
                     --  The tokenise() function will have ensured that the
                     --  closing quote is always there.
                     while (TP < Integer (Length (Expression))) and then
                       (Element (Expression, TP) /= """") loop
                        Append (Result.Arg_Buffer, Element (Expression, TP));
                        TP := TP + 1;
                        Arg_Buff_Ptr := Arg_Buff_Ptr + 1;
                     end loop;

                     Assert (TP <= Integer (Length (Expression)) or else
                             Last_Element (Expression) = """", Routine_Name
                             & "syntax error, closing quote missing");

                  else  --  anything else
                     --  MMBasic 2281
                     Append (Result.Arg_Buffer, Expression (TP));
                     TP := TP + 1;
                     Arg_Buff_Ptr := Arg_Buff_Ptr + 1;
                     Expect_Cmd := False;
                  end if;  --  if aChar /= '('

               else  --  C2
                  TP := TP + 1;
               end if;  -- not In_Arg

            else  --  Delim_Found
               Process_Delim;  --  C1;
            end if;  --  not Match
         end if;  --  First not Done

         Done := TP > Integer (Expression.Length);
         --  MMBasic 2280
      end loop;

      --  MMBasic 2285
      Assert (not Expect_Bracket or else Expression (TP) = ")",
              Routine_Name & "syntax error, bracket expected.");

      return Result;

   end Make_Args;

end Arguments;
