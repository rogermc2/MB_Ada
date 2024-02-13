--  -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- 
--  *	p32_defs.h
--  *
--  *	chipKIT core files for PIC32
--  *		Copyright (c) 2011 by Digilent Inc.

--  -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
--  *		Author: Gene Apperson
--  *		Copyright (c) 2011, Digilent Inc, All rights reserved
--  -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --

--  * This file contains hardware dependent symbol and data type declarations
--  * for the PIC32 microcontroller.

--  -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
--  *	This file is part of the core system for the chipKIT version
--  * of the Arduino code base. It defines various generic symbols
--  * describing the Microchip PIC32 devices.

--  *	This library is free software; you can redistribute it and/or
--  *	modify it under the terms of the GNU Lesser General Public
--  *	License as published by the Free Software Foundation; either
--  *	version 2.1 of the License, or (at your option) any later version.

--  *	This library is distributed in the hope that it will be useful,
--  *	but WITHOUT ANY WARRANTY; without even the implied warranty of
--  *	MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
--  *	Lesser General Public License for more details.

--  *	You should have received a copy of the GNU Lesser General
--  *	Public License along with this library; if not, write to the
--  *	Free Software Foundation, Inc., 59 Temple Place, Suite 330,
--  *	Boston, MA  02111-1307  USA
--  -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --

package P32_Defs is

#include <p32xxxx.h>
#include "cpudefs.h"
#include <inttypes.h>

--  ------------------------------------------------------------
-- 				Misc. Declarations
--  ------------------------------------------------------------

FLASH_SPEED_HZ          30000000

--  ------------------------------------------------------------
-- 				Register Declarations
--  ------------------------------------------------------------

typedef union {
  struct {
    unsigned r0:1;
    unsigned r1:1;
    unsigned r2:1;
    unsigned r3:1;
    unsigned r4:1;
    unsigned r5:1;
    unsigned r6:1;
    unsigned r7:1;
    unsigned r8:1;
    unsigned r9:1;
    unsigned r10:1;
    unsigned r11:1;
    unsigned r12:1;
    unsigned r13:1;
    unsigned r14:1;
    unsigned r15:1;
  };
  struct {
    unsigned w:32;
  };
} __REGbits_t;

--  This structure describes the register layout of the primary
--  register, set, clear, and invert registers associated with
--  most special function registers.

typedef struct {
	uint32_t	reg;
	uint32_t	clr;
	uint32_t	set;
	uint32_t	inv;
} p32_regset;

--  This structure describes the register layout for a buffer
--  register that does't have the associated set, clear, and invert
--  registers.

typedef struct {
	uint32_t	reg;
	uint32_t	rsv1;
	uint32_t	rsv2;
	uint32_t	rsv3;
} p32_regbuf;

--  This structure describes the register layout of an I/O port.

--  #if defined(__PIC32MX1XX__)  or  or  defined(__PIC32MX2XX__)  or  or  defined(__PIC32MZXX__)  or  or  defined(__PIC32MX47X__)
typedef struct {
    union
    {
	    p32_regset ansel;
        struct
        {
            __REGbits_t ANSELxbits;
            __REGbits_t ANSELxCLR;
            __REGbits_t ANSELxSET;
            __REGbits_t ANSELxINV;
        };
    };
    union
    {
	    p32_regset	tris;
        struct
        {
            __REGbits_t TRISxbits;
            __REGbits_t TRISxCLR;
            __REGbits_t TRISxSET;
            __REGbits_t TRISxINV;
        };
    };
    union
    {
	    p32_regset	port;
        struct
        {
            __REGbits_t PORTxbits;
            __REGbits_t PORTxCLR;
            __REGbits_t PORTxSET;
            __REGbits_t PORTxINV;
        };
    };
    union
    {
	    p32_regset	lat;
        struct
        {
            __REGbits_t LATxbits;
            __REGbits_t LATxCLR;
            __REGbits_t LATxSET;
            __REGbits_t LATxINV;
        };
    };
    union
    {
	    p32_regset	odc;
        struct
        {
            __REGbits_t ODCxbits;
            __REGbits_t ODCxCLR;
            __REGbits_t ODCxSET;
            __REGbits_t ODCxINV;
        };
    };
    union
    {
	    p32_regset cnpu;
        struct
        {
            __REGbits_t CNPUxbits;
            __REGbits_t CNPUxCLR;
            __REGbits_t CNPUxSET;
            __REGbits_t CNPUxINV;
       };
    };

    union
    {
	    p32_regset cnpd;
        struct
        {
            __REGbits_t CNPDxbits;
            __REGbits_t CNPDxCLR;
            __REGbits_t CNPDxSET;
            __REGbits_t CNPDxINV;
        };
    };

	p32_regset cncon;
	p32_regset cnen;
	p32_regset cnstat;
} p32_ioport;

--  This structure defines the registers for a PIC32 UART.

typedef struct {
    union
    {
        __U1MODEbits_t uartMode;
	    p32_regset	    uxMode;
    };
    union
    {
	    __U1STAbits_t	uartSta;
	    p32_regset	    uxSta;
    };
	p32_regbuf	uxTx;
	p32_regbuf	uxRx;
	p32_regset	uxBrg;
} p32_uart;

--  UxMODE - Define bits in UART mode port

UARTMODE_ON	15
UARTMODE_BRGH  3
UARTMODE_PDSEL 1

--  UxSTA - Define bits in UART status/control register

UARTSTA_ADM_EN 24
UARTSTA_ADDR   16
UARTSTA_URXEN	12
UARTSTA_UTXEN	10
UARTSTA_UTXBF  9
UARTSTA_TMRT	8
UARTSTA_ADDEN  5

--  Structure for the registers of a PIC32 SPI controller

typedef struct {
    union
    {
        __SPI2CONbits_t    spiCon;
	    p32_regset         sxCon;
    };
    union
    {
	    __SPI2STATbits_t   spiStat;
	    p32_regset         sxStat;
    };
	p32_regbuf sxBuf;
	p32_regset sxBrg;
} p32_spi;

-- 	SPIxCON - Define bits in the SPI control port

SPICON_ON		15
SPICON_MODE32		11
SPICON_MODE16		10
SPICON_SMP		9
SPICON_CKE		8
SPICON_CKP		6
SPICON_MSTEN	5

--	SPIxSTAT - Define symbols in the SPI status port

SPISTAT_SPIROV	6
SPISTAT_SPIRBE 5
SPISTAT_SPITBE	3
SPISTAT_SPITBF 1
SPISTAT_SPIRBF	0

--  This structure defines the registers for a PIC32 I2C port.

typedef struct {
    union
    {
        __I2C1CONbits_t    i2cCon;
	    p32_regset	        ixCon;
    };
    union
    {
        __I2C1STATbits_t   i2cStat;
	    p32_regset         ixStat;
    };
	p32_regset ixAdd;
	p32_regset ixMsk;
	p32_regset ixBrg;
	p32_regset ixTrn;
	p32_regbuf ixRcv;
} p32_i2c;

--  I2CxCON - Define symbols for the I2C control port bits

I2CCON_ON		15
I2CCON_SIDL	13
I2CCON_SCLREL	12
I2CCON_STRICT	11
I2CCON_A10M	10
I2CCON_DISSLW	9
I2CCON_SMEN	8
I2CCON_GCEN	7
I2CCON_STREN	6
I2CCON_ACKDT	5
I2CCON_ACKEN	4
I2CCON_RCEN	3
I2CCON_PEN		2
I2CCON_RSEN	1
I2CCON_SEN		0

--  I2CSTAT - Define symbols for the I2C status port bits

I2CSTAT_ACKSTAT	15
I2CSTAT_TRSTAT		14
I2CSTAT_BCL		10
I2CSTAT_GCSTAT		9
I2CSTAT_ADD10		8
I2CSTAT_IWCOL		7
I2CSTAT_I2COV		6
I2CSTAT_DA			5
I2CSTAT_P			4
I2CSTAT_S			3
I2CSTAT_RW			2
I2CSTAT_RBF		1
I2CSTAT_TBF		0

--  This structure defines the registers for a PIC32 Timer.

typedef struct {
	p32_regset tmxCon;
	p32_regset tmxTmr;
	p32_regset tmxPr;
} p32_timer;

--  Define bits in the timer control register.
--  Type A timers (timer1) have different control bits
--  than Type B timers (timer2 - timer5)

--   Type A timer - Timer1
BN_TACON_ON		15
BN_TACON_FRZ		14
BN_TACON_SIDL		13
BN_TACON_TWDIS		12
BN_TACON_TWIP		11
BN_TACON_TGATE		7
BN_TACON_TCKPS		4
BN_TACON_TSYNC		2
BN_TACON_TCS		1

TACON_ON			(1 << _BN_TACON_ON)
TACON_OFF			(0)
TACON_FRZ_ON		(1 << _BN_TACON_FRZ)
TACON_FRZ_OFF		(0)
TACON_IDLE_STOP		(1 << _BN_TACON_SIDL)
TACON_IDLE_RUN		(0)
TACON_TWDIS_ON		(1 << _BN_TACON_TWDIS)
TACON_TWDIS_OFF		(0)
TACON_TWIP			(1 << _BN_TACON_TWIP)
TACON_TGATE_ON		(1 << _BN_TACON_TGATE)
TACON_TGATE_OFF		(0)
TACON_TSYNC_ON		(1 << _BN_TACON_TSYNC)
TACON_TSYNC_OFF		(0)

TACON_SRC_INT		(0 << _BN_TACON_TCS)
TACON_SRC_EXT		(1 << _BN_TACON_TCS)

TACON_PS_MASK		(3 << _BN_TACON_TCKPS)
TACON_PS_1			(0 << _BN_TACON_TCKPS)
TACON_PS_8			(1 << _BN_TACON_TCKPS)
TACON_PS_64			(2 << _BN_TACON_TCKPS)
TACON_PS_256		(3 << _BN_TACON_TCKPS)

--   Type B timer - Timer2-Timer5
BN_TBCON_ON		15
BN_TBCON_FRZ		14
BN_TBCON_SIDL		13
BN_TBCON_TGATE		7
BN_TBCON_TCKPS		4
BN_TBCON_T32		3
BN_TBCON_TCS		1

TBCON_ON			(1 << _BN_TBCON_ON)
TBCON_OFF			(0)
TBCON_FRZ_ON		(1 << _BN_TBCON_FRZ)
TBCON_FRZ_OFF		(0)
TBCON_IDLE_STOP		(1 << _BN_TBCON_SIDL)
TBCON_IDLE_RUN		(0)
TBCON_TGATE_ON		(1 << _BN_TBCON_TGATE)
TBCON_TGATE_OFF		(0)

TBCON_PS_MASK		(7 << _BN_TBCON_TCKPS)
TBCON_PS_1			(0 << _BN_TBCON_TCKPS)
TBCON_PS_2			(1 << _BN_TBCON_TCKPS)
TBCON_PS_4			(2 << _BN_TBCON_TCKPS)
TBCON_PS_8			(3 << _BN_TBCON_TCKPS)
TBCON_PS_16			(4 << _BN_TBCON_TCKPS)
TBCON_PS_32			(5 << _BN_TBCON_TCKPS)
TBCON_PS_64			(6 << _BN_TBCON_TCKPS)
TBCON_PS_256		(7 << _BN_TBCON_TCKPS)

TBCON_MODE32		(1 << _BN_TBCON_T32)
TBCON_MODE16		(0)
TBCON_SRC_EXT		(1 << _BN_TBCON_TCS)
TBCON_SRC_INT		(0)

--  This structure defines the registers for a PIC32 Input Capture.

typedef struct {
	p32_regset icxCon;
	p32_regbuf icxBuf;
} p32_ic;

--  Define bits in the incput capture control register

BN_ICCON_ON		15
BN_ICCON_FRZ		14
BN_ICCON_SIDL		13
BN_ICCON_FEDGE		9
BN_ICCON_C32		8
BN_ICCON_ICTMR		7
BN_ICCON_ICI		5
BN_ICCON_ICOV		4
BN_ICCON_ICBNE		3
BN_ICCON_ICM		0

ICCON_ON			(1 << _BN_ICCON_ON)
ICCON_OFF			(0)
ICCON_FRZ_ON		(1 << _BN_ICCON_FRZ)
ICCON_FRZ_OFF		(0)
ICCON_IDLE_STOP		(1 << _BN_ICCON_SIDL)
ICCON_IDLE_RUN		(0)
ICCON_FEDGE_RISING	(1 << _BN_ICCON_FEDGE)
ICCON_FEDGE_FALLING	(0)
ICCON_WIDTH_32		(1 << _BN_ICCON_C32)
ICCON_WIDTH_16		(0)
ICCON_SOURCE_TIMER2	(1 << _BN_ICCON_ICTMR)
ICCON_SOURCE_TIMER3	(0)
ICCON_INT_FOURTH_EVENT	(3 << _BN_ICCON_ICI)
ICCON_INT_THIRD_EVENT	(2 << _BN_ICCON_ICI)
ICCON_INT_SECOND_EVENT	(1 << _BN_ICCON_ICI)
ICCON_INT_EVERY_EVENT	(0 << _BN_ICCON_ICI)
ICCON_OVERFLOW		(1 << _BN_ICCON_ICOV)
ICCON_ICBNE			(1 << _BN_ICCON_ICBNE)
ICCON_ICM_INTERRUPT		(7 << _BN_ICCON_ICM)
ICCON_ICM_EVERY_EDGE	(6 << _BN_ICCON_ICM)
ICCON_ICM_RISING_16		(5 << _BN_ICCON_ICM)
ICCON_ICM_RISING_4		(4 << _BN_ICCON_ICM)
ICCON_ICM_RISING_EDGE	(3 << _BN_ICCON_ICM)
ICCON_ICM_FALLING_EDGE	(2 << _BN_ICCON_ICM)
ICCON_ICM_EDGE_DETECT	(1 << _BN_ICCON_ICM)
ICCON_ICM_DISABLE		(0 << _BN_ICCON_ICM)

--  This structure defines the registers for a PIC32 Output Compare.

typedef struct {
	p32_regset ocxCon;
	p32_regset ocxR;
	p32_regset ocxRs;
} p32_oc;

--  Define bits in the output compare control register

BN_OCCON_ON		15
BN_OCCON_SIDL		13
BN_OCCON_OC32		5
BN_OCCON_OCFLT		4
BN_OCCON_OCTSEL	3
BN_OCCON_OCM		0

OCCON_ON			(1 << _BN_OCCON_ON)
OCCON_OFF			(0)
OCCON_IDLE_STOP		(1 << _BN_OCCON_SIDL)
OCCON_IDLE_RUN		(0)
OCCON_MODE32		(1 << _BN_OCCON_OC32)
OCCON_MODE16		(0)
OCCON_OCFLT			(1 << _BN_OCCON_OCFLT)
OCCON_SRC_TIMER3	(1 << _BN_OCCON_OCTSEL)
OCCON_SRC_TIMER2	(0)

OCCON_PWM_FAULT_ENABLE		(7 << _BN_OCCON_OCM)
OCCON_PWM_FAULT_DISABLE		(6 << _BN_OCCON_OCM)
OCCON_PULSE_CONTINUOUS		(5 << _BN_OCCON_OCM)
OCCON_PULSE_SINGLE			(4 << _BN_OCCON_OCM)
OCCON_PULSE_TOGGLE			(3 << _BN_OCCON_OCM)
OCCON_FALLING_EDGE			(2 << _BN_OCCON_OCM)
OCCON_RISING_EDGE			(1 << _BN_OCCON_OCM)
OCCON_MODE_OFF				(0 << _BN_OCCON_OCM)

--  This structure defines the registers for a PIC32 A/D converter

typedef struct {
	p32_regset adxCon1;
	p32_regset adxCon2;
	p32_regset adxCon3;
	p32_regset adxChs;
	p32_regset adxPcfg;
	p32_regset adxCssl;
	p32_regbuf	adxBuf0;
	p32_regbuf	adxBuf1;
	p32_regbuf	adxBuf2;
	p32_regbuf	adxBuf3;
	p32_regbuf	adxBuf4;
	p32_regbuf	adxBuf5;
	p32_regbuf	adxBuf6;
	p32_regbuf	adxBuf7;
	p32_regbuf	adxBuf8;
	p32_regbuf	adxBuf9;
	p32_regbuf	adxBufA;
	p32_regbuf	adxBufB;
	p32_regbuf	adxBufC;
	p32_regbuf	adxBufD;
	p32_regbuf	adxBufE;
	p32_regbuf	adxBufF;
} p32_adc;

--  This structure defines the change notice/pull-up enable registers.

typedef struct {
	p32_regset cnCon;
	p32_regset cnEn;
	p32_regset cnPue;
} p32_cn;

--  This structure defines the registers for the PIC32 parallel master port.

typedef struct {
	p32_regset pmpCon;
	p32_regset pmpMode;
	p32_regset pmpAddr;
	p32_regset	pmpDout;
	p32_regset pmpDin;
	p32_regset	pmpAen;
	p32_regset pmpStat;
} p32_pmp;


--  ------------------------------------------------------------
-- 			Peripheral Pin Select Output Declarations
--  ------------------------------------------------------------

--  Currently, PPS is only supported in PIC32MX1xx/PIC32MX2xx/PIC32MX47X devices.

#if defined(__PIC32MX47X__)

PPS_SET_A  0x0100
PPS_SET_B  0x0200
PPS_SET_C  0x0400
PPS_SET_D  0x0800

typedef uint32_t p32_ppsout;

PPS_INPUT_BIT  (1 << 15)
PPS_OUT_MASK    0x000F
PPS_IN_MASK     0x00FF
NUMPPS_IN      51          --   This must be set to the highest PPS_IN_xxx value
NUMPPS_OUT     0b1111      --   This must be set to the highest PPS_OUT_xxx value

typedef enum {
    PPS_OUT_GPIO    = (0 + (PPS_SET_A or PPS_SET_B or PPS_SET_C or PPS_SET_D)),

    PPS_OUT_U3TX    = (0b0001 + PPS_SET_A),
    PPS_OUT_U4RTS   = (0b0010 + PPS_SET_A),
    PPS_OUT_SDO2    = (0b0110 + (PPS_SET_A  or  PPS_SET_B)),
    PPS_OUT_OC3     = (0b1011 + PPS_SET_A),
    PPS_OUT_C2OUT   = (0b1101 + PPS_SET_A),

    PPS_OUT_U2TX    = (0b0001 + PPS_SET_B),
    PPS_OUT_U1TX    = (0b0011 + PPS_SET_B),
    PPS_OUT_U5RTS   = (0b0100 + PPS_SET_B),
    PPS_OUT_SDO1    = (0b1000 + (PPS_SET_B  or  PPS_SET_C  or  PPS_SET_D)),
    PPS_OUT_OC4     = (0b1011 + PPS_SET_B),

    PPS_OUT_U3RTS   = (0b0001 + PPS_SET_C),
    PPS_OUT_U4TX    = (0b0010 + PPS_SET_C),
    PPS_OUT_REFCLKO = (0b0011 + PPS_SET_C),
    PPS_OUT_U5TX    = (0b0100 + (PPS_SET_C  or  PPS_SET_D)),
    PPS_OUT_SS1     = (0b0111 + PPS_SET_C),
    PPS_OUT_OC5     = (0b1011 + PPS_SET_C),
    PPS_OUT_C1OUT   = (0b1101 + PPS_SET_C),

    PPS_OUT_U2RTS   = (0b0001 + PPS_SET_D),
    PPS_OUT_U1RTS   = (0b0011 + PPS_SET_D),
    PPS_OUT_SS2     = (0b0110 + PPS_SET_D),
    PPS_OUT_OC2     = (0b1011 + PPS_SET_D),
    PPS_OUT_OC1     = (0b1100 + PPS_SET_D),

    PPS_IN_INT1 = (0 + PPS_SET_D + PPS_INPUT_BIT),
    PPS_IN_INT2 = (1 + PPS_SET_C + PPS_INPUT_BIT),
    PPS_IN_INT3 = (2 + PPS_SET_A + PPS_INPUT_BIT),
    PPS_IN_INT4 = (3 + PPS_SET_B + PPS_INPUT_BIT),
    PPS_IN_T2CK = (5 + PPS_SET_A + PPS_INPUT_BIT),
    PPS_IN_T3CK = (6 + PPS_SET_D + PPS_INPUT_BIT),
    PPS_IN_T4CK = (7 + PPS_SET_C + PPS_INPUT_BIT),
    PPS_IN_T5CK = (8 + PPS_SET_B + PPS_INPUT_BIT),
    PPS_IN_IC1 = (9 + PPS_SET_D + PPS_INPUT_BIT),
    PPS_IN_IC2 = (10 + PPS_SET_C + PPS_INPUT_BIT),
    PPS_IN_IC3 = (11 + PPS_SET_A + PPS_INPUT_BIT),
    PPS_IN_IC4 = (12 + PPS_SET_B + PPS_INPUT_BIT),
    PPS_IN_IC5 = (13 + PPS_SET_C + PPS_INPUT_BIT),
    PPS_IN_OCFA = (17 + PPS_SET_D + PPS_INPUT_BIT),
    PPS_IN_U1RX = (19 + PPS_SET_A + PPS_INPUT_BIT),
    PPS_IN_U1CTS = (20 + PPS_SET_C + PPS_INPUT_BIT),
    PPS_IN_U2RX = (21 + PPS_SET_A + PPS_INPUT_BIT),
    PPS_IN_U2CTS = (22 + PPS_SET_C + PPS_INPUT_BIT),
    PPS_IN_U3RX = (23 + PPS_SET_B + PPS_INPUT_BIT),
    PPS_IN_U3CTS = (24 + PPS_SET_D + PPS_INPUT_BIT),
    PPS_IN_U4RX = (25 + PPS_SET_D + PPS_INPUT_BIT),
    PPS_IN_U4CTS = (26 + PPS_SET_B + PPS_INPUT_BIT),
    PPS_IN_U5RX = (27 + PPS_SET_D + PPS_INPUT_BIT),
    PPS_IN_U5CTS = (28 + PPS_SET_A + PPS_INPUT_BIT),
    PPS_IN_SDI1 = (32 + PPS_SET_B + PPS_INPUT_BIT),
    PPS_IN_SS1 = (33 + PPS_SET_C + PPS_INPUT_BIT),
    PPS_IN_SDI2 = (35 + PPS_SET_B + PPS_INPUT_BIT),
    PPS_IN_SS2 = (36 + PPS_SET_D + PPS_INPUT_BIT),
    PPS_IN_REFCLKI = (51 + PPS_SET_A + PPS_INPUT_BIT),

} ppsFunctionType;

typedef uint32_t p32_ppsin;

PPS_RPD2 : constant Natural := ( 0 + PPS_SET_A);
PPS_RPG8 : constant Natural := ( 1 + PPS_SET_A);
PPS_RPF4 : constant Natural := ( 2 + PPS_SET_A);
PPS_RPD10 : constant Natural := ( 3 + PPS_SET_A);
PPS_RPF1 : constant Natural := ( 4 + PPS_SET_A);
PPS_RPB9 : constant Natural := ( 5 + PPS_SET_A);
PPS_RPB10 : constant Natural := ( 6 + PPS_SET_A);
PPS_RPC14 : constant Natural :=  ( 7 + PPS_SET_A);
PPS_RPB5 : constant Natural := ( 8 + PPS_SET_A);
PPS_RPC1 : constant Natural := (10 + PPS_SET_A);
PPS_RPD14 : constant Natural := (11 + PPS_SET_A);
PPS_RPG1 : constant Natural := (12 + PPS_SET_A);
PPS_RPA14 : constant Natural := (13 + PPS_SET_A);
PPS_RPF2 : constant Natural := (15 + PPS_SET_A);

PPS_RPD3 : constant Natural := ( 0 + PPS_SET_B)
PPS_RPG7 : constant Natural := ( 1 + PPS_SET_B)
PPS_RPF5 : constant Natural := ( 2 + PPS_SET_B)
PPS_RPD11      ( 3 + PPS_SET_B)
PPS_RPF0 : constant Natural := ( 4 + PPS_SET_B)
PPS_RPB1 : constant Natural := ( 5 + PPS_SET_B)
PPS_RPE5 : constant Natural := ( 6 + PPS_SET_B)
PPS_RPC13      ( 7 + PPS_SET_B)
PPS_RPB3 : constant Natural := ( 8 + PPS_SET_B)
PPS_RPC4 : constant Natural := (10 + PPS_SET_B)
PPS_RPD15      (11 + PPS_SET_B)
PPS_RPG0 : constant Natural := (12 + PPS_SET_B)
PPS_RPA15      (13 + PPS_SET_B)
PPS_RPF2 : constant Natural := (14 + PPS_SET_B)
PPS_RPF7 : constant Natural := (15 + PPS_SET_B)

PPS_RPD9 : constant Natural := ( 0 + PPS_SET_C)
PPS_RPG6 : constant Natural := ( 1 + PPS_SET_C)
PPS_RPB8 : constant Natural := ( 2 + PPS_SET_C)
PPS_RPB15      ( 3 + PPS_SET_C)
PPS_RPD4 : constant Natural := ( 4 + PPS_SET_C)
PPS_RPB0 : constant Natural := ( 5 + PPS_SET_C)
PPS_RPE3 : constant Natural := ( 6 + PPS_SET_C)
PPS_RPB7 : constant Natural := ( 7 + PPS_SET_C)
PPS_RPF12      ( 9 + PPS_SET_C)
PPS_RPD12      (10 + PPS_SET_C)
PPS_RPF8 : constant Natural := (11 + PPS_SET_C)
PPS_RPC3 : constant Natural := (12 + PPS_SET_C)
PPS_RPE9 : constant Natural := (13 + PPS_SET_C)
PPS_RPB2 : constant Natural := (15 + PPS_SET_C)

PPS_RPD1 : constant Natural := ( 0 + PPS_SET_D)
PPS_RPG9 : constant Natural := ( 1 + PPS_SET_D)
PPS_RPB14      ( 2 + PPS_SET_D)
PPS_RPD0 : constant Natural := ( 3 + PPS_SET_D)
PPS_RPD8 : constant Natural := ( 4 + PPS_SET_D)
PPS_RPB6 : constant Natural := ( 5 + PPS_SET_D)
PPS_RPD5 : constant Natural := ( 6 + PPS_SET_D)
PPS_RPB2 : constant Natural := ( 7 + PPS_SET_D)
PPS_RPF3 : constant Natural := ( 8 + PPS_SET_D)
PPS_RPF13      ( 9 + PPS_SET_D)
PPS_RPF2 : constant Natural := (11 + PPS_SET_D)
PPS_RPC2 : constant Natural := (12 + PPS_SET_D)
PPS_RPE8 : constant Natural := (13 + PPS_SET_D)

PPS_RPB0R    0
PPS_RPB1R    1
PPS_RPB2R    2
PPS_RPB3R    3
PPS_RPB5R    5
PPS_RPB6R    6
PPS_RPB7R    7
PPS_RPB8R    8
PPS_RPB9R    9
PPS_RPB10R    10
PPS_RPB14R    14
PPS_RPB15R    15
PPS_RPC13R    29
PPS_RPC14R    30
PPS_RPD0R    32
PPS_RPD1R    33
PPS_RPD2R    34
PPS_RPD3R    35
PPS_RPD4R    36
PPS_RPD5R    37
PPS_RPD8R    40
PPS_RPD9R    41
PPS_RPD10R    42
PPS_RPD11R    43
PPS_RPE3R    51
PPS_RPE5R    53
PPS_RPF0R    64
PPS_RPF1R    65
PPS_RPF4R    68
PPS_RPF5R    69
PPS_RPG6R    86
PPS_RPG7R    87
PPS_RPG8R    88
PPS_RPG9R    89

--  These symbols define the values to load into a PPS input select register
--  to assign the actual input pin. The PIC32 architecture divides these values
--  into four disjoint sets. Set membership is defined as part of the value to
--  allow error checking when the pins are being mapped.

PPS_RPD2		(0 + PPS_SET_A);
PPS_RPG8		(1 + PPS_SET_A);
PPS_RPF4		(2 + PPS_SET_A);
PPS_RPD10		(3 + PPS_SET_A);
PPS_RPF1		(4 + PPS_SET_A);
PPS_RPB9		(5 + PPS_SET_A);
PPS_RPB10		(6 + PPS_SET_A);
PPS_RPC14		(7 + PPS_SET_A);
PPS_RPB5		(8 + PPS_SET_A);
--  PPS_RPXX		(9 + PPS_SET_A);
PPS_RPC1		(10 + PPS_SET_A);
PPS_RPD14		(11 + PPS_SET_A);
PPS_RPG1		(12 + PPS_SET_A);
PPS_RPA14		(13 + PPS_SET_A);
PPS_RPD6		(14 + PPS_SET_A);
--  PPS_RPXX		(15 + PPS_SET_A);

PPS_RPD3		(0 + PPS_SET_B)
PPS_RPG7		(1 + PPS_SET_B)
PPS_RPF5		(2 + PPS_SET_B)
PPS_RPD11		(3 + PPS_SET_B)
PPS_RPF0		(4 + PPS_SET_B)
PPS_RPB1		(5 + PPS_SET_B)
PPS_RPE5		(6 + PPS_SET_B)
PPS_RPC13		(7 + PPS_SET_B)
PPS_RPB3		(8 + PPS_SET_B)
--  PPS_RPXX		(9 + PPS_SET_B)
PPS_RPC4		(10 + PPS_SET_B)
PPS_RPD15		(11 + PPS_SET_B)
PPS_RPG0		(12 + PPS_SET_B)
PPS_RPA15		(13 + PPS_SET_B)
PPS_RPD7		(14 + PPS_SET_B)
--  PPS_RPXX		(15 + PPS_SET_B)

PPS_RPD9		(0 + PPS_SET_C)
PPS_RPG6		(1 + PPS_SET_C)
PPS_RPB8		(2 + PPS_SET_C)
PPS_RPB15		(3 + PPS_SET_C)
PPS_RPD4		(4 + PPS_SET_C)
PPS_RPB0		(5 + PPS_SET_C)
PPS_RPE3		(6 + PPS_SET_C)
PPS_RPB7		(7 + PPS_SET_C)
--  PPS_RPXX		(8 + PPS_SET_C)
PPS_RPF12		(9 + PPS_SET_C)
PPS_RPD12		(10 + PPS_SET_C)
PPS_RPF8		(11 + PPS_SET_C)
PPS_RPC3		(12 + PPS_SET_C)
PPS_RPE9		(13 + PPS_SET_C)
--  PPS_RPXX		(14 + PPS_SET_C)
--  PPS_RPXX		(15 + PPS_SET_C)

PPS_RPD1		(0 + PPS_SET_D)
PPS_RPG9		(1 + PPS_SET_D)
PPS_RPB14		(2 + PPS_SET_D)
PPS_RPD0		(3 + PPS_SET_D)
PPS_RPB6		(5 + PPS_SET_D)
PPS_RPD5		(6 + PPS_SET_D)
PPS_RPB2		(7 + PPS_SET_D)
PPS_RPF3		(8 + PPS_SET_D)
PPS_RPF13		(9 + PPS_SET_D)
PPS_RPF2		(11 + PPS_SET_D)
PPS_RPC2		(12 + PPS_SET_D)
PP_RPE8		(13 + PPS_SET_D)

end P32_Defs;
