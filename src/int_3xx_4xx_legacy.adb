
with P32mx470f512h;

package body Int_3xx_4xx_Legacy is

   procedure mOC1_Clear_Int_Flag is
      use P32mx470f512h;
   begin
      IFS0CLR := 0;

   end mOC1_Clear_Int_Flag;

   procedure mOC4_Clear_Int_Flag is
      use P32mx470f512h;
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

end Int_3xx_4xx_Legacy;
