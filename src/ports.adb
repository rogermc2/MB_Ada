
with P32mx470f512h; use P32mx470f512h;

package body Ports is

   procedure mJTAG_Port_Enable (Enable : Boolean) is
   begin
      if Enable then
         DDPCONbits.JTAGEN := 1;
      else
         DDPCONbits.JTAGEN := 0;
      end if;

   end mJTAG_Port_Enable;

end Ports;
