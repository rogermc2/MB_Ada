
with  Interfaces.C;

with P32mx470f512h; use P32mx470f512h;

package body Int_3xx_4xx_Legacy is

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
