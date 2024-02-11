
with Interfaces; use Interfaces;

package PPS is
 --  Output Pin Group 1
PPS_OUTPUT_BASE_ADDRESS : constant Unsigned_32 := 0;   --  RPA0R
OUT_PIN_PPS1_RPA0       : constant Unsigned_32 := 0;   --  RPA0Rbits.RPA0R
OUT_PIN_PPS1_RPB3       : constant Unsigned_32 := 0;  --  RPB3Rbits.RPB3R
OUT_PIN_PPS1_RPB4       : constant Unsigned_32 := 0;  --  RPB4Rbits.RPB4R
OUT_PIN_PPS1_RPB15      : constant Unsigned_32 := 0;  --  RPB15Rbits.RPB15R
OUT_PIN_PPS1_RPB7       : constant Unsigned_32 := 0;  --  RPB7Rbits.RPB7R
OUT_PIN_PPS1_RPC7       : constant Unsigned_32 := 0;  --  RPC7Rbits.RPC7R
OUT_PIN_PPS1_RPC0       : constant Unsigned_32 := 0;  --  RPC0Rbits.RPC0R
OUT_PIN_PPS1_RPC5       : constant Unsigned_32 := 0;  --  RPC5Rbits.RPC5R

OUT_FN_PPS1_NULL        : constant Unsigned_32 := 0;  --  No Connect
OUT_FN_PPS1_U1TX        : constant Unsigned_32 := 1;  --  RPn tied to U1TX
OUT_FN_PPS1_U2RTS       : constant Unsigned_32 := 2;  --  RPn tied to U2RTS_BAR
OUT_FN_PPS1_SS1         : constant Unsigned_32 := 3;  --  RPn tied to SS1
--                                                4  -   RESERVED
OUT_FN_PPS1_OC1         : constant Unsigned_32 := 5;  --  RPn tied to OC1
--                                                6  -   RESERVED
OUT_FN_PPS1_C2OUT       : constant Unsigned_32 := 7;  --  RPn tied to C2OUT

   procedure PPS_Input (Group, Pin : Natural; Func : String);
   procedure PPS_Output (Group, Pin : Natural; Func : String);

end PPS;
