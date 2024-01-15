
with Ada.Strings.Unbounded; use Ada.Strings.Unbounded;
with Configuration;

with M_Basic; use M_Basic;

package C_Functions is

   procedure Call_CFunction
     (Sub_Line_Ptr    : Subfunction_Ptr; Name_Ptr, Pos : Positive;
      Callers_Line_Ptr: Subfunction_Ptr);
   function Call_CFunction
     (Sub_Line_Ptr    : Subfunction_Ptr; Name_Ptr, Pos : Positive;
      Callers_Line_Ptr: Subfunction_Ptr)
      return Configuration.MMFLOAT;
   function Call_CFunction
     (Sub_Line_Ptr    : Subfunction_Ptr; Name_Ptr, Pos : Positive;
      Callers_Line_Ptr: Subfunction_Ptr)
      return Long_Long_Integer;
   function Call_CFunction
     (Sub_Line_Ptr    : Subfunction_Ptr; Name_Ptr, Pos : Positive;
      Callers_Line_Ptr: Subfunction_Ptr)
      return Unbounded_String;

   procedure Check_Abort;

end C_Functions;
