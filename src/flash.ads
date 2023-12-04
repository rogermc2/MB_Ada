
package Flash is

   type Pins_Array is array (1 .. 8) of Integer;

   type Option_Record is record
      Autorun              : Boolean;
      Tab                  : Boolean;
      Invert               : Boolean;
      List_Case            : Boolean;
      Height               : Boolean;
      Width                : Boolean;
      PIN                  : Integer;
      Baud_Rate            : Integer;
      Colour_Code          : Integer;
      Display_Type         : Integer;
      Display_Orientation  : Integer;
      Touch_CS             : Natural;
      Touch_IRQ            : Natural;
      Touch_Swap_XY        : Boolean;
      Touch_X_Zero         : Natural;
      Touch_Y_Zero         : Natural;
      Touch_X_Scale        : Natural;
      Touch_Y_Scale        : Natural;
      Touch_Click          : Boolean;
      LCD_CD               : Natural;
      LCD_CS               : Natural;
      LCD_Reset            : Boolean;
      Serial_Con_Disabled  : Boolean;
      SDCARD_CS            : Natural;
      SD_CD                : Natural;
      SD_WP                : Natural;
      DISPLAY_BL           : Natural;
      DISPLAY_CONSOLE      : Natural;
      Default_Font         : Natural;
      Keyboard_Config      : Natural;
      Prog_Flash_Size      : Positive;
      -- general use storage for CFunctions written by PeterM
      Pins                 : Pins_Array;
      -- default colours
      Default_FC           : Natural;
      Default_BC           : Natural;
      --  default backlight brightness
      Default_Brightness   : Natural;
      RTC_Clock            : Natural;
      RTC_Data             : Natural;
      --  used for the RD pin for SSD1963
      LCD_RD               : Natural;
      --  maximum number of controls allowe
      Max_Controls         : Natural;
   end record;

   Option : Option_Record;

end Flash;
