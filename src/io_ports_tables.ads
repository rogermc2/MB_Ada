
with Interfaces;  use Interfaces;

package IO_Ports_Tables is

   type Port_Addresses is (Addr_Port_A, Addr_Port_B, Addr_Port_C,
                           Addr_Port_E, Addr_Port_F, Addr_Port_G);
   type Pin_Modes is (Pin_Unused, Pin_Analog_in, Pin_Digital_In,
                      Pin_Counting, Pin_Digital_Out,  Pin_Do_Not_Reset);

   type Pin_Definitions is record
      Port       : Port_Addresses;
      Bit_Number : Natural := 0;
      Mode       : Pin_Modes := Pin_Unused;
      Analog_Channel :  Natural := 0;
   end record;

   Pin_Def_Table : array (1 .. 64) of Pin_Definitions :=
--      ((NULL,  0, UNUSED, 0),                                         --  pin 0
    ((Addr_Port_E,  5, Pin_Analog_in or Pin_Digital_In or Pin_Digital_Out, 22), --  pin 1
    (Addr_Port_E,  6, Pin_Analog_in or Pin_Digital_In or Pin_Digital_Out, 23), --  pin 2
    (Addr_Port_E,  7, Pin_Analog_in or Pin_Digital_In or Pin_Digital_Out, 27), --  pin 3
    (Addr_Port_G,  6, Pin_Analog_in or Pin_Digital_In or Pin_Digital_Out, 16), --  pin 4
    (Addr_Port_G,  7, Pin_Analog_in or Pin_Digital_In or Pin_Digital_Out, 17), --  pin 5
    (Addr_Port_G,  8, Pin_Analog_in or Pin_Digital_In or Pin_Digital_Out, 18), --  pin 6 - Console RX
    (NULL,  0, UNUSED),                                         --  pin 7
    (Addr_Port_G,  9, Pin_Analog_in or Pin_Digital_In or Pin_Digital_Out, 19), --  pin 8
    (NULL,  0, UNUSED),                                         --  pin 9
    (NULL,  0, UNUSED),                                         --  pin 10
    (Addr_Port_B,  5, Pin_Analog_in or Pin_Digital_In or Pin_Digital_Out, 5),  --  pin 11
    (Addr_Port_B,  4, Pin_Analog_in or Pin_Digital_In or Pin_Digital_Out, 4),  --  pin 12
    (Addr_Port_B,  3, Pin_Analog_in or Pin_Digital_In or Pin_Digital_Out, 3),  --  pin 13
    (Addr_Port_B,  2, Pin_Analog_in or Pin_Digital_In or Pin_Digital_Out, 2),  --  pin 14
    (Addr_Port_B,  1, Pin_Analog_in or Pin_Digital_In or Pin_Digital_Out, 1),  --  pin 15
    (Addr_Port_B,  0, Pin_Analog_in or Pin_Digital_In or Pin_Digital_Out, 0),  --  pin 16
    (Addr_Port_B,  6, Pin_Analog_in or Pin_Digital_In or Pin_Digital_Out, 6),  --  pin 17
    (Addr_Port_B,  7, Pin_Analog_in or Pin_Digital_In or Pin_Digital_Out, 7),  --  pin 18
    (NULL,  0, UNUSED),                                         --  pin 19
    (NULL,  0, UNUSED),                                         --  pin 20
    (Addr_Port_B,  8, Pin_Analog_in or Pin_Digital_In or Pin_Digital_Out, 8),  --  pin 21
    (Addr_Port_B,  9, Pin_Analog_in or Pin_Digital_In or Pin_Digital_Out, 9),  --  pin 22
    (Addr_Port_B, 10, Pin_Analog_in or Pin_Digital_In or Pin_Digital_Out, 10), --  pin 23
    (Addr_Port_B, 11, Pin_Analog_in or Pin_Digital_In or Pin_Digital_Out, 11), --  pin 24
    (NULL,  0, UNUSED),                                         --  pin 25
    (NULL,  0, UNUSED),                                         --  pin 26
    (Addr_Port_B, 12, Pin_Analog_in or Pin_Digital_In or Pin_Digital_Out, 12), --  pin 27
    (Addr_Port_B, 13, Pin_Analog_in or Pin_Digital_In or Pin_Digital_Out, 13), --  pin 28
    (Addr_Port_B, 14, Pin_Analog_in or Pin_Digital_In or Pin_Digital_Out, 14), --  pin 29
    (Addr_Port_B, 15, Pin_Analog_in or Pin_Digital_In or Pin_Digital_Out, 15), --  pin 30
    (Addr_Port_F,  4, Pin_Digital_In or Pin_Digital_Out),                 --  pin 31
    (Addr_Port_F,  5, Pin_Digital_In or Pin_Digital_Out),                 --  pin 32
    (Addr_Port_F,  3, Pin_Digital_In),                               --  pin 33
    (NULL,  0, UNUSED),                                         --  pin 34 - VBUS
    (NULL,  0, UNUSED),                                         --  pin 35 - USSB3V3
    (NULL,  0, UNUSED),                                         --  pin 36 - USB D-
    (NULL,  0, UNUSED),                                         --  pin 37 - USB D+
    (NULL,  0, UNUSED),                                         --  pin 38 - Vdd
    (NULL,  0, UNUSED),                                         --  pin 39 - Crystal
    (NULL,  0, UNUSED),                                         --  pin 40 - Crystal
    (NULL,  0, UNUSED),                                         --  pin 41 - Vss
    (Addr_Port_D,  8, Pin_Digital_In or Pin_Digital_Out),                 --  pin 42
    (Addr_Port_D,  9, Pin_Digital_In or Pin_Digital_Out),                 --  pin 43
    (Addr_Port_D, 10, Pin_Digital_In or Pin_Digital_Out),                 --  pin 44
    (Addr_Port_D, 11, Pin_Digital_In or Pin_Digital_Out),                 --  pin 45
    (Addr_Port_D,  0, Pin_Digital_In or Pin_Digital_Out),                 --  pin 46
    (Addr_Port_C, 13, Pin_Digital_In or Pin_Digital_Out),                 --  pin 47
    (Addr_Port_C, 14, Pin_Digital_In or Pin_Digital_Out),                 --  pin 48
    (Addr_Port_D,  1, Pin_Analog_in or Pin_Digital_In or Pin_Digital_Out, 24), --  pin 49
    (Addr_Port_D,  2, Pin_Analog_in or Pin_Digital_In or Pin_Digital_Out, 25), --  pin 50
    (Addr_Port_D,  3, Pin_Analog_in or Pin_Digital_In or Pin_Digital_Out, 26), --  pin 51
    (Addr_Port_D,  4, Pin_Digital_In or Pin_Digital_Out),                 --  pin 52
    (Addr_Port_D,  5, Pin_Digital_In or Pin_Digital_Out),                 --  pin 53
    (Addr_Port_D,  6, Pin_Digital_In or Pin_Digital_Out),                 --  pin 54
    (Addr_Port_D,  7, Pin_Digital_In or Pin_Digital_Out),                 --  pin 55
    (NULL,  0, UNUSED),                                         --  pin 56
    (NULL,  0, UNUSED),                                         --  pin 57
    (Addr_Port_F,  0, Pin_Digital_In or Pin_Digital_Out),                 --  pin 58 - Console TX
    (Addr_Port_F,  1, Pin_Digital_In or Pin_Digital_Out),                 --  pin 59
    (Addr_Port_E,  0, Pin_Digital_In or Pin_Digital_Out),                 --  pin 60
    (Addr_Port_E,  1, Pin_Digital_In or Pin_Digital_Out),                 --  pin 61
    (Addr_Port_E,  2, Pin_Analog_in or Pin_Digital_In or Pin_Digital_Out, 20), --  pin 62
    (Addr_Port_E,  3, Pin_Digital_In or Pin_Digital_Out),                 --  pin 63
    (Addr_Port_E,  4, Pin_Analog_in or Pin_Digital_In or Pin_Digital_Out, 21), --  pin 64
);

end IO_Ports_Tables;
