
with Interfaces;

package Int_3xx_4xx_Legacy is

   procedure mINT0_Clear_Int_Flag;
   function mINT0_Get_Int_Flag return Boolean;
   function mINT0_Get_Int_Enable return Boolean;
   procedure mINT0_Int_Enable (Enable : Interfaces.Unsigned_16);
   procedure mINT0_Set_Int_Priority (Priority : Interfaces.Unsigned_16);
   function mINT0_Get_Int_Priority  return Natural;
   procedure mINT0_Set_Int_SubPriority (Subpriority : Interfaces.Unsigned_16);
   function mINT0_Get_Int_SubPriority return Interfaces. Unsigned_16;
   procedure mINT0_Set_Edge_Mode (Mode : Interfaces.Unsigned_16);
   function mINT0_Get_Edge_Mode return Interfaces.Unsigned_16;
   procedure mOC1_Clear_Int_Flag;
   procedure mOC4_Clear_Int_Flag;
   procedure mOC1_Int_Enable (Enable : Interfaces.Unsigned_32);
   procedure mOC4_Int_Enable (Enable : Interfaces.Unsigned_32);
   procedure mT4_Clear_Int_Flag;
   procedure mT4_Int_Enable (Priority : Natural);
   procedure mT4_Set_Int_Priority (Priority : Natural) ;

end Int_3xx_4xx_Legacy;
