
package M_Misc is

   C_Base_Token : constant := 128;  --  0x80
   Echo_Option  : Boolean := False;

   procedure Autosave (Current_Line_Ptr : Natural; Command_Line : String);
   function Check_Interrupt return Integer;

end M_Misc;
