
with Command_And_Token_Tables; use Command_And_Token_Tables;

package File_IO is

   Option_File_Error_Abort : Boolean := True;

   procedure Check_SDCard;
   procedure Config_SD_Card (Command_Line : String_Buffer);
   function File_Get_Character (File_Num : Positive) return Character;
   procedure Init_File_IO;

end File_IO;
