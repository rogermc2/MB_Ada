
with System; use System;

with Ada.Strings.Unbounded; use Ada.Strings.Unbounded;

package Commands_And_Tokens_Tables is

   type Token_Table_Item is record
      Name         : Unbounded_String;
      Precedence   : Natural := 0;
      Token_Type   : Integer := 0;
      Function_Ptr : System.Address := System.Null_Address;
   end record;

   Command_Table_Size : constant Positive := 100;
   Token_Table_Size   : constant Positive := 45;

   Command_Table : array (1 .. Command_Table_Size) of Token_Table_Item;
   Token_Table   : array (1 .. Token_Table_Size) of Token_Table_Item :=
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
