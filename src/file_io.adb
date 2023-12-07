
package body File_IO is

   function File_Get_Character (File_Num : Positive) return Character is
   begin
      return Character'Val (0);
   end File_Get_Character;

   procedure Init_File_IO is
   begin
      null;
   end Init_File_IO;

   procedure Check_SDCard is
   begin
      null;
   end Check_SDCard;

end File_IO;
