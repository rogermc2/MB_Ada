
with System.Storage_Elements;

with Ada.Text_IO; use Ada.Text_IO;

with Configuration;
with IO_Ports.Tables;
with Misc_MX470;

package body External is

   --  Define the counting pin numbers.
   --  INT1PIN refers to the PIC32 external interrupt #1.
function INT1PIN             (HAS_100PINS ? 76 : 49)
INT1PIN_OPEN        PPSInput(4, INT1, RPD1)
INT1PIN_CLOSE       PPSInput(4, INT1, NULL)

INT2PIN             (HAS_100PINS ? 81 : 52)
INT2PIN_OPEN        PPSInput(3, INT2, RPD4)
INT2PIN_CLOSE       PPSInput(3, INT2, NULL)

INT3PIN             (HAS_100PINS ? 34 : 23)
INT3PIN_OPEN        PPSInput(1, INT3, RPB10)
INT3PIN_CLOSE       PPSInput(1, INT3, NULL)

INT4PIN             (HAS_100PINS ? 78 : 51)
INT4PIN_OPEN        PPSInput(2, INT4, RPD3)
INT4PIN_CLOSE       PPSInput(2, INT4, NULL)
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

 procedure Ext_Config (Pin, Config, Option : Natural) is
   begin
      Check_Pin (Pin,CP_IGNORE_INUSE or CP_IGNORE_RESERVED);

      if Config >= EXT_COM_RESERVED then
         Ext_Current_Config (Pin) := Config;

         --  otherwise make sure that interrupts are disabled in case we are
         --  changing from an interrupt input
      elsif Pin = INT1PIN then
         null;
      end if;

   end Ext_Config;

   procedure Init_Ext_IO is
   begin
      for index in 1 .. IO_Ports.Num_Pins loop
         if Check_Pin (index, CP_NOABORT) then
            Ext_Config (index, Config, Option);
         end if;
      end loop;

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
