
with Ada.Strings.Unbounded; use Ada.Strings.Unbounded;

with M_Basic;

package Support is

   type Setup_Exception is (Cause_Nothing, Cause_Display, Cause_File_IO,
                            Cause_Keyboard, Cause_RTC, Cause_Touch,
                            Cause_MM_Startup);

   Except_Cause : Setup_Exception := Cause_Nothing;

   procedure Do_PIN;
   function Is_X_Digit (aChar : Character) return Boolean;
   pragma Inline (Is_X_Digit);
   procedure Process_Commands (Tokens : in out M_Basic.UB_String_Buffer);
   procedure Restart;

end Support;
