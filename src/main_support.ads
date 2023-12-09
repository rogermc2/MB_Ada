
with Ada.Strings.Unbounded; use Ada.Strings.Unbounded;

with Global;

package Main_Support is

   type Setup_Exception is (Cause_Nothing, Cause_Display, Cause_File_IO,
                            Cause_Keyboard, Cause_RTC, Cause_Touch,
                            Cause_MM_Startup);

   Except_Cause : Setup_Exception := Cause_Nothing;

   procedure Do_PIN;
   procedure Process_Commands (Tokens : in out Global.UB_String_Buffer);
   procedure Restart;

end Main_Support;
