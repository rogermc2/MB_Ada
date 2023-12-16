
with System;

with Ada.Strings.Unbounded; use Ada.Strings.Unbounded;

with Configuration;

package M_Basic is

   --     package UB_String_Buffer_Package is
   --       new Ada.Containers.Vectors (Positive, Unbounded_String);
   --     subtype UB_String_Buffer is UB_String_Buffer_Package.Vector;

   MAXLINENBR       : constant integer := 65001;

   In_Buffer        : Unbounded_String;
   Token_Buffer     : Unbounded_String;

   Current_Line_Ptr : Natural := 0;
   Continue_Point   : Natural := 0;
   Local_Index      : Natural := 0;

   Subfunctions             : array (1 .. Configuration.MAXSUBFUN) of Natural;
   Current_Subfunction_Name : array (1 .. Configuration.MAXVARLEN + 1) of
     Unbounded_String;
   Current_Interrupt_Name   : array (1 .. Configuration.MAXVARLEN + 1) of
     Unbounded_String;

   procedure Clear_Program;
   procedure Execute_Program (Tokens : Unbounded_String);
   function Find_Subfunction (Token : Unbounded_String; Fun_Type : Integer)
                              return System.Address;
   procedure Init_Basic;
   function Is_Name_Character (aChar : Character) return Boolean;
   pragma Inline (Is_Name_Character);
   function Is_Name_End (aChar : Character) return Boolean;
   pragma Inline (Is_Name_End);
   function Is_Name_Start (aChar : Character) return Boolean;
   pragma Inline (Is_Name_Start);
   procedure Print_String (theString : String);
   procedure Prepare_Program (Error_Abort : Boolean);
   procedure Skip_Spaces (Pos : in out Positive);
   function Skip_Var (Pos : in out Positive) return Positive;
   function Token_Function (Index : Positive) return System.Address;
   procedure Tokenize (From_Console : Boolean);

end M_Basic;
