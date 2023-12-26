
with System; use System;

with Ada.Strings.Unbounded; use Ada.Strings.Unbounded;

with Command_And_Token_Functions; use Command_And_Token_Functions;
with Command_And_Token_Tables; use Command_And_Token_Tables;

package Operators is

   op_exp         : constant Access_Procedure :=  Null;
   op_mul         : constant Access_Procedure :=  Null;
   op_div         : constant Access_Procedure :=  Null;
   op_divint      : constant Access_Procedure :=  Null;
   op_add         : constant Access_Procedure :=  Null;
   op_subtract    : constant Access_Procedure :=  Null;
   op_mod         : constant Access_Procedure :=  Null;
   op_ne          : constant Access_Procedure :=  Null;
   op_gte         : constant Access_Procedure :=  Null;
   op_lte         : constant Access_Procedure :=  Null;
   op_lt          : constant Access_Procedure :=  Null;
   op_gt          : constant Access_Procedure :=  Null;
   op_equal       : constant Access_Procedure :=  Null;
   op_and         : constant Access_Procedure :=  Null;
   op_or          : constant Access_Procedure :=  Null;
   op_xor         : constant Access_Procedure :=  Null;
   op_not         : constant Access_Procedure :=  Null;
   op_shiftleft   : constant Access_Procedure :=  Null;
   op_shiftright  : constant Access_Procedure :=  Null;

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
