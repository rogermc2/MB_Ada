
with Ada.Containers.Formal_Ordered_Maps;

package body PPS is

   type String4 is new String (1 .. 4);
   package Pin_Map is new
     Ada.Containers.Formal_Ordered_Maps (Positive, String4);

   type Channels_Array is array (Natural range <>) of Integer;
   Groups : Channels_Array (1 .. 5);

   procedure PPS_Input (Group, Pin : Natural; Func : String) is
      --        Command : constant String := "IN_FN_PPS" & Group & "_" & Func &
      --          " := IN_PIN_PPS" & "_" & Pin;
      --        To      : constant String := "IN_FN_PPS" & Group & "_" & Func;
      --        From    : constant String := "IN_PIN_PPS" & Group & "_" & Pin;
   begin
      case Group is
         when 1 =>  case Pin is
            when others => null;
            end case;
         when others => null;
      end case;

   end PPS_Input;

   procedure PPS_Output (Group, Pin : Natural; Func : String) is
      --        Command : constant String :=  "OUT_PIN_PPS" & Group & "_" & Pin &
      --        " := OUT_FN_PPS" & Group &  "_" & Func;

      --  OUT_PIN_PPS1_RPA0 := OUT_FN_PPS1_U1TX
      --  Group 1, Pin RPA0, Func U1TX
   begin
      case Group is
      when 1 =>
         case Pin is
         when 1 =>
            case Func is
            when 1 =>  null;
            when others => null;
            end case;
         when others => null;
         end case;
      when others => null;
      end case;

   end PPS_Output;

end PPS;
