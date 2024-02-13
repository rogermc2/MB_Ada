/***********************************************************************************************************************
MMBasic

IOPorts.h

Include file that defines the IOPins for the PIC32 chip in MMBasic.

Copyright 2011 - 2021 Geoff Graham.  All Rights Reserved.

This file and modified versions of this file are supplied to specific individuals or organisations under the following
provisions:

- This file, or any files that comprise the MMBasic source (modified or not), may not be distributed or copied to any other
  person or organisation without written permission.

- Object files (.o and .hex files) generated using this file (modified or not) may not be distributed or copied to any other
  person or organisation without written permission.

- This file is provided in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of
  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.

************************************************************************************************************************/

#ifndef IOPORTS_H
#define IOPORTS_H

/* #if !defined(__32MX470F512L__) && !defined(__32MX470F512H__) */
/*        #error Processor not supported */
/* #endif */

#define DEVID (*(volatile unsigned int *)0xBF80F220)
#define PIC32MX470F512H_DEVID  0x0580A053
#define PIC32MX470F512L_DEVID  0x0580B053

#define HAS_USB                1
#define HAS_64PINS             ((DEVID & 0xfffffff) == PIC32MX470F512H_DEVID)
#define HAS_100PINS            ((DEVID & 0xfffffff) == PIC32MX470F512L_DEVID)


// these are the valid peek/poke memory ranges for the MX470
#define PEEKRANGE(a) ((a >= 0xA0000000 && a <= 0xA001FFFF) || (a >= 0x9D000000 && a <= 0x9D07FFFF) || (a >= 0x9FC02FF0 && a <= 0x9FC02FFF) || (a >= 0xBF800000 && a <= 0xBF8FFFFF))
#define POKERANGE(a) ((a >= 0xA0000000 && a <= 0xA001FFFF) || (a >= 0xBF800000 && a <= 0xBF8FFFFF))

// General defines
#define P_INPUT           1                   // for setting the TRIS on I/O bits
#define P_OUTPUT          0
#define P_ON              1
#define P_OFF             0

// Constant definitions of the port registers in the PIC32 chips
#define ADDR_PORTA          (volatile unsigned int *)0xbf886020
#define ADDR_PORTB          (volatile unsigned int *)0xbf886120
#define ADDR_PORTC          (volatile unsigned int *)0xbf886220
#define ADDR_PORTD          (volatile unsigned int *)0xbf886320
#define ADDR_PORTE          (volatile unsigned int *)0xbf886420
#define ADDR_PORTF          (volatile unsigned int *)0xbf886520
#define ADDR_PORTG          (volatile unsigned int *)0xbf886620

// Structure that defines the SFR, bit number and mode for each I/O pin
struct s_PinDef {
    volatile unsigned int *sfr; // this is the port register (defined above), eg ADDR_PORTG for port G
    unsigned char bitnbr;   // this is the bit number of the port, eg the 7 in G7
    unsigned char mode;    // the various modes that an I/O pin can be set to (defined below)
    unsigned char anChan;    // if the input supports analog this is the analog channel number
};

// Defines for the various modes that an I/O pin can be set to
#define UNUSED       (1 << 0)
#define ANALOG_IN    (1 << 1)
#define DIGITAL_IN   (1 << 2)
#define COUNTING     (1 << 3)
#define DIGITAL_OUT  (1 << 4)
#define DO_NOT_RESET (1 << 5)

#define NBR_PINS_64CHIP     64       // number of pins for external i/o on a 28 pin chip
#define NBR_PINS_100CHIP    100      // number of pins for external i/o on a 44 pin chip
#define NBRPINS             (HAS_64PINS ? NBR_PINS_64CHIP : NBR_PINS_100CHIP)   // number of pins for external i/o
#define MAXNBRPINS          100


// Define the structure for the I/O pins
// the first element of the structure contains a pointer to the SFR for the port to be used
// the second element is the bit number within that port to use
// the third is a set of flags that defines what that I/O pin can do
// the fourth (if present) is the analog channel number if the pin is analog capable

#if defined(DEFINE_PINDEF_TABLE)
const struct s_PinDef PinDef64[NBR_PINS_64CHIP + 1] =
    {
    { NULL,  0, UNUSED },                                                        // pin 0
    { ADDR_PORTE,  5, ANALOG_IN | DIGITAL_IN | DIGITAL_OUT, 22 },                // pin 1
    { ADDR_PORTE,  6, ANALOG_IN | DIGITAL_IN | DIGITAL_OUT, 23 },                // pin 2
    { ADDR_PORTE,  7, ANALOG_IN | DIGITAL_IN | DIGITAL_OUT, 27 },                // pin 3
    { ADDR_PORTG,  6, ANALOG_IN | DIGITAL_IN | DIGITAL_OUT, 16 },                // pin 4
    { ADDR_PORTG,  7, ANALOG_IN | DIGITAL_IN | DIGITAL_OUT, 17 },                // pin 5
    { ADDR_PORTG,  8, ANALOG_IN | DIGITAL_IN | DIGITAL_OUT, 18 },                // pin 6 - Console RX
    { NULL,  0, UNUSED },                                                        // pin 7
    { ADDR_PORTG,  9, ANALOG_IN | DIGITAL_IN | DIGITAL_OUT, 19 },                // pin 8
    { NULL,  0, UNUSED },                                                        // pin 9
    { NULL,  0, UNUSED },                                                        // pin 10
    { ADDR_PORTB,  5, ANALOG_IN | DIGITAL_IN | DIGITAL_OUT, 5 },                 // pin 11
    { ADDR_PORTB,  4, ANALOG_IN | DIGITAL_IN | DIGITAL_OUT, 4 },                 // pin 12
    { ADDR_PORTB,  3, ANALOG_IN | DIGITAL_IN | DIGITAL_OUT, 3 },                 // pin 13
    { ADDR_PORTB,  2, ANALOG_IN | DIGITAL_IN | DIGITAL_OUT, 2 },                 // pin 14
#if defined(DEBUGMODE)
    { NULL,  0, UNUSED | DO_NOT_RESET },                                         // pin 15  ICSP PGD
    { NULL,  0, UNUSED | DO_NOT_RESET },                                         // pin 16  ICSP PGC
#else
    { ADDR_PORTB,  1, ANALOG_IN | DIGITAL_IN | DIGITAL_OUT, 1 },                 // pin 15
    { ADDR_PORTB,  0, ANALOG_IN | DIGITAL_IN | DIGITAL_OUT, 0 },                 // pin 16
#endif
//
    { ADDR_PORTB,  6, ANALOG_IN | DIGITAL_IN | DIGITAL_OUT, 6 },                 // pin 17
    { ADDR_PORTB,  7, ANALOG_IN | DIGITAL_IN | DIGITAL_OUT, 7 },                 // pin 18
    { NULL,  0, UNUSED },                                                        // pin 19
    { NULL,  0, UNUSED },                                                        // pin 20
    { ADDR_PORTB,  8, ANALOG_IN | DIGITAL_IN | DIGITAL_OUT, 8 },                 // pin 21
    { ADDR_PORTB,  9, ANALOG_IN | DIGITAL_IN | DIGITAL_OUT, 9 },                 // pin 22
    { ADDR_PORTB, 10, ANALOG_IN | DIGITAL_IN | DIGITAL_OUT, 10 },                // pin 23
    { ADDR_PORTB, 11, ANALOG_IN | DIGITAL_IN | DIGITAL_OUT, 11 },                // pin 24
    { NULL,  0, UNUSED },                                                        // pin 25
    { NULL,  0, UNUSED },                                                        // pin 26
    { ADDR_PORTB, 12, ANALOG_IN | DIGITAL_IN | DIGITAL_OUT, 12 },                // pin 27
    { ADDR_PORTB, 13, ANALOG_IN | DIGITAL_IN | DIGITAL_OUT, 13 },                // pin 28
    { ADDR_PORTB, 14, ANALOG_IN | DIGITAL_IN | DIGITAL_OUT, 14 },                // pin 29
    { ADDR_PORTB, 15, ANALOG_IN | DIGITAL_IN | DIGITAL_OUT, 15 },                // pin 30
    { ADDR_PORTF,  4, DIGITAL_IN | DIGITAL_OUT },                                // pin 31
    { ADDR_PORTF,  5, DIGITAL_IN | DIGITAL_OUT },                                // pin 32
//
    { ADDR_PORTF,  3, DIGITAL_IN },                                              // pin 33
    { NULL,  0, UNUSED },                                                        // pin 34 - VBUS
    { NULL,  0, UNUSED },                                                        // pin 35 - USSB3V3
    { NULL,  0, UNUSED },                                                        // pin 36 - USB D-
    { NULL,  0, UNUSED },                                                        // pin 37 - USB D+
    { NULL,  0, UNUSED },                                                        // pin 38 - Vdd
    { NULL,  0, UNUSED },                                                        // pin 39 - Crystal
    { NULL,  0, UNUSED },                                                        // pin 40 - Crystal
    { NULL,  0, UNUSED },                                                        // pin 41 - Vss
    { ADDR_PORTD,  8, DIGITAL_IN | DIGITAL_OUT },                                // pin 42
    { ADDR_PORTD,  9, DIGITAL_IN | DIGITAL_OUT },                                // pin 43
    { ADDR_PORTD, 10, DIGITAL_IN | DIGITAL_OUT },                                // pin 44
    { ADDR_PORTD, 11, DIGITAL_IN | DIGITAL_OUT },                                // pin 45
    { ADDR_PORTD,  0, DIGITAL_IN | DIGITAL_OUT },                                // pin 46
    { ADDR_PORTC, 13, DIGITAL_IN | DIGITAL_OUT },                                // pin 47
    { ADDR_PORTC, 14, DIGITAL_IN | DIGITAL_OUT },                                // pin 48
//
    { ADDR_PORTD,  1, ANALOG_IN | DIGITAL_IN | DIGITAL_OUT, 24 },                // pin 49
    { ADDR_PORTD,  2, ANALOG_IN | DIGITAL_IN | DIGITAL_OUT, 25 },                // pin 50
    { ADDR_PORTD,  3, ANALOG_IN | DIGITAL_IN | DIGITAL_OUT, 26 },                // pin 51
    { ADDR_PORTD,  4, DIGITAL_IN | DIGITAL_OUT },                                // pin 52
    { ADDR_PORTD,  5, DIGITAL_IN | DIGITAL_OUT },                                // pin 53
    { ADDR_PORTD,  6, DIGITAL_IN | DIGITAL_OUT },                                // pin 54
    { ADDR_PORTD,  7, DIGITAL_IN | DIGITAL_OUT },                                // pin 55
    { NULL,  0, UNUSED },                                                        // pin 56
    { NULL,  0, UNUSED },                                                        // pin 57
    { ADDR_PORTF,  0, DIGITAL_IN | DIGITAL_OUT },                                // pin 58 - Console TX
    { ADDR_PORTF,  1, DIGITAL_IN | DIGITAL_OUT },                                // pin 59
    { ADDR_PORTE,  0, DIGITAL_IN | DIGITAL_OUT },                                // pin 60
    { ADDR_PORTE,  1, DIGITAL_IN | DIGITAL_OUT },                                // pin 61
    { ADDR_PORTE,  2, ANALOG_IN | DIGITAL_IN | DIGITAL_OUT, 20 },                // pin 62
    { ADDR_PORTE,  3, DIGITAL_IN | DIGITAL_OUT },                                // pin 63
    { ADDR_PORTE,  4, ANALOG_IN | DIGITAL_IN | DIGITAL_OUT, 21 },                // pin 64
};

const struct s_PinDef PinDef100[NBR_PINS_100CHIP + 1] = {
    { NULL,  0, UNUSED },                                                        // pin 0
    { ADDR_PORTG, 15, DIGITAL_IN | DIGITAL_OUT },                                // pin 1
    { NULL,  0, UNUSED },                                                        // pin 2
    { ADDR_PORTE,  5, ANALOG_IN | DIGITAL_IN | DIGITAL_OUT, 22 },                // pin 3
    { ADDR_PORTE,  6, ANALOG_IN | DIGITAL_IN | DIGITAL_OUT, 23 },                // pin 4
    { ADDR_PORTE,  7, ANALOG_IN | DIGITAL_IN | DIGITAL_OUT, 27 },                // pin 5
    { ADDR_PORTC,  1, DIGITAL_IN | DIGITAL_OUT },                                // pin 6
    { ADDR_PORTC,  2, DIGITAL_IN | DIGITAL_OUT },                                // pin 7
    { ADDR_PORTC,  3, DIGITAL_IN | DIGITAL_OUT },                                // pin 8
    { ADDR_PORTC,  4, DIGITAL_IN | DIGITAL_OUT },                                // pin 9
    { ADDR_PORTG,  6, ANALOG_IN | DIGITAL_IN | DIGITAL_OUT, 16 },                // pin 10
    { ADDR_PORTG,  7, ANALOG_IN | DIGITAL_IN | DIGITAL_OUT, 17 },                // pin 11
    { ADDR_PORTG,  8, ANALOG_IN | DIGITAL_IN | DIGITAL_OUT, 18 },                // pin 12 - Console RX
    { NULL,  0, UNUSED },                                                        // pin 13
    { ADDR_PORTG,  9, ANALOG_IN | DIGITAL_IN | DIGITAL_OUT, 19 },                // pin 14
    { NULL,  0, UNUSED },                                                        // pin 15
    { NULL,  0, UNUSED },                                                        // pin 16
    { ADDR_PORTA,  0, DIGITAL_IN | DIGITAL_OUT },                                // pin 17
    { ADDR_PORTE,  8, DIGITAL_IN | DIGITAL_OUT },                                // pin 18
    { ADDR_PORTE,  9, DIGITAL_IN | DIGITAL_OUT },                                // pin 19
    { ADDR_PORTB,  5, ANALOG_IN | DIGITAL_IN | DIGITAL_OUT, 5 },                 // pin 20
    { ADDR_PORTB,  4, ANALOG_IN | DIGITAL_IN | DIGITAL_OUT, 4 },                 // pin 21
    { ADDR_PORTB,  3, ANALOG_IN | DIGITAL_IN | DIGITAL_OUT, 3 },                 // pin 22
    { ADDR_PORTB,  2, ANALOG_IN | DIGITAL_IN | DIGITAL_OUT, 2 },                 // pin 23
#if defined(DEBUGMODE)
    { NULL,  0, UNUSED | DO_NOT_RESET },                                         // pin 24  ICSP PGD
    { NULL,  0, UNUSED | DO_NOT_RESET },                                         // pin 25  ICSP PGC
#else
    { ADDR_PORTB,  1, ANALOG_IN | DIGITAL_IN | DIGITAL_OUT, 1 },                 // pin 24
    { ADDR_PORTB,  0, ANALOG_IN | DIGITAL_IN | DIGITAL_OUT, 0 },                 // pin 25
#endif
//
    { ADDR_PORTB,  6, ANALOG_IN | DIGITAL_IN | DIGITAL_OUT, 6 },                 // pin 26
    { ADDR_PORTB,  7, ANALOG_IN | DIGITAL_IN | DIGITAL_OUT, 7 },                 // pin 27
    { ADDR_PORTA,  9, DIGITAL_IN | DIGITAL_OUT },                                // pin 28
    { ADDR_PORTA, 10, DIGITAL_IN | DIGITAL_OUT },                                // pin 29
    { NULL,  0, UNUSED },                                                        // pin 30
    { NULL,  0, UNUSED },                                                        // pin 31
    { ADDR_PORTB,  8, ANALOG_IN | DIGITAL_IN | DIGITAL_OUT, 8 },                 // pin 32
    { ADDR_PORTB,  9, ANALOG_IN | DIGITAL_IN | DIGITAL_OUT, 9 },                 // pin 33
    { ADDR_PORTB, 10, ANALOG_IN | DIGITAL_IN | DIGITAL_OUT, 10 },                // pin 34
    { ADDR_PORTB, 11, ANALOG_IN | DIGITAL_IN | DIGITAL_OUT, 11 },                // pin 35
    { NULL,  0, UNUSED },                                                        // pin 36
    { NULL,  0, UNUSED },                                                        // pin 37
    { ADDR_PORTA,  1, DIGITAL_IN | DIGITAL_OUT },                                // pin 38
    { ADDR_PORTF, 13, DIGITAL_IN | DIGITAL_OUT },                                // pin 39
    { ADDR_PORTF, 12, DIGITAL_IN | DIGITAL_OUT },                                // pin 40
    { ADDR_PORTB, 12, ANALOG_IN | DIGITAL_IN | DIGITAL_OUT, 12 },                // pin 41
    { ADDR_PORTB, 13, ANALOG_IN | DIGITAL_IN | DIGITAL_OUT, 13 },                // pin 42
    { ADDR_PORTB, 14, ANALOG_IN | DIGITAL_IN | DIGITAL_OUT, 14 },                // pin 43
    { ADDR_PORTB, 15, ANALOG_IN | DIGITAL_IN | DIGITAL_OUT, 15 },                // pin 44
    { NULL,  0, UNUSED },                                                        // pin 45
    { NULL,  0, UNUSED },                                                        // pin 46
    { ADDR_PORTD, 14, DIGITAL_IN | DIGITAL_OUT },                                // pin 47
    { ADDR_PORTD, 15, DIGITAL_IN | DIGITAL_OUT },                                // pin 48
    { ADDR_PORTF,  4, DIGITAL_IN | DIGITAL_OUT },                                // pin 49
    { ADDR_PORTF,  5, DIGITAL_IN | DIGITAL_OUT },                                // pin 50
//
    { ADDR_PORTF,  3, DIGITAL_IN },                                              // pin 51
    { ADDR_PORTF,  2, DIGITAL_IN | DIGITAL_OUT },                                // pin 52
    { ADDR_PORTF,  8, DIGITAL_IN | DIGITAL_OUT },                                // pin 53
    { NULL,  0, UNUSED },                                                        // pin 54 - VBUS
    { NULL,  0, UNUSED },                                                        // pin 55 - VUSB3V3
    { NULL,  0, UNUSED },                                                        // pin 56 - D-
    { NULL,  0, UNUSED },                                                        // pin 57 - D+
    { ADDR_PORTA,  2, DIGITAL_IN | DIGITAL_OUT },                                // pin 58
    { ADDR_PORTA,  3, DIGITAL_IN | DIGITAL_OUT },                                // pin 59
    { ADDR_PORTA,  4, DIGITAL_IN | DIGITAL_OUT },                                // pin 60
    { ADDR_PORTA,  5, DIGITAL_IN | DIGITAL_OUT },                                // pin 61
    { NULL,  0, UNUSED },                                                        // pin 62 - Vdd
    { NULL,  0, UNUSED },                                                        // pin 63 - Crystal
    { NULL,  0, UNUSED },                                                        // pin 64 - Crystal
    { NULL,  0, UNUSED },                                                        // pin 65 - Vcc
    { ADDR_PORTA, 14, DIGITAL_IN | DIGITAL_OUT },                                // pin 66
    { ADDR_PORTA, 15, DIGITAL_IN | DIGITAL_OUT },                                // pin 67
    { ADDR_PORTD,  8, DIGITAL_IN | DIGITAL_OUT },                                // pin 68
    { ADDR_PORTD,  9, DIGITAL_IN | DIGITAL_OUT },                                // pin 69
    { ADDR_PORTD, 10, DIGITAL_IN | DIGITAL_OUT },                                // pin 70
    { ADDR_PORTD, 11, DIGITAL_IN | DIGITAL_OUT },                                // pin 71
    { ADDR_PORTD,  0, DIGITAL_IN | DIGITAL_OUT },                                // pin 72
    { ADDR_PORTC, 13, DIGITAL_IN | DIGITAL_OUT },                                // pin 73
    { ADDR_PORTC, 14, DIGITAL_IN | DIGITAL_OUT },                                // pin 74
    { NULL,  0, UNUSED },                                                        // pin 75
//
    { ADDR_PORTD,  1, ANALOG_IN | DIGITAL_IN | DIGITAL_OUT, 24 },                // pin 76
    { ADDR_PORTD,  2, ANALOG_IN | DIGITAL_IN | DIGITAL_OUT, 25 },                // pin 77
    { ADDR_PORTD,  3, ANALOG_IN | DIGITAL_IN | DIGITAL_OUT, 26 },                // pin 78
    { ADDR_PORTD, 12, DIGITAL_IN | DIGITAL_OUT },                                // pin 79
    { ADDR_PORTD, 13, DIGITAL_IN | DIGITAL_OUT },                                // pin 80
    { ADDR_PORTD,  4, DIGITAL_IN | DIGITAL_OUT },                                // pin 81
    { ADDR_PORTD,  5, DIGITAL_IN | DIGITAL_OUT },                                // pin 82
    { ADDR_PORTD,  6, DIGITAL_IN | DIGITAL_OUT },                                // pin 83
    { ADDR_PORTD,  7, DIGITAL_IN | DIGITAL_OUT },                                // pin 84
    { NULL,  0, UNUSED },                                                        // pin 85
    { NULL,  0, UNUSED },                                                        // pin 86
    { ADDR_PORTF,  0, DIGITAL_IN | DIGITAL_OUT },                                // pin 87 - 5V - Console TX
    { ADDR_PORTF,  1, DIGITAL_IN | DIGITAL_OUT },                                // pin 88
    { ADDR_PORTG,  1, DIGITAL_IN | DIGITAL_OUT },                                // pin 89
    { ADDR_PORTG,  0, DIGITAL_IN | DIGITAL_OUT },                                // pin 90
    { ADDR_PORTA,  6, DIGITAL_IN | DIGITAL_OUT },                                // pin 91
    { ADDR_PORTA,  7, DIGITAL_IN | DIGITAL_OUT  },                               // pin 92
    { ADDR_PORTE,  0, DIGITAL_IN | DIGITAL_OUT },                                // pin 93
    { ADDR_PORTE,  1, DIGITAL_IN | DIGITAL_OUT },                                // pin 94
    { ADDR_PORTG, 14, DIGITAL_IN | DIGITAL_OUT },                                // pin 95
    { ADDR_PORTG, 12, DIGITAL_IN | DIGITAL_OUT },                                // pin 96
    { ADDR_PORTG, 13, DIGITAL_IN | DIGITAL_OUT },                                // pin 97
    { ADDR_PORTE,  2, ANALOG_IN | DIGITAL_IN | DIGITAL_OUT, 20 },                // pin 98
    { ADDR_PORTE,  3, DIGITAL_IN | DIGITAL_OUT },                                // pin 99
    { ADDR_PORTE,  4, ANALOG_IN | DIGITAL_IN | DIGITAL_OUT, 21 },                // pin 100
};

#else
    const extern struct s_PinDef PinDef64[];
    const extern struct s_PinDef PinDef100[];
#endif      // DEFINE_PINDEF_TABLE

extern struct s_PinDef *PinDef;

// Define the serial console pin numbers
#define CONSOLE_RX_PIN      (HAS_100PINS ? 89 :  6)     // this is UART1
#define CONSOLE_TX_PIN      (HAS_100PINS ? 87 : 58)

// Define the counting pin numbers.  INT1PIN refers to the PIC32 external interrupt #1, an so on for the others
#define INT1PIN             (HAS_100PINS ? 76 : 49)
#define INT1PIN_OPEN        PPSInput(4, INT1, RPD1)
#define INT1PIN_CLOSE       PPSInput(4, INT1, NULL)

#define INT2PIN             (HAS_100PINS ? 81 : 52)
#define INT2PIN_OPEN        PPSInput(3, INT2, RPD4)
#define INT2PIN_CLOSE       PPSInput(3, INT2, NULL)

#define INT3PIN             (HAS_100PINS ? 34 : 23)
#define INT3PIN_OPEN        PPSInput(1, INT3, RPB10)
#define INT3PIN_CLOSE       PPSInput(1, INT3, NULL)

#define INT4PIN             (HAS_100PINS ? 78 : 51)
#define INT4PIN_OPEN        PPSInput(2, INT4, RPD3)
#define INT4PIN_CLOSE       PPSInput(2, INT4, NULL)


// I2C pin numbers
#define P_I2C_SDA           (HAS_100PINS ? 67 : 43)     // not PPS,RD9 on 64-pin, RA15 on 100 pin
#define P_I2C_SCL           (HAS_100PINS ? 66 : 44)     // not PPS,RD10 on 64 pin, RA14 on 100 pin

//#define P_I2C2_SDA          (HAS_100PINS ? 59 : 31)
//#define P_I2C2_SCL          (HAS_100PINS ? 58 : 32)

// COM1: port pin numbers
#define COM1_RX_PIN         (HAS_100PINS ? 88 : 59)     // this is UART2, UART1 is used by the console or COM4
#define COM1_TX_PIN         (HAS_100PINS ? 24 : 15)
#define COM1_EN_PIN         (HAS_100PINS ? 43 : 29)
#define COM1_RX_PPS_OPEN    PPSInput(1, U2RX, RPF1)
#define COM1_TX_PPS_OPEN    PPSOutput(2, RPB1, U2TX)
#define COM1_TX_PPS_CLOSE   PPSOutput(2, RPB1, NULL)
#define COM1_EN_PPS_OPEN    PPSOutput(4, RPB14, U2RTS)
#define COM1_EN_PPS_CLOSE   PPSOutput(4, RPB14, NULL)

// COM2: port pin numbers
#define COM2_RX_PIN         (HAS_100PINS ?  22 : 13)     // this is UART3
#define COM2_TX_PIN         (HAS_100PINS ?  20 : 11)
#define COM2_RX_PPS_OPEN    PPSInput(2, U3RX, RPB3)
#define COM2_TX_PPS_OPEN    PPSOutput(1, RPB5, U3TX)
#define COM2_TX_PPS_CLOSE   PPSOutput(1, RPB5, NULL)

// COM3: port pin numbers
#define COM3_RX_PIN         (HAS_100PINS ?  26 : 17)     // this is UART4
#define COM3_TX_PIN         (HAS_100PINS ?  25 : 16)
#define COM3_RX_PPS_OPEN    PPSInput(4, U4RX, RPB6)
#define COM3_TX_PPS_OPEN    PPSOutput(3, RPB0, U4TX)
#define COM3_TX_PPS_CLOSE   PPSOutput(3, RPB0, NULL)

// COM4: port pin numbers
#define COM4_RX_PIN         (HAS_100PINS ?  89 :  6)     // this is UART1
#define COM4_TX_PIN         (HAS_100PINS ?  87 : 58)
#define COM4_RX_PPS_OPEN    { if(HAS_100PINS) PPSInput(1, U1RX, RPG1); else PPSInput(1, U1RX, RPG8); }
#define COM4_TX_PPS_OPEN    PPSOutput(2, RPF0, U1TX)
#define COM4_TX_PPS_CLOSE   PPSOutput(2, RPF0, NULL)


// SPI 1 pin numbers
#define SPI_INP_PIN         (HAS_100PINS ? 71 : 45)
#define SPI_OUT_PIN         (HAS_100PINS ? 72 :  8)
#define SPI_CLK_PIN         (HAS_100PINS ? 70 : 50)
#define SPI_PPS_OPEN        {PPSInput(2, SDI1, RPD11); if(HAS_100PINS) PPSOutput(4, RPD0, SDO1); else PPSOutput(4, RPG9, SDO1); }
#define SPI_PPS_CLOSE       PPSOutput(4, RPG9, NULL)

// SPI 2 pin numbers
#define SPI2_INP_PIN        (HAS_100PINS ?  11 : 47)
#define SPI2_OUT_PIN        (HAS_100PINS ? 12 :  5)
#define SPI2_CLK_PIN        (HAS_100PINS ? 10 :  4)
#define SPI2_PPS_OPEN       { if(HAS_100PINS) {PPSInput(2, SDI2, RPG7); PPSOutput(1, RPG8, SDO2); } else {PPSInput(2, SDI2, RPC13); PPSOutput(2, RPG7, SDO2);}}
#define SPI2_PPS_CLOSE      { if(HAS_100PINS) PPSOutput(1, RPG8, NULL); else PPSOutput(2, RPG7, NULL); }

// PWM CH1
#define PWM_CH1_PIN         (HAS_100PINS ? 74 : 48)
#define PWM_CH1_OPEN        PPSOutput(1, RPC14, OC3)
#define PWM_CH1_CLOSE       PPSOutput(1, RPC14, NULL)

// PWM CH2
#define PWM_CH2_PIN         (HAS_100PINS ? 68 : 42)
#define PWM_CH2_OPEN        PPSOutput(4, RPD8, OC2)
#define PWM_CH2_CLOSE       PPSOutput(4, RPD8, NULL)

// PWM CH3
#define PWM_CH3_PIN         (HAS_100PINS ? 79 : 63)
#define PWM_CH3_OPEN        { if(HAS_100PINS)  PPSOutput(3, RPD12, OC5); else PPSOutput(3, RPE3, OC5); }
#define PWM_CH3_CLOSE       { if(HAS_100PINS)  PPSOutput(3, RPD12, NULL); else PPSOutput(3, RPE3, NULL); }

// PWM CH4
#define PWM_CH4_PIN         (HAS_100PINS ? 82 : 53)
#define PWM_CH4_OPEN        PPSOutput(4, RPD5, OC1)
#define PWM_CH4_CLOSE       PPSOutput(4, RPD5, NULL)

// PWM CH5
//#define PWM_CH5_PIN         (HAS_100PINS ? 9 : 47)
//#define PWM_CH5_OPEN        { if(HAS_100PINS)  PPSOutput(2, RPC4, OC4); else PPSOutput(2, RPC13, OC4); }
//#define PWM_CH5_CLOSE       { if(HAS_100PINS)  PPSOutput(2, RPC4, NULL); else PPSOutput(2, RPC13, NULL); }
#define PWM_CH5_PIN         (HAS_100PINS ? 9 : 32)
#define PWM_CH5_OPEN        { if(HAS_100PINS)  PPSOutput(2, RPC4, OC4); else PPSOutput(2, RPF5, OC4); }
#define PWM_CH5_CLOSE       { if(HAS_100PINS)  PPSOutput(2, RPC4, NULL); else PPSOutput(2, RPF5, NULL); }

// PWM TONE_L
#define PWM_PLAY_L_PIN      PWM_CH4_PIN
#define PWM_PLAY_L_OPEN     PWM_CH4_OPEN
#define PWM_PLAY_L_CLOSE    PWM_CH4_CLOSE

// PWM TONE_R
#define PWM_PLAY_R_PIN      PWM_CH5_PIN
#define PWM_PLAY_R_OPEN     PWM_CH5_OPEN
#define PWM_PLAY_R_CLOSE    PWM_CH5_CLOSE

// pin used for wakeup from sleep and receiving IR messages
#define WAKEUP_PIN          (HAS_100PINS ? 78 : 51 )

// pins used by USB
#define USB_1_PIN           (HAS_100PINS ? 57 : 37)     //D+
#define USB_2_PIN           (HAS_100PINS ? 56 : 36)     //D-

// pins used by the SSD1963 display controller

// the SSD1963 data pins
#define SSD1963_DAT         LATE
#define SSD1963_DATREAD     PORTE
#define SSD1963_DATINV        TRISEINV
#define SSD1963_DAT1        (HAS_100PINS ? 93 : 60)
#define SSD1963_DAT2        (HAS_100PINS ? 94 : 61)
#define SSD1963_DAT3        (HAS_100PINS ? 98 : 62)
#define SSD1963_DAT4        (HAS_100PINS ? 99 : 63)
#define SSD1963_DAT5        (HAS_100PINS ? 100 : 64)
#define SSD1963_DAT6        (HAS_100PINS ? 3 :  1)
#define SSD1963_DAT7        (HAS_100PINS ? 4 :  2)
#define SSD1963_DAT8        (HAS_100PINS ? 5 :  3)

// the SSD1963 write pin
// IMPORTANT: For the 100-pin chip WR is pin E9 and this is assumed in ssd1963.c
#define SSD1963_WR_PIN      (HAS_100PINS ? 19 : 24)
#define SSD1963_WR_TOGGLE_64PIN    LATBINV = 1 << 11                // used on the 64-pin chip
#define SSD1963_WR_TOGGLE_100PIN   LATEINV = 1 << 9                 // used on the 100-pin chip

// the SSD1963 data/command pin.  On the LCD it is labeled RS.
// IMPORTANT: For the 100-pin chip DC is pin E8 and this is assumed in ssd1963.c
#define SSD1963_DC_PIN      (HAS_100PINS ? 18 : 27)

// the SSD1963 reset pin
#define SSD1963_RESET_PIN   (HAS_100PINS ? 42 : 28)

// touch controller interface
#define TOUCH_SPI_CHANNEL   SPI_CHANNEL2

// SPI LCD controller interface
#define SPI_LCD_SPI_CHANNEL SPI_CHANNEL2

// the keyboard pins
#define KEYBOARD_CLOCK      (HAS_100PINS ? 83 : 54)
#define KEYBOARD_DATA       (HAS_100PINS ? 84 : 55)
#define KBDIntEnable        mCNDIntEnable
#define KBDClearIntFlag     mCNDClearIntFlag

// the SD Card pins
#define SDCARD_SPI_CHANNEL  SPI_CHANNEL2

#endif
