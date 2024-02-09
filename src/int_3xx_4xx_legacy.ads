
with Interfaces; use Interfaces;

package Int_3xx_4xx_Legacy is

   procedure mOC1_Clear_Int_Flag;
   procedure mOC4_Clear_Int_Flag;
   procedure mOC1_Int_Enable (Enable : Unsigned_32);
   procedure mOC4_Int_Enable (Enable : Unsigned_32);
   procedure mT4_Clear_Int_Flag;
   procedure mT4_Int_Enable (Priority : Natural);
   procedure mT4_Set_Int_Priority (Priority : Natural) ;

end Int_3xx_4xx_Legacy;
