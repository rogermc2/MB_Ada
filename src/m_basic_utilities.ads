
with Ada.Strings.Unbounded; use Ada.Strings.Unbounded;

with Command_And_Token_Tables; use Command_And_Token_Tables;

package M_Basic_Utilities is

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
