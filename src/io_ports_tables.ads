
with Interfaces;  use Interfaces;

package IO_Ports_Tables is

   type Port_Addresses is (Addr_Port_A, Addr_Port_B, Addr_Port_C, Addr_Port_D,
                           Addr_Port_E, Addr_Port_F, Addr_Port_G, Addr_Null);
   type Pin_Modes is (Pin_Unused, Pin_Analog_in, Pin_Digital_In,
                      Pin_Counting, Pin_Digital_Out, DI_Or_DO, AI_Or_DI_Or_Do,
                      Pin_Do_Not_Reset);
   for Pin_Modes use (Pin_Unused => Unsigned_8 (1),
                      Pin_Analog_in => Unsigned_8 (2),
                      Pin_Digital_In => Unsigned_8 (4),
                      Pin_Counting => Unsigned_8 (8),
                      Pin_Digital_Out => Unsigned_8 (16),
                      DI_Or_DO => Unsigned_8 (20),
                      AI_Or_DI_Or_Do => Unsigned_8 (22),
                      Pin_Do_Not_Reset => Unsigned_8 (32));

   type Pin_Definitions is record
      Port           : Port_Addresses;
      Bit_Number     : Natural := 0;
      Mode           : Pin_Modes := Pin_Unused;
      Analog_Channel : Natural := 0;
   end record;

   function  U_Val (Mode : Pin_Modes) return Unsigned_8;

   Pin_Def_Table : array (1 .. 64) of Pin_Definitions :=
   --      ((Addr_Null,  0, UNUSED, 0),                                         --  pin 0
     ((Addr_Port_E,  5, AI_Or_DI_Or_Do, 22), --  pin 1
      (Addr_Port_E,  6, AI_Or_DI_Or_Do, 23), --  pin 2
      (Addr_Port_E,  7, AI_Or_DI_Or_Do, 27), --  pin 3
      (Addr_Port_G,  6, AI_Or_DI_Or_Do, 16), --  pin 4
      (Addr_Port_G,  7, AI_Or_DI_Or_Do, 17), --  pin 5
      (Addr_Port_G,  8, AI_Or_DI_Or_Do, 18), --  pin 6 - Console RX
      (Addr_Null,  0, Pin_Unused, 0),                                         --  pin 7
      (Addr_Port_G,  9, AI_Or_DI_Or_Do, 19), --  pin 8
      (Addr_Null,  0, Pin_Unused, 0),                                         --  pin 9
      (Addr_Null,  0, Pin_Unused, 0),                                         --  pin 10
      (Addr_Port_B,  5, AI_Or_DI_Or_Do, 5),  --  pin 11
      (Addr_Port_B,  4, AI_Or_DI_Or_Do, 4),  --  pin 12
      (Addr_Port_B,  3, AI_Or_DI_Or_Do, 3),  --  pin 13
      (Addr_Port_B,  2, AI_Or_DI_Or_Do, 2),  --  pin 14
      (Addr_Port_B,  1, AI_Or_DI_Or_DO, 1),  --  pin 15
      (Addr_Port_B,  0, AI_Or_DI_Or_DO, 0),  --  pin 16
      (Addr_Port_B,  6, AI_Or_DI_Or_DO, 6),  --  pin 17
      (Addr_Port_B,  7, AI_Or_DI_Or_DO, 7),  --  pin 18
      (Addr_Null,  0, Pin_Unused, 0),                                         --  pin 19
      (Addr_Null,  0, Pin_Unused, 0),                                         --  pin 20
      (Addr_Port_B,  8, AI_Or_DI_Or_DO, 8),  --  pin 21
      (Addr_Port_B,  9, AI_Or_DI_Or_DO, 9),  --  pin 22
      (Addr_Port_B, 10, AI_Or_DI_Or_DO, 10), --  pin 23
      (Addr_Port_B, 11, AI_Or_DI_Or_DO, 11), --  pin 24
      (Addr_Null,  0, Pin_Unused, 0),                                         --  pin 25
      (Addr_Null,  0, Pin_Unused, 0),                                         --  pin 26
      (Addr_Port_B, 12, AI_Or_DI_Or_DO, 12), --  pin 27
      (Addr_Port_B, 13, AI_Or_DI_Or_DO, 13), --  pin 28
      (Addr_Port_B, 14, AI_Or_DI_Or_DO, 14), --  pin 29
      (Addr_Port_B, 15, AI_Or_DI_Or_DO, 15), --  pin 30
      (Addr_Port_F,  4, DI_Or_DO, 0),        --  pin 31
      (Addr_Port_F,  5, DI_Or_DO, 0),        --  pin 32
      (Addr_Port_F,  3, Pin_Digital_In, 0),  --  pin 33
      (Addr_Null,  0, Pin_Unused, 0),                                         --  pin 34 - VBUS
      (Addr_Null,  0, Pin_Unused, 0),                                         --  pin 35 - USSB3V3
      (Addr_Null,  0, Pin_Unused, 0),                                         --  pin 36 - USB D-
      (Addr_Null,  0, Pin_Unused, 0),                                         --  pin 37 - USB D+
      (Addr_Null,  0, Pin_Unused, 0),                                         --  pin 38 - Vdd
      (Addr_Null,  0, Pin_Unused, 0),                                         --  pin 39 - Crystal
      (Addr_Null,  0, Pin_Unused, 0),                                         --  pin 40 - Crystal
      (Addr_Null,  0, Pin_Unused, 0),                                         --  pin 41 - Vss
      (Addr_Port_D,  8, DI_Or_DO, 0),                 --  pin 42
      (Addr_Port_D,  9, DI_Or_DO, 0),                 --  pin 43
      (Addr_Port_D, 10, DI_Or_DO, 0),                 --  pin 44
      (Addr_Port_D, 11, DI_Or_DO, 0),                 --  pin 45
      (Addr_Port_D,  0, DI_Or_DO, 0),                 --  pin 46
      (Addr_Port_C, 13, DI_Or_DO, 0),                 --  pin 47
      (Addr_Port_C, 14, DI_Or_DO, 0),                 --  pin 48
      (Addr_Port_D,  1, U_Val (Pin_Analog_In) or U_Val (Pin_Digital_In) or U_Val (Pin_Digital_Out), 24), --  pin 49
      (Addr_Port_D,  2, U_Val (Pin_Analog_In) or U_Val (Pin_Digital_In) or U_Val (Pin_Digital_Out), 25), --  pin 50
      (Addr_Port_D,  3, U_Val (Pin_Analog_In) or U_Val (Pin_Digital_In) or U_Val (Pin_Digital_Out), 26), --  pin 51
      (Addr_Port_D,  4, U_Val (Pin_Digital_In) or U_Val (Pin_Digital_Out)),                 --  pin 52
      (Addr_Port_D,  5, U_Val (Pin_Digital_In) or U_Val (Pin_Digital_Out)),                 --  pin 53
      (Addr_Port_D,  6, U_Val (Pin_Digital_In) or U_Val (Pin_Digital_Out)),                 --  pin 54
      (Addr_Port_D,  7, U_Val (Pin_Digital_In) or U_Val (Pin_Digital_Out)),                 --  pin 55
      (Addr_Null,  0, Pin_Unused, 0),                                         --  pin 56
      (Addr_Null,  0, Pin_Unused, 0),                                         --  pin 57
      (Addr_Port_F,  0, U_Val (Pin_Digital_In) or U_Val (Pin_Digital_Out)),                 --  pin 58 - Console TX
      (Addr_Port_F,  1, U_Val (Pin_Digital_In) or U_Val (Pin_Digital_Out)),                 --  pin 59
      (Addr_Port_E,  0, U_Val (Pin_Digital_In) or U_Val (Pin_Digital_Out)),                 --  pin 60
      (Addr_Port_E,  1, U_Val (Pin_Digital_In) or U_Val (Pin_Digital_Out)),                 --  pin 61
      (Addr_Port_E,  2, U_Val (Pin_Analog_In) or U_Val (Pin_Digital_In) or U_Val (Pin_Digital_Out), 20), --  pin 62
      (Addr_Port_E,  3, U_Val (Pin_Digital_In) or U_Val (Pin_Digital_Out)),                 --  pin 63
      (Addr_Port_E,  4, U_Val (Pin_Analog_In) or U_Val (Pin_Digital_In) or U_Val (Pin_Digital_Out), 21), --  pin 64
     );

end IO_Ports_Tables;
