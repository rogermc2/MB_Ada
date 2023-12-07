
package Flash is

   type Pins_Array is array (1 .. 8) of Integer;

   type Option_Record is record
      Autorun              : Boolean := False;
      Tab                  : Boolean := False;
      Invert               : Boolean := False;
      List_Case            : Boolean := False;
      Height               : Boolean := False;
      Width                : Boolean := False;
      PIN                  : Integer := 0;
      Baud_Rate            : Integer := 0;
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
      Default_Font         : Natural := 0;
      Keyboard_Config      : Natural := 0;
      Prog_Flash_Size      : Positive;
      --  general use storage for CFunctions written by PeterM
      Pins                 : Pins_Array := (others => 0);
      --  default colours
      Default_FC           : Natural := 0;
      Default_BC           : Natural := 0;
      --  default backlight brightness
      Default_Brightness   : Natural := 0;
      RTC_Clock            : Natural := 0;
      RTC_Data             : Natural := 0;
      --  used for the RD pin for SSD1963
      LCD_RD               : Natural := 0;
      --  maximum number of controls allowe
      Max_Controls         : Natural := 0;
   end record;

   Option : Option_Record;

end Flash;
