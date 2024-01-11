
with Interfaces;

with Ada.Containers.Vectors;
with Ada.Strings.Unbounded; use Ada.Strings.Unbounded;

with Command_And_Token_Tables; use Command_And_Token_Tables;
with Configuration;

package Arguments is

   type Dims_Array is array (1 .. Configuration.MAXDIM) of Natural;

   type Var_Record is record
      Name     : Unbounded_String;
      Var_Type : Function_Type;
      Level    : Natural := 0;
      Dims     : Dims_Array;
      F        : Configuration.MMFLOAT := 0.0;
      Ia       : Long_Long_Integer := 0;
      S        : Unbounded_String;
   end record;

   package Var_Package is new Ada.Containers.Vectors (Positive, Var_Record);
   subtype Var_Vector is Var_Package.Vector;

   Default_Type    : Function_Type := T_NBR;
   Option_Explicit : Boolean := False;
   Var_Table       : Var_Vector;
   Var_Index       : Natural := 0;
   Var_Count       : Natural := 0;
   Arg_C       	   : Interfaces.Unsigned_16;
   Arg_V           : String_Buffer;
   Arg_T           : Function_Type;

   function Find_Var (Expression : Unbounded_String; Pos : in out Positive;
                       Action     : Function_Type) return Var_Record;
   procedure Get_Args (Expression   : Unbounded_String; Pos : Positive;
                       Max_Num_Args : Natural; S : String);

end Arguments;