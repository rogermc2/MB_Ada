
with Interfaces; use Interfaces;

package Int_3xx_4xx_Legacy is

   procedure mINT0_Clear_Int_Flag;
   function mINT0_Get_Int_Flag return Unsigned_16;
   function mINT0_Get_Int_Enable return Unsigned_16;
   procedure mINT0_Int_Enable (Enable : Positive);
   procedure mINT0_Set_Int_Priority (Priority : Natural);
   function mINT0_Get_Int_Priority  return Unsigned_16;
   procedure mINT0_Set_Int_SubPriority (Subpriority : Unsigned_16);
   function mINT0_Get_Int_SubPriority return Unsigned_16;
   procedure mINT0_SetEdgeMode (Mode : Unsigned_16);
   function mINT0_GetEdgeMode return Unsigned_16;
   procedure mOC1_Clear_Int_Flag;
   procedure mOC4_Clear_Int_Flag;
   procedure mOC1_Int_Enable (Enable : Unsigned_32);
   procedure mOC4_Int_Enable (Enable : Unsigned_32);
   procedure mT4_Clear_Int_Flag;
   procedure mT4_Int_Enable (Priority : Natural);
   procedure mT4_Set_Int_Priority (Priority : Natural) ;

end Int_3xx_4xx_Legacy;
