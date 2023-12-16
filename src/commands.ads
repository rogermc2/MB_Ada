
package Commands is

   procedure Command_Input;
   procedure Execute_One_Line;
   procedure Process_Command (Match_Index, Match_I_Pos    : in out Positive;
                              First_Nonwhite, Label_Valid : in out Boolean);

end Commands;
