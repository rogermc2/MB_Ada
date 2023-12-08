
with System; use System;

with Ada.Strings.Unbounded; use Ada.Strings.Unbounded;

package Commands_And_Tokens_Tables is

   type Fun_Type is (T_NONE, T_FNA, T_FUN, T_INT, T_NBR, T_STR);

   type Command_Table_Item is record
      Name          : Unbounded_String;
      Command_Type1 : Fun_Type := T_NONE;
      Command_Type2 : Fun_Type := T_NONE;
      Command_Type3 : Fun_Type := T_NONE;
      Command_Type4 : Fun_Type := T_NONE;
      Precedence    : Natural := 0;
      Function_Ptr  : Address := Null_Address;
   end record;

   type Token_Table_Item is record
      Name         : Unbounded_String;
      Precedence   : Natural := 0;
      Token_Type   : Integer := 0;
      Function_Ptr : Address := Null_Address;
   end record;

   Command_Table_Size : constant Positive := 46;
   Token_Table_Size   : constant Positive := 101;

   fun_acos              : constant Address := Null_Address;
   fun_abs               : constant Address := Null_Address;
   fun_asc               : constant Address := Null_Address;
   fun_asin              : constant Address := Null_Address;
   fun_atn               : constant Address := Null_Address;
   fun_bin               : constant Address := Null_Address;
   fun_chr               : constant Address := Null_Address;
   fun_cint              : constant Address := Null_Address;
   fun_cos               : constant Address := Null_Address;
   fun_deg               : constant Address := Null_Address;
   fun_errno             : constant Address := Null_Address;
   fun_errmsg            : constant Address := Null_Address;
   fun_exp               : constant Address := Null_Address;
   fun_fix               : constant Address := Null_Address;
   fun_hex               : constant Address := Null_Address;
   fun_inkey             : constant Address := Null_Address;
   fun_instr             : constant Address := Null_Address;
   fun_int               : constant Address := Null_Address;
   fun_lcase             : constant Address := Null_Address;
   fun_ucase             : constant Address := Null_Address;
   fun_left              : constant Address := Null_Address;
   fun_len               : constant Address := Null_Address;
   fun_log               : constant Address := Null_Address;
   fun_mid               : constant Address := Null_Address;
   fun_version           : constant Address := Null_Address;
   fun_oct               : constant Address := Null_Address;
   fun_pi                : constant Address := Null_Address;
   fun_pos               : constant Address := Null_Address;
   fun_rad               : constant Address := Null_Address;
   fun_right             : constant Address := Null_Address;
   fun_rnd               : constant Address := Null_Address;
   fun_sgn               : constant Address := Null_Address;
   fun_sin               : constant Address := Null_Address;
   fun_tan               : constant Address := Null_Address;
   fun_space             : constant Address := Null_Address;
   fun_sqr               : constant Address := Null_Address;
   fun_str               : constant Address := Null_Address;
   fun_string            : constant Address := Null_Address;
   fun_tab               : constant Address := Null_Address;
   tan                   : constant Address := Null_Address;
   un_ucase              : constant Address := Null_Address;
   fun_val               : constant Address := Null_Address;
   fun_eval              : constant Address := Null_Address;
   fun_max               : constant Address := Null_Address;
   fun_min               : constant Address := Null_Address;

   cmd_nul               : constant Address := Null_Address;

   Command_Table : array (1 .. Command_Table_Size) of Command_Table_Item :=
                     ((To_Unbounded_String ("ACos("),  T_FUN, T_NBR, T_NONE, T_NONE, 0, fun_acos),
                      (To_Unbounded_String ("Abs("),   T_FUN, T_NBR, T_INT, T_NONE, 0, fun_abs),
                      (To_Unbounded_String ("Asc("),   T_FUN, T_INT, T_NONE, T_NONE, 0, fun_asc),
                      (To_Unbounded_String ("ASin("),  T_FUN, T_NBR, T_NONE, T_NONE, 0, fun_asin),
                      (To_Unbounded_String ("Atn("),   T_FUN, T_NBR, T_NONE, T_NONE, 0, fun_atn),
                      (To_Unbounded_String ("Bin$("),  T_FUN, T_STR, T_NONE, T_NONE, 0, fun_bin),
                      (To_Unbounded_String ("Chr$("),  T_FUN, T_STR, T_NONE, T_NONE, 0, fun_chr),
                      (To_Unbounded_String ("Cint("),  T_FUN, T_INT, T_NONE, T_NONE, 0, fun_cint),
                      (To_Unbounded_String ("Cos("),   T_FUN, T_NBR, T_NONE, T_NONE, 0, fun_cos),
                      (To_Unbounded_String ("Deg("),   T_FUN, T_NBR, T_NONE, T_NONE, 0, fun_deg),
                      (To_Unbounded_String ("MM.Errno"),   T_FNA, T_INT, T_NONE, T_NONE, 0, fun_errno),
                      (To_Unbounded_String ("MM.ErrMsg$"), T_FNA, T_STR, T_NONE, T_NONE, 0, fun_errmsg),
                      (To_Unbounded_String ("Exp("),   T_FUN, T_NBR, T_NONE, T_NONE, 0, fun_exp),
                      (To_Unbounded_String ("Fix("),   T_FUN, T_INT, T_NONE, T_NONE, 0, fun_fix),
                      (To_Unbounded_String ("Hex$("),  T_FUN, T_STR, T_NONE, T_NONE, 0, fun_hex),
                      (To_Unbounded_String ("Inkey$"), T_FNA, T_STR, T_NONE, T_NONE, 0, fun_inkey),
                      (To_Unbounded_String ("Instr("), T_FUN, T_INT, T_NONE, T_NONE, 0, fun_instr),
                      (To_Unbounded_String ("Int("),   T_FUN, T_INT, T_NONE, T_NONE, 0, fun_int),
                      (To_Unbounded_String ("LCase$("), T_FUN, T_STR, T_NONE, T_NONE, 0, fun_lcase),
                      (To_Unbounded_String ("Left$("), T_FUN, T_STR, T_NONE, T_NONE, 0, fun_left),
                      (To_Unbounded_String ("Len("),   T_FUN, T_INT, T_NONE, T_NONE, 0, fun_len),
                      (To_Unbounded_String ("Log("),   T_FUN, T_NBR, T_NONE, T_NONE, 0, fun_log),
                      (To_Unbounded_String ("Mid$("),  T_FUN, T_STR, T_NONE, T_NONE, 0, fun_mid),
                      (To_Unbounded_String ("MM.Ver"), T_FNA, T_NBR, T_NONE, T_NONE, 0, fun_version),
                      (To_Unbounded_String ("Oct$("),  T_FUN, T_STR, T_NONE, T_NONE, 0, fun_oct),
                      (To_Unbounded_String ("Pi"),     T_FNA, T_NBR, T_NONE, T_NONE, 0, fun_pi ),
                      (To_Unbounded_String ("Pos"),    T_FNA, T_INT, T_NONE, T_NONE, 0, fun_pos),
                      (To_Unbounded_String ("Rad("),   T_FUN, T_NBR, T_NONE, T_NONE, 0, fun_rad),
                      (To_Unbounded_String ("Right$("), T_FUN, T_STR, T_NONE, T_NONE, 0, fun_right),
                      (To_Unbounded_String ("Rnd("),   T_FUN, T_NBR, T_NONE, T_NONE, 0, fun_rnd),  -- this must come before Rnd - without bracket
                      (To_Unbounded_String ("Rnd"),    T_FNA, T_NBR, T_NONE, T_NONE, 0, fun_rnd),   -- this must come after Rnd(
                      (To_Unbounded_String ("Sgn("),   T_FUN, T_INT, T_NONE, T_NONE, 0, fun_sgn),
                      (To_Unbounded_String ("Sin("),   T_FUN, T_NBR, T_NONE, T_NONE, 0, fun_sin),
                      (To_Unbounded_String ("Space$("), T_FUN, T_STR, T_NONE, T_NONE, 0, fun_space),
                      (To_Unbounded_String ("Spc("),   T_FUN, T_STR, T_NONE, T_NONE, 0, fun_space),
                      (To_Unbounded_String ("Sqr("),   T_FUN, T_NBR, T_NONE, T_NONE, 0, fun_sqr),
                      (To_Unbounded_String ("Str$("),  T_FUN, T_STR, T_NONE, T_NONE, 0, fun_str),
                      (To_Unbounded_String ("String$(("), T_FUN, T_STR, T_NONE, T_NONE, 0, fun_string),
                      (To_Unbounded_String ("Tab("),   T_FUN, T_STR, T_NONE, T_NONE, 0, fun_tab),
                      (To_Unbounded_String ("Tan("),   T_FUN, T_NBR, T_NONE, T_NONE, 0, fun_tan),
                      (To_Unbounded_String ("UCase$("), T_FUN, T_STR, T_NONE, T_NONE, 0, fun_ucase),
                      (To_Unbounded_String ("Val("),   T_FUN, T_NBR, T_INT, T_NONE, 0, fun_val),
                      (To_Unbounded_String ("Eval("),  T_FUN, T_NBR, T_INT, T_STR, 0, fun_eval),
                      (To_Unbounded_String ("Max("),   T_FUN, T_NBR, T_NONE, T_NONE, 0, fun_max),
                      (To_Unbounded_String ("Min("),   T_FUN, T_NBR, T_NONE, T_NONE, 0, fun_min),
                      (To_Unbounded_String (""),       T_NONE, T_NONE, T_NONE, T_NONE, 0, cmd_nul));

   Token_Table           : array (1 .. Token_Table_Size) of Token_Table_Item :=
                             ((To_Unbounded_String ("fun_abs"), 0, 0, Null_Address),
                              (To_Unbounded_String ("fun_asc"), 0, 0, Null_Address),
                              (To_Unbounded_String ("fun_atn"), 0, 0, Null_Address),
                              (To_Unbounded_String ("fun_bin"), 0, 0, Null_Address),
                              (To_Unbounded_String ("fun_chr"), 0, 0, Null_Address),
                              (To_Unbounded_String ("fun_cint"), 0, 0, Null_Address),
                              (To_Unbounded_String ("fun_cos"), 0, 0, Null_Address),
                              (To_Unbounded_String ("fun_deg"), 0, 0, Null_Address),
                              (To_Unbounded_String ("fun_errno"), 0, 0, Null_Address),
                              (To_Unbounded_String ("fun_errmsg"), 0, 0, Null_Address),
                              (To_Unbounded_String ("fun_exp"), 0, 0, Null_Address),
                              (To_Unbounded_String ("fun_fix"), 0, 0, Null_Address),
                              (To_Unbounded_String ("fun_hex"), 0, 0, Null_Address),
                              (To_Unbounded_String ("fun_inkey"), 0, 0, Null_Address),
                              (To_Unbounded_String ("fun_instr"), 0, 0, Null_Address),
                              (To_Unbounded_String ("fun_int"), 0, 0, Null_Address),
                              (To_Unbounded_String ("fun_lcase"), 0, 0, Null_Address),
                              (To_Unbounded_String ("fun_left"), 0, 0, Null_Address),
                              (To_Unbounded_String ("fun_len"), 0, 0, Null_Address),
                              (To_Unbounded_String ("fun_log"), 0, 0, Null_Address),
                              (To_Unbounded_String ("fun_mid"), 0, 0, Null_Address),
                              (To_Unbounded_String ("fun_oct"), 0, 0, Null_Address),
                              (To_Unbounded_String ("fun_pi"), 0, 0, Null_Address),
                              (To_Unbounded_String ("fun_pos"), 0, 0, Null_Address),
                              (To_Unbounded_String ("fun_rad"), 0, 0, Null_Address),
                              (To_Unbounded_String ("fun_right"), 0, 0, Null_Address),
                              (To_Unbounded_String ("fun_rnd"), 0, 0, Null_Address),
                              (To_Unbounded_String ("fun_sgn"), 0, 0, Null_Address),
                              (To_Unbounded_String ("fun_sin"), 0, 0, Null_Address),
                              (To_Unbounded_String ("fun_space"), 0, 0, Null_Address),
                              (To_Unbounded_String ("fun_sqr"), 0, 0, Null_Address),
                              (To_Unbounded_String ("fun_str"), 0, 0, Null_Address),
                              (To_Unbounded_String ("fun_string"), 0, 0, Null_Address),
                              (To_Unbounded_String ("fun_tab"), 0, 0, Null_Address),
                              (To_Unbounded_String ("fun_tan"), 0, 0, Null_Address),
                              (To_Unbounded_String ("fun_ucase"), 0, 0, Null_Address),
                              (To_Unbounded_String ("fun_val"), 0, 0, Null_Address),
                              (To_Unbounded_String ("fun_eval"), 0, 0, Null_Address),
                              (To_Unbounded_String ("fun_asin"), 0, 0, Null_Address),
                              (To_Unbounded_String ("fun_acos"), 0, 0, Null_Address),
                              (To_Unbounded_String ("fun_max"), 0, 0, Null_Address),
                              (To_Unbounded_String ("fun_min"), 0, 0, Null_Address),
                              (To_Unbounded_String ("cmd_clear"), 0, 0, Null_Address),
                              (To_Unbounded_String ("cmd_continue"), 0, 0, Null_Address),
                              (To_Unbounded_String ("cmd_dim"), 0, 0, Null_Address),
                              (To_Unbounded_String ("cmd_do"), 0, 0, Null_Address),
                              (To_Unbounded_String ("cmd_else"), 0, 0, Null_Address),
                              (To_Unbounded_String ("cmd_end"), 0, 0, Null_Address),
                              (To_Unbounded_String ("cmd_endfun"), 0, 0, Null_Address),
                              (To_Unbounded_String ("cmd_endsub"), 0, 0, Null_Address),
                              (To_Unbounded_String ("cmd_erase"), 0, 0, Null_Address),
                              (To_Unbounded_String ("cmd_error"), 0, 0, Null_Address),
                              (To_Unbounded_String ("cmd_exit"), 0, 0, Null_Address),
                              (To_Unbounded_String ("cmd_exitfor"), 0, 0, Null_Address),
                              (To_Unbounded_String ("cmd_for"), 0, 0, Null_Address),
                              (To_Unbounded_String ("cmd_subfun"), 0, 0, Null_Address),
                              (To_Unbounded_String ("cmd_gosub"), 0, 0, Null_Address),
                              (To_Unbounded_String ("cmd_goto"), 0, 0, Null_Address),
                              (To_Unbounded_String ("cmd_if"), 0, 0, Null_Address),
                              (To_Unbounded_String ("cmd_input"), 0, 0, Null_Address),
                              (To_Unbounded_String ("cmd_let"), 0, 0, Null_Address),
                              (To_Unbounded_String ("cmd_lineinput"), 0, 0, Null_Address),
                              (To_Unbounded_String ("cmd_list"), 0, 0, Null_Address),
                              (To_Unbounded_String ("cmd_loop"), 0, 0, Null_Address),
                              (To_Unbounded_String ("cmd_new"), 0, 0, Null_Address),
                              (To_Unbounded_String ("cmd_next"), 0, 0, Null_Address),
                              (To_Unbounded_String ("cmd_null"), 0, 0, Null_Address),
                              (To_Unbounded_String ("cmd_on"), 0, 0, Null_Address),
                              (To_Unbounded_String ("cmd_print"), 0, 0, Null_Address),
                              (To_Unbounded_String ("cmd_randomize"), 0, 0, Null_Address),
                              (To_Unbounded_String ("cmd_read"), 0, 0, Null_Address),
                              (To_Unbounded_String ("cmd_restore"), 0, 0, Null_Address),
                              (To_Unbounded_String ("cmd_return"), 0, 0, Null_Address),
                              (To_Unbounded_String ("cmd_run"), 0, 0, Null_Address),
                              (To_Unbounded_String ("cmd_troff"), 0, 0, Null_Address),
                              (To_Unbounded_String ("cmd_tron"), 0, 0, Null_Address),
                              (To_Unbounded_String ("cmd_trace"), 0, 0, Null_Address),
                              (To_Unbounded_String ("cmd_const"), 0, 0, Null_Address),
                              (To_Unbounded_String ("cmd_select"), 0, 0, Null_Address),
                              (To_Unbounded_String ("cmd_case"), 0, 0, Null_Address),
                              (To_Unbounded_String ("op_invalid"), 0, 0, Null_Address),
                              (To_Unbounded_String ("op_exp"), 0, 0, Null_Address),
                              (To_Unbounded_String ("op_mul"), 0, 0, Null_Address),
                              (To_Unbounded_String ("op_div"), 0, 0, Null_Address),
                              (To_Unbounded_String ("op_divint"), 0, 0, Null_Address),
                              (To_Unbounded_String ("op_add"), 0, 0, Null_Address),
                              (To_Unbounded_String ("op_subtract"), 0, 0, Null_Address),
                              (To_Unbounded_String ("op_mod"), 0, 0, Null_Address),
                              (To_Unbounded_String ("op_ne"), 0, 0, Null_Address),
                              (To_Unbounded_String ("op_gte"), 0, 0, Null_Address),
                              (To_Unbounded_String ("op_lte"), 0, 0, Null_Address),
                              (To_Unbounded_String ("op_lt"), 0, 0, Null_Address),
                              (To_Unbounded_String ("op_gt"), 0, 0, Null_Address),
                              (To_Unbounded_String ("op_equal"), 0, 0, Null_Address),
                              (To_Unbounded_String ("op_and"), 0, 0, Null_Address),
                              (To_Unbounded_String ("op_or"), 0, 0, Null_Address),
                              (To_Unbounded_String ("op_xor"), 0, 0, Null_Address),
                              (To_Unbounded_String ("op_not"), 0, 0, Null_Address),
                              (To_Unbounded_String ("op_shiftleft"), 0, 0, Null_Address),
                              (To_Unbounded_String ("op_shiftright"), 0, 0, Null_Address),
                              (To_Unbounded_String (""), 0, 0, Null_Address));

end Commands_And_Tokens_Tables;
