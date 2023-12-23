
with Command_And_Token_Tables; use Command_And_Token_Tables;

package Commands is

   Option_Error_Skip : Integer := 0;

   procedure Check_Type_Specified
     (Buffer : String_Buffer; Pos: Positive; Fun_Type : in out Unsigned_2Byte;
      Allow_Default_Type : Boolean);
   procedure Command_Input;
   procedure Execute_One_Line;
   procedure Process_Command
     (Buffer : in out String_Buffer; Match_Index : Positive;
      Pos    : in out Positive;
      First_Nonwhite, Label_Valid : in out Boolean);

end Commands;
