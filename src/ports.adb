
with P32mx470f512h; use P32mx470f512h;
with Int_3xx_4xx_Legacy;

package body Ports is

   procedure Config_INT0 (Config : Unsigned_16) is
      use Int_3xx_4xx_Legacy;
   begin
      mINT0_Clear_Int_Flag;
      mINT0_Set_Int_Priority (Config and 7);
      mINT0_Set_Edge_Mode (Shift_Right (Config, 3) and 1);
      mINT0_Int_Enable (Shift_Right (Config, 15));

   end Config_INT0;

   procedure mJTAG_Port_Enable (Enable : Boolean) is
   begin
      if Enable then
         DDPCONbits.JTAGEN := 1;
      else
         DDPCONbits.JTAGEN := 0;
      end if;

   end mJTAG_Port_Enable;

end Ports;
