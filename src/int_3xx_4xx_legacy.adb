
with Interfaces.C;
with Interfaces.C.Extensions; use Interfaces.C.Extensions;

with P32mx470f512h; use P32mx470f512h;

package body Int_3xx_4xx_Legacy is

   procedure mINT0_Clear_Int_Flag is
   begin
      IFS0CLR := IFS0_INT0IF_MASK;

   end mINT0_Clear_Int_Flag;

   function mINT0_Get_Int_Flag return Boolean is
   begin

      return IFS0bits.anon5420.INT0IF = 1;

   end mINT0_Get_Int_Flag;

      function mINT0_Get_Int_Enable return Boolean is
   begin
      return IEC0bits.anon5530.INT0IE = 1;

   end mINT0_Get_Int_Enable;

   procedure mINT0_Int_Enable (Enable : Interfaces.Unsigned_16) is
      use Interfaces;
      use Interfaces.C;
   begin
      IEC0CLR := IEC0_INT0IE_MASK;
      IEC0SET := unsigned
        (Shift_Left (Enable, Natural (IEC0_INT0IE_POSITION)));

   end mINT0_Int_Enable;

   procedure mINT0_Set_Int_Priority (Priority : Interfaces.Unsigned_16) is
      use Interfaces;
      use Interfaces.C;
   begin
      IPC0CLR := IPC0_INT0IP_MASK;
      IPC0SET := unsigned
        (Shift_Left (Priority, Natural (IPC0_INT0IP_POSITION)));

   end mINT0_Set_Int_Priority;

   function mINT0_Get_Int_Priority return Natural is
   begin
      return Natural (IPC0bits.anon5619.INT0IP);

   end mINT0_Get_Int_Priority;

   procedure mINT0_Set_Int_SubPriority (Subpriority : Interfaces.Unsigned_16) is
      use Interfaces;
      use Interfaces.C;
   begin
      IPC0CLR := IPC0_INT0IS_MASK;
      IPC0SET := unsigned
        (Shift_Left (Subpriority, Natural (IPC0_INT0IS_POSITION)));

   end mINT0_Set_Int_SubPriority;

   function mINT0_Get_Int_SubPriority return Interfaces.Unsigned_16 is
   begin
      return Interfaces.Unsigned_16 (IPC0bits.anon5619.INT0IS);

   end mINT0_Get_Int_SubPriority;

   procedure mINT0_Set_Edge_Mode (Mode : Interfaces.Unsigned_16) is
      use Interfaces;
      use Interfaces.C;
   begin
      INTCONCLR := 2 * INTCON_INT0EP_POSITION;
      INTCONSET := unsigned
        (Shift_Left (Mode, Natural (INTCON_INT0EP_POSITION)));

   end mINT0_Set_Edge_Mode;

   function mINT0_Get_Edge_Mode return Interfaces.Unsigned_16 is
   begin
      return Interfaces.Unsigned_16 (INTCONbits.anon5362.INT0EP);

   end mINT0_Get_Edge_Mode;

   procedure mOC1_Clear_Int_Flag is
   begin
      IFS0CLR := 0;

   end mOC1_Clear_Int_Flag;

   procedure mOC4_Clear_Int_Flag is
   begin
      IFS0CLR := 0;

   end mOC4_Clear_Int_Flag;

   procedure mOC1_Int_Enable (Enable : Interfaces.Unsigned_32) is
      use Interfaces;
      use Interfaces.C;
   begin
        IEC0CLR := IEC0_OC1IE_MASK;
      IEC1SET := unsigned
        (Shift_Left (Enable, Natural (IEC0_OC1IE_POSITION)));

   end mOC1_Int_Enable;

   procedure mOC4_Int_Enable (Enable : Interfaces.Unsigned_32) is
      use Interfaces;
      use Interfaces.C;
   begin
        IEC0CLR := IEC0_OC4IE_MASK;
      IEC0SET := unsigned
        (Shift_Left (Enable, Natural (IEC0_OC4IE_POSITION)));

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
      use Interfaces;
      use Interfaces.C;
   begin
      IPC4CLR := unsigned
        (Shift_Left (Interfaces.Unsigned_32 (IPC4_T4IP_Position), Priority));

   end mT4_Set_Int_Priority;

end Int_3xx_4xx_Legacy;
