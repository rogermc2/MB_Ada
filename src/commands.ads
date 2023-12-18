
with Command_And_Token_Tables; use Command_And_Token_Tables;

package Commands is

   function Check_Type_Specified
     (Pos                : Positive; Fun_Type : in out Unsigned_2Byte;
      Allow_Default_Type : Boolean) return Positive;
   procedure Command_Input;
   procedure Execute_One_Line;
   procedure Process_Command
     (Match_Index : Positive; Pos : in out Positive;
      First_Nonwhite, Label_Valid : in out Boolean);

end Commands;
