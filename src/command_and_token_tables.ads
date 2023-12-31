
with System; use System;
with System.Address_To_Access_Conversions;

with Interfaces; use Interfaces;

with Ada.Containers.Indefinite_Vectors;
with Ada.Strings.Unbounded; use Ada.Strings.Unbounded;

with Command_And_Token_Functions; use Command_And_Token_Functions;

package Command_And_Token_Tables is

   package String_Buffer_Package is
     new Ada.Containers.Indefinite_Vectors (Positive, String);
   subtype String_Buffer is String_Buffer_Package.Vector;

   package AAC_Functions is new
     System.Address_To_Access_Conversions (Float);

   subtype Token_Cursor is String_Buffer_Package.Cursor;
   type Token_Pointer is access String;

   type Modular is mod 2**32;
   --
   --     type Unsigned_Byte is mod 256;
   --     type Unsigned_2Byte is mod 65536;
   type Unsigned_Byte_Ptr is access Unsigned_8;
   type Unsigned_Byte_Array is array (Positive range <>) of Unsigned_8;

   subtype Function_Type is Unsigned_16;
   --     type Function_Type_Ptr is access Function_Type;
   subtype Function_Type_Ptr is System.Address;
   --     type Cos_Ptr is access Cos (X : Float) return float;

   T_NOTYPE  : constant Function_Type := 0;
   T_NBR     : constant Function_Type := 1;
   T_STR     : constant Function_Type := 2;
   T_INT     : constant Function_Type := 4;
   T_PTR     : constant Function_Type := 8;
   T_CMD     : constant Function_Type := 16;
   --                            T_NBRorImplied => 17,
   --                            T_STRorImplied => 18,
   --                            T_INTorImplied => 20,
   T_CONST   : constant Function_Type := 32;
   T_FUN     : constant Function_Type := 64;
   --                            T_FUNorNBR => 65,
   --                            T_FUNorSTR => 66,
   --                            T_FUNorINT => 68,
   --                            T_FUNorNBRorINT => 69,
   --                            T_FUNorNBRorINTorSTR => 71,
   T_FNA     : constant Function_Type := 128;
   --                            T_FNAorNBR => 129,
   --                            T_FNAorSTR => 130,
   --     T_FNAorINT => 132;

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

   Num_Commands  : constant Positive := 45;
   Num_Functions : constant Positive := 118;
   Num_Tokens    : constant Positive := 9;
   Num_Operators : constant Positive := 19;

   Command_Table_Size : constant Positive :=
                          Num_Functions + Num_Commands + Num_Operators + 1;
   Token_Table_Size   : constant Positive :=
                          Num_Functions + Num_Commands + Num_Operators + 1;

   Command_Table : array (1 .. Command_Table_Size) of Command_Table_Item;
   Token_Table   : array (1 .. Token_Table_Size) of Command_Table_Item;

   op_invalid    : constant Access_Procedure :=  Null;
   fun_acos      : constant Access_Procedure :=  F_Cos_Ptr;
   fun_abs       : constant Access_Procedure :=  Null;
   fun_asc       : constant Access_Procedure :=  Null;
   fun_asin      : constant Access_Procedure :=  Null;
   fun_atn       : constant Access_Procedure :=  Null;
   fun_bin       : constant Access_Procedure :=  Null;
   fun_chr       : constant Access_Procedure :=  Null;
   fun_cint      : constant Access_Procedure :=  Null;
   fun_cos       : constant Access_Procedure :=  F_Cos_Ptr;
   fun_deg       : constant Access_Procedure :=  Null;
   fun_errno     : constant Access_Procedure :=  Null;
   fun_errmsg    : constant Access_Procedure :=  Null;
   fun_exp       : constant Access_Procedure :=  Null;
   fun_fix       : constant Access_Procedure :=  Null;
   fun_hex       : constant Access_Procedure :=  Null;
   fun_inkey     : constant Access_Procedure :=  Null;
   fun_instr     : constant Access_Procedure :=  Null;
   fun_int       : constant Access_Procedure :=  Null;
   fun_lcase     : constant Access_Procedure :=  Null;
   fun_ucase     : constant Access_Procedure :=  Null;
   fun_left      : constant Access_Procedure :=  Null;
   fun_len       : constant Access_Procedure :=  Null;
   fun_log       : constant Access_Procedure :=  Null;
   fun_mid       : constant Access_Procedure :=  Null;
   fun_version   : constant Access_Procedure :=  Null;
   fun_oct       : constant Access_Procedure :=  Null;
   fun_pi        : constant Access_Procedure :=  Null;
   fun_pos       : constant Access_Procedure :=  Null;
   fun_rad       : constant Access_Procedure :=  Null;
   fun_right     : constant Access_Procedure :=  Null;
   fun_rnd       : constant Access_Procedure :=  Null;
   fun_sgn       : constant Access_Procedure :=  Null;
   fun_sin       : constant Access_Procedure :=  Null;
   fun_tan       : constant Access_Procedure :=  Null;
   fun_space     : constant Access_Procedure :=  Null;
   fun_sqr       : constant Access_Procedure :=  Null;
   fun_str       : constant Access_Procedure :=  Null;
   fun_string    : constant Access_Procedure :=  Null;
   fun_tab       : constant Access_Procedure :=  Null;
   fun_val       : constant Access_Procedure :=  Null;
   fun_eval      : constant Access_Procedure :=  Null;
   fun_max       : constant Access_Procedure :=  Null;
   fun_min       : constant Access_Procedure :=  Null;

   cmd_null           : constant Access_Procedure :=  Null;
   cmd_autosave       : constant Access_Procedure :=  Null;
   cmd_option         : constant Access_Procedure :=  Null;
   cmd_pause          : constant Access_Procedure :=  Null;
   cmd_timer          : constant Access_Procedure :=  Null;
   cmd_date           : constant Access_Procedure :=  Null;
   cmd_time           : constant Access_Procedure :=  Null;
   cmd_ireturn        : constant Access_Procedure :=  Null;
   cmd_poke           : constant Access_Procedure :=  Null;
   cmd_settick        : constant Access_Procedure :=  Null;
   cmd_watchdog       : constant Access_Procedure :=  Null;
   cmd_cpu            : constant Access_Procedure :=  Null;
   cmd_cfunction      : constant Access_Procedure :=  Null;

   function Get_Input_Buffer return String;
   function Get_Input_Character (Pos : Positive) return Character;
   function Get_Input_Slice (Pos1, Pos2 : Positive) return String;
   function Input_Buffer_Length return Natural;
   procedure Load_Input_Buffer (File_Num : Natural);
   procedure Replace_In_Buffer_Character (Pos : Positive; aChar : Character);
   procedure Skip_In_Buffer_Spaces (Pos : in out Positive);
   function Token_Type (Index : Integer) return Function_Type;
   procedure Trim_Input_Buffer (Side : Ada.Strings.Trim_End);

end Command_And_Token_Tables;
