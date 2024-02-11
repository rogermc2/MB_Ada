
with Interfaces; use Interfaces;

with IO_Ports;

package External is

   EXT_NOT_CONFIG        : constant Natural := 0;
   EXT_ANA_IN   : constant Positive := 1;
   EXT_DIG_IN   : constant Positive := 2;
   EXT_FREQ_IN  : constant Positive := 3;
   EXT_PER_IN   : constant Positive := 4;
   EXT_CNT_IN   : constant Positive := 5;
   EXT_INT_HI   : constant Positive := 6;
   EXT_INT_LO   : constant Positive := 7;
   EXT_DIG_OUT  : constant Positive := 8;
   EXT_OC_OUT   : constant Positive := 9;
   EXT_INT_BOTH : constant Positive := 10;
   --  pin 100 is reserved, SETPIN and PIN cannot be used.
   EXT_COM_RESERVED      : constant Positive := 100;
   --  pin 101 is reserved at bootup and cannot be used.
   EXT_BOOT_RESERVED     : constant Positive := 101;
   EXT_DS18B20_RESERVED  : constant Positive := 102;

   --  for Check_Pin action can be set to:
   --  abort with an error if invalid, in use or reserved
   CP_CHECKALL        : constant unsigned_16 := 2#0000#;
   --  the function will not abort with an error
   CP_NOABORT: constant unsigned_16 := 2#0001#;
   --  the function will ignore pins that are in use
   --  (but not including reserved pins)
   CP_IGNORE_INUSE    : constant unsigned_16 := 2#0010#;
   --  the function will ignore reserved pins
   --  (EXT_COM_RESERVED and EXT_BOOT_RESERVED)
   CP_IGNORE_RESERVED : constant unsigned_16 := 2#0100#;
   --  the function will ignore the boot reserved pins (EXT_BOOT_RESERVED)
   CP_IGNORE_BOOTRES  : constant unsigned_16 := 2#1000#;

   ANSEL     : constant integer := -8;
   ANSELCLR  : constant integer := -7;
   ANSELSET  : constant integer := -6;
   ANSELINV  : constant integer := -5;
   TRIS      : constant integer := -4;
   TRISCLR   : constant integer := -3;
   TRISSET   : constant integer := -2;
   TRISINV   : constant integer := -1;
   PORT      : constant integer := 0;
   PORTCLR   : constant integer := 1;
   PORTSET   : constant integer := 2;
   PORTINV   : constant integer := 3;
   LAT       : constant integer := 4;
   LATCLR    : constant integer := 5;
   LATSET    : constant integer := 6;
   LATINV    : constant integer := 7;
   ODC       : constant integer := 8;
   ODCCLR    : constant integer := 9;
   ODCSET    : constant integer := 10;
   ODCINV    : constant integer := 11;
   CNPU      : constant integer := 12;
   CNPUCLR   : constant integer := 13;
   CNPUSET   : constant integer := 14;
   CNPUINV   : constant integer := 15;
   CNPD      : constant integer := 16;
   CNPDCLR   : constant integer := 17;
   CNPDSET   : constant integer := 18;
   CNPDINV   : constant integer := 19;
   CNCON     : constant integer := 20;
   CNCONCLR  : constant integer := 21;
   CNCONSET  : constant integer := 22;
   CNCONINV  : constant integer := 23;
   CNEN      : constant integer := 24;
   CNENCLR   : constant integer := 25;
   CNENSET   : constant integer := 26;
   CNENINV   : constant integer := 27;
   CNSTAT    : constant integer := 28;
   CNSTATCLR : constant integer := 29;
   CNSTATSET : constant integer := 30;
   CNSTATINV : constant integer := 31;

   Ext_Current_Config : array (1 .. IO_Ports.Max_Nbr_Ports) of Integer;

   procedure Check_Pin (Pin : Integer; Action : Unsigned_16);
   function Check_Pin (Pin : Integer; Action : Unsigned_16) return Boolean;
   procedure Init_Ext_IO (Config, Option : Natural);
   function Pin_Read (Pin : Integer) return Integer;
   procedure Pin_Set_Bit (Pin : Integer; Offset : Unsigned_32);

end External;
