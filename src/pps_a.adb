
with Interfaces.C; use Interfaces.C;

package body PPS_A is

   procedure PPS_Input (Group : Natural; Pin, Func : String) is
      C_Group : constant char_array := To_C (Integer'Image (Group));
      C_Pin : constant char_array := To_C (Pin);
      C_Func : constant char_array := To_C (Func);
      procedure PPSInput (G, P, F : char_array);
      pragma Import (C, PPSInput, "PPSInput");
   begin
      PPSInput (C_Group, C_Pin, C_Func);

   end PPS_Input;

   procedure PPS_Output (Group : Natural; Pin, Func : String) is
      C_Group : constant char_array := To_C (Integer'Image (Group));
      C_Pin : constant char_array := To_C (Pin);
      C_Func : constant char_array := To_C (Func);
      procedure PPSOutput (G, P, F : char_array);
      pragma Import (C, PPSOutput, "PPSOutput");
   begin
      PPSOutput (C_Group, C_Pin, C_Func);

   end PPS_Output;

end PPS_A;
