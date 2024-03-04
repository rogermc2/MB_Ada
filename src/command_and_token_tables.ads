
with System; use System;
with System.Address_To_Access_Conversions;

with Interfaces; use Interfaces;
with Interfaces.C; use Interfaces.C;

with Ada.Containers.Indefinite_Vectors;
with Ada.Containers.Vectors;
with Ada.Strings.Unbounded; use Ada.Strings.Unbounded;

with Command_And_Token_Functions; use Command_And_Token_Functions;
with Command_Handler;
with File_IO_Handler; use File_IO_Handler;
with Option_Handler; use Option_Handler;

package Command_And_Token_Tables is

   package String_Buffer_Package is
     new Ada.Containers.Indefinite_Vectors (Positive, String);
   subtype String_Buffer is String_Buffer_Package.Vector;

   package AAC_Functions is new
     System.Address_To_Access_Conversions (Float);

   type Modular is mod 2**32;

   subtype US_Long_Integer is Long_Integer range 0 .. 2**31 - 1;

   subtype Byte is Unsigned_8;
   subtype Word is Unsigned_16;
   subtype DWord is Unsigned_32;
   subtype QWord is Unsigned_64;

   package Unsigned_Buffer_Package is
     new Ada.Containers.Vectors (Positive, Unsigned);
   subtype Unsigned_Buffer is Unsigned_Buffer_Package.Vector;

   subtype Function_Type is Unsigned_16;

   type Byte_Array is array (Long_Integer range <>) of Byte;

   T_NOTYPE  : constant Function_Type := 0;
   T_NBR     : constant Function_Type := 1;
   T_STR     : constant Function_Type := 2;
   T_INT     : constant Function_Type := 4;
   T_PTR     : constant Function_Type := 8;
   T_CMD     : constant Function_Type := 16;
   T_CONST   : constant Function_Type := 32;
   T_FUN     : constant Function_Type := 64;
   T_FNA     : constant Function_Type := 128;

   T_NA      : constant Function_Type := T_NOTYPE;
   T_INV     : constant Function_Type := T_NA;
   T_IMPLIED : constant Function_Type := T_CMD;
   T_OPER    : constant Function_Type := T_CONST;

   type Command_Table_Item is record
      Name         : Unbounded_String;
      Command_Type : Function_Type := T_NOTYPE;
      Precedence   : Natural := 0;
      Function_Ptr : Access_Procedure := Null;
   end record;

   Num_Commands          : constant Positive := 53;
   Num_File_IO_Commands  : constant Positive := 9;
   Num_Function_Commands : constant Positive := 45;
   Num_Functions         : constant Positive := 117;
   Num_Tokens            : constant Positive := 11;
   Num_Operators         : constant Positive := 19;

   Command_Table_Size : constant Positive :=
     Num_Functions + Num_Commands + Num_Function_Commands +
      Num_File_IO_Commands + Num_Operators + 1;
   Token_Table_Size   : constant Positive :=
     Num_Functions + Num_Commands + Num_Operators +
       Num_Tokens + 1;

   --  Command_Table and Token_Table are loaded by
   --  Command_and_Token_Tables.adb initialization.
   Command_Table : array (1 .. Command_Table_Size) of Command_Table_Item;
   Token_Table   : array (1 .. Token_Table_Size) of Command_Table_Item;

   op_invalid    : constant Access_Procedure := Null;
   fun_acos      : constant Access_Procedure :=  F_Cos_Ptr;
   fun_abs       : constant Access_Procedure := Null;
   fun_asc       : constant Access_Procedure := Null;
   fun_asin      : constant Access_Procedure := Null;
   fun_atn       : constant Access_Procedure := Null;
   fun_bin       : constant Access_Procedure := Null;
   fun_chr       : constant Access_Procedure := Null;
   fun_cint      : constant Access_Procedure := Null;
   fun_cos       : constant Access_Procedure :=  F_Cos_Ptr;
   fun_deg       : constant Access_Procedure := Null;
   fun_errno     : constant Access_Procedure := Null;
   fun_errmsg    : constant Access_Procedure := Null;
   fun_exp       : constant Access_Procedure := Null;
   fun_fix       : constant Access_Procedure := Null;
   fun_hex       : constant Access_Procedure := Null;
   fun_inkey     : constant Access_Procedure := Null;
   fun_instr     : constant Access_Procedure := Null;
   fun_int       : constant Access_Procedure := Null;
   fun_lcase     : constant Access_Procedure := Null;
   fun_ucase     : constant Access_Procedure := Null;
   fun_left      : constant Access_Procedure := Null;
   fun_len       : constant Access_Procedure := Null;
   fun_log       : constant Access_Procedure := Null;
   fun_mid       : constant Access_Procedure := Null;
   fun_version   : constant Access_Procedure := Null;
   fun_oct       : constant Access_Procedure := Null;
   fun_pi        : constant Access_Procedure := Null;
   fun_pos       : constant Access_Procedure := Null;
   fun_rad       : constant Access_Procedure := Null;
   fun_right     : constant Access_Procedure := Null;
   fun_rnd       : constant Access_Procedure := Null;
   fun_sgn       : constant Access_Procedure := Null;
   fun_sin       : constant Access_Procedure := Null;
   fun_tan       : constant Access_Procedure := Null;
   fun_space     : constant Access_Procedure := Null;
   fun_sqr       : constant Access_Procedure := Null;
   fun_str       : constant Access_Procedure := Null;
   fun_string    : constant Access_Procedure := Null;
   fun_tab       : constant Access_Procedure := Null;
   fun_val       : constant Access_Procedure := Null;
   fun_eval      : constant Access_Procedure := Null;
   fun_max       : constant Access_Procedure := Null;
   fun_min       : constant Access_Procedure := Null;

   cmd_null           : constant Access_Procedure := Null;
   cmd_autosave       : constant Access_Procedure := Null;
   cmd_option         : constant Access_Procedure := Option_Cmd'Access;
   cmd_pause          : constant Access_Procedure := Null;
   cmd_timer          : constant Access_Procedure := Null;
   cmd_date           : constant Access_Procedure := Null;
   cmd_time           : constant Access_Procedure := Null;
   cmd_ireturn        : constant Access_Procedure := Null;
   cmd_poke           : constant Access_Procedure := Null;
   cmd_settick        : constant Access_Procedure := Null;
   cmd_watchdog       : constant Access_Procedure := Null;
   cmd_cpu            : constant Access_Procedure := Null;
   cmd_cfunction      : constant Access_Procedure := Null;

   cmd_clear          : constant Access_Procedure := Null;
   cmd_continue       : constant Access_Procedure := Null;
   cmd_dim            : constant Access_Procedure := Null;
   cmd_do             : constant Access_Procedure := Null;
   cmd_else           : constant Access_Procedure := Null;
   cmd_end            : constant Access_Procedure := Null;
   cmd_endfun         : constant Access_Procedure := Null;
   cmd_endsub         : constant Access_Procedure := Null;
   cmd_erase          : constant Access_Procedure := Null;
   cmd_error          : constant Access_Procedure := Null;
   cmd_exit           : constant Access_Procedure := Null;
   cmd_exitfor        : constant Access_Procedure := Null;
   cmd_for            : constant Access_Procedure := Null;
   cmd_subfun         : constant Access_Procedure := Null;
   cmd_gosub          : constant Access_Procedure := Null;
   cmd_goto           : constant Access_Procedure := Null;
   cmd_if             : constant Access_Procedure := Null;
   cmd_input          : constant Access_Procedure := Null;
   cmd_let            : constant Access_Procedure := Null;
   cmd_lineinput      : constant Access_Procedure := Null;
   cmd_list           : constant Access_Procedure :=
     Command_Handler.List_Cmd'Access;
   cmd_loop           : constant Access_Procedure := Null;
   cmd_new            : constant Access_Procedure := Null;
   cmd_next           : constant Access_Procedure := Null;
   cmd_on             : constant Access_Procedure := Null;
   cmd_print          : constant Access_Procedure := Null;
   cmd_randomize      : constant Access_Procedure := Null;
   cmd_read           : constant Access_Procedure := Null;
   cmd_restore        : constant Access_Procedure := Null;
   cmd_return         : constant Access_Procedure := Null;
   cmd_run            : constant Access_Procedure := Null;
   cmd_troff          : constant Access_Procedure := Null;
   cmd_tron           : constant Access_Procedure := Null;
   cmd_trace          : constant Access_Procedure := Null;
   cmd_const          : constant Access_Procedure := Null;
   cmd_select         : constant Access_Procedure := Null;
   cmd_case           : constant Access_Procedure := Null;

   cmd_save           : constant Access_Procedure := Null;
   cmd_load           : constant Access_Procedure := Null;
   cmd_mkdir          : constant Access_Procedure := Null;
   cmd_rmdir          : constant Access_Procedure := Null;
   cmd_chdir          : constant Access_Procedure := Null;
   cmd_kill           : constant Access_Procedure := Null;
   cmd_seek           : constant Access_Procedure := Null;
   cmd_files          : constant Access_Procedure :=  Files_Cmd'Access;
   cmd_name           : constant Access_Procedure := Null;

   function Get_Input_Buffer return String;
   function Get_Input_Character (Pos : Positive) return Character;
   function Get_Input_Slice (Pos1, Pos2 : Positive) return String;
   function Input_Buffer_Length return Natural;
   procedure Load_Input_Buffer (File_Num : Natural);
   procedure Replace_In_Buffer_Character (Pos : Positive; aChar : Character);
   procedure Skip_In_Buffer_Spaces (Pos : in out Positive);
   function Token_Type (Index : Integer) return Function_Type;
   procedure Trim_Input_Buffer (Side : Ada.Strings.Trim_End);
   function Type_Mask (Val : Function_Type) return Function_Type;
   function Type_Mask (Val : Unbounded_String) return Function_Type;

end Command_And_Token_Tables;
