
with Ada.Containers.Ordered_Maps;

package Peripheral_Maps is

   type String17 is new String (1 .. 17);
   package Pin_Map is new
     Ada.Containers.Ordered_Maps (String17, Positive);

   procedure Init;

end Peripheral_Maps;
