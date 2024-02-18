
with Int;

package body MM_System is

   procedure SYSTEM_Config_Wait_States (Sys_Clock : Positive);

   function System_Config (Sys_Clock : Positive; Flags : Unsigned_32)
                           return Natural is
      Pb_Clock   : Natural;
      Int_Status : Unsigned_16 := Int.INT_Disable_Interrupts;
   begin
      --        mBMXDisableDRMWaitState();
      if (Flags and SYS_CFG_WAIT_STATES) = SYS_CFG_WAIT_STATES then

        SYSTEM_Config_Wait_States (Sys_Clock);
      end if;

      return Pb_Clock;

   end System_Config;

   procedure SYSTEM_Config_Wait_States (Sys_Clock : Positive) is
   begin
      null;

   end SYSTEM_Config_Wait_States;

end MM_System;
