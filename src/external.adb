
with System;

with IO_Ports.Tables;
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
      use IO_Ports.Tables;
      Port_Address : Unsigned_32 := Misc_MX470.Pin_Def (Pin).Port + Offset;
      X            : System.Address;
      for X'Address use Port_Address;
   begin
      X := Unsigned_32 (2 * Misc_MX470.Pin_Def (Pin).Bit_Number);

   end Pin_Set_Bit;

end External;
