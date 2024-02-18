
package body Int is

   function Int_Disable_Interrupts return Unsigned_16 is
   begin
      return 0;

   end Int_Disable_Interrupts;

end Int;
