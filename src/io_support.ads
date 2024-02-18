
package IO_Support is

   subtype String3 is String (1 .. 3);
   subtype String5 is String (1 .. 5);

   Esc_Char   : constant Character := Character'Val (27);

   --  vt100 escape code sequences
   F1    : constant String5 := (Esc_Char,  '[', '1', '1', '~');
   F2    : constant String5 := (Esc_Char,  '[', '1', '1', '~');
   F3    : constant String5 := (Esc_Char,  '[', '1', '1', '~');
   F4    : constant String5 := (Esc_Char,  '[', '1', '1', '~');
   F10   : constant String5 := (Esc_Char,  '[', '2', '1', '~');
   F11   : constant String5 := (Esc_Char,  '[', '2', '1', '~');
   F12   : constant String5 := (Esc_Char,  '[', '2', '1', '~');

   function MM_Inkey (OK : in out Boolean) return String;

end IO_Support;
