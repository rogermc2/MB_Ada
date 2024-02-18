
with Interfaces; use Interfaces;

package MM_System is

   FLASH_SPEED_HZ     : constant Integer := 30000000;  --  Max Flash speed
   PB_BUS_MAX_FREQ_HZ : constant Integer := 80000000;  --  Max Peripheral bus speed

   --  SYSTEMConfig Flags
   SYS_CFG_WAIT_STATES : unsigned_32 := 1;             --  SYSTEMConfig wait states
   SYS_CFG_PB_BUS      : unsigned_32 := 2;             --  SYSTEMConfig pb bus
   SYS_CFG_PCACHE      : unsigned_32 := 4;             --  SYSTEMConfig cache
   SYS_CFG_ALL         : unsigned_32 := 16#FFFFFFFF#;  --  SYSTEMConfig All

   function System_Config (Sys_Clock : Positive; Flags : Unsigned_32)
                           return Natural;
   pragma Inline (System_Config);

end MM_System;
