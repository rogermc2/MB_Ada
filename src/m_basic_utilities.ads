
with Ada.Containers.Vectors;
with Ada.Strings.Unbounded; use Ada.Strings.Unbounded;

with Command_And_Token_Tables; use Command_And_Token_Tables;
with Configuration;

package M_Basic_Utilities is

   type Dims_Array is array (1 .. Configuration.MAXDIM) of Positive;

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

   Var_Table : Var_Vector;

   Default_Type : Function_Type := T_NBR;

   procedure Find_Var (Expression : Unbounded_String; Pos : in out Positive;
                       Action     : Function_Type);
   function Is_Line_Num (aChar : Character) return Boolean;
   function Is_Name_Character (aChar : Character) return Boolean;
   pragma Inline (Is_Name_Character);
   function Is_Name_End (aChar : Character) return Boolean;
   pragma Inline (Is_Name_End);
   function Is_Name_Start (aChar : Character) return Boolean;
   pragma Inline (Is_Name_Start);
   procedure Skip_Spaces (aLine : String; Pos : in out Positive);
   procedure Skip_Spaces (Buffer : Unbounded_String; Pos : in out Positive);

end M_Basic_Utilities;
