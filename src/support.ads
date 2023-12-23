
with Command_And_Token_Tables; use Command_And_Token_Tables;

package Support is

   type Setup_Exception is (Cause_Nothing, Cause_Display, Cause_File_IO,
                            Cause_Keyboard, Cause_RTC, Cause_Touch,
                            Cause_MM_Startup);

   Except_Cause : Setup_Exception := Cause_Nothing;

   function Buffer_Item (Buffer : String_Buffer; Pos : Positive) return String;
   procedure Clear_Buffer (Buffer : in out String_Buffer);
   procedure Copy_Slice (Buffer : in out String_Buffer;
                         Pos1 : in out Positive; Pos2 : Positive);
   procedure Do_PIN;
   procedure Initialize;
   procedure Process_Commands;
   procedure Restart;
   procedure Setup;

end Support;
