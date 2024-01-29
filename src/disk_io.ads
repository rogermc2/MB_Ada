
with Command_And_Token_Tables; use Command_And_Token_Tables;

package Disk_IO is

   type Drive_Type is (Dev_RAM, Dev_MMC, Dev_USB);
   type D_Result is (Res_OK, Res_Error, Res_Write_Protected,
                    Res_Not_Ready, Res_Parameter_Invalid);
   type D_Status is (STA_NOINIT, STA_NODISK, STA_PROTECT);

--     for D_Status use (STA_NOINIT  => 1),
--                          STA_NODISK  => 2,
--                          STA_PROTECT => 4);

   function Disk_Initialize (Drv_Typ : Drive_Type) return D_Status;
   function Disk_Read (Drv_Typ : Drive_Type; Buffer : Byte_Array;
                       Sector  : Long_Integer; Count : Natural)
                       return D_Result;
   function Disk_Status (Drv_Typ : Drive_Type) return D_Status;
   function Disk_Write (Drv_Typ : Drive_Type; Buffer : Byte_Array;
                        Sector  : Long_Integer; Count : Natural)
                        return D_Result;

end Disk_IO;
