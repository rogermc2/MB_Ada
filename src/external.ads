
with Interfaces; use Interfaces;

with IO_Ports;

package External is

   EXT_NOT_CONFIG        : constant Natural := 0;
   EXT_ANA_IN            : constant Positive := 1;
   EXT_DIG_IN            : constant Positive := 2;
   EXT_FREQ_IN           : constant Positive := 3;
   EXT_PER_IN            : constant Positive := 4;
   EXT_CNT_IN            : constant Positive := 5;
   EXT_INT_HI            : constant Positive := 6;
   EXT_INT_LO            : constant Positive := 7;
   EXT_DIG_OUT           : constant Positive := 8;
   EXT_OC_OUT            : constant Positive := 9;
   EXT_INT_BOTH          : constant Positive := 10;
   --  pin 100 is reserved, SETPIN and PIN cannot be used.
   EXT_COM_RESERVED      : constant Positive := 100;
   --  pin 101 is reserved at bootup and cannot be used.
   EXT_BOOT_RESERVED     : constant Positive := 101;
   EXT_DS18B20_RESERVED  : constant Positive := 102;

   --  for Check_Pin action can be set to:
   --  abort with an error if invalid, in use or reserved
   CP_CHECKALL        : constant unsigned_16 := 2#0000#;
   --  the function will not abort with an error
   CP_NOABORT         : constant unsigned_16 := 2#0001#;
   --  the function will ignore pins that are in use
   --  (but not including reserved pins)
   CP_IGNORE_INUSE    : constant unsigned_16 := 2#0010#;
   --  the function will ignore reserved pins
   --  (EXT_COM_RESERVED and EXT_BOOT_RESERVED)
   CP_IGNORE_RESERVED : constant unsigned_16 := 2#0100#;
   --  the function will ignore the boot reserved pins (EXT_BOOT_RESERVED)
   CP_IGNORE_BOOTRES  : constant unsigned_16 := 2#1000#;

   Ext_Current_Config : array (1 .. IO_Ports.Max_Nbr_Ports) of Integer;

   procedure Check_Pin (Pin : Integer; Action : Unsigned_16);
   function Check_Pin (Pin : Integer; Action : Unsigned_16) return Integer;

end External;
