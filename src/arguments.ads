
with Ada.Containers.Vectors;
with Ada.Strings.Unbounded; use Ada.Strings.Unbounded;

with Command_And_Token_Tables; use Command_And_Token_Tables;
with Configuration;

package Arguments is

   type Dims_Array is array (1 .. Configuration.MAXDIM) of Natural;

   package Arg_Package is new
     Ada.Containers.Vectors (Positive, Natural);
   subtype Arg_Vector is Arg_Package.Vector;

   type Var_Record is record
      Name     : Unbounded_String;
      Var_Type : Function_Type;
      Level    : Natural := 0;
      Dims     : Dims_Array;
      F        : Configuration.MMFLOAT := 0.0;
      Ia       : Long_Long_Integer := 0;
      S        : Unbounded_String;
      Size     : Natural := 0;
   end record;

   package Var_Package is new Ada.Containers.Vectors (Positive, Var_Record);
   subtype Var_Vector is Var_Package.Vector;
   use Var_Package;

   Default_Type    : Function_Type := T_NBR;
   Option_Explicit : Boolean := False;
   Var_Table       : Var_Vector;
   Var_Index       : Natural := 0;
   Var_Count       : Natural := 0;
   Arg_C       	   : Natural := 0;
   Arg_V           : Arg_Vector;
   Arg_Buffer      : String_Buffer;
   Arg_T           : Function_Type;

   Arg_Var_Index   : array (1 .. Natural (Length (Var_Table))) of Integer;

   function Find_Var (Expression : Unbounded_String; Pos : in out Positive;
                       Action     : Function_Type) return Var_Record;
   procedure Get_Args (Expression   : Unbounded_String; Pos : Positive;
                       Max_Num_Args : Natural; Delim : String);
   procedure Make_Args
     (Expression : Unbounded_String; Pos : Positive; Max_Args : Positive;
      Arg_Buff   : out String_Buffer; Arg_V : out Arg_Vector;
      Arg_C      : out Natural; Delim : String);

end Arguments;
