
with System; use System;

with Ada.Strings.Unbounded; use Ada.Strings.Unbounded;

with Command_And_Token_Tables; use Command_And_Token_Tables;

package Operators is

   op_exp         : constant Address := Null_Address;
   op_mul         : constant Address := Null_Address;
   op_div         : constant Address := Null_Address;
   op_divint      : constant Address := Null_Address;
   op_add         : constant Address := Null_Address;
   op_subtract    : constant Address := Null_Address;
   op_mod         : constant Address := Null_Address;
   op_ne          : constant Address := Null_Address;
   op_gte         : constant Address := Null_Address;
   op_lte         : constant Address := Null_Address;
   op_lt          : constant Address := Null_Address;
   op_gt          : constant Address := Null_Address;
   op_equal       : constant Address := Null_Address;
   op_and         : constant Address := Null_Address;
   op_or          : constant Address := Null_Address;
   op_xor         : constant Address := Null_Address;
   op_not         : constant Address := Null_Address;
   op_shiftleft   : constant Address := Null_Address;
   op_shiftright  : constant Address := Null_Address;

   Operator_Types : array (1 .. Num_Operators) of Command_Table_Item :=
                      ((To_Unbounded_String ("^"),  T_OPER, 0, op_exp),
                       (To_Unbounded_String ("*"),  T_OPER, 0, op_mul),
                       (To_Unbounded_String ("/"),  T_OPER, 0, op_div),
                       (To_Unbounded_String ("\"),  T_OPER, 0, op_divint),
                       (To_Unbounded_String ("Mod"), T_OPER, 0, op_mod),
                       (To_Unbounded_String ("+"),  T_OPER, 0, op_add),
                       (To_Unbounded_String ("-"),  T_OPER, 0, op_subtract),
                       (To_Unbounded_String ("Not"), T_OPER, 0, op_not),
                       (To_Unbounded_String ("<<"), T_OPER, 0, op_shiftleft),
                       (To_Unbounded_String (">>"), T_OPER, 0, op_shiftright),
                       (To_Unbounded_String ("<>"), T_OPER, 0, op_ne),
                       (To_Unbounded_String ("=>"), T_OPER, 0, op_gte),
                       (To_Unbounded_String ("=<"), T_OPER, 0, op_lte),
                       (To_Unbounded_String ("<"),  T_OPER, 0, op_lt),
                       (To_Unbounded_String (">"),  T_OPER, 0, op_gt),
                       (To_Unbounded_String ("="),  T_OPER, 0, op_equal),
                       (To_Unbounded_String ("And"), T_OPER, 0, op_and),
                       (To_Unbounded_String ("Or"),  T_OPER, 0, op_or),
                       (To_Unbounded_String ("Xor"), T_OPER, 0, op_xor));

end Operators;
