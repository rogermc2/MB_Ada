
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

   Ext_Current_Config : array (1 .. IO_Ports.Max_Nbr_Ports) of Integer;

   function Check_Pin (Pin, Action : Integer) return Integer;

end External;
