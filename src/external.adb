
with System.Storage_Elements;

with Misc_MX470;

package body External is

   procedure Check_Pin (Pin : Integer; Action : Unsigned_16) is
   begin
      null;

   end Check_Pin;

   function Check_Pin (Pin : Integer; Action : Unsigned_16) return Integer is
      Result : Integer := 0;
   begin
      return Result;

   end Check_Pin;

   function Pin_Read (Pin : Integer; Action : Unsigned_16) return Integer is
      Result : Integer := 0;
   begin
      return Result;

   end Pin_Read;

   --  Pin_Set_Bit sets or clears a bit in the pin's port register
   procedure Pin_Set_Bit (Pin : Integer; Offset : Unsigned_32) is
      use System.Storage_Elements;
      Port_Address : constant System.Address :=
        To_Address (Integer_Address (Misc_MX470.Pin_Def (Pin).Port + Offset));
      Reg : Unsigned_32;
      for Reg'Address use Port_Address;
   begin
      Reg := Unsigned_32 (2 * Misc_MX470.Pin_Def (Pin).Bit_Number);

   end Pin_Set_Bit;

end External;
