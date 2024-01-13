
with Interfaces;
with Ada.Strings.Unbounded; use Ada.Strings.Unbounded;

with Command_And_Token_Tables; use Command_And_Token_Tables;
with Configuration;

package Evaluation is

   F_Arg1 : Configuration.MMFLOAT;
   F_Arg2 : Configuration.MMFLOAT;
   F_Ret  : Configuration.MMFLOAT;
   I_Arg1 : Long_Long_Integer;
   I_Arg2 : Long_Long_Integer;
   I_Ret  : Long_Long_Integer;
   S_Arg1 : Unbounded_String;
   S_Arg2 : Unbounded_String;
   S_Ret  : Unbounded_String;
   T_Arg  : Function_Type;

   procedure Evaluate
     (Expression : in out Unbounded_String; Fa : out Configuration.MMFLOAT;
      Ia         : out Long_Long_Integer; Sa : out Unbounded_String;
      Ta         : in out Function_Type; Flags : Interfaces.Unsigned_16);
   function Get_Int
     (Expression : in out Unbounded_String; Lo, Hi : Integer) return Integer;
   function Get_Integer
     (Expression : in out Unbounded_String) return Long_Long_Integer;
   function Get_Value
     (Expression : in out Unbounded_String; Fa : out Configuration.MMFLOAT;
      Ia         : out Long_Long_Integer; Sa : out Unbounded_String;
      OO : in out Natural; Ta : in out Function_Type) return Unbounded_String;

end Evaluation;
