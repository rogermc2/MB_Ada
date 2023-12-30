
with Command_And_Token_Tables; use Command_And_Token_Tables;

package Parse_Functions is

   function Get_Command_Value (Command : String) return Integer;
   procedure Process_Colon
     (Buffer : in out String_Buffer; I_Pos : in out Positive);
   procedure Process_Double_Quote
     (Buffer : in out String_Buffer; I_Pos  : in out Positive);
   procedure Process_Name_Start (Buffer : in out String_Buffer;
                                 I_Pos  : in out Positive);
   procedure Process_First_Nonwhite
     (Buffer      : out String_Buffer; I_Pos  : in out Positive;
      Label_Valid : in out Boolean; First_Nonwhite : in out Boolean);
   procedure Process_Quote (Buffer : in out String_Buffer;
                            I_Pos  : in out Positive);
   procedure Process_Variable_Name
     (Buffer         : in out String_Buffer; Pos : in out Positive;
      First_Nonwhite : in out Boolean; Label_Valid : in out Boolean);
   function Try_Function_Or_Keyword
     (Buffer         : out String_Buffer; I_Pos : in out Positive;
      First_Nonwhite : in out Boolean) return Boolean;
   procedure Try_Number
     (Buffer : out String_Buffer; I_Pos : in out Positive);

end Parse_Functions;
