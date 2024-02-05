
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

   procedure Pin_Set_Bit (Pin : Integer; Offset : Unsigned_16) is
      use IO_Ports.Tables;
   begin
      Misc_MX470.Pin_Def (Pin).Port :=
        Port_Addresses (2 * Misc_MX470.Pin_Def (Pin).Bit_Number);

   end Pin_Set_Bit;

end External;
