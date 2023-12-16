
with System;

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

   FONT_BUILTIN_NBR : constant Positive := 6;
   FONT_TABLE_SIZE  : constant Positive := 16;

   Font_Table : array (1 .. FONT_TABLE_SIZE) of System.Address :=
                  (others => System.Null_Address);

   procedure Set_Font (Font_ID : Natural);

end Draw;
