
with Configuration; use Configuration;
with Draw;

package Flash is

   type Pins_Array is array (1 .. 8) of Integer;

   FLASH_PAGE_SIZE : constant Positive := 4096;
   PROG_FLASH_SIZE : constant Positive := 16 * FLASH_PAGE_SIZE;

   type Option_Record is record
      Autorun              : Boolean := False;
      Tab                  : Natural := 2;
      Invert               : Boolean := False;
      List_Case            : Boolean := False;
      Height               : Positive := SCREENHEIGHT;
      Width                : Positive := SCREENWIDTH;
      PIN                  : Integer := 0;
      Baud_Rate            : Integer := CONSOLE_BAUDRATE;
      Colour_Code          : Integer := 0;
      Display_Type         : Integer := 0;
      Display_Orientation  : Integer := 0;
      Touch_CS             : Natural := 0;
      Touch_IRQ            : Natural := 0;
      Touch_Swap_XY        : Boolean := False;
      Touch_X_Zero         : Natural := 0;
      Touch_Y_Zero         : Natural := 0;
      Touch_X_Scale        : Natural := 0;
      Touch_Y_Scale        : Natural := 0;
      Touch_Click          : Boolean := False;
      LCD_CD               : Natural := 0;
      LCD_CS               : Natural := 0;
      LCD_Reset            : Boolean := False;
      Serial_Con_Disabled  : Boolean := False;
      SDCARD_CS            : Natural := 0;
      SD_CD                : Natural := 0;
      SD_WP                : Natural := 0;
      DISPLAY_BL           : Natural := 0;
      DISPLAY_CONSOLE      : Boolean := False;
      Default_Font         : Natural := 1;
      Keyboard_Config      : Natural := 0;
      Program_Flash_Size   : Positive := PROG_FLASH_SIZE;
      --  general use storage for CFunctions written by PeterM
      Pins                 : Pins_Array := (others => 0);
      --  default colours
      Default_FC           : Draw.RGB := Draw.WHITE;
      Default_BC           : Draw.RGB := Draw.BLACK;
      --  default backlight brightness
      Default_Brightness   : Natural := 100;
      RTC_Clock            : Natural := 0;
      RTC_Data             : Natural := 0;
      --  used for the RD pin for SSD1963
      LCD_RD               : Natural := 0;
      --  maximum number of controls allowe
      Max_Controls         : Natural := 101;
   end record;

   Option : Option_Record;

   procedure Load_Options;

end Flash;
