
package Keyboard is

   type Keyboard_Configuration is (NO_KEYBOARD, CONFIG_US, CONFIG_FR,
                                   CONFIG_GR, CONFIG_IT, CONFIG_BE, CONFIG_UK,
                                   CONFIG_ES);

   procedure Init_Keyboard;

end Keyboard;
