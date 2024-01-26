
with Ada.Strings.Unbounded;

with Command_And_Token_Tables; use Command_And_Token_Tables;

package Support is

   type Setup_Exception is (Cause_Nothing, Cause_Display, Cause_File_IO,
                            Cause_Keyboard, Cause_RTC, Cause_Touch,
                            Cause_MM_Startup);
   type Exception_Code is (EXCEP_IRQ,    --  interrupt
                           EXCEP_AdEL,    --  address error exception (load or ifetch)
                           EXCEP_AdES,    --  address error exception (store)
                           EXCEP_IBE,    --  bus error (ifetch)
                           EXCEP_DBE,    --  bus error (load/store)
                           EXCEP_Sys,    --  syscall
                           EXCEP_Bp,    --  breakpoint
                           EXCEP_RI,    --  reserved instruction
                           EXCEP_CpU,    --  coprocessor unusable
                           EXCEP_Overflow,    --  arithmetic overflow
                           EXCEP_Trap,    --  trap (possible divide by zero)
                           EXCEP_IS1,    --  implementation specfic 1
                           EXCEP_CEU,    --  CorExtend Unuseable
                           EXCEP_C2E,
                           EXCEP_NONE,
                           RESTART_DO_AUTORUN,
                           RESTART_NO_AUTORUN,
                           PIN_RESTART,
                           WATCHDOG_TIMEOUT,
                           RESET_COMMAND);

   for Exception_Code use (EXCEP_IRQ => 0,
                           EXCEP_AdEL => 4,
                           EXCEP_AdES => 5,
                           EXCEP_IBE => 6,
                           EXCEP_DBE => 7,
                           EXCEP_Sys => 8,
                           EXCEP_Bp => 9,
                           EXCEP_RI => 10,
                           EXCEP_CpU => 11,
                           EXCEP_Overflow => 12,
                           EXCEP_Trap => 13,
                           EXCEP_IS1 => 16,
                           EXCEP_CEU => 17,
                           EXCEP_C2E => 18,
                           EXCEP_NONE => 9990,
                           RESTART_DO_AUTORUN => 9995,
                           RESTART_NO_AUTORUN => 9996,
                           PIN_RESTART => 9997,
                           WATCHDOG_TIMEOUT => 9998,
                           RESET_COMMAND => 9999);

   Except_Cause : Setup_Exception := Cause_Nothing;
   Except_Code  : Exception_Code := EXCEP_NONE;

   procedure Buffer_Append (Buffer : in out String_Buffer; Item : String);
   function Buffer_Item (Buffer : String_Buffer; Pos : Positive) return String;
   function Buffer_Length (Buffer : String_Buffer) return Natural;
   function Buffer_Not_Empty (Buffer : String_Buffer) return Boolean;
   procedure Clear_Buffer (Buffer : in out String_Buffer);
   procedure Copy_Slice (Buffer : in out String_Buffer;
                         Pos1   : in out Positive; Pos2 : Positive);
   procedure Do_PIN;
   procedure Execute_MM_Basic;
   procedure Initialize;
   procedure Print_Buffer (Buffer     : String_Buffer;
                           With_Delim : Boolean := False);
   procedure Process_Commands;
   procedure Restart;
   procedure Setup;
   procedure Skip_Spaces (Buffer : String_Buffer; Pos : in out Positive);
   procedure Skip_Buffer_Element (Buffer : String_Buffer;
                                  Pos    : in out Positive);
   procedure Skip_Buffer_Spaces (Buffer : in out String_Buffer;
                                 Pos    : in out Positive);
   function To_String (aChar : Character) return String;
   function To_UB_String (aChar : Character)
                          return Ada.Strings.Unbounded.Unbounded_String;

end Support;
