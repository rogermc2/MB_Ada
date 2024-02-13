
package PPS is

--  ---------------------------------------------------------------------------*/
--  Section:  Remappable Peripheral Inputs :                                         : constant Natural := */
--  ---------------------------------------------------------------------------*/
--  #if   (((__PIC32_FEATURE_SET__ >= 100) && (__PIC32_FEATURE_SET__ <= 299)) || defined(__32MXGENERIC__))
--  Input Pins Group 1 */
IN_FN_PPS1_INT4 : constant Natural := INT4Rbits.INT4R;
IN_FN_PPS1_T2CK : constant Natural := T2CKRbits.T2CKR;
IN_FN_PPS1_IC4 : constant Natural := IC4Rbits.IC4R;
IN_FN_PPS1_SS1 : constant Natural := SS1Rbits.SS1R;
IN_FN_PPS1_REFCLKIN : constant Natural := REFCLKIRbits.REFCLKIR;

IN_PIN_PPS1_RPA0 : constant Natural := 0;   --  Assign RPA0  as Input Pin */
IN_PIN_PPS1_RPB3 : constant Natural := 1;   --  Assign RPB3  as Input Pin */
IN_PIN_PPS1_RPB4 : constant Natural := 2;   --  Assign RPB4  as Input Pin */
IN_PIN_PPS1_RPB15 : constant Natural := 3;   --  Assign RPB15 as Input Pin */
IN_PIN_PPS1_RPB7 : constant Natural := 4;   --  Assign RPB7  as Input Pin */
IN_PIN_PPS1_RPC7 : constant Natural := 5;   --  Assign RPC4  as Input Pin */
IN_PIN_PPS1_RPC0 : constant Natural := 6;   --  Assign RPC0  as Input Pin */
IN_PIN_PPS1_RPC5 : constant Natural := 7;   --  Assign RPC5  as Input Pin */

--  Input Pins Group 2 */
IN_FN_PPS2_INT3 : constant Natural := INT3Rbits.INT3R;
IN_FN_PPS2_T3CK : constant Natural := T3CKRbits.T3CKR;
IN_FN_PPS2_IC3 : constant Natural := IC3Rbits.IC3R;
IN_FN_PPS2_U1CTS : constant Natural := U1CTSRbits.U1CTSR;
IN_FN_PPS2_U2RX : constant Natural := U2RXRbits.U2RXR;
IN_FN_PPS2_SDI1 : constant Natural := SDI1Rbits.SDI1R;

IN_PIN_PPS2_RPA1 : constant Natural := 0;   --  Assign RPA1  as Input Pin */
IN_PIN_PPS2_RPB5 : constant Natural := 1;   --  Assign RPB5  as Input Pin */
IN_PIN_PPS2_RPB1 : constant Natural := 2;   --  Assign RPB1  as Input Pin */
IN_PIN_PPS2_RPB11 : constant Natural := 3;   --  Assign RPB11 as Input Pin */
IN_PIN_PPS2_RPB8 : constant Natural := 4;   --  Assign RPB8  as Input Pin */
IN_PIN_PPS2_RPA8 : constant Natural := 5;   --  Assign RPA8  as Input Pin */
IN_PIN_PPS2_RPC8 : constant Natural := 6;   --  Assign RPC8  as Input Pin */
IN_PIN_PPS2_RPA9 : constant Natural := 7;   --  Assign RPA9  as Input Pin */

--  Input Pins Group 3 */
IN_FN_PPS3_INT2 : constant Natural := INT2Rbits.INT2R;
IN_FN_PPS3_T4CK : constant Natural := T4CKRbits.T4CKR;
IN_FN_PPS3_IC1 : constant Natural := IC1Rbits.IC1R;
IN_FN_PPS3_IC5 : constant Natural := IC5Rbits.IC5R;
IN_FN_PPS3_U1RX : constant Natural := U1RXRbits.U1RXR;
IN_FN_PPS3_U2CTS : constant Natural := U2CTSRbits.U2CTSR;
IN_FN_PPS3_SDI2 : constant Natural := SDI2Rbits.SDI2R;
IN_FN_PPS3_OCFB : constant Natural := OCFBRbits.OCFBR;

IN_PIN_PPS3_RPA2 : constant Natural := 0;   --  Assign RPA2  as Input Pin */
IN_PIN_PPS3_RPB6 : constant Natural := 1;   --  Assign RPB6  as Input Pin */
IN_PIN_PPS3_RPA4 : constant Natural := 2;   --  Assign RPA4  as Input Pin */
IN_PIN_PPS3_RPB13 : constant Natural := 3;   --  Assign RPB13 as Input Pin */
IN_PIN_PPS3_RPB2 : constant Natural := 4;   --  Assign RPB2  as Input Pin */
IN_PIN_PPS3_RPC6 : constant Natural := 5;   --  Assign RPC6  as Input Pin */
IN_PIN_PPS3_RPC1 : constant Natural := 6;   --  Assign RPC1  as Input Pin */
IN_PIN_PPS3_RPC3 : constant Natural := 7;   --  Assign RPC3  as Input Pin */

--  Input Pins Group 4 */

PPS_INPUT_BASE_ADDRESS : constant Natural := INT1R; -- Happens to be the first one
IN_FN_PPS4_INT1 : constant Natural := INT1Rbits.INT1R;
IN_FN_PPS4_T5CK : constant Natural := T5CKRbits.T5CKR;
IN_FN_PPS4_IC2 : constant Natural := IC2Rbits.IC2R;
IN_FN_PPS4_SS2 : constant Natural := SS2Rbits.SS2R;
IN_FN_PPS4_OCFA : constant Natural := OCFARbits.OCFAR;

IN_PIN_PPS4_RPA3 : constant Natural := 0;   --  Assign RPA3  as Input Pin */
IN_PIN_PPS4_RPB14 : constant Natural := 1;   --  Assign RPB14 as Input Pin */
IN_PIN_PPS4_RPB0 : constant Natural := 2;   --  Assign RPB0  as Input Pin */
IN_PIN_PPS4_RPB10 : constant Natural := 3;   --  Assign RPB10 as Input Pin */
IN_PIN_PPS4_RPB9 : constant Natural := 4;   --  Assign RPB9  as Input Pin */
IN_PIN_PPS4_RPC9 : constant Natural := 5;   --  Assign RPC9  as Input Pin */
IN_PIN_PPS4_RPC2 : constant Natural := 6;   --  Assign RPC2  as Input Pin */
IN_PIN_PPS4_RPC4 : constant Natural := 7;   --  Assign RPC4  as Input Pin */

--  #elif (__PIC32_FEATURE_SET__ == 330) || (__PIC32_FEATURE_SET__ == 350) || (__PIC32_FEATURE_SET__ == 370) || (__PIC32_FEATURE_SET__ == 430) || (__PIC32_FEATURE_SET__ == 450) || (__PIC32_FEATURE_SET__ == 470)

--  Input Pins Group 1 */
IN_FN_PPS1_INT3 : constant Natural := INT3Rbits.INT3R;
IN_FN_PPS1_T2CK : constant Natural := T2CKRbits.T2CKR;
IN_FN_PPS1_IC3 : constant Natural := IC3Rbits.IC3R;
IN_FN_PPS1_U1RX : constant Natural := U1RXRbits.U1RXR;
IN_FN_PPS1_U2RX : constant Natural := U2RXRbits.U2RXR;
IN_FN_PPS1_U5CTS : constant Natural := U5CTSRbits.U5CTSR;
IN_FN_PPS1_REFCLKI : constant Natural := REFCLKIRbits.REFCLKIR;

IN_PIN_PPS1_RPD2 : constant Natural := 0;   --  Assign RPD2  as Input Pin */
IN_PIN_PPS1_RPG8 : constant Natural := 1;   --  Assign RPG8  as Input Pin */
IN_PIN_PPS1_RPF4 : constant Natural := 2;   --  Assign RPF4  as Input Pin */
IN_PIN_PPS1_RPD10 : constant Natural := 3;   --  Assign RPD10 as Input Pin */
IN_PIN_PPS1_RPF1 : constant Natural := 4;   --  Assign RPF1  as Input Pin */
IN_PIN_PPS1_RPB9 : constant Natural := 5;   --  Assign RPB9  as Input Pin */
IN_PIN_PPS1_RPB10 : constant Natural := 6;   --  Assign RPB10 as Input Pin */
IN_PIN_PPS1_RPC14 : constant Natural := 7;   --  Assign RPC14 as Input Pin */
IN_PIN_PPS1_RPB5 : constant Natural := 8;   --  Assign RPB5  as Input Pin */
IN_PIN_PPS1_RPC1 : constant Natural := 10;  --  Assign RPC1  as Input Pin */
IN_PIN_PPS1_RPD14 : constant Natural := 11;  --  Assign RPD14 as Input Pin */
IN_PIN_PPS1_RPG1 : constant Natural := 12;  --  Assign RPG1  as Input Pin */
IN_PIN_PPS1_RPA14 : constant Natural := 13;  --  Assign RPA14 as Input Pin */
IN_PIN_PPS1_RPF2 : constant Natural := 15;   --  Assign RPF2  as Input Pin */

--  Input Pins Group 2 */
IN_FN_PPS2_INT4 : constant Natural := INT4Rbits.INT4R;
IN_FN_PPS2_T5CK : constant Natural := T5CKRbits.T5CKR;
IN_FN_PPS2_IC4 : constant Natural := IC4Rbits.IC4R;
IN_FN_PPS2_U3RX : constant Natural := U3RXRbits.U3RXR;
IN_FN_PPS2_U4CTS : constant Natural := U4CTSRbits.U4CTSR;
IN_FN_PPS2_SDI1 : constant Natural := SDI1Rbits.SDI1R;
IN_FN_PPS2_SDI2 : constant Natural := SDI2Rbits.SDI2R;

IN_PIN_PPS2_RPD3 : constant Natural := 0;   --  Assign RPD3  as Input Pin */
IN_PIN_PPS2_RPG7 : constant Natural := 1;   --  Assign RPG7  as Input Pin */
IN_PIN_PPS2_RPF5 : constant Natural := 2;   --  Assign RPF5  as Input Pin */
IN_PIN_PPS2_RPD11 : constant Natural := 3;   --  Assign RPD11 as Input Pin */
IN_PIN_PPS2_RPF0 : constant Natural := 4;   --  Assign RPF0  as Input Pin */
IN_PIN_PPS2_RPB1 : constant Natural := 5;   --  Assign RPB1  as Input Pin */
IN_PIN_PPS2_RPE5 : constant Natural := 6;   --  Assign RPE5  as Input Pin */
IN_PIN_PPS2_RPC13 : constant Natural := 7;   --  Assign RPC13 as Input Pin */
IN_PIN_PPS2_RPB3 : constant Natural := 8;   --  Assign RPB3  as Input Pin */
IN_PIN_PPS2_RPC4 : constant Natural := 10;  --  Assign RPC4  as Input Pin */
IN_PIN_PPS2_RPD15 : constant Natural := 11;  --  Assign RPD15 as Input Pin */
IN_PIN_PPS2_RPG0 : constant Natural := 12;  --  Assign RPG0  as Input Pin */
IN_PIN_PPS2_RPA15 : constant Natural := 13;  --  Assign RPA15 as Input Pin */
IN_PIN_PPS2_RPF2 : constant Natural := 14;  --  Assign RPF2  as Input Pin */
IN_PIN_PPS2_RPF7 : constant Natural := 15;  --  Assign RPF7  as Input Pin */

--  Input Pins Group 3 */
IN_FN_PPS3_INT2 : constant Natural := INT2Rbits.INT2R;
IN_FN_PPS3_T4CK : constant Natural := T4CKRbits.T4CKR;
IN_FN_PPS3_IC2 : constant Natural := IC2Rbits.IC2R;
IN_FN_PPS3_IC5 : constant Natural := IC5Rbits.IC5R;
IN_FN_PPS3_U1CTS : constant Natural := U1CTSRbits.U1CTSR;
IN_FN_PPS3_U2CTS : constant Natural := U2CTSRbits.U2CTSR;
IN_FN_PPS3_SS1 : constant Natural := SS1Rbits.SS1R;

IN_PIN_PPS3_RPD9 : constant Natural := 0;   --  Assign RPD9  as Input Pin */
IN_PIN_PPS3_RPG6 : constant Natural := 1;   --  Assign RPG6  as Input Pin */
IN_PIN_PPS3_RPB8 : constant Natural := 2;   --  Assign RPB8  as Input Pin */
IN_PIN_PPS3_RPB15 : constant Natural := 3;   --  Assign RPB15 as Input Pin */
IN_PIN_PPS3_RPD4 : constant Natural := 4;   --  Assign RPD4  as Input Pin */
IN_PIN_PPS3_RPB0 : constant Natural := 5;   --  Assign RPB0  as Input Pin */
IN_PIN_PPS3_RPE3 : constant Natural := 6;   --  Assign RPE3  as Input Pin */
IN_PIN_PPS3_RPB7 : constant Natural := 7;   --  Assign RPB7  as Input Pin */
IN_PIN_PPS3_RPF12 : constant Natural := 9;   --  Assign RPF12 as Input Pin */
IN_PIN_PPS3_RPD12 : constant Natural := 10;  --  Assign RPD12 as Input Pin */
IN_PIN_PPS3_RPF8 : constant Natural := 11;  --  Assign RPF8  as Input Pin */
IN_PIN_PPS3_RPC3 : constant Natural := 12; --  Assign RPC3  as Input Pin */
IN_PIN_PPS3_RPE9 : constant Natural := 13; --  Assign RPE9  as Input Pin */
IN_PIN_PPS3_RPB2 : constant Natural := 15; --  Assign RPB2  as Input Pin */

--  Input Pins Group 4 */
IN_FN_PPS4_INT1 : constant Natural := INT1Rbits.INT1R;
IN_FN_PPS4_T3CK : constant Natural := T3CKRbits.T3CKR;
IN_FN_PPS4_IC1 : constant Natural := IC1Rbits.IC1R;
IN_FN_PPS4_U3CTS : constant Natural := U3CTSRbits.U3CTSR;
IN_FN_PPS4_U4RX : constant Natural := U4RXRbits.U4RXR;
IN_FN_PPS4_U5RX : constant Natural := U5RXRbits.U5RXR;
IN_FN_PPS4_SS2 : constant Natural := SS2Rbits.SS2R;
IN_FN_PPS4_OCFA : constant Natural := OCFARbits.OCFAR;

IN_PIN_PPS4_RPD1 : constant Natural := 0;   --  Assign RPD1  as Input Pin */
IN_PIN_PPS4_RPG9 : constant Natural := 1;   --  Assign RPG9  as Input Pin */
IN_PIN_PPS4_RPB14 : constant Natural := 2;   --  Assign RPB14 as Input Pin */
IN_PIN_PPS4_RPD0 : constant Natural := 3;   --  Assign RPD0  as Input Pin */
IN_PIN_PPS4_RPD8 : constant Natural := 4;   --  Assign RPD8  as Input Pin */
IN_PIN_PPS4_RPB6 : constant Natural := 5;   --  Assign RPB6  as Input Pin */
IN_PIN_PPS4_RPD5 : constant Natural := 6;   --  Assign RPD5  as Input Pin */
IN_PIN_PPS4_RPB2 : constant Natural := 7;   --  Assign RPB2  as Input Pin */
IN_PIN_PPS4_RPF3 : constant Natural := 8;   --  Assign RPF3  as Input Pin */
IN_PIN_PPS4_RPF13 : constant Natural := 9;   --  Assign RPF13 as Input Pin */
IN_PIN_PPS4_RPF2 : constant Natural := 11;  --  Assign RPF2  as Input Pin */
IN_PIN_PPS4_RPC2 : constant Natural := 12;  --  Assign RPC2  as Input Pin */
IN_PIN_PPS4_RPE8 : constant Natural := 13;  --  Assign RPE8  as Input Pin */

--  PPSInput(grp,fn,pin) IN_FN_PPS##grp##_##fn = IN_PIN_PPS##grp##_##pin

--  ---------------------------------------------------------------------------*/
--  Section:  Remappable Peripheral Outputs:                                         : constant Natural := */
--  ---------------------------------------------------------------------------*/
--  #if   (((__PIC32_FEATURE_SET__ >= 100) && (__PIC32_FEATURE_SET__ <= 299)) || defined(__32MXGENERIC__))
--  Output Pin Group 1 */
PPS_OUTPUT_BASE_ADDRESS : constant Natural := RPA0R; -- Happens to be the first one
OUT_PIN_PPS1_RPA0 : constant Natural := RPA0Rbits.RPA0R;
OUT_PIN_PPS1_RPB3 : constant Natural := RPB3Rbits.RPB3R;
OUT_PIN_PPS1_RPB4 : constant Natural := RPB4Rbits.RPB4R;
OUT_PIN_PPS1_RPB15 : constant Natural := RRPB15Rbits.RPB15R;
OUT_PIN_PPS1_RPB7 : constant Natural := RPB7Rbits.RPB7R;
OUT_PIN_PPS1_RPC7 : constant Natural := RPC7Rbits.RPC7R;
OUT_PIN_PPS1_RPC0 : constant Natural := RPC0Rbits.RPC0R;
OUT_PIN_PPS1_RPC5 : constant Natural := RPC5Rbits.RPC5R;

OUT_FN_PPS1_NULL : constant Natural := 0;  --  No Connect */
OUT_FN_PPS1_U1TX : constant Natural := 1;  --  RPn tied to U1TX */
OUT_FN_PPS1_U2RTS : constant Natural := 2;  --  RPn tied to U2RTS_BAR */
OUT_FN_PPS1_SS1 : constant Natural := 3;  --  RPn tied to SS1 */
--                                      4  - RESERVED
OUT_FN_PPS1_OC1 : constant Natural := 5;  --  RPn tied to OC1 */
--                                    6  - RESERVED
OUT_FN_PPS1_C2OUT : constant Natural := 7;  --  RPn tied to C2OUT */

--  Output Pin Group 2 */
OUT_PIN_PPS2_RPA1 : constant Natural := RPA1Rbits.RPA1R;
OUT_PIN_PPS2_RPB5 : constant Natural := RPB5Rbits.RPB5R;
OUT_PIN_PPS2_RPB1 : constant Natural := RPB1Rbits.RPB1R;
OUT_PIN_PPS2_RPB11 : constant Natural := RPB11Rbits.RPB11R;
OUT_PIN_PPS2_RPB8 : constant Natural := RPB8Rbits.RPB8R;
OUT_PIN_PPS2_RPA8 : constant Natural := RPA8Rbits.RPA8R;
OUT_PIN_PPS2_RPC8 : constant Natural := RPC8Rbits.RPC8R;
OUT_PIN_PPS2_RPA9 : constant Natural := RPA9Rbits.RPA9R;

OUT_FN_PPS2_NULL : constant Natural := 0;  --  No Connect */
--                                     1  - RESERVED
--                                     2  - RESERVED
OUT_FN_PPS2_SDO1 : constant Natural := 3;  --  RPn tied to SDO1 */
OUT_FN_PPS2_SDO2 : constant Natural := 4;  --  RPn tied to SDO2 */
OUT_FN_PPS2_OC2 : constant Natural := 5;  --  RPn tied to OC2 */
--                                      6  - RESERVED
--                                      7  - RESERVED

--  Output Pin Group 3
OUT_PIN_PPS3_RPA2 : constant Natural := RPA2Rbits.RPA2R;
OUT_PIN_PPS3_RPB6 : constant Natural := RPB6Rbits.RPB6R;
OUT_PIN_PPS3_RPA4 : constant Natural := RPA4Rbits.RPA4R;
OUT_PIN_PPS3_RPB13 : constant Natural := RPB13Rbits.RPB13R;
OUT_PIN_PPS3_RPB2 : constant Natural := RPB2Rbits.RPB2R;
OUT_PIN_PPS3_RPC6 : constant Natural := RPC6Rbits.RPC6R;
OUT_PIN_PPS3_RPC1 : constant Natural := RPC1Rbits.RPC1R;
OUT_PIN_PPS3_RPC3 : constant Natural := RPC3Rbits.RPC3R;

OUT_FN_PPS3_NULL : constant Natural := 0;  --  No Connect */
--                                     1 ; - RESERVED
--                                     2  - RESERVED
OUT_FN_PPS3_SDO1 : constant Natural := 3;  --  RPn tied to SDO1 */
OUT_FN_PPS3_SDO2 : constant Natural := 4;  --  RPn tied to SDO2 */
OUT_FN_PPS3_OC4 : constant Natural := 5;  --  RPn tied to OC4 */
OUT_FN_PPS3_OC5 : constant Natural := 6;  --  RPn tied to OC5 */
OUT_FN_PPS3_REFCLKO : constant Natural := 7;  --  RPn tied to REFCLKO */

--  Output Pin Group 4 */
OUT_PIN_PPS4_RPA3 : constant Natural := RPA3Rbits.RPA3R;
OUT_PIN_PPS4_RPB14 : constant Natural := RPB14Rbits.RPB14R;
OUT_PIN_PPS4_RPB0 : constant Natural := RPB0Rbits.RPB0R;
OUT_PIN_PPS4_RPB10 : constant Natural := RPB10Rbits.RPB10R;
OUT_PIN_PPS4_RPB9 : constant Natural := RPB9Rbits.RPB9R;
OUT_PIN_PPS4_RPC9 : constant Natural := RPC9Rbits.RPC9R;
OUT_PIN_PPS4_RPC2 : constant Natural := RPC2Rbits.RPC2R;
OUT_PIN_PPS4_RPC4 : constant Natural := RPC4Rbits.RPC4R;

OUT_FN_PPS4_NULL : constant Natural := 0;  --  No Connect */
OUT_FN_PPS4_U1RTS : constant Natural := 1;  --  RPn tied to U1RTS */
OUT_FN_PPS4_U2TX : constant Natural := 2;  --  RPn tied to U2TX */
--                                     3  - RESERVED
OUT_FN_PPS4_SS2 : constant Natural := 4;  --  RPn tied to SS2_BAR */
OUT_FN_PPS4_OC3 : constant Natural := 5;  --  RPn tied to OC31 */
--                                    6  - RESERVED
OUT_FN_PPS4_C1OUT : constant Natural := 7;  --  RPn tied to C1OUT */

--  #elif (__PIC32_FEATURE_SET__ == 330) || (__PIC32_FEATURE_SET__ == 350) || (__PIC32_FEATURE_SET__ == 370) || (__PIC32_FEATURE_SET__ == 430) || (__PIC32_FEATURE_SET__ == 450) || (__PIC32_FEATURE_SET__ == 470)
--  Output Pin Group 1 */
OUT_PIN_PPS1_RPD2 : constant Natural := RPD2Rbits.RPD2R;
OUT_PIN_PPS1_RPG8 : constant Natural := RPG8Rbits.RPG8R;
OUT_PIN_PPS1_RPF4 : constant Natural := RPF4Rbits.RPF4R;
OUT_PIN_PPS1_RPD10 : constant Natural := RPD10Rbits.RPD10R;
OUT_PIN_PPS1_RPF1 : constant Natural := RPF1Rbits.RPF1R;
OUT_PIN_PPS1_RPB9 : constant Natural := RPB9Rbits.RPB9R;
OUT_PIN_PPS1_RPB10 : constant Natural := RPB10Rbits.RPB10R;
OUT_PIN_PPS1_RPC14 : constant Natural := RPC14Rbits.RPC14R;
OUT_PIN_PPS1_RPB5 : constant Natural := RPB5Rbits.RPB5R;
OUT_PIN_PPS1_RPC1 : constant Natural := RPC1Rbits.RPC1R;
OUT_PIN_PPS1_RPD14 : constant Natural := RPD14Rbits.RPD14R;
OUT_PIN_PPS1_RPG1 : constant Natural := RPG1Rbits.RPG1R;
OUT_PIN_PPS1_RPA14 : constant Natural := RPA14Rbits.RPA14R;

OUT_FN_PPS1_NULL : constant Natural := 0;  --  No Connect */
OUT_FN_PPS1_U3TX : constant Natural := 1;  --  RPn tied to U3TX */
OUT_FN_PPS1_U4RTS : constant Natural := 2;  --  RPn tied to U4RTS_BAR */
--                                      3  - RESERVED
--                                      4  - RESERVED
--                                            5  - RESERVED
OUT_FN_PPS1_SDO2 : constant Natural := 6;  --  RPn tied to SDO2 */
--                                            7  - RESERVED
--                                            8  - RESERVED
--                                            9  - RESERVED
--                                            10 - RESERVED
OUT_FN_PPS1_OC3 : constant Natural := 11;  --  RPn tied to OC3 */
--                                            12 - RESERVED
OUT_FN_PPS1_C2OUT : constant Natural := 13; --  RPn tied to C2OUT */
--                                            14 - RESERVED
--                                            15 - RESERVED

--  Output Pin Group 2 */
OUT_PIN_PPS2_RPD3 : constant Natural := RPD3Rbits.RPD3R;
OUT_PIN_PPS2_RPG7 : constant Natural := RPG7Rbits.RPG7R;
OUT_PIN_PPS2_RPF5 : constant Natural := RPF5Rbits.RPF5R;
OUT_PIN_PPS2_RPD11 : constant Natural := RPD11Rbits.RPD11R;
OUT_PIN_PPS2_RPF0 : constant Natural := RPF0Rbits.RPF0R;
OUT_PIN_PPS2_RPB1 : constant Natural := RPB1Rbits.RPB1R;
OUT_PIN_PPS2_RPE5 : constant Natural := RPE5Rbits.RPE5R;
OUT_PIN_PPS2_RPC13 : constant Natural := RPC13Rbits.RPC13R;
OUT_PIN_PPS2_RPB3 : constant Natural := RPB3Rbits.RPB3R;
OUT_PIN_PPS2_RPF3 : constant Natural := RPF3Rbits.RPF3R;
OUT_PIN_PPS2_RPC4 : constant Natural := RPC4Rbits.RPC4R;
OUT_PIN_PPS2_RPD15 : constant Natural := RPD15Rbits.RPD15R;
OUT_PIN_PPS2_RPG0 : constant Natural := RPG0Rbits.RPG0R;
OUT_PIN_PPS2_RPA15 : constant Natural := RPA15Rbits.RPA15R;

OUT_FN_PPS2_NULL : constant Natural := 0;  --  No Connect */
OUT_FN_PPS2_U2TX : constant Natural := 1;  --  RPn tied to U2TX */
--                                            2  - RESERVED
OUT_FN_PPS2_U1TX : constant Natural := 3;  --  RPn tied to U1TX */
OUT_FN_PPS2_U5RTS : constant Natural := 4;  --  RPn tied to U5RTS */
--                                            5  - RESERVED
OUT_FN_PPS2_SDO2 : constant Natural := 6;  --  RPn tied to SDO2 */
--                                            7  - RESERVED
OUT_FN_PPS2_SDO1 : constant Natural := 8;  --  RPn tied to SDO1 */
--                                            9  - RESERVED
--                                            10 - RESERVED
OUT_FN_PPS2_OC4 : constant Natural := 11;  --  RPn tied to OC4 */
--                                            12 - RESERVED
--                                            13 - RESERVED
--                                            14 - RESERVED
--                                            15 - RESERVED

--  Output Pin Group 3 */
OUT_PIN_PPS3_RPD9 : constant Natural := RPD9Rbits.RPD9R;
OUT_PIN_PPS3_RPG6 : constant Natural := RPG6Rbits.RPG6R;
OUT_PIN_PPS3_RPB8 : constant Natural := RPB8Rbits.RPB8R;
OUT_PIN_PPS3_RPB15 : constant Natural := RPB15Rbits.RPB15R;
OUT_PIN_PPS3_RPD4 : constant Natural := RPD4Rbits.RPD4R;
OUT_PIN_PPS3_RPB0 : constant Natural := RPB0Rbits.RPB0R;
OUT_PIN_PPS3_RPE3 : constant Natural := RPE3Rbits.RPE3R;
OUT_PIN_PPS3_RPB7 : constant Natural := RPB7Rbits.RPB7R;
OUT_PIN_PPS3_RPB2 : constant Natural := RPB2Rbits.RPB2R;
OUT_PIN_PPS3_RPF12 : constant Natural := RPF12Rbits.RPF12R;
OUT_PIN_PPS3_RPD12 : constant Natural := RPD12Rbits.RPD12R;
OUT_PIN_PPS3_RPF8 : constant Natural := RPF8Rbits.RPF8R;
OUT_PIN_PPS3_RPC3 : constant Natural := RPC3Rbits.RPC3R;
OUT_PIN_PPS3_RPE9 : constant Natural := RPE9Rbits.RPE9R;


OUT_FN_PPS3_NULL : constant Natural := 0  --  No Connect */
OUT_FN_PPS3_U3RTS : constant Natural := 1  --  RPn tied to U3RTS */
OUT_FN_PPS3_U4TX : constant Natural := 2  --  RPn tied to U4TX */
OUT_FN_PPS3_REFCLKO : constant Natural := 3  --  RPn tied to REFCLKO */
OUT_FN_PPS3_U5TX : constant Natural := 4  --  RPn tied to U5TX */
--                                            5  - RESERVED
--                                            6  - RESERVED
OUT_FN_PPS3_SS1 : constant Natural := 7  --  RPn tied to SS1 */
OUT_FN_PPS3_SDO1 : constant Natural := 8  --  RPn tied to SDO1 */
--                                            9  - RESERVED
--                                            10 - RESERVED
OUT_FN_PPS3_OC5 : constant Natural := 11 --  RPn tied to OC5 */
--                                            12 - RESERVED
OUT_FN_PPS3_C1OUT : constant Natural := 13 --  RPn tied to C1OUT */
--                                            14 - RESERVED
--                                            15 - RESERVED

--  Output Pin Group 4 */
OUT_PIN_PPS4_RPD1 : constant Natural := RPD1Rbits.RPD1R
OUT_PIN_PPS4_RPG9 : constant Natural := RPG9Rbits.RPG9R
OUT_PIN_PPS4_RPB14       RPB14Rbits.RPB14R
OUT_PIN_PPS4_RPD0 : constant Natural := RPD0Rbits.RPD0R
OUT_PIN_PPS4_RPD8 : constant Natural := RPD8Rbits.RPD8R
OUT_PIN_PPS4_RPB6 : constant Natural := RPB6Rbits.RPB6R
OUT_PIN_PPS4_RPD5 : constant Natural := RPD5Rbits.RPD5R
OUT_PIN_PPS4_RPF3 : constant Natural := RPF3Rbits.RPF3R
OUT_PIN_PPS4_RPF6 : constant Natural := RPF6Rbits.RPF6R
OUT_PIN_PPS4_RPF13       RPF13Rbits.RPF13R
OUT_PIN_PPS4_RPF2 : constant Natural := RPF2Rbits.RPF2R
OUT_PIN_PPS4_RPC2 : constant Natural := RPC2Rbits.RPC2R
OUT_PIN_PPS4_RPE8 : constant Natural := RPE8Rbits.RPE8R


OUT_FN_PPS4_NULL : constant Natural := 0  --  No Connect */
OUT_FN_PPS4_U2RTS : constant Natural := 1  --  RPn tied to U2RTS */
--                                            2  - RESERVED
OUT_FN_PPS4_U1RTS : constant Natural := 3  --  RPn tied to U1RTS */
OUT_FN_PPS4_U5TX : constant Natural := 4  --  RPn tied to U5TX */
--                                            5  - RESERVED
OUT_FN_PPS4_SS2 : constant Natural := 6  --  RPn tied to SS2_BAR */
--                                            7  - RESERVED
OUT_FN_PPS4_SDO1 : constant Natural := 8  --  RPn tied to SDO1 */
--                                            9  - RESERVED
--                                            10  -RESERVED
OUT_FN_PPS4_OC2 : constant Natural := 11 --  RPn tied to OC2 */
OUT_FN_PPS4_OC1 : constant Natural := 12 --  RPn tied to OC1 */
--                                            13 - RESERVED
--                                            14 - RESERVED
--                                            15 - RESERVED

;   --  PPSOutput(grp,pin,fn)   OUT_PIN_PPS##grp##_##pin = OUT_FN_PPS##grp##_##fn
 --  Macro: : constant Natural :=  PPSUnLock
--   PPSUnLock : constant Natural :=  : constant Natural := CFGCONbits.IOLOCK = 0;   

--    Macro: : constant Natural :=  PPSLock
--    PPSLock : constant Natural :=  : constant Natural :=  CFGCONbits.IOLOCK = 1;  

end PPS;
