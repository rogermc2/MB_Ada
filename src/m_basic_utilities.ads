
with Ada.Strings.Unbounded; use Ada.Strings.Unbounded;

with Command_And_Token_Tables; use Command_And_Token_Tables;
with M_Basic;

package M_Basic_Utilities is

   function Get_Close_Bracket
     (Expression : Unbounded_String; Pos : in out Positive) return Positive;
   function Get_Word (Expression : Unbounded_String; Pos : Positive)
                      return String;
   function Is_Line_Num (aChar : Character) return Boolean;
   function Is_Name_Character (aChar : Character) return Boolean;
   pragma Inline (Is_Name_Character);
   function Is_Name_End (aChar : Character) return Boolean;
   pragma Inline (Is_Name_End);
   function Is_Name_Start (aChar : Character) return Boolean;
   pragma Inline (Is_Name_Start);

   procedure Skip_Spaces (aLine : String; Pos : in out Positive);
   procedure Skip_Spaces (Buffer : Unbounded_String; Pos : in out Positive);
   procedure Skip_Spaces (Pos : in out M_Basic.Subfunction_Ptr);
   function To_String_Buffer (Buffer : Unbounded_String; Pos : Positive)
                              return String_Buffer;
   function To_UB_String (Buffer : String_Buffer) return Unbounded_String;

end M_Basic_Utilities;
