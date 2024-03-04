
with Interfaces;
with Ada.Assertions; use Ada.Assertions;
with Ada.Containers;
with Ada.Text_IO; use Ada.Text_IO;

with Arguments;

with Audio;
with Commands;
with Configuration;
with Disk_IO;
with External;
with Fat_File;
with Flash;
with MMC_Pic32;
with Serial_File_IO;

package body File_IO is

   procedure Check_SD_Card is
      use Interfaces;
      use Audio;
      use Disk_IO;
      use MMC_Pic32;
      Status          : unsigned_8;
      Disk_Check_Rate : Integer := 0;
      Buffer          : String (1 .. 4);
   begin
      if Currently_Playing = P_Wav then
         Check_Wave_Input;
      elsif Disk_Check_Rate mod 4096 = 0 then
         Disk_Check_Rate := Disk_Check_Rate + 1;
         if SD_Card_Stat /= STA_NOINIT and then
           Disk_IO_Control (Dev_RAM, MMC_Get_OCR, Buffer) = Res_OK then
            Status := D_Status'enum_rep (SD_Card_Stat);
            Status := Status or D_Status'enum_rep (STA_NODisk);
            SD_Card_Stat := D_Status'enum_val (Status);
         end if;
      end if;

   end Check_SD_Card;

   procedure Config_SD_Card (Command_Line : String_Buffer) is
      use Ada.Containers;
      use Arguments;
      Routine_Name : constant String := "File_IO.Config_SD_Card ";
      Args         : String_Buffer := Command_Line;
      Arg_Data     : Arguments_Record;
      Arg_Val      : Integer := 0;
   begin
      Put_Line (Routine_Name);
      --  File_IO 107
      Args.Delete_First;
      --  File_IO 109
      Arg_Data := Get_Args (Args, 1, 5, ",");

      Assert (Arg_Data.Arg_V.Length > 0, Routine_Name & "Arg_V is empty");
      Arg_Val := Integer'Value (Arg_Data.Arg_Buffer (Arg_Data.Arg_V (1)));
      Assert (Arg_Data.Arg_C > 0 and then Arg_Data.Arg_C <= 5,
              Routine_Name & "invalid number of arguments:" &
                Integer'Image (Arg_Data.Arg_C) &
                ", 1 to 5 arguments are required.");

      --  File_IO 113
      Flash.Option.SD_CD := 0;
      Flash.Option.SD_WP := 0;
      External.Check_Pin (Integer'Value (Arg_Data.Arg_Buffer (1)),
                          Commands.Option_Error_Check);
      --  File_IO 115
      Flash.Option.SDCARD_CS := Arg_Val;

      if Arg_Data.Arg_C > 2 then
         Arg_Val := Integer'Value (Arg_Data.Arg_Buffer (Arg_Data.Arg_V (3)));
         External.Check_Pin(abs (Integer'Value (Arg_Data.Arg_Buffer (3))),
                            Commands.Option_Error_Check);
         Flash.Option.SD_CD := Arg_Val;
      end if;

      if Arg_Data.Arg_C = 5 then
         Arg_Val := Integer'Value (Arg_Data.Arg_Buffer (Arg_Data.Arg_V (5)));
         External.Check_Pin (abs (Integer'Value (Arg_Data.Arg_Buffer (5))),
                             Commands.Option_Error_Check);
         Flash.Option.SD_WP := Arg_Val;
      end if;

   end Config_SD_Card;

   --     function File_Get_Character (File_Num : Positive) return Character is
   --     begin
   --        return Character'Val (0);
   --
   --     end File_Get_Character;

   procedure Init_File_IO is
   begin
      null;
   end Init_File_IO;

   --  InitSDCard is called by:
   --  FileIO.c cmd_save, FileLoadProgram, fun_dir, cmd_mkdir, cmd_rmdir,
   --           cmd_chdir, cmd_kill, cmd_seek, cmd_name, BMP_bDecode,
   --           cmd_files, BasicFileOpen, FileGetChar, FilePutChar, FileEOF,
   --           GetCWD.
   --  XModem.c cmd_xmodem.
   --  Audio.c  cmd_play.
   function Init_SD_Card return Boolean is
      use Disk_IO;
      use Fat_File;
      use MMC_Pic32;
      use Serial_File_IO;
      Routine_Name : constant String := "File_IO.Init_SD_Card ";
      FS           : Fat_File.Fat_FS;
      OK           : Boolean := Configuration.Bus_Speed >= 30000000;
   begin
      --  FileIO.c 792
      if not OK then
         Put_Line (Routine_Name & "CPU speed is too low.");
      elsif Flash.Option.SDCARD_CS = 0 then
         Put_Line (Routine_Name & "The SD card has not been configured.");
         OK := False;
      elsif not MMC_Pic32.MDD_SDSPI_Card_Detect_State then
         Put_Line (Routine_Name & To_String (F_Error_Message (2)));
         OK := False;
      elsif SD_Card_Stat = STA_NOINIT then
         OK := True;
      else
         --  FileIO.c 807
         for index in 1 .. Max_Open_Files loop
            if File_Table (index).Com > Max_Com_Ports then
               if File_Table (index).Name /= Null_Unbounded_String then
                  Close (File_Table (index).File_ID);
               end if;
            end if;
         end loop;

         --  FileIO.c 812
         OK := F_Mount (FS, "", 1) = FR_OK;
         if not OK then
            Put_Line (Routine_Name & "SD card failed to mount.");
         end if;
      end if;

      return OK;

   end Init_SD_Card;

end File_IO;
