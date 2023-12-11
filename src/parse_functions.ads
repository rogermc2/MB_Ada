
package Parse_Functions is

   procedure Process_Colon (Pos : in out Positive);
   procedure Process_Command (Pos : in out Positive);
   procedure Process_Double_Quote (Pos : in out Positive; aChar : Character);
   procedure Process_Name_Start (Pos : in out Positive);
   procedure Process_First_Nonwhite
     (Pos  : in out Positive; Label_Valid : Boolean);
   procedure Process_Try_Number (Pos : in out Positive);
   procedure Process_Quote (Pos : in out Positive);

end Parse_Functions;
