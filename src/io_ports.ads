
package IO_Ports is

   Max_Nbr_Ports : constant Positive := 100;
   Has_64_Pins   : constant Boolean := True;
   Has_100_Pins  : constant Boolean := False;

   function Console_Rx_Pin return Positive;
   function Console_Tx_Pin return Positive;

end IO_Ports;
