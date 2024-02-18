
package Audio is

   type Playing_Kind is (P_Nothing, P_Pause_Tone, P_Tone, P_Wav,
                         P_Pause_Wav, P_Stopped);

   Currently_Playing : Playing_Kind := P_Nothing;
   Vol_Left  : Natural := 0;
   Vol_Right : Natural := 0;

   procedure Audio_Interrupt;
   procedure Check_Wave_Input;
   procedure Close_Audio;
   procedure Command_Play;
   procedure Stop_Audio;

end Audio;
