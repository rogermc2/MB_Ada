
with System; use System;

with Ada.Strings.Unbounded; use Ada.Strings.Unbounded;

package Commands_And_Tokens_Tables is

   type Fun_Type is (T_FNA, T_FUN, T_INT, T_NBR, T_STR);

   type Token_Table_Item is record
      Name         : Unbounded_String;
      Precedence   : Natural := 0;
      Token_Type   : Integer := 0;
      Function_Ptr : Address := Null_Address;
   end record;

   Command_Table_Size : constant Positive := 44;
   Token_Table_Size   : constant Positive := 45;

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

   Command_Table : array (1 .. Command_Table_Size) of Token_Table_Item :=
                     ((To_Unbounded_String ("ACos(To_Unbounded_String ("),  T_FUN or T_NBR, 0, fun_acos),
                      (To_Unbounded_String ("Abs(To_Unbounded_String ("),   T_FUN or T_NBR or T_INT, 0, fun_abs),
                      (To_Unbounded_String ("Asc(To_Unbounded_String ("),   T_FUN or T_INT, 0, fun_asc),
                      (To_Unbounded_String ("ASin(To_Unbounded_String ("),  T_FUN or T_NBR, 0, fun_asin),
                      (To_Unbounded_String ("Atn(To_Unbounded_String ("),   T_FUN or T_NBR, 0, fun_atn),
                      (To_Unbounded_String ("Bin$(To_Unbounded_String ("),  T_FUN or T_STR, 0, fun_bin),
                      (To_Unbounded_String ("Chr$(To_Unbounded_String ("),  T_FUN or T_STR, 0, fun_chr),
                      (To_Unbounded_String ("Cint(To_Unbounded_String ("),  T_FUN or T_INT, 0, fun_cint),
                      (To_Unbounded_String ("Cos(To_Unbounded_String ("),   T_FUN or T_NBR, 0, fun_cos),
                      (To_Unbounded_String ("Deg(To_Unbounded_String ("),   T_FUN or T_NBR, 0, fun_deg),
                      (To_Unbounded_String ("MM.Errno"),   T_FNA or T_INT, 0, fun_errno),
                      (To_Unbounded_String ("MM.ErrMsg$"), T_FNA or T_STR, 0, fun_errmsg),
                      (To_Unbounded_String ("Exp(To_Unbounded_String ("),   T_FUN or T_NBR, 0, fun_exp),
                      (To_Unbounded_String ("Fix(To_Unbounded_String ("),   T_FUN or T_INT, 0, fun_fix),
                      (To_Unbounded_String ("Hex$(To_Unbounded_String ("),  T_FUN or T_STR, 0, fun_hex),
                      (To_Unbounded_String ("Inkey$"), T_FNA or T_STR, 0, fun_inkey),
                      (To_Unbounded_String ("Instr(To_Unbounded_String ("), T_FUN or T_INT, 0, fun_instr),
                      (To_Unbounded_String ("Int(To_Unbounded_String ("),   T_FUN or T_INT, 0, fun_int),
                      (To_Unbounded_String ("LCase$(To_Unbounded_String ("),    T_FUN or T_STR, 0, fun_lcase),
                      (To_Unbounded_String ("Left$(To_Unbounded_String ("), T_FUN or T_STR, 0, fun_left),
                      (To_Unbounded_String ("Len(To_Unbounded_String ("),   T_FUN or T_INT, 0, fun_len),
                      (To_Unbounded_String ("Log(To_Unbounded_String ("),   T_FUN or T_NBR, 0, fun_log),
                      (To_Unbounded_String ("Mid$(To_Unbounded_String ("),  T_FUN or T_STR, 0, fun_mid),
                      (To_Unbounded_String ("MM.Ver"), T_FNA or T_NBR, 0, fun_version),
                      (To_Unbounded_String ("Oct$(To_Unbounded_String ("),  T_FUN or T_STR, 0, fun_oct),
                      (To_Unbounded_String ("Pi"),     T_FNA or T_NBR, 0, fun_pi ),
                      (To_Unbounded_String ("Pos"),    T_FNA or T_INT, 0, fun_pos),
                      (To_Unbounded_String ("Rad(To_Unbounded_String ("),   T_FUN or T_NBR, 0, fun_rad),
                      (To_Unbounded_String ("Right$(To_Unbounded_String ("), T_FUN or T_STR, 0, fun_right),
                      (To_Unbounded_String ("Rnd(To_Unbounded_String ("),   T_FUN or T_NBR, 0, fun_rnd),  -- this must come before Rnd - without bracket
                      (To_Unbounded_String ("Rnd"),    T_FNA or T_NBR, 0, fun_rnd),   -- this must come after Rnd(
                      (To_Unbounded_String ("Sgn(To_Unbounded_String ("),   T_FUN or T_INT, 0, fun_sgn),
                      (To_Unbounded_String ("Sin(To_Unbounded_String ("),   T_FUN or T_NBR, 0, fun_sin),
                      (To_Unbounded_String ("Space$(To_Unbounded_String ("), T_FUN or T_STR, 0, fun_space),
                      (To_Unbounded_String ("Spc(To_Unbounded_String ("),   T_FUN or T_STR, 0, fun_space),
                      (To_Unbounded_String ("Sqr(To_Unbounded_String ("),   T_FUN or T_NBR, 0, fun_sqr),
                      (To_Unbounded_String ("Str$(To_Unbounded_String ("),  T_FUN or T_STR, 0, fun_str),
                      (To_Unbounded_String ("String$(To_Unbounded_String ("), T_FUN or T_STR, 0, fun_string),
                      (To_Unbounded_String ("Tab(To_Unbounded_String ("),   T_FUN or T_STR, 0, fun_tab),
                      (To_Unbounded_String ("Tan(To_Unbounded_String ("),   T_FUN or T_NBR, 0, fun_tan),
                      (To_Unbounded_String ("UCase$(To_Unbounded_String ("), T_FUN or T_STR, 0, fun_ucase),
                      (To_Unbounded_String ("Val(To_Unbounded_String ("),   T_FUN or T_NBR or T_INT, 0, fun_val),
                      (To_Unbounded_String ("Eval(To_Unbounded_String ("),  T_FUN or T_NBR or T_INT or T_STR, 0, fun_eval),
                      (To_Unbounded_String ("Max(To_Unbounded_String ("),   T_FUN or T_NBR, 0, fun_max),
                      (To_Unbounded_String ("Min(To_Unbounded_String ("),   T_FUN or T_NBR, 0, fun_min));

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
                         (To_Unbounded_String (""), 0, 0, Null_Address));

                      end Commands_And_Tokens_Tables;
