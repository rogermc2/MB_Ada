
with System.Storage_Elements;

with Ada.Text_IO; use Ada.Text_IO;

with Configuration;
with IO_Ports.Tables;
with Misc_MX470;

package body External is

   function Check_Pin (Pin : Integer; Action : Unsigned_16) return Boolean is
      use IO_Ports;
      use IO_Ports.Tables;
      Routine_Name : constant String := "External.Check_Pin ";
      OK           : Boolean := True;
   begin
      if Configuration.Debug_Mode then
         OK := (Action and CP_NOABORT) /= 0 and then
           ((Has_64_Pins and (Pin = 15 or else Pin = 16)) or else
              (Has_100_Pins and (Pin = 24 or else Pin = 25)));
         if not OK then
            Put_Line (Routine_Name & "Pin " & Integer'Image (Pin) &
                        " unavailable. It is used by the ICSP.");
         end if;
      end if;

      if (Pin < 1 or else Pin > Num_Pins) or else
        (Pin_Def_Table (Pin).Mode = Pin_Unused) or else
        (HAS_USB and then (Pin = 1 or else Pin = 2)) then
         OK := (Action and CP_NOABORT) /= 0;
         if not OK then
            Put_Line (Routine_Name & "Pin " & Integer'Image (Pin) &
                        " is invalid.");
         end if;
      end if;

      if OK then
         if (Action and CP_IGNORE_BOOTRES) = 0 and then
           Ext_Current_Config (Pin) = EXT_BOOT_RESERVED then
            OK := (Action and CP_NOABORT) /= 0;
            if not OK then
               Put_Line (Routine_Name & "Pin " & Integer'Image (Pin) &
                           " is in use.");
            end if;
         elsif
           (Action and CP_IGNORE_RESERVED) = 0 and then
           Ext_Current_Config (Pin) = EXT_COM_RESERVED then
            OK := (Action and CP_NOABORT) /= 0;
            if not OK then
               Put_Line (Routine_Name & "Pin " & Integer'Image (Pin) &
                           " is in use.");
            end if;
         end if;
      end if;

      return OK;

   end Check_Pin;

   pragma Warnings (Off);
   procedure Check_Pin (Pin : Integer; Action : Unsigned_16) is
      OK : constant Boolean := Check_Pin (Pin, Action);
   begin
      null;
   end Check_Pin;
   pragma Warnings (On);

   procedure Init_Ext_IO is
   begin
      null;
   end Init_Ext_IO;

   function Pin_Read (Pin : Integer) return Integer is
      use IO_Ports.Tables;
   begin
      return Integer (Shift_Right (Pin_Def_Table (Pin).Port,
                      Pin_Def_Table (Pin).Bit_Number mod 2));

   end Pin_Read;

   --  Pin_Set_Bit sets or clears a bit in the pin's port register
   procedure Pin_Set_Bit (Pin : Integer; Offset : Unsigned_32) is
      use System.Storage_Elements;
      Port_Address : constant System.Address :=
        To_Address (Integer_Address (Misc_MX470.Pin_Def (Pin).Port + Offset));
      Reg          : Unsigned_32;
      --        for Reg'Address use Port_Address;
   begin
      Reg := Unsigned_32 (2 * Misc_MX470.Pin_Def (Pin).Bit_Number);

   end Pin_Set_Bit;

end External;
