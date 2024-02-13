
with Interfaces.C; use Interfaces.C;
with Interfaces.C.Strings; use Interfaces.C.Strings;

with C_API; use C_API;

package body PPS_A is
   --  New_String is equivalent to New_Char_Array(To_C(Str)).
   --  When passed an Ada String, To_C sets Append_Nul to True by default.
   --  As a result, PPS_Input calls C with a properly null terminated C string.
   procedure PPS_Input (Group, Pin, Func : String) is
      C_Group : constant chars_ptr := New_String (Group);
      C_Pin   : constant chars_ptr := New_String (Pin);
      C_Func  : constant chars_ptr := New_String (Func);
   begin
      PPSInput_C (C_Group, C_Pin, C_Func);

   end PPS_Input;

   procedure PPS_Output (Group, Pin, Func : String) is
--        C_Group : constant char_array := To_C (Integer'Image (Group));
--        C_Pin : constant char_array := To_C (Pin);
--        C_Func : constant char_array := To_C (Func);
      C_Group : constant chars_ptr := New_String (Group);
      C_Pin   : constant chars_ptr := New_String (Pin);
      C_Func  : constant chars_ptr := New_String (Func);
   begin
      PPSOutput (C_Group, C_Pin, C_Func);

   end PPS_Output;

end PPS_A;
