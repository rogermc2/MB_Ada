
with Ada.Strings;
with Ada.Text_IO; use Ada.Text_IO;

with M_Misc; use M_Misc;
with Operators;
with Serial_File_IO;

package body Command_And_Token_Tables is

   In_Buffer : Unbounded_String;

   Command_Types1 : array (1 .. Num_Commands1) of Command_Table_Item :=
                      (To_Unbounded_String ("Clear)", T_CMD, 0, cmd_clear),
                       To_Unbounded_String ("Continue)",T_CMD, 0,
                        cmd_continue),
                       To_Unbounded_String ("Data)",  T_CMD, 0, cmd_null),
                       To_Unbounded_String ("Dim)",T_CMD, 0, cmd_dim ),
                       To_Unbounded_String ("Do)", T_CMD, 0, cmd_do  ),

                       To_Unbounded_String ("ElseIf)",T_CMD, 0, cmd_else),
                       To_Unbounded_String ("Else If)", T_CMD, 0, cmd_else),
                       To_Unbounded_String ("Case Else)",  T_CMD, 0, cmd_case),
                       To_Unbounded_String ("Else)",  T_CMD, 0, cmd_else),

                       To_Unbounded_String ("Select Case)",T_CMD, 0,
                        cmd_select),
                       To_Unbounded_String ("End Select)", T_CMD, 0, cmd_null),
                       To_Unbounded_String ("Case)",  T_CMD, 0, cmd_case),

                       To_Unbounded_String ("End Function)", T_CMD,  0,
                        cmd_endfun),
                       To_Unbounded_String ("End Sub)", T_CMD, 0, cmd_return),
                       To_Unbounded_String ("EndIf)", T_CMD, 0, cmd_null),
                       To_Unbounded_String ("End If)",T_CMD, 0, cmd_null),
                       To_Unbounded_String ("End)",T_CMD, 0, cmd_end ),

                       To_Unbounded_String ("Exit For)",T_CMD, 0, cmd_exitfor  ),
                       To_Unbounded_String ("Exit Sub)",T_CMD, 0, cmd_return),
                       To_Unbounded_String ("Exit Function)",  T_CMD,0,
                        cmd_endfun),
                       To_Unbounded_String ("Exit Do)", T_CMD, 0, cmd_exit),
                       To_Unbounded_String ("Exit)",  T_CMD, 0, cmd_exit),

                       To_Unbounded_String ("Erase)", T_CMD, 0, cmd_erase ),
                       To_Unbounded_String ("Error)", T_CMD, 0, cmd_error ),
                       To_Unbounded_String ("For)",T_CMD, 0, cmd_for ),
                       To_Unbounded_String ("Function)",T_CMD, 0, cmd_subfun),
                       To_Unbounded_String ("GoSub)", T_CMD, 0, cmd_gosub ),
                       To_Unbounded_String ("GoTo)",  T_CMD, 0, cmd_goto),
                       To_Unbounded_String ("If)", T_CMD, 0, cmd_if  ),
                       To_Unbounded_String ("Line Input)", T_CMD, 0,
                        cmd_lineinput),
                       To_Unbounded_String ("Input)", T_CMD, 0, cmd_input ),
                       To_Unbounded_String ("Let)",T_CMD, 0, cmd_let ),
                       To_Unbounded_String ("List)",  T_CMD, 0, cmd_list),
                       To_Unbounded_String ("Local)", T_CMD, 0, cmd_dim ),
                       To_Unbounded_String ("Loop)",  T_CMD, 0, cmd_loop),
                       To_Unbounded_String ("New)",T_CMD, 0, cmd_new ),
                       To_Unbounded_String ("Next)",  T_CMD, 0, cmd_next),
                       To_Unbounded_String ("On)", T_CMD, 0, cmd_on  ),
                       To_Unbounded_String ("Print)", T_CMD, 0, cmd_print ),
                       To_Unbounded_String ("Randomize)",  T_CMD, 0,
                        cmd_randomize),
                       To_Unbounded_String ("Read)",  T_CMD, 0, cmd_read),
                       To_Unbounded_String ("Rem)",T_CMD, 0, cmd_null, ),
                       To_Unbounded_String ("Restore)", T_CMD, 0, cmd_restore),
                       To_Unbounded_String ("Return)",T_CMD, 0, cmd_return,  ),
                       To_Unbounded_String ("Run)",T_CMD, 0, cmd_run ),
                       To_Unbounded_String ("Static)",T_CMD, 0, cmd_dim ),
                       To_Unbounded_String ("Sub)",T_CMD, 0, cmd_subfun),
                       To_Unbounded_String ("TROFF)", T_CMD, 0, cmd_troff ),
                       To_Unbounded_String ("TRON)",  T_CMD, 0, cmd_tron),
                       To_Unbounded_String ("Trace)", T_CMD, 0, cmd_trace ),
                       To_Unbounded_String ("Wend)",  T_CMD, 0, cmd_loop),
                       To_Unbounded_String ("While)", T_CMD, 0, cmd_do  ),
                       To_Unbounded_String ("Const)", T_CMD, 0, cmd_const ));

   Command_Types2 : array (1 .. Num_Commands2) of Command_Table_Item :=
                      ((To_Unbounded_String ("ACos("),T_FUN or T_NBR,
                       0, fun_acos),
                       (To_Unbounded_String ("Abs("), T_FUN or T_NBR or T_INT,
                        0, fun_abs),
                       (To_Unbounded_String ("Asc("), T_FUN or T_INT,
                        0, fun_asc),
                       (To_Unbounded_String ("ASin("), T_FUN or T_NBR,
                        0, fun_asin),
                       (To_Unbounded_String ("Atn("), T_FUN or T_NBR,
                        0, fun_atn),
                       (To_Unbounded_String ("Bin$("), T_FUN or T_STR,
                        0, fun_bin),
                       (To_Unbounded_String ("Chr$("), T_FUN or T_STR,
                        0, fun_chr),
                       (To_Unbounded_String ("Cint("), T_FUN or T_INT,
                        0, fun_cint),
                       (To_Unbounded_String ("Cos("), T_FUN or T_NBR,
                        0, fun_cos),
                       (To_Unbounded_String ("Deg("), T_FUN or T_NBR,
                        0, fun_deg),
                       (To_Unbounded_String ("MM.Errno"), T_FNA or T_INT,
                        0, fun_errno),
                       (To_Unbounded_String ("MM.ErrMsg$"), T_FNA or T_STR,
                        0, fun_errmsg),
                       (To_Unbounded_String ("Exp("), T_FUN or T_NBR,
                        0, fun_exp),
                       (To_Unbounded_String ("Fix("), T_FUN or T_INT,
                        0, fun_fix),
                       (To_Unbounded_String ("Hex$("), T_FUN or T_STR,
                        0, fun_hex),
                       (To_Unbounded_String ("Inkey$"), T_FNA or T_STR,
                        0, fun_inkey),
                       (To_Unbounded_String ("Instr("), T_FUN or T_INT,
                        0, fun_instr),
                       (To_Unbounded_String ("Int("), T_FUN or T_INT,
                        0, fun_int),
                       (To_Unbounded_String ("LCase$("), T_FUN or T_STR,
                        0, fun_lcase),
                       (To_Unbounded_String ("Left$("), T_FUN or T_STR,
                        0, fun_left),
                       (To_Unbounded_String ("Len("), T_FUN or T_INT,
                        0, fun_len),
                       (To_Unbounded_String ("Log("), T_FUN or T_NBR,
                        0, fun_log),
                       (To_Unbounded_String ("Mid$("), T_FUN or T_STR,
                        0, fun_mid),
                       (To_Unbounded_String ("MM.Ver"), T_FNA or T_NBR,
                        0, fun_version),
                       (To_Unbounded_String ("Oct$("), T_FUN or T_STR,
                        0, fun_oct),
                       (To_Unbounded_String ("Pi"), T_FNA or T_NBR, 0, fun_pi ),
                       (To_Unbounded_String ("Pos"), T_FNA or T_INT, 0, fun_pos),
                       (To_Unbounded_String ("Rad("), T_FUN or T_NBR,
                        0, fun_rad),
                       (To_Unbounded_String ("Right$("), T_FUN or T_STR,
                        0, fun_right),
                       (To_Unbounded_String ("Rnd("), T_FUN or T_NBR,
                        0, fun_rnd),  -- this must come before Rnd without bracket
                       (To_Unbounded_String ("Rnd"), T_FNA or T_NBR,
                        0, fun_rnd),   -- this must come after Rnd(
                       (To_Unbounded_String ("Sgn("), T_FUN or T_INT,
                        0, fun_sgn),
                       (To_Unbounded_String ("Sin("), T_FUN or T_NBR,
                        0, fun_sin),
                       (To_Unbounded_String ("Space$("), T_FUN or T_NBR,
                        0, fun_space),
                       (To_Unbounded_String ("Spc("), T_FUN or T_STR,
                        0, fun_space),
                       (To_Unbounded_String ("Sqr("), T_FUN or T_NBR,
                        0, fun_sqr),
                       (To_Unbounded_String ("Str$("), T_FUN or T_STR,
                        0, fun_str),
                       (To_Unbounded_String ("String$(("), T_FUN or T_STR,
                        0, fun_string),
                       (To_Unbounded_String ("Tab("), T_FUN or T_STR,
                        0, fun_tab),
                       (To_Unbounded_String ("Tan("), T_FUN or T_NBR,
                        0, fun_tan),
                       (To_Unbounded_String ("UCase$("), T_FUN or T_STR,
                        0, fun_ucase),
                       (To_Unbounded_String ("Val("), T_FUN or T_NBR or T_INT,
                        0, fun_val),
                       (To_Unbounded_String ("Eval("),
                        T_FUN or T_NBR or T_INT or T_STR, 0, fun_eval),
                       (To_Unbounded_String ("Max("), T_FUN or T_NBR,
                        0, fun_max),
                       (To_Unbounded_String ("Min("), T_FUN or T_NBR,
                        0, fun_min));

   Token_Types   : array (1 .. Num_Tokens) of Command_Table_Item :=
                     ((To_Unbounded_String ("For"), T_NA, 0, op_invalid),
                      (To_Unbounded_String ("Else"), T_NA, 0, op_invalid),
                      (To_Unbounded_String ("GoSub"), T_NA, 0, op_invalid),
                      (To_Unbounded_String ("GoTo"), T_NA, 0, op_invalid),
                      (To_Unbounded_String ("Step"), T_NA, 0, op_invalid),
                      (To_Unbounded_String ("Then"), T_NA, 0, op_invalid),
                      (To_Unbounded_String ("To"), T_NA, 0, op_invalid),
                      (To_Unbounded_String ("Until"), T_NA, 0, op_invalid),
                      (To_Unbounded_String ("While"), T_NA, 0, op_invalid));

   Function_Types  : array (1 .. Num_Functions) of Command_Table_Item :=
                       ((To_Unbounded_String ("fun_abs"), T_NA, 0, Null),
                        (To_Unbounded_String ("fun_asc"), T_NA, 0, Null),
                        (To_Unbounded_String ("fun_atn"), T_NA, 0, Null),
                        (To_Unbounded_String ("fun_bin"), T_NA, 0, Null),
                        (To_Unbounded_String ("fun_chr"), T_NA, 0, Null),
                        (To_Unbounded_String ("fun_cint"), T_NA, 0, Null),
                        (To_Unbounded_String ("fun_cos"), T_NA, 0, Null),
                        (To_Unbounded_String ("fun_deg"), T_NA, 0, Null),
                        (To_Unbounded_String ("fun_errno"), T_NA, 0, Null),
                        (To_Unbounded_String ("fun_errmsg"), T_NA, 0, Null),
                        (To_Unbounded_String ("fun_exp"), T_NA, 0, Null),
                        (To_Unbounded_String ("fun_fix"), T_NA, 0, Null),
                        (To_Unbounded_String ("fun_hex"), T_NA, 0, Null),
                        (To_Unbounded_String ("fun_inkey"), T_NA, 0, Null),
                        (To_Unbounded_String ("fun_instr"), T_NA, 0, Null),
                        (To_Unbounded_String ("fun_int"), T_NA, 0, Null),
                        (To_Unbounded_String ("fun_lcase"), T_NA, 0, Null),
                        (To_Unbounded_String ("fun_left"), T_NA, 0, Null),
                        (To_Unbounded_String ("fun_len"), T_NA, 0, Null),
                        (To_Unbounded_String ("fun_log"), T_NA, 0, Null),
                        (To_Unbounded_String ("fun_mid"), T_NA, 0, Null),
                        (To_Unbounded_String ("fun_oct"), T_NA, 0, Null),
                        (To_Unbounded_String ("fun_pi"), T_NA, 0, Null),
                        (To_Unbounded_String ("fun_pos"), T_NA, 0, Null),
                        (To_Unbounded_String ("fun_rad"), T_NA, 0, Null),
                        (To_Unbounded_String ("fun_right"), T_NA, 0, Null),
                        (To_Unbounded_String ("fun_rnd"), T_NA, 0, Null),
                        (To_Unbounded_String ("fun_sgn"), T_NA, 0, Null),
                        (To_Unbounded_String ("fun_sin"), T_NA, 0, Null),
                        (To_Unbounded_String ("fun_space"), T_NA, 0, Null),
                        (To_Unbounded_String ("fun_sqr"), T_NA, 0, Null),
                        (To_Unbounded_String ("fun_str"), T_NA, 0, Null),
                        (To_Unbounded_String ("fun_string"), T_NA, 0, Null),
                        (To_Unbounded_String ("fun_tab"), T_NA, 0, Null),
                        (To_Unbounded_String ("fun_tan"), T_NA, 0, Null),
                        (To_Unbounded_String ("fun_ucase"), T_NA, 0, Null),
                        (To_Unbounded_String ("fun_val"), T_NA, 0, Null),
                        (To_Unbounded_String ("fun_eval"), T_NA, 0, Null),
                        (To_Unbounded_String ("fun_asin"), T_NA, 0, Null),
                        (To_Unbounded_String ("fun_acos"), T_NA, 0, Null),
                        (To_Unbounded_String ("fun_max"), T_NA, 0, Null),
                        (To_Unbounded_String ("fun_min"), T_NA, 0, Null),
                        (To_Unbounded_String ("AutoSave"), T_CMD,
                         0, cmd_autosave),
                        (To_Unbounded_String ("Option"), T_CMD, 0, cmd_option),
                        (To_Unbounded_String ("Pause"), T_CMD, 0, cmd_pause),
                        (To_Unbounded_String ("Timer"), T_CMD or T_FUN,
                         0, cmd_timer),
                        (To_Unbounded_String ("Date$"), T_CMD or T_FUN,
                         0, cmd_date),
                        (To_Unbounded_String ("Time$"), T_CMD or T_FUN,
                         0, cmd_time),
                        (To_Unbounded_String ("IRetirn"), T_CMD,
                         0, cmd_ireturn),
                        (To_Unbounded_String ("Poke"), T_CMD, 0, cmd_poke),
                        (To_Unbounded_String ("SetTick"), T_CMD,
                         0, cmd_settick),
                        (To_Unbounded_String ("WatchDog"), T_CMD,
                         0, cmd_watchdog),
                        (To_Unbounded_String ("CPU"),T_CMD, 0, cmd_cpu),
                        (To_Unbounded_String ("CFunction"), T_CMD,
                         0, cmd_cfunction),
                        (To_Unbounded_String ("End CFunction"), T_CMD,
                         0, cmd_null),
                        (To_Unbounded_String ("CSub"),T_CMD, 0, cmd_cfunction),
                        (To_Unbounded_String ("End CSub"), T_CMD, 0, cmd_null),
                        (To_Unbounded_String ("DefineFont"), T_CMD,
                         0, cmd_cfunction),
                        (To_Unbounded_String ("End DefineFont"), T_CMD,
                         0, cmd_null),
                        (To_Unbounded_String ("cmd_clear"), T_NA, 0, Null),
                        (To_Unbounded_String ("cmd_continue"), T_NA, 0, Null),
                        (To_Unbounded_String ("cmd_dim"), T_NA, 0, Null),
                        (To_Unbounded_String ("cmd_do"), T_NA, 0, Null),
                        (To_Unbounded_String ("cmd_else"), T_NA, 0, Null),
                        (To_Unbounded_String ("cmd_end"), T_NA, 0, Null),
                        (To_Unbounded_String ("cmd_endfun"), T_NA, 0, Null),
                        (To_Unbounded_String ("cmd_endsub"), T_NA, 0, Null),
                        (To_Unbounded_String ("cmd_erase"), T_NA, 0, Null),
                        (To_Unbounded_String ("cmd_error"), T_NA, 0, Null),
                        (To_Unbounded_String ("cmd_exit"), T_NA, 0, Null),
                        (To_Unbounded_String ("cmd_exitfor"), T_NA, 0, Null),
                        (To_Unbounded_String ("cmd_for"), T_NA, 0, Null),
                        (To_Unbounded_String ("cmd_subfun"), T_NA, 0, Null),
                        (To_Unbounded_String ("cmd_gosub"), T_NA, 0, Null),
                        (To_Unbounded_String ("cmd_goto"), T_NA, 0, Null),
                        (To_Unbounded_String ("cmd_if"), T_NA, 0, Null),
                        (To_Unbounded_String ("cmd_input"), T_NA, 0, Null),
                        (To_Unbounded_String ("cmd_let"), T_NA, 0, Null),
                        (To_Unbounded_String ("cmd_lineinput"), T_NA, 0, Null),
                        (To_Unbounded_String ("cmd_list"), T_NA, 0, Null),
                        (To_Unbounded_String ("cmd_loop"), T_NA, 0, Null),
                        (To_Unbounded_String ("cmd_new"), T_NA, 0, Null),
                        (To_Unbounded_String ("cmd_next"), T_NA, 0, Null),
                        (To_Unbounded_String ("cmd_null"), T_NA, 0, Null),
                        (To_Unbounded_String ("cmd_on"), T_NA, 0, Null),
                        (To_Unbounded_String ("cmd_print"), T_NA, 0, Null),
                        (To_Unbounded_String ("cmd_randomize"), T_NA, 0, Null),
                        (To_Unbounded_String ("cmd_read"), T_NA, 0, Null),
                        (To_Unbounded_String ("cmd_restore"), T_NA, 0, Null),
                        (To_Unbounded_String ("cmd_return"), T_NA, 0, Null),
                        (To_Unbounded_String ("cmd_run"), T_NA, 0, Null),
                        (To_Unbounded_String ("cmd_troff"), T_NA, 0, Null),
                        (To_Unbounded_String ("cmd_tron"), T_NA, 0, Null),
                        (To_Unbounded_String ("cmd_trace"), T_NA, 0, Null),
                        (To_Unbounded_String ("cmd_const"), T_NA, 0, Null),
                        (To_Unbounded_String ("cmd_select"), T_NA, 0, Null),
                        (To_Unbounded_String ("cmd_case"), T_NA, 0, Null),
                        (To_Unbounded_String ("op_invalid"), T_NA, 0, Null),
                        (To_Unbounded_String ("op_exp"), T_NA, 0, Null),
                        (To_Unbounded_String ("op_mul"), T_NA, 0, Null),
                        (To_Unbounded_String ("op_div"), T_NA, 0, Null),
                        (To_Unbounded_String ("op_divint"), T_NA, 0, Null),
                        (To_Unbounded_String ("op_add"), T_NA, 0, Null),
                        (To_Unbounded_String ("op_subtract"), T_NA, 0, Null),
                        (To_Unbounded_String ("op_mod"), T_NA, 0, Null),
                        (To_Unbounded_String ("op_ne"), T_NA, 0, Null),
                        (To_Unbounded_String ("op_gte"), T_NA, 0, Null),
                        (To_Unbounded_String ("op_lte"), T_NA, 0, Null),
                        (To_Unbounded_String ("op_lt"), T_NA, 0, Null),
                        (To_Unbounded_String ("op_gt"), T_NA, 0, Null),
                        (To_Unbounded_String ("op_equal"), T_NA, 0, Null),
                        (To_Unbounded_String ("op_and"), T_NA, 0, Null),
                        (To_Unbounded_String ("op_or"), T_NA, 0, Null),
                        (To_Unbounded_String ("op_xor"), T_NA, 0, Null),
                        (To_Unbounded_String ("op_not"), T_NA, 0, Null),
                        (To_Unbounded_String ("op_shiftleft"), T_NA, 0, Null),
                        (To_Unbounded_String ("op_shiftright"), T_NA, 0, Null),
                        (To_Unbounded_String (""), T_NA, 0, Null));

   function Get_Input_Buffer return String is
   begin
      return To_String (In_Buffer);

   end Get_Input_Buffer;

   function Get_Input_Character (Pos : Positive) return Character is
   begin
      return Element (In_Buffer, Pos);

   end Get_Input_Character;

   function Get_Input_Slice (Pos1, Pos2 : Positive) return String is
   begin
      return Slice (In_Buffer, Pos1, Pos2);

   end Get_Input_Slice;

   function Input_Buffer_Length return Natural is
   begin
      return Length (In_Buffer);

   end Input_Buffer_Length;

   procedure Load_Input_Buffer (File_Num : Natural) is
   begin
      Serial_File_IO.MM_Get_Line (File_Num, In_Buffer);
      Put_Line ("Command_And_Token_Tables.Load_Input_Buffer In_Buffer: " &
                  To_String (In_Buffer));

   end Load_Input_Buffer;

   procedure Replace_In_Buffer_Character (Pos : Positive; aChar : Character) is
   begin
      Replace_Element (In_Buffer, Pos, aChar);

   end Replace_In_Buffer_Character;

   procedure Skip_In_Buffer_Spaces (Pos : in out Positive) is
   begin
      while  Element (In_Buffer, Pos) = ' ' loop
         Pos := Pos + 1;
      end loop;

   end Skip_In_Buffer_Spaces;

   function Token_Type (Index : Integer) return Function_Type is
      T_Type : Function_Type := T_NA;
   begin
      if Index < Token_Table'Length + C_Base_Token and then
        Index >= C_Base_Token then
         T_Type := Token_Table (Index).Command_Type;
      end if;

      return T_Type;

   end Token_Type;

   procedure Trim_Input_Buffer (Side : Ada.Strings.Trim_End) is
   begin
      Trim (In_Buffer, Side);

   end Trim_Input_Buffer;

begin
   for index in 1 .. Num_Functions loop
      Command_Table (index) := Function_Types (index);
   end loop;

   for index in 1 .. Num_Commands loop
      Command_Table (Num_Functions + index) := Command_Types (index);
   end loop;

   for index in 1 ..Num_Operators loop
      Command_Table (Num_Functions + Num_Commands + index) :=
        Operators.Operator_Types (index);
   end loop;

   Command_Table (Command_Table_Size) :=
     (To_Unbounded_String (""), T_NA, 0, Null);

   for index in 1 .. Num_Functions loop
      Token_Table (index) := Function_Types (index);
   end loop;

   for index in 1 .. Num_Commands loop
      Command_Table (Num_Functions + index) := Command_Types (index);
   end loop;

   for index in 1 ..Num_Operators loop
      Token_Table (Num_Functions + Num_Commands + index) :=
        Operators.Operator_Types (index);
   end loop;

   Token_Table (Token_Table_Size) :=
     (To_Unbounded_String (""), T_NA, 0, Null);

end  Command_And_Token_Tables;
