
package body Peripheral_Maps is

   Input_Map : Pin_Map.Map;

   procedure Init is
   begin
      Input_Map.Include ("IN_FN_PPS1_INT4  ", 1);
   end Init;

end Peripheral_Maps;
