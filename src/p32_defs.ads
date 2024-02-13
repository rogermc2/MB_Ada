
--  -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
--  *	p32_defs.h
--  *
--  *	chipKIT core files for PIC32
--  *		Copyright (c) 2011 by Digilent Inc.

--  *		Author: Gene Apperson
--  *		Copyright (c) 2011, Digilent Inc, All rights reserved

--  * This file contains hardware dependent symbol and data type declarations
--  * for the PIC32 microcontroller.

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

with Interfaces; use Interfaces;

package P32_Defs is

   --  #include <p32xxxx.h>
   --  #include "cpudefs.h"
   --  #include <inttypes.h>

   FLASH_SPEED_HZ : Positive := 30000000;

   --   Register Declarations
   type REGbits_t is record
      r0  : Bit;
      r1  : Bit;
      r2  : Bit;
      r3  : Bit;
      r4  : Bit;
      r5  : Bit;
      r6  : Bit;
      r7  : Bit;
      r8  : Bit;
      r9  : Bit;
      r10 : Bit;
      r11 : Bit;
      r12 : Bit;
      r13 : Bit;
      r14 : Bit;
   end record;

   --  This structure describes the register layout of the primary
   --  register, set, clear, and invert registers associated with
   --  most special function registers.

   type p32_Regset is record
      reg : uint32_t;
      clr : uint32_t;
      set : uint32_t;
      inv : uint32_t;
   end record;

   --  This structure describes the register layout for a buffer
   --  register that does't have the associated set, clear, and invert
   --  registers.

   type p32_regbuf is record
      reg  : uint32_t;
      rsv1 : uint32_t;
      rsv2 : uint32_t;
      rsv3 : uint32_t;
   end record;

   --  This structure describes the register layout of an I/O port.
   type p32_uart (Disc : p32_regset) is record
      cncon             : p32_regset;
      cnen              : p32_regset;
      cnstat            : p32_regset;

      case Disc is
         when ansel =>
            ANSELxbits : REGbits_t;
            ANSELxCLR  : REGbits_t;
            ANSELxSET  : REGbits_t;
            ANSELxINV  : REGbits_t;
         when tris =>
            TRISxbits  : REGbits_t;
            TRISxCLR   : REGbits_t;
            TRISxSET   : REGbits_t;
            TRISxINV   : REGbits_t;
         when port =>
            PORTxbits  : REGbits_t;
            PORTxCLR   : REGbits_t;
            PORTxSET   : REGbits_t;
            PORTxINV   : REGbits_t;
         when lat =>
            LATxbits   : REGbits_t;
            LATxCLR    : REGbits_t;
            LATxSET    : REGbits_t;
            LATxINV    : REGbits_t;
         when odc =>
            ODCxbits   : REGbits_t;
            ODCxCLR    : REGbits_t;
            ODCxSET    : REGbits_t;
            ODCxINV    : REGbits_t;
         when cnpu =>
            CNPUxbits  : REGbits_t;
            CNPUxCLR   : REGbits_t;
            CNPUxSET   : REGbits_t;
            CNPUxINV   : REGbits_t;
         when cnpd =>
            CNPDxbits  : REGbits_t;
            CNPDxCLR   : REGbits_t;
            CNPDxSET   : REGbits_t;
            CNPDxINV   : REGbits_t;
      end case;
   end record;

   --  This structure defines the registers for a PIC32 UART.
   type p32_uart (Disc : U1MODEbits_t) is record
      uxTx  : p32_regbuf;
      uxRx  : p32_regbuf;
      uxBrg : p32_regbuf;
      case Disc is
         when uartMode =>
            uxMode : p32_regset;
         when uartSta =>
            uxSta  : p32_regset;
      end case;
   end record;

   --  UxMODE - Define bits in UART mode port
   UARTMODE_ON    : constant Natural:= 15;
   UARTMODE_BRGH  : constant Natural:= 3;
   UARTMODE_PDSEL : constant Natural:= 1;

   --  UxSTA - Define bits in UART status/control register
   UARTSTA_ADM_EN : constant Natural:= 24;
   UARTSTA_ADDR   : constant Natural:= 16;
   UARTSTA_URXEN  : constant Natural:= 12;
   UARTSTA_UTXEN  : constant Natural:= 10;
   UARTSTA_UTXBF  : constant Natural:= 9;
   UARTSTA_TMRT   : constant Natural:= 8;
   UARTSTA_ADDEN  : constant Natural:= 5;

   --  Structure for the registers of a PIC32 SPI controller
   type p32_spi  (Disc : SPI2CONbits_t) is record
      sxBuf : p32_regset;
      sxBrg : p32_regset;
      case Disc is
         when spiCon =>
            sxCon  : p32_regset;
         when   spiStat =>
            sxStat : p32_regset;
      end case;
   end record;

   -- 	SPIxCON - Define bits in the SPI control port
   SPICON_ON     : constant Natural:= 15;
   SPICON_MODE32 : constant Natural:= 11;
   SPICON_MODE16 : constant Natural:= 10;
   SPICON_SMP    : constant Natural:= 9;
   SPICON_CKE    : constant Natural:= 8;
   SPICON_CKP    : constant Natural:= 6;
   SPICON_MSTEN  : constant Natural:= 5;

   --	SPIxSTAT - Define symbols in the SPI status port
   SPISTAT_SPIROV : constant Natural := 6;
   SPISTAT_SPIRBE : constant Natural := 5;
   SPISTAT_SPITBE : constant Natural := 3;
   SPISTAT_SPITBF : constant Natural := 1;
   SPISTAT_SPIRBF : constant Natural := 0;

   --  This structure defines the registers for a PIC32 I2C port.
   type p32_i2c (Disc : I2C1CONbits_t) is record
      ixAdd: p32_regset;
      ixMsk: p32_regset;
      ixBrg: p32_regset;
      ixTrn: p32_regset;
      ixRcv: p32_regset;
      case Disc is
      when  i2cCon =>
         ixCon : p32_regset;
      when i2cStat=>
         ixStat: p32_regset;
      end case;
   end record;

   --  I2CxCON - Define symbols for the I2C control port bits

   I2CCON_ON : constant Natural := 15;
   I2CCON_SIDL : constant Natural := 13;
   I2CCON_SCLREL : constant Natural := 12;
   I2CCON_STRICT : constant Natural := 11;
   I2CCON_A10M : constant Natural := 10;
   I2CCON_DISSLW : constant Natural := 9;
   I2CCON_SMEN : constant Natural := 8;
   I2CCON_GCEN : constant Natural := 7;
   I2CCON_STREN : constant Natural := 6;
   I2CCON_ACKDT : constant Natural := 5;
   I2CCON_ACKEN : constant Natural := 4;
   I2CCON_RCEN : constant Natural := 3;
   I2CCON_PEN : constant Natural := 2;
   I2CCON_RSEN : constant Natural := 1;
   I2CCON_SEN : constant Natural := 0;

   --  I2CSTAT - Define symbols for the I2C status port bits
   I2CSTAT_ACKSTAT : constant Natural := 15;
   I2CSTAT_TRSTAT  : constant Natural := 14;
   I2CSTAT_BCL     : constant Natural := 10;
   I2CSTAT_GCSTAT  : constant Natural := 9;
   I2CSTAT_ADD10   : constant Natural := 8;
   I2CSTAT_IWCOL   : constant Natural := 7;
   I2CSTAT_I2COV   : constant Natural := 6;
   I2CSTAT_DA      : constant Natural := 5;
   I2CSTAT_P       : constant Natural := 4;
   I2CSTAT_S       : constant Natural := 3;
   I2CSTAT_RW      : constant Natural := 2;
   I2CSTAT_RBF     : constant Natural := 1;
   I2CSTAT_TBF     : constant Natural := 0;

   --  This structure defines the registers for a PIC32 Timer.
   type p32_timer is record
      tmxCon : p32_regset;
      tmxTmr : p32_regset;
      tmxPr  : p32_regset;
   end record;

   --  Define bits in the timer control register.
   --  Type A timers (timer1) have different control bits
   --  than Type B timers (timer2 - timer5)

   --   Type A timer -
   BN_TACON_ON    : constant Natural := 15;
   BN_TACON_FRZ   : constant Natural := 14;
   BN_TACON_SIDL  : constant Natural := 13;
   BN_TACON_TWDIS : constant Natural := 12;
   BN_TACON_TWIP  : constant Natural := 11;
   BN_TACON_TGATE : constant Natural := 7;
   BN_TACON_TCKPS : constant Natural := 4;
   BN_TACON_TSYNC : constant Natural := 2;
   BN_TACON_TCS   : constant Natural := 1;

   TACON_ON	       : constant Natural := 2 * BN_TACON_ON;
   TACON_OFF	      : constant Natural := 0;
   TACON_FRZ_ON    : constant Natural := 2 * BN_TACON_FRZ;
   TACON_FRZ_OFF   : constant Natural := 0;
   TACON_IDLE_STOP : constant Natural := 2 * BN_TACON_SIDL;
   TACON_IDLE_RUN  : constant Natural := 0;
   TACON_TWDIS_ON  : constant Natural := 2 * BN_TACON_TWDIS;
   TACON_TWDIS_OFF : constant Natural := 0;
   TACON_TWIP	     : constant Natural := 2 * BN_TACON_TGATE;
   TACON_TGATE_OFF : constant Natural := 0;
   TACON_TSYNC_ON  : constant Natural := 2 * BN_TACON_TSYNC;
   TACON_TSYNC_OFF : constant Natural := 0;

   TACON_SRC_INT   : constant Natural := BN_TACON_TCS;
   TACON_SRC_EXT   : constant Natural := 2 * BN_TACON_TCS;

   TACON_PS_MASK   : constant Natural := 8* BN_TACON_TCKPS;
   TACON_PS_1	     : constant Natural := BN_TACON_TCKPS;
   TACON_PS_8	     : constant Natural := 2 * BN_TACON_TCKPS;
   TACON_PS_64	    : constant Natural := 4 * BN_TACON_TCKPS;
   TACON_PS_256    : constant Natural := 8 * BN_TACON_TCKPS;

   --   Type B timer - Timer2-Timer5
   BN_TBCON_ON    : constant Natural := 15;
   BN_TBCON_FRZ   : constant Natural := 14;
   BN_TBCON_SIDL  : constant Natural := 13;
   BN_TBCON_TGATE : constant Natural := 7;
   BN_TBCON_TCKPS : constant Natural := 4;
   BN_TBCON_T32   : constant Natural := 3;
   BN_TBCON_TCS   : constant Natural := 1;

   TBCON_ON        : constant Natural := 2 * BN_TBCON_ON;
   TBCON_OFF       : constant Natural := 0;
   TBCON_FRZ_ON    : constant Natural := 2 * BN_TBCON_FRZ;
   TBCON_FRZ_OFF   : constant Natural := 0;
   TBCON_IDLE_STOP : constant Natural := 2 * BN_TBCON_SIDL;
   TBCON_IDLE_RUN  : constant Natural := 0;
   TBCON_TGATE_ON  : constant Natural := 2 * BN_TBCON_TGATE;
   TBCON_TGATE_OFF : constant Natural := 0;

   TBCON_PS_MASK : constant Natural := 128 * BN_TBCON_TCKPS;
   TBCON_PS_1	   : constant Natural := BN_TBCON_TCKPS;
   TBCON_PS_2	   : constant Natural := 2 * BN_TBCON_TCKPS;
   TBCON_PS_4	   : constant Natural := 4 * BN_TBCON_TCKPS;
   TBCON_PS_8	   : constant Natural := 8 * BN_TBCON_TCKPS;
   TBCON_PS_16	  : constant Natural := 16 * BN_TBCON_TCKPS;
   TBCON_PS_32	  : constant Natural := 32 * BN_TBCON_TCKPS;
   TBCON_PS_64	  : constant Natural := 64 * BN_TBCON_TCKPS;
   TBCON_PS_256  : constant Natural := 128 * BN_TBCON_TCKPS;

   TBCON_MODE32  : constant Natural := 2 * BN_TBCON_T32;
   TBCON_MODE16  : constant Natural := 0;
   TBCON_SRC_EXT : constant Natural := 2 * BN_TBCON_TCS;
   TBCON_SRC_INT : constant Natural := 0;

   --  This structure defines the registers for a PIC32 Input Capture.
   type p32_ic is record
      icxCon : p32_regset;
      icxBuf : p32_regset;
   end record;

   --  Define bits in the incput capture control register
   BN_ICCON_ON    : constant Natural := 15;
   BN_ICCON_FRZ   : constant Natural := 14;
   BN_ICCON_SIDL  : constant Natural := 13;
   BN_ICCON_FEDGE : constant Natural := 9;
   BN_ICCON_C32   : constant Natural := 8;
   BN_ICCON_ICTMR : constant Natural := 7;
   BN_ICCON_ICI   : constant Natural := 5;
   BN_ICCON_ICOV  : constant Natural:= 4;
   BN_ICCON_ICBNE : constant Natural:= 3;
   BN_ICCON_ICM   : constant Natural:= 0;

   ICCON_ON	                : constant Natural := 2 * BN_ICCON_ON;
   ICCON_OFF	               : constant Natural := 0;
   ICCON_FRZ_ON             : constant Natural := 2 * BN_ICCON_FRZ;
   ICCON_FRZ_OFF            : constant Natural := 0;
   ICCON_IDLE_STOP          : constant Natural := 2 * BN_ICCON_SIDL;
   ICCON_IDLE_RUN           : constant Natural := 0;
   ICCON_FEDGE_RISING       : constant Natural := 2 * BN_ICCON_FEDGE;
   ICCON_FEDGE_FALLING      : constant Natural :=0;
   ICCON_WIDTH_32           : constant Natural := 2 * BN_ICCON_C32;
   ICCON_WIDTH_16           : constant Natural := 0;
   ICCON_SOURCE_TIMER2      : constant Natural := 2 * BN_ICCON_ICTMR;
   ICCON_SOURCE_TIMER3      : constant Natural := 0;
   ICCON_INT_FOURTH_EVENT   : constant Natural := 8 * BN_ICCON_ICI;
   ICCON_INT_THIRD_EVENT    : constant Natural := 4 * BN_ICCON_ICI;
   ICCON_INT_SECOND_EVENT   : constant Natural := 2 * BN_ICCON_ICI;
   ICCON_INT_EVERY_EVENT    : constant Natural := BN_ICCON_ICI;
   ICCON_OVERFLOW           : constant Natural := 2 * BN_ICCON_ICOV;
   ICCON_ICBNE	             : constant Natural := 2 * BN_ICCON_ICBNE;
   ICCON_ICM_INTERRUPT      : constant Natural := 128 * BN_ICCON_ICM;
   ICCON_ICM_EVERY_EDGE     : constant Natural := 64 * N_ICCON_ICM;
   ICCON_ICM_RISING_16      : constant Natural := 32 * BN_ICCON_ICM;
   ICCON_ICM_RISING_4       : constant Natural := 16 * BN_ICCON_ICM;
   ICCON_ICM_RISING_EDGE    : constant Natural := 8 * BN_ICCON_ICM;
   ICCON_ICM_FALLING_EDGE   : constant Natural := 4 * BN_ICCON_ICM;
   ICCON_ICM_EDGE_DETECT    : constant Natural := 2 * BN_ICCON_ICM;
   ICCON_ICM_DISABLE        : constant Natura := BN_ICCON_ICM;

   --  This structure defines the registers for a PIC32 Output Compare.
   type p32_oc is record
      ocxCon : p32_regset;
      ocxR   : p32_regset;
      ocxRs  : p32_regset;
   end record;

   --  Define bits in the output compare control register
   BN_OCCON_ON     : constant Natura := 15;
   BN_OCCON_SIDL   : constant Natura := 13;
   BN_OCCON_OC32   : constant Natura := 5;
   BN_OCCON_OCFLT  : constant Natura := 4;
   BN_OCCON_OCTSEL : constant Natura := 3;
   BN_OCCON_OCM    : constant Natura := 0;

   OCCON_ON	        : constant Natural := 2 * BN_OCCON_ON;
   OCCON_OFF	       : constant Natural := 0;
   OCCON_IDLE_STOP  : constant Natural := 2 * BN_OCCON_SIDL;
   OCCON_IDLE_RUN   : constant Natural := 0;
   OCCON_MODE32     : constant Natural := 2 * BN_OCCON_OC32;
   OCCON_MODE16     : constant Natural := 0;
   OCCON_OCFLT	     : constant Natural := 2 * BN_OCCON_OCFLT;
   OCCON_SRC_TIMER3 : constant Natural := 2 * BN_OCCON_OCTSEL;
   OCCON_SRC_TIMER2 : constant Natural := 0;

   OCCON_PWM_FAULT_ENABLE    : constant Natural := 128 * BN_OCCON_OCM;
   OCCON_PWM_FAULT_DISABLE   : constant Natural := 64 * BN_OCCON_OCM;
   OCCON_PULSE_CONTINUOUS    : constant Natural := 32 * BN_OCCON_OCM;
   OCCON_PULSE_SINGLE	       : constant Natural := 16 * BN_OCCON_OCM;
   OCCON_PULSE_TOGGLE	       : constant Natural := 8 * BN_OCCON_OCM;
   OCCON_FALLING_EDGE	       : constant Natural := 4 * BN_OCCON_OCM;
   OCCON_RISING_EDGE	        : constant Natural := 2 * BN_OCCON_OCM;
   OCCON_MODE_OFF	           : constant Natural := BN_OCCON_OCM;

   --  This structure defines the registers for a PIC32 A/D converter
   type p32_adc is record
      adxCon1 : p32_regset;
      adxCon2 : p32_regset;
      adxCon3 : p32_regset;
      adxChs  : p32_regset;
      adxPcfg : p32_regset;
      adxCssl : p32_regset;
      adxBuf0 : p32_regbuf;
      adxBuf1 : p32_regbuf;
      adxBuf2 : p32_regbuf;
      adxBuf3 : p32_regbuf;
      adxBuf4 : p32_regbuf;
      adxBuf5 : p32_regbuf;
      adxBuf6 : p32_regbuf;
      adxBuf7 : p32_regbuf;
      adxBuf8 : p32_regbuf;
      adxBuf9 : p32_regbuf;
      adxBufA : p32_regbuf;
      adxBufB : p32_regbuf;
      adxBufC : p32_regbuf;
      adxBufD : p32_regbuf;
      adxBufE : p32_regbuf;
      adxBufF : p32_regbuf;
   end record;

   --  This structure defines the change notice/pull-up enable registers.
   type p32_cn is record
      cnCon : p32_regset;
      cnEn  : p32_regset;
      cnPue : p32_regset;
   end record;

   --  This structure defines the registers for the PIC32 parallel master port.
   type p32_pmp is record
         pmpCon : p32_regset;
         pmpMode : p32_regset;
         pmpAddr : p32_regset;
         pmpDout : p32_regset;
         pmpDin : p32_regset;
         pmpAen : p32_regset;
         pmpStat : p32_regset;
      end record;

      --  Peripheral Pin Select Output Declarations
      PPS_SET_A : constant Unsigned_32 := 16#0100#;
      PPS_SET_B : constant Unsigned_32 := 16#0200#;
      PPS_SET_C : constant Unsigned_32 := 16#0400#;
      PPS_SET_D : constant Unsigned_32 := 16#0800#;

      subtype p32_ppsout is uint32_t;

      PPS_INPUT_BIT : Unsigned_16 := 16#8000#;
                      PPS_OUT_MASK : constant Unsigned_32 := 16#000F#;
                      PPS_IN_MASK  : constant Unsigned_32 := 16#00FF#;
                      NUMPPS_IN    : constant Unsigned_32 := 51;          --   This must be set to the highest PPS_IN_xxx value
                        NUMPPS_OUT : constant Unsigned_32 := 2#1111#;      --   This must be set to the highest PPS_OUT_xxx value

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

                      PPS_RPD2  : constant Natural := ( 0 + PPS_SET_A);
                      PPS_RPG8  : constant Natural := ( 1 + PPS_SET_A);
                      PPS_RPF4  : constant Natural := ( 2 + PPS_SET_A);
                      PPS_RPD10 : constant Natural := ( 3 + PPS_SET_A);
                      PPS_RPF1  : constant Natural := ( 4 + PPS_SET_A);
                      PPS_RPB9  : constant Natural := ( 5 + PPS_SET_A);
                      PPS_RPB10 : constant Natural := ( 6 + PPS_SET_A);
                      PPS_RPC14 : constant Natural :=  ( 7 + PPS_SET_A);
                      PPS_RPB5  : constant Natural := ( 8 + PPS_SET_A);
                      PPS_RPC1  : constant Natural := (10 + PPS_SET_A);
                      PPS_RPD14 : constant Natural := (11 + PPS_SET_A);
                      PPS_RPG1  : constant Natural := (12 + PPS_SET_A);
                      PPS_RPA14 : constant Natural := (13 + PPS_SET_A);
                      PPS_RPF2  : constant Natural := (15 + PPS_SET_A);

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

                        PPS_RPD2 : constant Natural := (0 + PPS_SET_A);
                      PPS_RPG8 : constant Natural := (1 + PPS_SET_A);
                      PPS_RPF4 : constant Natural := (2 + PPS_SET_A);
                      PPS_RPD10 : constant Natural := (3 + PPS_SET_A);
                      PPS_RPF1 : constant Natural := (4 + PPS_SET_A);
                      PPS_RPB9 : constant Natural := (5 + PPS_SET_A);
                      PPS_RPB10 : constant Natural := (6 + PPS_SET_A);
                      PPS_RPC14 : constant Natural := (7 + PPS_SET_A);
                      PPS_RPB5 : constant Natural := (8 + PPS_SET_A);
                      --  PPS_RPXX : constant Natural := (9 + PPS_SET_A);
                      PPS_RPC1 : constant Natural := (10 + PPS_SET_A);
                      PPS_RPD14 : constant Natural := (11 + PPS_SET_A);
                      PPS_RPG1 : constant Natural := (12 + PPS_SET_A);
                      PPS_RPA14 : constant Natural := (13 + PPS_SET_A);
                      PPS_RPD6 : constant Natural := (14 + PPS_SET_A);
                      --  PPS_RPXX : constant Natural := (15 + PPS_SET_A);

                      PPS_RPD3 : constant Natural := (0 + PPS_SET_B)
                        PPS_RPG7 : constant Natural := (1 + PPS_SET_B)
                        PPS_RPF5 : constant Natural := (2 + PPS_SET_B)
                        PPS_RPD11 : constant Natural := (3 + PPS_SET_B)
                        PPS_RPF0 : constant Natural := (4 + PPS_SET_B)
                        PPS_RPB1 : constant Natural := (5 + PPS_SET_B)
                        PPS_RPE5 : constant Natural := (6 + PPS_SET_B)
                        PPS_RPC13 : constant Natural := (7 + PPS_SET_B)
                        PPS_RPB3 : constant Natural := (8 + PPS_SET_B)
                      --  PPS_RPXX : constant Natural := (9 + PPS_SET_B)
                        PPS_RPC4 : constant Natural := (10 + PPS_SET_B)
                        PPS_RPD15 : constant Natural := (11 + PPS_SET_B)
                        PPS_RPG0 : constant Natural := (12 + PPS_SET_B)
                        PPS_RPA15 : constant Natural := (13 + PPS_SET_B)
                        PPS_RPD7 : constant Natural := (14 + PPS_SET_B)
                      --  PPS_RPXX : constant Natural := (15 + PPS_SET_B)

                        PPS_RPD9 : constant Natural := (0 + PPS_SET_C)
                        PPS_RPG6 : constant Natural := (1 + PPS_SET_C)
                        PPS_RPB8 : constant Natural := (2 + PPS_SET_C)
                        PPS_RPB15 : constant Natural := (3 + PPS_SET_C)
                        PPS_RPD4 : constant Natural := (4 + PPS_SET_C)
                        PPS_RPB0 : constant Natural := (5 + PPS_SET_C)
                        PPS_RPE3 : constant Natural := (6 + PPS_SET_C)
                        PPS_RPB7 : constant Natural := (7 + PPS_SET_C)
                      --  PPS_RPXX : constant Natural := (8 + PPS_SET_C)
                        PPS_RPF12 : constant Natural := (9 + PPS_SET_C)
                        PPS_RPD12 : constant Natural := (10 + PPS_SET_C)
                        PPS_RPF8 : constant Natural := (11 + PPS_SET_C)
                        PPS_RPC3 : constant Natural := (12 + PPS_SET_C)
                        PPS_RPE9 : constant Natural := (13 + PPS_SET_C)
                      --  PPS_RPXX : constant Natural := (14 + PPS_SET_C)
                      --  PPS_RPXX : constant Natural := (15 + PPS_SET_C)

                        PPS_RPD1 : constant Natural := (0 + PPS_SET_D)
                        PPS_RPG9 : constant Natural := (1 + PPS_SET_D)
                        PPS_RPB14 : constant Natural := (2 + PPS_SET_D)
                        PPS_RPD0 : constant Natural := (3 + PPS_SET_D)
                        PPS_RPB6 : constant Natural := (5 + PPS_SET_D)
                        PPS_RPD5 : constant Natural := (6 + PPS_SET_D)
                        PPS_RPB2 : constant Natural := (7 + PPS_SET_D)
                        PPS_RPF3 : constant Natural := (8 + PPS_SET_D)
                        PPS_RPF13 : constant Natural := (9 + PPS_SET_D)
                        PPS_RPF2 : constant Natural := (11 + PPS_SET_D)
                        PPS_RPC2 : constant Natural := (12 + PPS_SET_D)
                        PP_RPE8 : constant Natural := (13 + PPS_SET_D)

                      end P32_Defs;
