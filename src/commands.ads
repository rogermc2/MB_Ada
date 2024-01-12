
with Interfaces; use Interfaces;

with Ada.Strings.Unbounded; use Ada.Strings.Unbounded;

with Command_And_Token_Tables; use Command_And_Token_Tables;

package Commands is

   type Config_Cases is (CONFIG_TITLE, CONFIG_LOWER, CONFIG_UPPER);
   Dim_Used           : Boolean := False;

   Option_Error_Check : unsigned_16 := 0;
   Option_Error_Skip  : unsigned_16 := 0;

   procedure Check_Type_Specified
     (Expression : Unbounded_String; Pos: Positive; Fun_Type : in out Unsigned_16;
      Allow_Default_Type : Boolean);
   procedure Command_Input;
   procedure Execute_One_Line;
   procedure Process_Command
     (Buffer : in out String_Buffer; Match_Index : Positive;
      Pos    : in out Positive;
      First_Nonwhite, Label_Valid : in out Boolean);

end Commands;
