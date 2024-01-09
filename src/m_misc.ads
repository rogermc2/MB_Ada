
package M_Misc is

   C_Base_Token : constant := 128;  --  0x80 the base of the token numbers.
   Echo_Option  : Boolean := False;
   Option_Base : Natural := 0;

   procedure Autosave (Current_Line_Ptr : Natural; Command_Line : String);
   function Check_Interrupt return Integer;

end M_Misc;
