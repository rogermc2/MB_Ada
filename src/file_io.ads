
with Ada.Strings.Unbounded; use Ada.Strings.Unbounded;

package File_IO is

   Option_File_Error_Abort : Boolean := True;

   procedure Check_SDCard;
   procedure Config_SD_Card (Arg_String : Unbounded_String);
   function File_Get_Character (File_Num : Positive) return Character;
   procedure Init_File_IO;

end File_IO;
