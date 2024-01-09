
with Interfaces;

with Ada.Assertions;
with Ada.Characters.Handling;
with Ada.Text_IO; use Ada.Text_IO;

with Evaluation;
with Global;
with M_Basic;
with M_Basic_Utilities; use M_Basic_Utilities;

package body Arguments is

   type Dim_Array is array (1 .. Configuration.MAXDIM) of Integer;

   Var_Count   : Natural := 0;
   Var_Index   : Natural := 0;
   Local_Index : Natural := 0;
   Arg_Buff    : Unbounded_String;
   Arg_V       : String_Buffer;
   Arg_C       : Interfaces.Unsigned_16;
   Arg_T       : Function_Type;
   Option_Base : Natural := 0;

   procedure Get_Args (Expression   : Unbounded_String; Pos : Positive;
                       Max_Num_Args : Natural; S : String);

   procedure Do_AA (IP, TP      : in out Natural; Var_I : in out Natural;
                    Name_Length : Natural; I_Free : in out Natural;
                    Tmp         : in out Integer; Name  : Unbounded_String) is
      use Interfaces;
      use Var_Package;
      --        Routine_Name : constant String := "M_Basic_Utilities.Do_AA ";
      Item         : Var_Record;
      TP_Name      : Unbounded_String;
      IP_Name      : Unbounded_String;
      J            : Natural;
      Done         : Boolean := False;
   begin
      --  ASCII.NU is C string terminator
      --        Append (S, ASCII.NUL);

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
                  Done := Item.Level = 0 and then Local_Index = 0;
               else
                  Tmp := Var_I;
               end if;
            else
               --  MMBasic 1843 this is a subroutine or function.
               Done := Item.Level = Local_Index;
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
      use Var_Package;
      Routine_Name : constant String := "M_Basic_Utilities.Do_BA ";
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

   --  MMBasic 1693
   function Find_Var (Expression : Unbounded_String; Pos : in out Positive;
                      Action     : Function_Type) return Var_Record is
      use Interfaces;
      use Ada.Assertions;
      use Ada.Characters.Handling;
      use Global;
      use String_Buffer_Package;
      Routine_Name : constant String := "M_Basic_Utilities.Find_Var ";
      PP           : Positive;
      Dim          : Dim_Array := (others => 0);
      F            : Configuration.MMFLOAT := 0.0;
      I64          : Long_Long_Integer := 0;
      T_Arg        : Function_Type := T_NOTYPE;
      Arg          : Unbounded_String;
      Name         : Unbounded_String;
      S            : Unbounded_String;   --  New variable name
      aChar        : Character;
      Name_Length  : Natural := 0;
      String_Size  : Natural := 0;
      V_Type       : Function_Type := T_NA;
      D_Num        : Integer := 0;
      I_Free       : Natural;
      Tmp          : Integer;
      Index        : Positive := 1;
      V_Index      : Natural := 0;
      Var_I        : Natural := 0;
      IP           : Positive := 1;
      TP           : Positive := 1;
      X            : Integer;
      Done         : Boolean := False;
      Result       : Var_Record;
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
            Get_Args (Expression, Pos, 2 * Configuration.MAXDIM, "(,");
            Assert ((Arg_C and 1) /= 0, Routine_Name & "invalid dimensions.");
         end if;

         --  MMBasic 1772
         D_Num := Integer (Arg_C / 2) + 1;
         Assert (D_Num <= Configuration.MAXDIM, Routine_Name &
                   "invalid dimensions.");
         Index := 1;
         while Index < Integer (Arg_C / 2) loop
            Arg := To_Unbounded_String (Arg_V (Index));
            Evaluation.Evaluate (Arg, F, I64, S, T_Arg, 0);
            if T_Arg = T_STR then
               --  Force later error
               D_Num := Configuration.MAXDIM;
            elsif  T_Arg = T_NBR then
               I64 := Long_Long_Integer (F);
            end if;

            Dim (Index / 2) := Integer (I64);
            Assert (Dim (Index / 2) < Option_Base, Routine_Name &
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
               Done := M_Basic.Subfunctions (Var_I) = 0;
               if not Done then
                  X := M_Basic.Subfunctions (Var_I);
                  X := X + 1;
                  --  Skip_Spaces (X);
                  --  MMBasic 1955
                  S := Name;
                  --                    Assert (To_Upper (X) /= To_Upper (X), Routine_Name &
                  --                              "a subroutine has the same name: " & Name);
               end if;
            end loop;
         end if;

         String_Size := Configuration.MAXSTRLEN;
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
               Pos := M_Basic.Check_String
                 (Slice (Expression, Pos, Length (Expression)), "Length");
               if Pos > 0 then
                  String_Size :=
                    Evaluation.Get_Int (S, 1, Configuration.MAXSTRLEN);
               else
                  aChar := Element (Expression, Pos);
                  --  op_invalid is a pointer (Access_Procedure) to the
                  --  op_invalid routine.
                  Assert (aChar = ',' or else Pos > Length (Expression) or else
                          M_Basic.Token_Function (Character'Image (aChar)) =
                            op_invalid, Routine_Name & "unexpected text: " &
                            Slice (Expression, Pos, Length (Expression));
               end if;
            end if;
         end if;
      end if;

      return Result;

   end Find_Var;

   procedure Get_Args (Expression   : Unbounded_String; Pos : Positive;
                       Max_Num_Args : Natural; S : String) is
   begin
      --  MMBasic.h 142
      Make_Args (Expression, Pos, Max_Num_Args, Arg_Buff, Arg_V, Arg_C, S);

   end Get_Args;

end Arguments;
