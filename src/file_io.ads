
with Ada.Strings.Unbounded; use Ada.Strings.Unbounded;

with Command_And_Token_Tables; use Command_And_Token_Tables;

package File_IO is

   Option_File_Error_Abort : Boolean := True;
   F_Error_Message         : array (1 .. 15) of Unbounded_String :=
     (To_Unbounded_String ("No error"),
      To_Unbounded_String ("SD card not found"),
      To_Unbounded_String ("SD card is write protected"),
      To_Unbounded_String ("Not enough space"),
      To_Unbounded_String (""),
      To_Unbounded_String (""),
      To_Unbounded_String ("Cannot find file"),
      To_Unbounded_String ("Cannot find file or directory"),
      To_Unbounded_String ("Cannot create directory"),
      To_Unbounded_String (""),
      To_Unbounded_String (""),
      To_Unbounded_String (""),
      To_Unbounded_String ("Hardware error"),
      To_Unbounded_String ("File system error"),
      To_Unbounded_String ("Directory not empty" ));

   procedure Check_SDCard;
   procedure Config_SD_Card (Command_Line : String_Buffer);
   function File_Get_Character (File_Num : Positive) return Character;
   procedure Init_File_IO;
   function Init_SDCard return Boolean;

end File_IO;
