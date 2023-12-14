
with Ada.Strings.Unbounded; use Ada.Strings.Unbounded;

package Support is

   type Setup_Exception is (Cause_Nothing, Cause_Display, Cause_File_IO,
                            Cause_Keyboard, Cause_RTC, Cause_Touch,
                            Cause_MM_Startup);

   Except_Cause : Setup_Exception := Cause_Nothing;

   procedure Do_PIN;
   procedure Process_Commands (Tokens : in out Unbounded_String);
   procedure Restart;

end Support;
