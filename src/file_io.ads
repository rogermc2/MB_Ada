
package File_IO is

   Option_File_Error_Abort : Boolean := True;

   function File_Get_Character (File_Num : Positive) return Character;
   procedure Init_File_IO;
   procedure Check_SDCard;

end File_IO;
