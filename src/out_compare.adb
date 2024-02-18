
with Int_3xx_4xx_Legacy;
with P32mx470f512h;

package body Out_Compare is

   procedure Close_OC1 is
      use Int_3xx_4xx_Legacy;
      use P32mx470f512h;
   begin
      mOC1_Int_Enable (0);
      mOC1_Clear_Int_Flag;
      OC2CONCLR := OC2Con_On_Mask;

   end Close_OC1;

   procedure Close_OC4 is
      use Int_3xx_4xx_Legacy;
      use P32mx470f512h;
   begin
      mOC4_Int_Enable (0);
      mOC4_Clear_Int_Flag;
      OC4CONCLR := OC4Con_On_Mask;

   end Close_OC4;

end Out_Compare;
