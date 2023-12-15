
package Parse_Functions is

   procedure Process_Colon (I_Pos : in out Positive;
                            First_Nonwhite : in out Boolean);
   procedure Process_Double_Quote (I_Pos : in out Positive; aChar : Character);
   procedure Process_Name_Start (I_Pos : in out Positive);
   procedure Process_First_Nonwhite
     (I_Pos  : in out Positive;  Label_Valid, First_Nonwhite : in out Boolean);
   procedure Process_Try_Number (I_Pos : in out Positive);
   procedure Process_Quote (I_Pos : in out Positive);
   function Try_Function_Or_Keyword
     (I_Pos : in out Positive; First_Nonwhite : in out Boolean) return Boolean;

end Parse_Functions;
