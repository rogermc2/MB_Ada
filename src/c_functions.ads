
with Ada.Strings.Unbounded; use Ada.Strings.Unbounded;
with Configuration;

package C_Functions is

   function Call_CFunction
     (Sub_Line_Ptr, Name_Ptr, Pos, Callers_Line_Ptr : Positive)
      return Configuration.MMFLOAT;
   function Call_CFunction
     (Sub_Line_Ptr, Name_Ptr, Pos, Callers_Line_Ptr : Positive)
      return Long_Long_Integer;
   function Call_CFunction
     (Sub_Line_Ptr, Name_Ptr, Pos, Callers_Line_Ptr : Positive)
      return Unbounded_String;

   procedure Check_Abort;

end C_Functions;
