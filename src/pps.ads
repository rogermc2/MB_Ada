
with P32mx470f512h; use P32mx470f512h;

package PPS is
   --  Output Pin Group 1
   PPS_OUTPUT_BASE_ADDRESS : Natural := 0;   --  RPA0R
   OUT_PIN_PPS1_RPA0       : Natural := 0;   --  RPA0Rbits.RPA0R
   OUT_PIN_PPS1_RPB3       : Natural := 0;  --  RPB3Rbits.RPB3R
   OUT_PIN_PPS1_RPB4       : Natural := 0;  --  RPB4Rbits.RPB4R
   OUT_PIN_PPS1_RPB15      : Natural := 0;  --  RPB15Rbits.RPB15R
   OUT_PIN_PPS1_RPB7       : Natural := 0;  --  RPB7Rbits.RPB7R
   OUT_PIN_PPS1_RPC7       : Natural := 0;  --  RPC7Rbits.RPC7R
   OUT_PIN_PPS1_RPC0       : Natural := 0;  --  RPC0Rbits.RPC0R
   OUT_PIN_PPS1_RPC5       : Natural := 0;  --  RPC5Rbits.RPC5R

--     OUT_FN_PPS1_NULL        : Natural := 0;  --  No Connect
   OUT_FN_PPS1_U1TX        : Natural := 1;  --  RPn tied to U1TX
   OUT_FN_PPS1_U2RTS       : Natural := 2;  --  RPn tied to U2RTS_BAR
   OUT_FN_PPS1_SS1         : Natural := 3;  --  RPn tied to SS1
   --                                                4  -   RESERVED
   OUT_FN_PPS1_OC1         : Natural := 5;  --  RPn tied to OC1
   --                                                6  -   RESERVED
--     OUT_FN_PPS1_C2OUT       : Natural := 7;  --  RPn tied to C2OUT

   --  Section:  Remappable Peripheral Inputs :                                         : Natural :=
   --  #elif (__PIC32_FEATURE_SET__ == 330) || (__PIC32_FEATURE_SET__ == 350) || (__PIC32_FEATURE_SET__ == 370) || (__PIC32_FEATURE_SET__ == 430) || (__PIC32_FEATURE_SET__ == 450) || (__PIC32_FEATURE_SET__ == 470)
   --  Input Pins Group 1
   IN_FN_PPS1_INT3         : Natural := Natural (INT3Rbits.INT3R);
   IN_FN_PPS1_T2CK         : Natural := Natural (T2CKRbits.T2CKR);
   IN_FN_PPS1_IC3          : Natural := Natural (IC3Rbits.IC3R);
   IN_FN_PPS1_U1RX         : Natural := Natural (U1RXRbits.U1RXR);
   IN_FN_PPS1_U2RX         : Natural := Natural (U2RXRbits.U2RXR);
   IN_FN_PPS1_U5CTS        : Natural := Natural (U5CTSRbits.U5CTSR);
   IN_FN_PPS1_REFCLKI      : Natural := Natural (REFCLKIRbits.REFCLKIR);

   IN_PIN_PPS1_RPD2  : Natural := 0;   --  Assign RPD2  as Input Pin
   IN_PIN_PPS1_RPG8  : Natural := 1;   --  Assign RPG8  as Input Pin
   IN_PIN_PPS1_RPF4  : Natural := 2;   --  Assign RPF4  as Input Pin
   IN_PIN_PPS1_RPD10 : Natural := 3;   --  Assign RPD10 as Input Pin
   IN_PIN_PPS1_RPF1  : Natural := 4;   --  Assign RPF1  as Input Pin
   IN_PIN_PPS1_RPB9  : Natural := 5;   --  Assign RPB9  as Input Pin
   IN_PIN_PPS1_RPB10 : Natural := 6;   --  Assign RPB10 as Input Pin
   IN_PIN_PPS1_RPC14 : Natural := 7;   --  Assign RPC14 as Input Pin
   IN_PIN_PPS1_RPB5  : Natural := 8;   --  Assign RPB5  as Input Pin
   IN_PIN_PPS1_RPC1  : Natural := 10;  --  Assign RPC1  as Input Pin
   IN_PIN_PPS1_RPD14 : Natural := 11;  --  Assign RPD14 as Input Pin
   IN_PIN_PPS1_RPG1  : Natural := 12;  --  Assign RPG1  as Input Pin
   IN_PIN_PPS1_RPA14 : Natural := 13;  --  Assign RPA14 as Input Pin
   IN_PIN_PPS1_RPF2  : Natural := 15;   --  Assign RPF2  as Input Pin

   --  Input Pins Group 2
   IN_FN_PPS2_INT4   : Natural := Natural (INT4Rbits.INT4R);
   IN_FN_PPS2_T5CK   : Natural := Natural (T5CKRbits.T5CKR);
   IN_FN_PPS2_IC4    : Natural := Natural (IC4Rbits.IC4R);
   IN_FN_PPS2_U3RX   : Natural := Natural (U3RXRbits.U3RXR);
   IN_FN_PPS2_U4CTS  : Natural := Natural (U4CTSRbits.U4CTSR);
   IN_FN_PPS2_SDI1   : Natural := Natural (SDI1Rbits.SDI1R);
   IN_FN_PPS2_SDI2   : Natural := Natural (SDI2Rbits.SDI2R);

   IN_PIN_PPS2_RPD3  : Natural := 0;   --  Assign RPD3  as Input Pin
   IN_PIN_PPS2_RPG7  : Natural := 1;   --  Assign RPG7  as Input Pin
   IN_PIN_PPS2_RPF5  : Natural := 2;   --  Assign RPF5  as Input Pin
   IN_PIN_PPS2_RPD11 : Natural := 3;   --  Assign RPD11 as Input Pin
   IN_PIN_PPS2_RPF0  : Natural := 4;   --  Assign RPF0  as Input Pin
   IN_PIN_PPS2_RPB1  : Natural := 5;   --  Assign RPB1  as Input Pin
   IN_PIN_PPS2_RPE5  : Natural := 6;   --  Assign RPE5  as Input Pin
   IN_PIN_PPS2_RPC13 : Natural := 7;   --  Assign RPC13 as Input Pin
   IN_PIN_PPS2_RPB3  : Natural := 8;   --  Assign RPB3  as Input Pin
   IN_PIN_PPS2_RPC4  : Natural := 10;  --  Assign RPC4  as Input Pin
   IN_PIN_PPS2_RPD15 : Natural := 11;  --  Assign RPD15 as Input Pin
   IN_PIN_PPS2_RPG0  : Natural := 12;  --  Assign RPG0  as Input Pin
   IN_PIN_PPS2_RPA15 : Natural := 13;  --  Assign RPA15 as Input Pin
   IN_PIN_PPS2_RPF2  : Natural := 14;  --  Assign RPF2  as Input Pin
   IN_PIN_PPS2_RPF7  : Natural := 15;  --  Assign RPF7  as Input Pin

   --  Input Pins Group 3
   IN_FN_PPS3_INT2   : Natural := Natural (INT2Rbits.INT2R);
   IN_FN_PPS3_T4CK   : Natural := Natural (T4CKRbits.T4CKR);
   IN_FN_PPS3_IC2    : Natural := Natural (IC2Rbits.IC2R);
   IN_FN_PPS3_IC5    : Natural := Natural (IC5Rbits.IC5R);
   IN_FN_PPS3_U1CTS  : Natural := Natural (U1CTSRbits.U1CTSR);
   IN_FN_PPS3_U2CTS  : Natural := Natural (U2CTSRbits.U2CTSR);
   IN_FN_PPS3_SS1    : Natural := Natural (SS1Rbits.SS1R);

   IN_PIN_PPS3_RPD9  : Natural := 0;   --  Assign RPD9  as Input Pin
   IN_PIN_PPS3_RPG6  : Natural := 1;   --  Assign RPG6  as Input Pin
   IN_PIN_PPS3_RPB8  : Natural := 2;   --  Assign RPB8  as Input Pin
   IN_PIN_PPS3_RPB15 : Natural := 3;   --  Assign RPB15 as Input Pin
   IN_PIN_PPS3_RPD4  : Natural := 4;   --  Assign RPD4  as Input Pin
   IN_PIN_PPS3_RPB0  : Natural := 5;   --  Assign RPB0  as Input Pin
   IN_PIN_PPS3_RPE3  : Natural := 6;   --  Assign RPE3  as Input Pin
   IN_PIN_PPS3_RPB7  : Natural := 7;   --  Assign RPB7  as Input Pin
   IN_PIN_PPS3_RPF12 : Natural := 9;   --  Assign RPF12 as Input Pin
   IN_PIN_PPS3_RPD12 : Natural := 10;  --  Assign RPD12 as Input Pin
   IN_PIN_PPS3_RPF8  : Natural := 11;  --  Assign RPF8  as Input Pin
   IN_PIN_PPS3_RPC3  : Natural := 12; --  Assign RPC3  as Input Pin
   IN_PIN_PPS3_RPE9  : Natural := 13; --  Assign RPE9  as Input Pin
   IN_PIN_PPS3_RPB2  : Natural := 15; --  Assign RPB2  as Input Pin

   --  Input Pins Group 4
   IN_FN_PPS4_INT1   : Natural := Natural (INT1Rbits.INT1R);
   IN_FN_PPS4_T3CK   : Natural := Natural (T3CKRbits.T3CKR);
   IN_FN_PPS4_IC1    : Natural := Natural (IC1Rbits.IC1R);
   IN_FN_PPS4_U3CTS  : Natural := Natural (U3CTSRbits.U3CTSR);
   IN_FN_PPS4_U4RX   : Natural := Natural (U4RXRbits.U4RXR);
   IN_FN_PPS4_U5RX   : Natural := Natural (U5RXRbits.U5RXR);
   IN_FN_PPS4_SS2    : Natural := Natural (SS2Rbits.SS2R);
   IN_FN_PPS4_OCFA   : Natural := Natural (OCFARbits.OCFAR);

   IN_PIN_PPS4_RPD1  : Natural := 0;   --  Assign RPD1  as Input Pin
   IN_PIN_PPS4_RPG9  : Natural := 1;   --  Assign RPG9  as Input Pin
   IN_PIN_PPS4_RPB14 : Natural := 2;   --  Assign RPB14 as Input Pin
   IN_PIN_PPS4_RPD0  : Natural := 3;   --  Assign RPD0  as Input Pin
   IN_PIN_PPS4_RPD8  : Natural := 4;   --  Assign RPD8  as Input Pin
   IN_PIN_PPS4_RPB6  : Natural := 5;   --  Assign RPB6  as Input Pin
   IN_PIN_PPS4_RPD5  : Natural := 6;   --  Assign RPD5  as Input Pin
   IN_PIN_PPS4_RPB2  : Natural := 7;   --  Assign RPB2  as Input Pin
   IN_PIN_PPS4_RPF3  : Natural := 8;   --  Assign RPF3  as Input Pin
   IN_PIN_PPS4_RPF13 : Natural := 9;   --  Assign RPF13 as Input Pin
   IN_PIN_PPS4_RPF2  : Natural := 11;  --  Assign RPF2  as Input Pin
   IN_PIN_PPS4_RPC2  : Natural := 12;  --  Assign RPC2  as Input Pin
   IN_PIN_PPS4_RPE8  : Natural := 13;  --  Assign RPE8  as Input Pin

   --  Section:  Remappable Peripheral Outputs:                                         : Natural :=
   --  Output Pin Group 1
   OUT_PIN_PPS1_RPD2 : Natural := Natural (RPD2Rbits.RPD2R);
   OUT_PIN_PPS1_RPG8 : Natural := Natural (RPG8Rbits.RPG8R);
   OUT_PIN_PPS1_RPF4 : Natural := Natural (RPF4Rbits.RPF4R);
   OUT_PIN_PPS1_RPD10 : Natural := Natural (RPD10Rbits.RPD10R);
   OUT_PIN_PPS1_RPF1 : Natural := Natural (RPF1Rbits.RPF1R);
   OUT_PIN_PPS1_RPB9 : Natural := Natural (RPB9Rbits.RPB9R);
   OUT_PIN_PPS1_RPB10 : Natural := Natural (RPB10Rbits.RPB10R);
   OUT_PIN_PPS1_RPC14 : Natural := Natural (RPC14Rbits.RPC14R);
   OUT_PIN_PPS1_RPB5 : Natural := Natural (RPB5Rbits.RPB5R);
   OUT_PIN_PPS1_RPC1 : Natural := Natural (RPC1Rbits.RPC1R);
   OUT_PIN_PPS1_RPD14 : Natural := Natural (RPD14Rbits.RPD14R);
   OUT_PIN_PPS1_RPG1 : Natural := Natural (RPG1Rbits.RPG1R);
   OUT_PIN_PPS1_RPA14 : Natural := Natural (RPA14Rbits.RPA14R);

   OUT_FN_PPS1_NULL  : Natural := 0;  --  No Connect
   OUT_FN_PPS1_U3TX  : Natural := 1;  --  RPn tied to U3TX
   OUT_FN_PPS1_U4RTS : Natural := 2;  --  RPn tied to U4RTS_BAR
   --                                      3  - RESERVED
   --                                      4  - RESERVED
   --                                            5  - RESERVED
   OUT_FN_PPS1_SDO2  : Natural := 6;  --  RPn tied to SDO2
   --                                            7  - RESERVED
   --                                            8  - RESERVED
   --                                            9  - RESERVED
   --                                            10 - RESERVED
   OUT_FN_PPS1_OC3   : Natural := 11;  --  RPn tied to OC3
   --                                            12 - RESERVED
   OUT_FN_PPS1_C2OUT : Natural := 13; --  RPn tied to C2OUT
   --                                            14 - RESERVED
   --                                            15 - RESERVED

   --  Output Pin Group 2
   OUT_PIN_PPS2_RPD3  : Natural := Natural (RPD3Rbits.RPD3R);
   OUT_PIN_PPS2_RPG7  : Natural := Natural (RPG7Rbits.RPG7R);
   OUT_PIN_PPS2_RPF5  : Natural := Natural (RPF5Rbits.RPF5R);
   OUT_PIN_PPS2_RPD11 : Natural := Natural (RPD11Rbits.RPD11R);
   OUT_PIN_PPS2_RPF0  : Natural := Natural (RPF0Rbits.RPF0R);
   OUT_PIN_PPS2_RPB1  : Natural := Natural (RPB1Rbits.RPB1R);
   OUT_PIN_PPS2_RPE5  : Natural := Natural (RPE5Rbits.RPE5R);
   OUT_PIN_PPS2_RPC13 : Natural := Natural (RPC13Rbits.RPC13R);
   OUT_PIN_PPS2_RPB3  : Natural := Natural (RPB3Rbits.RPB3R);
   OUT_PIN_PPS2_RPF3  : Natural := Natural (RPF3Rbits.RPF3R);
   --  RPC4Rbits is not defined for P32mx470f512h
   --  OUT_PIN_PPS2_RPC4  : Natural := Natural (RPC4Rbits.RPC4R);
   OUT_PIN_PPS2_RPD15 : Natural := Natural (RPD15Rbits.RPD15R);
   OUT_PIN_PPS2_RPG0  : Natural := Natural (RPG0Rbits.RPG0R);
   OUT_PIN_PPS2_RPA15 : Natural := Natural (RPA15Rbits.RPA15R);

   OUT_FN_PPS2_NULL  : Natural := 0;  --  No Connect
   OUT_FN_PPS2_U2TX  : Natural := 1;  --  RPn tied to U2TX
   --                                            2  - RESERVED
   OUT_FN_PPS2_U1TX  : Natural := 3;  --  RPn tied to U1TX
   OUT_FN_PPS2_U5RTS : Natural := 4;  --  RPn tied to U5RTS
   --                                            5  - RESERVED
   OUT_FN_PPS2_SDO2  : Natural := 6;  --  RPn tied to SDO2
   --                                            7  - RESERVED
   OUT_FN_PPS2_SDO1  : Natural := 8;  --  RPn tied to SDO1
   --                                            9  - RESERVED
   --                                            10 - RESERVED
   OUT_FN_PPS2_OC4   : Natural := 11;  --  RPn tied to OC4
   --                                            12 - RESERVED
   --                                            13 - RESERVED
   --                                            14 - RESERVED
   --                                            15 - RESERVED

   --  Output Pin Group 3
   OUT_PIN_PPS3_RPD9  : Natural := Natural (RPD9Rbits.RPD9R);
   OUT_PIN_PPS3_RPG6  : Natural := Natural (RPG6Rbits.RPG6R);
   OUT_PIN_PPS3_RPB8  : Natural := Natural (RPB8Rbits.RPB8R);
   OUT_PIN_PPS3_RPB15 : Natural := Natural (RPB15Rbits.RPB15R);
   OUT_PIN_PPS3_RPD4  : Natural := Natural (RPD4Rbits.RPD4R);
   OUT_PIN_PPS3_RPB0  : Natural := Natural (RPB0Rbits.RPB0R);
   OUT_PIN_PPS3_RPE3  : Natural := Natural (RPE3Rbits.RPE3R);
   OUT_PIN_PPS3_RPB7  : Natural := Natural (RPB7Rbits.RPB7R);
   OUT_PIN_PPS3_RPB2  : Natural := Natural (RPB2Rbits.RPB2R);
   OUT_PIN_PPS3_RPF12 : Natural := Natural (RPF12Rbits.RPF12R);
   OUT_PIN_PPS3_RPD12 : Natural := Natural (RPD12Rbits.RPD12R);
   OUT_PIN_PPS3_RPF8  : Natural := Natural (RPF8Rbits.RPF8R);
   OUT_PIN_PPS3_RPE9  : Natural := Natural (RPE9Rbits.RPE9R);

   OUT_FN_PPS3_NULL    : Natural := 0;  --  No Connect
   OUT_FN_PPS3_U3RTS   : Natural := 1;  --  RPn tied to U3RTS
   OUT_FN_PPS3_U4TX    : Natural := 2;  --  RPn tied to U4TX
   OUT_FN_PPS3_REFCLKO : Natural := 3;  --  RPn tied to REFCLKO
   OUT_FN_PPS3_U5TX    : Natural := 4;  --  RPn tied to U5TX
   --                                            5  - RESERVED
   --                                            6  - RESERVED
   OUT_FN_PPS3_SS1     : Natural := 7;  --  RPn tied to SS1
   OUT_FN_PPS3_SDO1    : Natural := 8;  --  RPn tied to SDO1
   --                                            9  - RESERVED
   --                                            10 - RESERVED
   OUT_FN_PPS3_OC5     : Natural := 11; --  RPn tied to OC5
   --                                            12 - RESERVED
   OUT_FN_PPS3_C1OUT   : Natural := 13; --  RPn tied to C1OUT
   --                                            14 - RESERVED
   --                                            15 - RESERVED

   --  Output Pin Group 4
   OUT_PIN_PPS4_RPD1   : Natural := Natural (RPD1Rbits.RPD1R);
   OUT_PIN_PPS4_RPG9   : Natural := Natural (RPG9Rbits.RPG9R);
   OUT_PIN_PPS4_RPB14  : Natural := Natural (RPB14Rbits.RPB14R);
   OUT_PIN_PPS4_RPD0   : Natural := Natural (RPD0Rbits.RPD0R);
   OUT_PIN_PPS4_RPD8   : Natural := Natural (RPD8Rbits.RPD8R);
   OUT_PIN_PPS4_RP6    : Natural := Natural (RPB6Rbits.RPB6R);
   OUT_PIN_PPS4_RPD5   : Natural := Natural (RPD5Rbits.RPD5R);
   OUT_PIN_PPS4_RPF3   : Natural := Natural (RPF3Rbits.RPF3R);
   OUT_PIN_PPS4_RPF6   : Natural := Natural (RPF6Rbits.RPF6R);
   OUT_PIN_PPS4_RPF13  : Natural := Natural (RPF13Rbits.RPF13R);
   OUT_PIN_PPS4_RPF2   : Natural := Natural (RPF2Rbits.RPF2R);
   OUT_PIN_PPS4_RPE8   : Natural := Natural (RPE8Rbits.RPE8R);

   OUT_FN_PPS4_NULL  : Natural := 0;  --  No Connect
   OUT_FN_PPS4_U2RTS : Natural := 1;  --  RPn tied to U2RTS
   --                                            2  - RESERVED
   OUT_FN_PPS4_U1RTS : Natural := 3;  --  RPn tied to U1RTS
   OUT_FN_PPS4_U5TX  : Natural := 4;  --  RPn tied to U5TX
   --                                            5  - RESERVED
   OUT_FN_PPS4_SS2   : Natural := 6;  --  RPn tied to SS2_BAR
   --                                            7  - RESERVED
   OUT_FN_PPS4_SDO1  : Natural := 8;  --  RPn tied to SDO1
   --                                            9  - RESERVED
   --                                            10  -RESERVED
   OUT_FN_PPS4_OC2   : Natural := 11; --  RPn tied to OC2
   OUT_FN_PPS4_OC1   : Natural := 12; --  RPn tied to OC1
   --                                            13 - RESERVED
   --                                            14 - RESERVED
   --                                            15 - RESERVED

   --  Macro: : Natural :=  PPSUnLock
   --   PPSUnLock : Natural :=  : Natural := CFGCONbits.IOLOCK = 0;

   --    Macro: : Natural :=  PPSLock
   --    PPSLock : Natural :=  : Natural :=  CFGCONbits.IOLOCK = 1;

end PPS;
