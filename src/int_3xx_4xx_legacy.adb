
with  Interfaces.C;

with P32mx470f512h; use P32mx470f512h;

package body Int_3xx_4xx_Legacy is

   procedure mINT0_Clear_Int_Flag is
   begin
      IFS0CLR := IFS0_INT0IF_MASK;

   end mINT0_Clear_Int_Flag;

   function mINT0_Get_Int_Flag return Unsigned_16 is
   begin
      return IFS0bits.INT0IF;

   end mINT0_Get_Int_Flag;

   function mINT0_Get_Int_Enable return Unsigned_16 is
   begin
      return IEC0bits.INT0IE;

   end mINT0_Get_Int_Enable;

   procedure mINT0_Int_Enable (Enable : Positive) is
   begin
      IEC0CLR := IEC0_INT0IE_MASK;
      IEC0SET := Shift_Left (enable, IEC0_INT0IE_POSITION);

   end mINT0_Int_Enable;

   procedure mINT0_Set_Int_Priority (Priority : Natural) is
   begin
      IPC0CLR := IPC0_INT0IP_MASK;
      IPC0SET := Shift_Left (Priority, IPC0_INT0IP_POSITION);

   end mINT0_Set_Int_Priority;

   function mINT0_Get_Int_Priority  return Unsigned_16 is
   begin
      return IPC0bits.INT0IP;
   end mINT0_Get_Int_Priority;

   procedure mINT0_Set_Int_SubPriority (Subpriority : Unsigned_16) is
   begin
      IPC0CLR := IPC0_INT0IS_MASK;
      IPC0SET := Shift_Left (Subpriority, IPC0_INT0IS_POSITION);

   end mINT0_Set_Int_SubPriority;

   function mINT0_Get_Int_SubPriority return Unsigned_16 is
   begin
      return IPC0bits.INT0IS;

   end mINT0_Get_Int_SubPriority;

   procedure mINT0_SetEdgeMode (Mode : Unsigned_16) is
   begin
      INTCONCLR := 2 * INTCON_INT0EP_POSITION;
      INTCONSET := Shift_Left (Mode, INTCON_INT0EP_POSITION);

   end mINT0_SetEdgeMode;

   function mINT0_GetEdgeMode return Unsigned_16 is
   begin
      return INTCONbits.INT0EP;

   end mINT0_GetEdgeMode;

   procedure mOC1_Clear_Int_Flag is
   begin
      IFS0CLR := 0;

   end mOC1_Clear_Int_Flag;

   procedure mOC4_Clear_Int_Flag is
   begin
      IFS0CLR := 0;

   end mOC4_Clear_Int_Flag;

   procedure mOC1_Int_Enable (Enable : Unsigned_32) is
   begin
      null;

   end mOC1_Int_Enable;

   procedure mOC4_Int_Enable (Enable : Unsigned_32) is
   begin
      null;

   end mOC4_Int_Enable;

   procedure mT4_Clear_Int_Flag is
      use Interfaces.C;
   begin
      IFS0CLR := IFS0_T4IF_Mask;

   end mT4_Clear_Int_Flag;

   procedure mT4_Int_Enable (Priority : Natural) is
      use Interfaces.C;
   begin
      IEC0CLR := IEC0_T4IE_Mask;

   end mT4_Int_Enable;

   procedure mT4_Set_Int_Priority (Priority : Natural) is
      use Interfaces.C;
   begin
      IPC4CLR :=
        unsigned (Shift_Left (Unsigned_32 (IPC4_T4IP_Position), Priority));

   end mT4_Set_Int_Priority;

end Int_3xx_4xx_Legacy;
