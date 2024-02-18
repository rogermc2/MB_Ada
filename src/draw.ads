
with Ada.Strings.Unbounded; use Ada.Strings.Unbounded;

with Command_And_Token_Functions;

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

   Font_Table    : array (1 .. FONT_TABLE_SIZE) of Unbounded_String;
   H_Res         : Positive;
   V_Res         : Positive;
   Display_H_Res : Positive;
   Display_V_Res : Positive;

   procedure Set_Font (Font_ID : Natural);
   procedure Draw_Bit_Map;
   procedure Draw_Bit_Map_User;
   procedure Draw_Rectangle;
   procedure Draw_Rectangle_User;

   Draw_Bit_Map_Ptr : Command_And_Token_Functions.Access_Procedure :=
                        Draw_Bit_Map'Access;
   Draw_Bit_Map_User_Ptr : Command_And_Token_Functions.Access_Procedure :=
                             Draw_Bit_Map_User'Access;
   Draw_Rectangle_Ptr : Command_And_Token_Functions.Access_Procedure :=
                          Draw_Rectangle'Access;
   Draw_Rectangle_User_Ptr : Command_And_Token_Functions.Access_Procedure :=
                               Draw_Rectangle_User'Access;

end Draw;
