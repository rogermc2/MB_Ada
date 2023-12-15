
with System; use System;

with Ada.Strings.Unbounded; use Ada.Strings.Unbounded;

package Command_And_Token_Tables is

   type Fun_Type is (T_NA, T_FNA, T_FUN, T_INT, T_NBR, T_OPER, T_STR);
   for Fun_Type use (T_NA => 0,
                     T_FNA => 1,
                     T_FUN => 2,
                     T_INT => 3,
                     T_NBR => 4,
                     T_OPER => 5,
                     T_STR => 6);

   type Command_Table_Item is record
      Name          : Unbounded_String;
      Command_Type1 : Fun_Type := T_NA;
      Command_Type2 : Fun_Type := T_NA;
      Command_Type3 : Fun_Type := T_NA;
      Command_Type4 : Fun_Type := T_NA;
      Precedence    : Natural := 0;
      Function_Ptr  : Address := Null_Address;
   end record;

   Num_Commands  : constant Positive := 45;
   Num_Functions : constant Positive := 100;
   Num_Tokens    : constant Positive := 9;

   op_invalid    : constant Address := Null_Address;
   fun_acos      : constant Address := Null_Address;
   fun_abs       : constant Address := Null_Address;
   fun_asc       : constant Address := Null_Address;
   fun_asin      : constant Address := Null_Address;
   fun_atn       : constant Address := Null_Address;
   fun_bin       : constant Address := Null_Address;
   fun_chr       : constant Address := Null_Address;
   fun_cint      : constant Address := Null_Address;
   fun_cos       : constant Address := Null_Address;
   fun_deg       : constant Address := Null_Address;
   fun_errno     : constant Address := Null_Address;
   fun_errmsg    : constant Address := Null_Address;
   fun_exp       : constant Address := Null_Address;
   fun_fix       : constant Address := Null_Address;
   fun_hex       : constant Address := Null_Address;
   fun_inkey     : constant Address := Null_Address;
   fun_instr     : constant Address := Null_Address;
   fun_int       : constant Address := Null_Address;
   fun_lcase     : constant Address := Null_Address;
   fun_ucase     : constant Address := Null_Address;
   fun_left      : constant Address := Null_Address;
   fun_len       : constant Address := Null_Address;
   fun_log       : constant Address := Null_Address;
   fun_mid       : constant Address := Null_Address;
   fun_version   : constant Address := Null_Address;
   fun_oct       : constant Address := Null_Address;
   fun_pi        : constant Address := Null_Address;
   fun_pos       : constant Address := Null_Address;
   fun_rad       : constant Address := Null_Address;
   fun_right     : constant Address := Null_Address;
   fun_rnd       : constant Address := Null_Address;
   fun_sgn       : constant Address := Null_Address;
   fun_sin       : constant Address := Null_Address;
   fun_tan       : constant Address := Null_Address;
   fun_space     : constant Address := Null_Address;
   fun_sqr       : constant Address := Null_Address;
   fun_str       : constant Address := Null_Address;
   fun_string    : constant Address := Null_Address;
   fun_tab       : constant Address := Null_Address;
   tan           : constant Address := Null_Address;
   un_ucase      : constant Address := Null_Address;
   fun_val       : constant Address := Null_Address;
   fun_eval      : constant Address := Null_Address;
   fun_max       : constant Address := Null_Address;
   fun_min       : constant Address := Null_Address;

   cmd_nul       : constant Address := Null_Address;

   Command_Types : array (1 .. Num_Commands) of Command_Table_Item :=
                     ((To_Unbounded_String ("ACos("),  T_FUN, T_NBR, T_NA, T_NA, 0, fun_acos),
                      (To_Unbounded_String ("Abs("),   T_FUN, T_NBR, T_INT, T_NA, 0, fun_abs),
                      (To_Unbounded_String ("Asc("),   T_FUN, T_INT, T_NA, T_NA, 0, fun_asc),
                      (To_Unbounded_String ("ASin("),  T_FUN, T_NBR, T_NA, T_NA, 0, fun_asin),
                      (To_Unbounded_String ("Atn("),   T_FUN, T_NBR, T_NA, T_NA, 0, fun_atn),
                      (To_Unbounded_String ("Bin$("),  T_FUN, T_STR, T_NA, T_NA, 0, fun_bin),
                      (To_Unbounded_String ("Chr$("),  T_FUN, T_STR, T_NA, T_NA, 0, fun_chr),
                      (To_Unbounded_String ("Cint("),  T_FUN, T_INT, T_NA, T_NA, 0, fun_cint),
                      (To_Unbounded_String ("Cos("),   T_FUN, T_NBR, T_NA, T_NA, 0, fun_cos),
                      (To_Unbounded_String ("Deg("),   T_FUN, T_NBR, T_NA, T_NA, 0, fun_deg),
                      (To_Unbounded_String ("MM.Errno"),   T_FNA, T_INT, T_NA, T_NA, 0, fun_errno),
                      (To_Unbounded_String ("MM.ErrMsg$"), T_FNA, T_STR, T_NA, T_NA, 0, fun_errmsg),
                      (To_Unbounded_String ("Exp("),   T_FUN, T_NBR, T_NA, T_NA, 0, fun_exp),
                      (To_Unbounded_String ("Fix("),   T_FUN, T_INT, T_NA, T_NA, 0, fun_fix),
                      (To_Unbounded_String ("Hex$("),  T_FUN, T_STR, T_NA, T_NA, 0, fun_hex),
                      (To_Unbounded_String ("Inkey$"), T_FNA, T_STR, T_NA, T_NA, 0, fun_inkey),
                      (To_Unbounded_String ("Instr("), T_FUN, T_INT, T_NA, T_NA, 0, fun_instr),
                      (To_Unbounded_String ("Int("),   T_FUN, T_INT, T_NA, T_NA, 0, fun_int),
                      (To_Unbounded_String ("LCase$("), T_FUN, T_STR, T_NA, T_NA, 0, fun_lcase),
                      (To_Unbounded_String ("Left$("), T_FUN, T_STR, T_NA, T_NA, 0, fun_left),
                      (To_Unbounded_String ("Len("),   T_FUN, T_INT, T_NA, T_NA, 0, fun_len),
                      (To_Unbounded_String ("Log("),   T_FUN, T_NBR, T_NA, T_NA, 0, fun_log),
                      (To_Unbounded_String ("Mid$("),  T_FUN, T_STR, T_NA, T_NA, 0, fun_mid),
                      (To_Unbounded_String ("MM.Ver"), T_FNA, T_NBR, T_NA, T_NA, 0, fun_version),
                      (To_Unbounded_String ("Oct$("),  T_FUN, T_STR, T_NA, T_NA, 0, fun_oct),
                      (To_Unbounded_String ("Pi"),     T_FNA, T_NBR, T_NA, T_NA, 0, fun_pi ),
                      (To_Unbounded_String ("Pos"),    T_FNA, T_INT, T_NA, T_NA, 0, fun_pos),
                      (To_Unbounded_String ("Rad("),   T_FUN, T_NBR, T_NA, T_NA, 0, fun_rad),
                      (To_Unbounded_String ("Right$("), T_FUN, T_STR, T_NA, T_NA, 0, fun_right),
                      (To_Unbounded_String ("Rnd("),   T_FUN, T_NBR, T_NA, T_NA, 0, fun_rnd),  -- this must come before Rnd - without bracket
                      (To_Unbounded_String ("Rnd"),    T_FNA, T_NBR, T_NA, T_NA, 0, fun_rnd),   -- this must come after Rnd(
                      (To_Unbounded_String ("Sgn("),   T_FUN, T_INT, T_NA, T_NA, 0, fun_sgn),
                      (To_Unbounded_String ("Sin("),   T_FUN, T_NBR, T_NA, T_NA, 0, fun_sin),
                      (To_Unbounded_String ("Space$("), T_FUN, T_STR, T_NA, T_NA, 0, fun_space),
                      (To_Unbounded_String ("Spc("),   T_FUN, T_STR, T_NA, T_NA, 0, fun_space),
                      (To_Unbounded_String ("Sqr("),   T_FUN, T_NBR, T_NA, T_NA, 0, fun_sqr),
                      (To_Unbounded_String ("Str$("),  T_FUN, T_STR, T_NA, T_NA, 0, fun_str),
                      (To_Unbounded_String ("String$(("), T_FUN, T_STR, T_NA, T_NA, 0, fun_string),
                      (To_Unbounded_String ("Tab("),   T_FUN, T_STR, T_NA, T_NA, 0, fun_tab),
                      (To_Unbounded_String ("Tan("),   T_FUN, T_NBR, T_NA, T_NA, 0, fun_tan),
                      (To_Unbounded_String ("UCase$("), T_FUN, T_STR, T_NA, T_NA, 0, fun_ucase),
                      (To_Unbounded_String ("Val("),   T_FUN, T_NBR, T_INT, T_NA, 0, fun_val),
                      (To_Unbounded_String ("Eval("),  T_FUN, T_NBR, T_INT, T_STR, 0, fun_eval),
                      (To_Unbounded_String ("Max("),   T_FUN, T_NBR, T_NA, T_NA, 0, fun_max),
                      (To_Unbounded_String ("Min("),   T_FUN, T_NBR, T_NA, T_NA, 0, fun_min));

   Token_Types   : array (1 .. Num_Tokens) of Command_Table_Item :=
                     ((To_Unbounded_String ("For"),   T_NA, T_NA, T_NA, T_NA, 0, op_invalid),
                      (To_Unbounded_String ("Else"),  T_NA, T_NA, T_NA, T_NA, 0, op_invalid),
                      (To_Unbounded_String ("GoSub"), T_NA, T_NA, T_NA, T_NA, 0, op_invalid),
                      (To_Unbounded_String ("GoTo"),  T_NA, T_NA, T_NA, T_NA, 0, op_invalid),
                      (To_Unbounded_String ("Step"),  T_NA, T_NA, T_NA, T_NA, 0, op_invalid),
                      (To_Unbounded_String ("Then"),  T_NA, T_NA, T_NA, T_NA, 0, op_invalid),
                      (To_Unbounded_String ("To"),    T_NA, T_NA, T_NA, T_NA, 0, op_invalid),
                      (To_Unbounded_String ("Until"), T_NA, T_NA, T_NA, T_NA, 0, op_invalid),
                      (To_Unbounded_String ("While"), T_NA, T_NA, T_NA, T_NA, 0, op_invalid));

   Function_Types  : array (1 .. Num_Functions) of Command_Table_Item :=
                       ((To_Unbounded_String ("fun_abs"), T_NA, T_NA, T_NA, T_NA, 0, Null_Address),
                        (To_Unbounded_String ("fun_asc"), T_NA, T_NA, T_NA, T_NA, 0, Null_Address),
                        (To_Unbounded_String ("fun_atn"), T_NA, T_NA, T_NA, T_NA, 0, Null_Address),
                        (To_Unbounded_String ("fun_bin"), T_NA, T_NA, T_NA, T_NA, 0, Null_Address),
                        (To_Unbounded_String ("fun_chr"), T_NA, T_NA, T_NA, T_NA, 0, Null_Address),
                        (To_Unbounded_String ("fun_cint"), T_NA, T_NA, T_NA, T_NA, 0, Null_Address),
                        (To_Unbounded_String ("fun_cos"), T_NA, T_NA, T_NA, T_NA, 0, Null_Address),
                        (To_Unbounded_String ("fun_deg"), T_NA, T_NA, T_NA, T_NA, 0, Null_Address),
                        (To_Unbounded_String ("fun_errno"), T_NA, T_NA, T_NA, T_NA, 0, Null_Address),
                        (To_Unbounded_String ("fun_errmsg"), T_NA, T_NA, T_NA, T_NA, 0, Null_Address),
                        (To_Unbounded_String ("fun_exp"), T_NA, T_NA, T_NA, T_NA, 0, Null_Address),
                        (To_Unbounded_String ("fun_fix"), T_NA, T_NA, T_NA, T_NA, 0, Null_Address),
                        (To_Unbounded_String ("fun_hex"), T_NA, T_NA, T_NA, T_NA, 0, Null_Address),
                        (To_Unbounded_String ("fun_inkey"), T_NA, T_NA, T_NA, T_NA, 0, Null_Address),
                        (To_Unbounded_String ("fun_instr"), T_NA, T_NA, T_NA, T_NA, 0, Null_Address),
                        (To_Unbounded_String ("fun_int"), T_NA, T_NA, T_NA, T_NA, 0, Null_Address),
                        (To_Unbounded_String ("fun_lcase"), T_NA, T_NA, T_NA, T_NA, 0, Null_Address),
                        (To_Unbounded_String ("fun_left"), T_NA, T_NA, T_NA, T_NA, 0, Null_Address),
                        (To_Unbounded_String ("fun_len"), T_NA, T_NA, T_NA, T_NA, 0, Null_Address),
                        (To_Unbounded_String ("fun_log"), T_NA, T_NA, T_NA, T_NA, 0, Null_Address),
                        (To_Unbounded_String ("fun_mid"), T_NA, T_NA, T_NA, T_NA, 0, Null_Address),
                        (To_Unbounded_String ("fun_oct"), T_NA, T_NA, T_NA, T_NA, 0, Null_Address),
                        (To_Unbounded_String ("fun_pi"), T_NA, T_NA, T_NA, T_NA, 0, Null_Address),
                        (To_Unbounded_String ("fun_pos"), T_NA, T_NA, T_NA, T_NA, 0, Null_Address),
                        (To_Unbounded_String ("fun_rad"), T_NA, T_NA, T_NA, T_NA, 0, Null_Address),
                        (To_Unbounded_String ("fun_right"), T_NA, T_NA, T_NA, T_NA, 0, Null_Address),
                        (To_Unbounded_String ("fun_rnd"), T_NA, T_NA, T_NA, T_NA, 0, Null_Address),
                        (To_Unbounded_String ("fun_sgn"), T_NA, T_NA, T_NA, T_NA, 0, Null_Address),
                        (To_Unbounded_String ("fun_sin"), T_NA, T_NA, T_NA, T_NA, 0, Null_Address),
                        (To_Unbounded_String ("fun_space"), T_NA, T_NA, T_NA, T_NA, 0, Null_Address),
                        (To_Unbounded_String ("fun_sqr"), T_NA, T_NA, T_NA, T_NA, 0, Null_Address),
                        (To_Unbounded_String ("fun_str"), T_NA, T_NA, T_NA, T_NA, 0, Null_Address),
                        (To_Unbounded_String ("fun_string"), T_NA, T_NA, T_NA, T_NA, 0, Null_Address),
                        (To_Unbounded_String ("fun_tab"), T_NA, T_NA, T_NA, T_NA, 0, Null_Address),
                        (To_Unbounded_String ("fun_tan"), T_NA, T_NA, T_NA, T_NA, 0, Null_Address),
                        (To_Unbounded_String ("fun_ucase"), T_NA, T_NA, T_NA, T_NA, 0, Null_Address),
                        (To_Unbounded_String ("fun_val"), T_NA, T_NA, T_NA, T_NA, 0, Null_Address),
                        (To_Unbounded_String ("fun_eval"), T_NA, T_NA, T_NA, T_NA, 0, Null_Address),
                        (To_Unbounded_String ("fun_asin"), T_NA, T_NA, T_NA, T_NA, 0, Null_Address),
                        (To_Unbounded_String ("fun_acos"), T_NA, T_NA, T_NA, T_NA, 0, Null_Address),
                        (To_Unbounded_String ("fun_max"), T_NA, T_NA, T_NA, T_NA, 0, Null_Address),
                        (To_Unbounded_String ("fun_min"), T_NA, T_NA, T_NA, T_NA, 0, Null_Address),
                        (To_Unbounded_String ("cmd_clear"), T_NA, T_NA, T_NA, T_NA, 0, Null_Address),
                        (To_Unbounded_String ("cmd_continue"), T_NA, T_NA, T_NA, T_NA, 0, Null_Address),
                        (To_Unbounded_String ("cmd_dim"), T_NA, T_NA, T_NA, T_NA, 0, Null_Address),
                        (To_Unbounded_String ("cmd_do"), T_NA, T_NA, T_NA, T_NA, 0, Null_Address),
                        (To_Unbounded_String ("cmd_else"), T_NA, T_NA, T_NA, T_NA, 0, Null_Address),
                        (To_Unbounded_String ("cmd_end"), T_NA, T_NA, T_NA, T_NA, 0, Null_Address),
                        (To_Unbounded_String ("cmd_endfun"), T_NA, T_NA, T_NA, T_NA, 0, Null_Address),
                        (To_Unbounded_String ("cmd_endsub"), T_NA, T_NA, T_NA, T_NA, 0, Null_Address),
                        (To_Unbounded_String ("cmd_erase"), T_NA, T_NA, T_NA, T_NA, 0, Null_Address),
                        (To_Unbounded_String ("cmd_error"), T_NA, T_NA, T_NA, T_NA, 0, Null_Address),
                        (To_Unbounded_String ("cmd_exit"), T_NA, T_NA, T_NA, T_NA, 0, Null_Address),
                        (To_Unbounded_String ("cmd_exitfor"), T_NA, T_NA, T_NA, T_NA, 0, Null_Address),
                        (To_Unbounded_String ("cmd_for"), T_NA, T_NA, T_NA, T_NA, 0, Null_Address),
                        (To_Unbounded_String ("cmd_subfun"), T_NA, T_NA, T_NA, T_NA, 0, Null_Address),
                        (To_Unbounded_String ("cmd_gosub"), T_NA, T_NA, T_NA, T_NA, 0, Null_Address),
                        (To_Unbounded_String ("cmd_goto"), T_NA, T_NA, T_NA, T_NA, 0, Null_Address),
                        (To_Unbounded_String ("cmd_if"), T_NA, T_NA, T_NA, T_NA, 0, Null_Address),
                        (To_Unbounded_String ("cmd_input"), T_NA, T_NA, T_NA, T_NA, 0, Null_Address),
                        (To_Unbounded_String ("cmd_let"), T_NA, T_NA, T_NA, T_NA, 0, Null_Address),
                        (To_Unbounded_String ("cmd_lineinput"), T_NA, T_NA, T_NA, T_NA, 0, Null_Address),
                        (To_Unbounded_String ("cmd_list"), T_NA, T_NA, T_NA, T_NA, 0, Null_Address),
                        (To_Unbounded_String ("cmd_loop"), T_NA, T_NA, T_NA, T_NA, 0, Null_Address),
                        (To_Unbounded_String ("cmd_new"), T_NA, T_NA, T_NA, T_NA, 0, Null_Address),
                        (To_Unbounded_String ("cmd_next"), T_NA, T_NA, T_NA, T_NA, 0, Null_Address),
                        (To_Unbounded_String ("cmd_null"), T_NA, T_NA, T_NA, T_NA, 0, Null_Address),
                        (To_Unbounded_String ("cmd_on"), T_NA, T_NA, T_NA, T_NA, 0, Null_Address),
                        (To_Unbounded_String ("cmd_print"), T_NA, T_NA, T_NA, T_NA, 0, Null_Address),
                        (To_Unbounded_String ("cmd_randomize"), T_NA, T_NA, T_NA, T_NA, 0, Null_Address),
                        (To_Unbounded_String ("cmd_read"), T_NA, T_NA, T_NA, T_NA, 0, Null_Address),
                        (To_Unbounded_String ("cmd_restore"), T_NA, T_NA, T_NA, T_NA, 0, Null_Address),
                        (To_Unbounded_String ("cmd_return"), T_NA, T_NA, T_NA, T_NA, 0, Null_Address),
                        (To_Unbounded_String ("cmd_run"), T_NA, T_NA, T_NA, T_NA, 0, Null_Address),
                        (To_Unbounded_String ("cmd_troff"), T_NA, T_NA, T_NA, T_NA, 0, Null_Address),
                        (To_Unbounded_String ("cmd_tron"), T_NA, T_NA, T_NA, T_NA, 0, Null_Address),
                        (To_Unbounded_String ("cmd_trace"), T_NA, T_NA, T_NA, T_NA, 0, Null_Address),
                        (To_Unbounded_String ("cmd_const"), T_NA, T_NA, T_NA, T_NA, 0, Null_Address),
                        (To_Unbounded_String ("cmd_select"), T_NA, T_NA, T_NA, T_NA, 0, Null_Address),
                        (To_Unbounded_String ("cmd_case"), T_NA, T_NA, T_NA, T_NA, 0, Null_Address),
                        (To_Unbounded_String ("op_invalid"), T_NA, T_NA, T_NA, T_NA, 0, Null_Address),
                        (To_Unbounded_String ("op_exp"), T_NA, T_NA, T_NA, T_NA, 0, Null_Address),
                        (To_Unbounded_String ("op_mul"), T_NA, T_NA, T_NA, T_NA, 0, Null_Address),
                        (To_Unbounded_String ("op_div"), T_NA, T_NA, T_NA, T_NA, 0, Null_Address),
                        (To_Unbounded_String ("op_divint"), T_NA, T_NA, T_NA, T_NA, 0, Null_Address),
                        (To_Unbounded_String ("op_add"), T_NA, T_NA, T_NA, T_NA, 0, Null_Address),
                        (To_Unbounded_String ("op_subtract"), T_NA, T_NA, T_NA, T_NA, 0, Null_Address),
                        (To_Unbounded_String ("op_mod"), T_NA, T_NA, T_NA, T_NA, 0, Null_Address),
                        (To_Unbounded_String ("op_ne"), T_NA, T_NA, T_NA, T_NA, 0, Null_Address),
                        (To_Unbounded_String ("op_gte"), T_NA, T_NA, T_NA, T_NA, 0, Null_Address),
                        (To_Unbounded_String ("op_lte"), T_NA, T_NA, T_NA, T_NA, 0, Null_Address),
                        (To_Unbounded_String ("op_lt"), T_NA, T_NA, T_NA, T_NA, 0, Null_Address),
                        (To_Unbounded_String ("op_gt"), T_NA, T_NA, T_NA, T_NA, 0, Null_Address),
                        (To_Unbounded_String ("op_equal"), T_NA, T_NA, T_NA, T_NA, 0, Null_Address),
                        (To_Unbounded_String ("op_and"), T_NA, T_NA, T_NA, T_NA, 0, Null_Address),
                        (To_Unbounded_String ("op_or"), T_NA, T_NA, T_NA, T_NA, 0, Null_Address),
                        (To_Unbounded_String ("op_xor"), T_NA, T_NA, T_NA, T_NA, 0, Null_Address),
                        (To_Unbounded_String ("op_not"), T_NA, T_NA, T_NA, T_NA, 0, Null_Address),
                        (To_Unbounded_String ("op_shiftleft"), T_NA, T_NA, T_NA, T_NA, 0, Null_Address),
                        (To_Unbounded_String ("op_shiftright"), T_NA, T_NA, T_NA, T_NA, 0, Null_Address));

end Command_And_Token_Tables;
