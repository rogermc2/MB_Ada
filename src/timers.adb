
with Interfaces.C;

with Configuration;
with Int_3xx_4xx_Legacy;
with P32mx470f512h;

package body Timers is

   procedure Init_Timers is
      use Int_3xx_4xx_Legacy;
      use Interfaces.C;
      use Configuration;
      use P32mx470f512h;
   begin
      PR4 := 500 * unsigned (Bus_Speed / 2 / 1000000) - 1;  --  500 usec
      T4CON := 16#8010#;
      mT4_Clear_Int_Flag;
      mT4_Set_Int_Priority (1);
      mT4_Int_Enable (1);

   end Init_Timers;

end Timers;
