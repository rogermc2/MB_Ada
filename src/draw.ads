
package Draw is

   type RGB is array (1 .. 3) of Natural;

   BLACK : constant RGB := (0, 0, 0);
   RED   : constant RGB := (255, 0, 0);
   GREEN : constant RGB := (0, 255, 0);
   BLUE  : constant RGB := (0, 0, 255);
   WHITE : constant RGB := (255, 255, 255);

   Current_X   : Natural := 0;
   Current_Y   : Natural := 0;
   GUI_Font    : Natural := 0;
   GUI_Fcolour : Natural := 0;
   GUI_Bcolour : Natural;

   procedure Set_Font (Font_ID : Natural);

end Draw;
