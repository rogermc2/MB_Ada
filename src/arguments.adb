
with Interfaces;

with Ada.Assertions;
with Ada.Characters.Handling;

with Evaluation;
with Global;
with M_Basic_Utilities; use M_Basic_Utilities;

package body Arguments is

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

   --  MMBasic 1693
   procedure Find_Var (Expression : Unbounded_String; Pos : in out Positive;
                       Action     : Function_Type) is
      use Interfaces;
      use Ada.Assertions;
      use Ada.Characters.Handling;
      use Global;
      use String_Buffer_Package;
      use Var_Package;
      type Dim_Array is array (1 .. Configuration.MAXDIM) of Integer;
      Routine_Name : constant String := "M_Basic_Utilities.Find_Var ";
      PP           : Positive;
      Dim          : Dim_Array := (others => 0);
      F            : Configuration.MMFLOAT := 0.0;
      I64          : Long_Long_Integer := 0;
      T_Arg        : Function_Type := T_NOTYPE;
      Arg          : Unbounded_String;
      Name         : Unbounded_String;
      TP_Name      : Unbounded_String;
      IP_Name      : Unbounded_String;
      S            : Unbounded_String;   --  New variable name
      Name_Length  : Natural := 0;
      V_Type       : Function_Type := T_NA;
      D_Num        : Integer := 0;
      I_Free       : Natural;
      Item         : Var_Record;
      Tmp          : Integer;
      Index        : Positive := 1;
      V_Index      : Natural := 0;
      Var_I        : Natural := 0;
      IP           : Positive := 1;
      TP           : Positive := 1;
      J            : Natural;
      Done         : Boolean := False;
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
      Tmp := -1;
      Done := False;
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
        if Var_I >= Var_Count then
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
               end if;
            end loop;
         end if;
      end if;

   end Find_Var;

   procedure Get_Args (Expression   : Unbounded_String; Pos : Positive;
                       Max_Num_Args : Natural; S : String) is
   begin
      --  MMBasic.h 142
      Make_Args (Expression, Pos, Max_Num_Args, Arg_Buff, Arg_V, Arg_C, S);

   end Get_Args;

end Arguments;
