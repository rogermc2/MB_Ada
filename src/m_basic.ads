
with System;

with Ada.Strings.Unbounded; use Ada.Strings.Unbounded;

with Command_And_Token_Tables; use Command_And_Token_Tables;
with Configuration;

package M_Basic is

   MAXLINENBR       : constant integer := 65001;

   Current_Line_Pos : Natural := 0;
   Continue_Point   : Natural := 0;
   Local_Index      : Natural := 0;

   --  Subfunctions is an array of pointers to program memory elements
   Subfunctions             : array (1 .. Configuration.MAXSUBFUN) of Natural :=
                                (others => 0);
   Current_Subfunction_Name : array (1 .. Configuration.MAXVARLEN + 1) of
     Unbounded_String;
   Current_Interrupt_Name   : array (1 .. Configuration.MAXVARLEN + 1) of
     Unbounded_String;

   Default_Type     : Function_Type := T_NBR;

   procedure Clear_Program;
   procedure Execute_Program;
   function Find_Subfunction (Token : String; Fun_Type : Function_Type)
                              return Natural;
   procedure Init_Basic;
   function Is_Name_Character (aChar : Character) return Boolean;
   pragma Inline (Is_Name_Character);
   function Is_Name_End (aChar : Character) return Boolean;
   pragma Inline (Is_Name_End);
   function Is_Name_Start (aChar : Character) return Boolean;
   pragma Inline (Is_Name_Start);
   procedure Print_String (theString : String);
   procedure Prepare_Program (Error_Abort : Boolean);
   procedure Skip_Spaces (Buffer : Unbounded_String; Pos : in out Positive);
   function Skip_Var (Pos : in out Positive) return Positive;
   function Token_Function (Index : Positive) return System.Address;
   procedure Tokenize (From_Console : Boolean);

end M_Basic;
