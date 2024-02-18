
with Interfaces; use Interfaces;
with Interfaces.C; use Interfaces.C;
with Interfaces.C.Strings; use Interfaces.C.Strings;

package C_API is

   procedure PPSInput_C (G, P, F : chars_ptr);
   pragma Import (C, PPSInput_C, "PPSInput");

   procedure PPSOutput (G, P, F : chars_ptr);
   pragma Import (C, PPSOutput, "PPSOutput");

end C_API;
