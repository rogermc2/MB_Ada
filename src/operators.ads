
with Ada.Strings.Unbounded; use Ada.Strings.Unbounded;

with Command_And_Token_Tables; use Command_And_Token_Tables;

package Operators is

   op_exp         : constant Function_Type_Ptr :=  Null;
   op_mul         : constant Function_Type_Ptr :=  Null;
   op_div         : constant Function_Type_Ptr :=  Null;
   op_divint      : constant Function_Type_Ptr :=  Null;
   op_add         : constant Function_Type_Ptr :=  Null;
   op_subtract    : constant Function_Type_Ptr :=  Null;
   op_mod         : constant Function_Type_Ptr :=  Null;
   op_ne          : constant Function_Type_Ptr :=  Null;
   op_gte         : constant Function_Type_Ptr :=  Null;
   op_lte         : constant Function_Type_Ptr :=  Null;
   op_lt          : constant Function_Type_Ptr :=  Null;
   op_gt          : constant Function_Type_Ptr :=  Null;
   op_equal       : constant Function_Type_Ptr :=  Null;
   op_and         : constant Function_Type_Ptr :=  Null;
   op_or          : constant Function_Type_Ptr :=  Null;
   op_xor         : constant Function_Type_Ptr :=  Null;
   op_not         : constant Function_Type_Ptr :=  Null;
   op_shiftleft   : constant Function_Type_Ptr :=  Null;
   op_shiftright  : constant Function_Type_Ptr :=  Null;

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
