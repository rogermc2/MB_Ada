
package Audio is

   Vol_Left  : Natural := 0;
   Vol_Right : Natural := 0;

   procedure Audio_Interrupt;
   procedure Close_Audio;
   procedure Command_Play;
   procedure Stop_Audio;

end Audio;
