
package body C_Functions is

   procedure Call_CFunction
     (Sub_Line_Ptr                    : Subfunction_Ptr;
      Name_Ptr, Pos, Callers_Line_Ptr : Positive) is
   begin
      null;

   end Call_CFunction;

   function Call_CFunction
     (Sub_Line_Ptr                    : Subfunction_Ptr;
      Name_Ptr, Pos, Callers_Line_Ptr : Positive)
      return Configuration.MMFLOAT is
   begin
      return 0.0;

   end Call_CFunction;

   function Call_CFunction
     (Sub_Line_Ptr                    : Subfunction_Ptr;
      Name_Ptr, Pos, Callers_Line_Ptr : Positive)
      return Long_Long_Integer is
   begin
      return 0;

   end Call_CFunction;

   function Call_CFunction
     (Sub_Line_Ptr: Subfunction_Ptr; Name_Ptr, Pos, Callers_Line_Ptr : Positive)
      return Unbounded_String is
   begin
      return To_Unbounded_String ("");

   end Call_CFunction;

   procedure Check_Abort is
   begin
      null;

   end Check_Abort;

end C_Functions;
