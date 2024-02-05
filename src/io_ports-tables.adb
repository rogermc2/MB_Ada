
package body IO_Ports.Tables is

   function U_Val (Mode : Pin_Modes) return Unsigned_8 is
   begin
      return Pin_Modes'Enum_Rep (Mode);

   end U_Val;

end IO_Ports.Tables;
