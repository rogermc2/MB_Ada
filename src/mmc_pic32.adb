
with Flash;

package body MMC_Pic32 is

   function MDD_SDSPI_Card_Detect_State return Boolean is
      OK : constant Boolean := Flash.Option.SD_CD = 0;
   begin
--        if not OK and then Flash.Option.SD_CD > 0 then
--           OK := not Pin_Read (Flash.Option.SD_CD);
--        else
--           OK := Pin_Read (-Flash.Option.SD_CD);
--        end if;

      return OK;

   end MDD_SDSPI_Card_Detect_State;

end MMC_Pic32;
