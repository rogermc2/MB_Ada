
package M_Basic is

   Current_Line_Ptr : Natural := 0;
   Continue_Point   : Natural := 0;
   Local_Index      : Natural := 0;

   procedure Clear_Program;
   procedure Execute_Program (Name : String);
   function Find_Subfunction (Name : String; Fun_Type : Integer)
                              return Integer;
   procedure Init_Basic;
   procedure Print_String (theString : String);
   procedure Prepare_Program (State : Boolean);

end M_Basic;
