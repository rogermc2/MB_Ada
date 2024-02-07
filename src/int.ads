
with Interfaces; use Interfaces;

package Int is

   type Int_En_Dis is (Int_Disabled, Int_Enabled);

   function Int_Disable_Interrupts return Unsigned_16;

end Int;
