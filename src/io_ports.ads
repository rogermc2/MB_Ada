
with Interfaces; use Interfaces;

package IO_Ports is

   DEV_ID : constant Unsigned_32 := Unsigned_32 (16#BF80F220#);
   PIC32MX470F512H_DEVID : constant Unsigned_32 := Unsigned_32 (16#0580A053#);
   PIC32MX470F512L_DEVID : constant Unsigned_32 := Unsigned_32 (16#0580B053#);
   HAS_USB     : constant  Boolean := True;
   HAS_64PINS  : constant Boolean :=
     (DEV_ID and 16#fffffff#) = PIC32MX470F512H_DEVID;
   HAS_100PINS : constant Boolean :=
     (DEV_ID and 16#fffffff#) = PIC32MX470F512L_DEVID;

   --   General defines
   P_INPUT       : constant Unsigned_32 := Unsigned_32 (1);  --  for setting the TRIS on I/O bits
   P_OUTPUT      : constant Unsigned_32 := Unsigned_32 (0);
   P_ON          : constant Unsigned_32 := Unsigned_32 (1);
   P_OFF         : constant Unsigned_32 := Unsigned_32 (0);
   --  Constant definitions of the port registers in the 28-pin chips
   ADDR_PORTA    : constant Unsigned_32 := Unsigned_32 (16#bf886020#);
   ADDR_PORTB    : constant Unsigned_32 := Unsigned_32 (16#bf886120#);
   ADDR_PORTC    : constant Unsigned_32 := Unsigned_32 (16#bf886220#);

   Max_Nbr_Ports : constant Positive := 100;
   Has_64_Pins   : constant Boolean := True;
   Has_100_Pins  : constant Boolean := False;

   function Console_Rx_Pin return Positive;
   function Console_Tx_Pin return Positive;
   function Num_Pins return Positive;

end IO_Ports;
