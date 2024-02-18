/*-------------------------------------------------------------------------
 * PIC32MX470F512H processor header
 *
 * This software is developed by Microchip Technology Inc. and its
 * subsidiaries ("Microchip").
 * 
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted provided that the following conditions are 
 * met:
 * 
 * 1.      Redistributions of source code must retain the above copyright
 *         notice, this list of conditions and the following disclaimer.
 * 2.      Redistributions in binary form must reproduce the above 
 *         copyright notice, this list of conditions and the following 
 *         disclaimer in the documentation and/or other materials provided 
 *         with the distribution.
 * 3.      Microchip's name may not be used to endorse or promote products
 *         derived from this software without specific prior written 
 *         permission.
 * 
 * THIS SOFTWARE IS PROVIDED BY MICROCHIP "AS IS" AND ANY EXPRESS OR IMPLIED
 * WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF
 * MERCHANTABILITY AND FITNESS FOR PURPOSE ARE DISCLAIMED. IN NO EVENT 
 * SHALL MICROCHIP BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL,
 * EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING BUT NOT LIMITED TO
 * PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA OR PROFITS;
 * OR BUSINESS INTERRUPTION) HOWSOEVER CAUSED AND ON ANY THEORY OF LIABILITY,
 * WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR 
 * OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF
 * ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 * 
 *-------------------------------------------------------------------------*/
//#ifndef __32MX470F512H_H
//#define __32MX470F512H_H

//#if defined (__LANGUAGE_C__) || defined (__LANGUAGE_C_PLUS_PLUS)

//#ifdef __cplusplus
//"C" {
//#endif

volatile unsigned int WDTCON;
typedef union {
  struct {
    unsigned WDTCLR:1;
    unsigned WDTWINEN:1;
    unsigned SWDTPS:5;
    unsigned :8;
    unsigned ON:1;
  };
  struct {
    unsigned :2;
    unsigned SWDTPS0:1;
    unsigned SWDTPS1:1;
    unsigned SWDTPS2:1;
    unsigned SWDTPS3:1;
    unsigned SWDTPS4:1;
  };
  struct {
    unsigned :2;
    unsigned WDTPSTA:5;
  };
  struct {
    unsigned :2;
    unsigned WDTPS:5;
  };
  struct {
    unsigned w:32;
  };
} __WDTCONbits_t;
volatile __WDTCONbits_t WDTCONbits __asm__ ("WDTCON");
volatile unsigned int        WDTCONCLR;
volatile unsigned int        WDTCONSET;
volatile unsigned int        WDTCONINV;
volatile unsigned int        RTCCON;
typedef union {
  struct {
    unsigned RTCOE:1;
    unsigned HALFSEC:1;
    unsigned RTCSYNC:1;
    unsigned RTCWREN:1;
    unsigned :2;
    unsigned RTCCLKON:1;
    unsigned RTSECSEL:1;
    unsigned :5;
    unsigned SIDL:1;
    unsigned :1;
    unsigned ON:1;
    unsigned CAL:10;
  };
  struct {
    unsigned w:32;
  };
} __RTCCONbits_t;
volatile __RTCCONbits_t RTCCONbits __asm__ ("RTCCON");
volatile unsigned int        RTCCONCLR;
volatile unsigned int        RTCCONSET;
volatile unsigned int        RTCCONINV;
volatile unsigned int        RTCALRM;
typedef union {
  struct {
    unsigned ARPT:8;
    unsigned AMASK:4;
    unsigned ALRMSYNC:1;
    unsigned PIV:1;
    unsigned CHIME:1;
    unsigned ALRMEN:1;
  };
  struct {
    unsigned w:32;
  };
} __RTCALRMbits_t;
volatile __RTCALRMbits_t RTCALRMbits __asm__ ("RTCALRM");
volatile unsigned int        RTCALRMCLR;
volatile unsigned int        RTCALRMSET;
volatile unsigned int        RTCALRMINV;
volatile unsigned int        RTCTIME;
typedef union {
  struct {
    unsigned :8;
    unsigned SEC01:4;
    unsigned SEC10:4;
    unsigned MIN01:4;
    unsigned MIN10:4;
    unsigned HR01:4;
    unsigned HR10:4;
  };
  struct {
    unsigned w:32;
  };
} __RTCTIMEbits_t;
volatile __RTCTIMEbits_t RTCTIMEbits __asm__ ("RTCTIME");
volatile unsigned int        RTCTIMECLR;
volatile unsigned int        RTCTIMESET;
volatile unsigned int        RTCTIMEINV;
volatile unsigned int        RTCDATE;
typedef union {
  struct {
    unsigned WDAY01:4;
    unsigned :4;
    unsigned DAY01:4;
    unsigned DAY10:4;
    unsigned MONTH01:4;
    unsigned MONTH10:4;
    unsigned YEAR01:4;
    unsigned YEAR10:4;
  };
  struct {
    unsigned w:32;
  };
} __RTCDATEbits_t;
volatile __RTCDATEbits_t RTCDATEbits __asm__ ("RTCDATE");
volatile unsigned int        RTCDATECLR;
volatile unsigned int        RTCDATESET;
volatile unsigned int        RTCDATEINV;
volatile unsigned int        ALRMTIME;
typedef union {
  struct {
    unsigned :8;
    unsigned SEC01:4;
    unsigned SEC10:4;
    unsigned MIN01:4;
    unsigned MIN10:4;
    unsigned HR01:4;
    unsigned HR10:4;
  };
  struct {
    unsigned w:32;
  };
} __ALRMTIMEbits_t;
volatile __ALRMTIMEbits_t ALRMTIMEbits __asm__ ("ALRMTIME");
volatile unsigned int        ALRMTIMECLR;
volatile unsigned int        ALRMTIMESET;
volatile unsigned int        ALRMTIMEINV;
volatile unsigned int        ALRMDATE;
typedef union {
  struct {
    unsigned WDAY01:4;
    unsigned :4;
    unsigned DAY01:4;
    unsigned DAY10:4;
    unsigned MONTH01:4;
    unsigned MONTH10:4;
  };
  struct {
    unsigned w:32;
  };
} __ALRMDATEbits_t;
volatile __ALRMDATEbits_t ALRMDATEbits __asm__ ("ALRMDATE");
volatile unsigned int        ALRMDATECLR;
volatile unsigned int        ALRMDATESET;
volatile unsigned int        ALRMDATEINV;
volatile unsigned int        T1CON;
typedef union {
  struct {
    unsigned :1;
    unsigned TCS:1;
    unsigned TSYNC:1;
    unsigned :1;
    unsigned TCKPS:2;
    unsigned :1;
    unsigned TGATE:1;
    unsigned :3;
    unsigned TWIP:1;
    unsigned TWDIS:1;
    unsigned SIDL:1;
    unsigned :1;
    unsigned ON:1;
  };
  struct {
    unsigned :4;
    unsigned TCKPS0:1;
    unsigned TCKPS1:1;
  };
  struct {
    unsigned :13;
    unsigned TSIDL:1;
    unsigned :1;
    unsigned TON:1;
  };
  struct {
    unsigned w:32;
  };
} __T1CONbits_t;
volatile __T1CONbits_t T1CONbits __asm__ ("T1CON");
volatile unsigned int        T1CONCLR;
volatile unsigned int        T1CONSET;
volatile unsigned int        T1CONINV;
volatile unsigned int        TMR1;
volatile unsigned int        TMR1CLR;
volatile unsigned int        TMR1SET;
volatile unsigned int        TMR1INV;
volatile unsigned int        PR1;
volatile unsigned int        PR1CLR;
volatile unsigned int        PR1SET;
volatile unsigned int        PR1INV;
volatile unsigned int        T2CON;
typedef union {
  struct {
    unsigned :1;
    unsigned TCS:1;
    unsigned :1;
    unsigned T32:1;
    unsigned TCKPS:3;
    unsigned TGATE:1;
    unsigned :5;
    unsigned SIDL:1;
    unsigned :1;
    unsigned ON:1;
  };
  struct {
    unsigned :4;
    unsigned TCKPS0:1;
    unsigned TCKPS1:1;
    unsigned TCKPS2:1;
  };
  struct {
    unsigned :13;
    unsigned TSIDL:1;
    unsigned :1;
    unsigned TON:1;
  };
  struct {
    unsigned w:32;
  };
} __T2CONbits_t;
volatile __T2CONbits_t T2CONbits __asm__ ("T2CON");
volatile unsigned int        T2CONCLR;
volatile unsigned int        T2CONSET;
volatile unsigned int        T2CONINV;
volatile unsigned int        TMR2;
volatile unsigned int        TMR2CLR;
volatile unsigned int        TMR2SET;
volatile unsigned int        TMR2INV;
volatile unsigned int        PR2;
volatile unsigned int        PR2CLR;
volatile unsigned int        PR2SET;
volatile unsigned int        PR2INV;
volatile unsigned int        T3CON;
typedef union {
  struct {
    unsigned :1;
    unsigned TCS:1;
    unsigned :1;
    unsigned T32:1;
    unsigned TCKPS:3;
    unsigned TGATE:1;
    unsigned :5;
    unsigned SIDL:1;
    unsigned :1;
    unsigned ON:1;
  };
  struct {
    unsigned :4;
    unsigned TCKPS0:1;
    unsigned TCKPS1:1;
    unsigned TCKPS2:1;
  };
  struct {
    unsigned :13;
    unsigned TSIDL:1;
    unsigned :1;
    unsigned TON:1;
  };
  struct {
    unsigned w:32;
  };
} __T3CONbits_t;
volatile __T3CONbits_t T3CONbits __asm__ ("T3CON");
volatile unsigned int        T3CONCLR;
volatile unsigned int        T3CONSET;
volatile unsigned int        T3CONINV;
volatile unsigned int        TMR3;
volatile unsigned int        TMR3CLR;
volatile unsigned int        TMR3SET;
volatile unsigned int        TMR3INV;
volatile unsigned int        PR3;
volatile unsigned int        PR3CLR;
volatile unsigned int        PR3SET;
volatile unsigned int        PR3INV;
volatile unsigned int        T4CON;
typedef union {
  struct {
    unsigned :1;
    unsigned TCS:1;
    unsigned :1;
    unsigned T32:1;
    unsigned TCKPS:3;
    unsigned TGATE:1;
    unsigned :5;
    unsigned SIDL:1;
    unsigned :1;
    unsigned ON:1;
  };
  struct {
    unsigned :4;
    unsigned TCKPS0:1;
    unsigned TCKPS1:1;
    unsigned TCKPS2:1;
  };
  struct {
    unsigned :13;
    unsigned TSIDL:1;
    unsigned :1;
    unsigned TON:1;
  };
  struct {
    unsigned w:32;
  };
} __T4CONbits_t;
volatile __T4CONbits_t T4CONbits __asm__ ("T4CON");
volatile unsigned int        T4CONCLR;
volatile unsigned int        T4CONSET;
volatile unsigned int        T4CONINV;
volatile unsigned int        TMR4;
volatile unsigned int        TMR4CLR;
volatile unsigned int        TMR4SET;
volatile unsigned int        TMR4INV;
volatile unsigned int        PR4;
volatile unsigned int        PR4CLR;
volatile unsigned int        PR4SET;
volatile unsigned int        PR4INV;
volatile unsigned int        T5CON;
typedef union {
  struct {
    unsigned :1;
    unsigned TCS:1;
    unsigned :1;
    unsigned T32:1;
    unsigned TCKPS:3;
    unsigned TGATE:1;
    unsigned :5;
    unsigned SIDL:1;
    unsigned :1;
    unsigned ON:1;
  };
  struct {
    unsigned :4;
    unsigned TCKPS0:1;
    unsigned TCKPS1:1;
    unsigned TCKPS2:1;
  };
  struct {
    unsigned :13;
    unsigned TSIDL:1;
    unsigned :1;
    unsigned TON:1;
  };
  struct {
    unsigned w:32;
  };
} __T5CONbits_t;
volatile __T5CONbits_t T5CONbits __asm__ ("T5CON");
volatile unsigned int        T5CONCLR;
volatile unsigned int        T5CONSET;
volatile unsigned int        T5CONINV;
volatile unsigned int        TMR5;
volatile unsigned int        TMR5CLR;
volatile unsigned int        TMR5SET;
volatile unsigned int        TMR5INV;
volatile unsigned int        PR5;
volatile unsigned int        PR5CLR;
volatile unsigned int        PR5SET;
volatile unsigned int        PR5INV;
volatile unsigned int        IC1CON;
typedef union {
  struct {
    unsigned ICM:3;
    unsigned ICBNE:1;
    unsigned ICOV:1;
    unsigned ICI:2;
    unsigned ICTMR:1;
    unsigned C32:1;
    unsigned FEDGE:1;
    unsigned :3;
    unsigned SIDL:1;
    unsigned :1;
    unsigned ON:1;
  };
  struct {
    unsigned ICM0:1;
    unsigned ICM1:1;
    unsigned ICM2:1;
    unsigned :2;
    unsigned ICI0:1;
    unsigned ICI1:1;
  };
  struct {
    unsigned :13;
    unsigned ICSIDL:1;
  };
  struct {
    unsigned w:32;
  };
} __IC1CONbits_t;
volatile __IC1CONbits_t IC1CONbits __asm__ ("IC1CON");
volatile unsigned int        IC1CONCLR;
volatile unsigned int        IC1CONSET;
volatile unsigned int        IC1CONINV;
volatile unsigned int        IC1BUF;
volatile unsigned int        IC2CON;
typedef union {
  struct {
    unsigned ICM:3;
    unsigned ICBNE:1;
    unsigned ICOV:1;
    unsigned ICI:2;
    unsigned ICTMR:1;
    unsigned C32:1;
    unsigned FEDGE:1;
    unsigned :3;
    unsigned SIDL:1;
    unsigned :1;
    unsigned ON:1;
  };
  struct {
    unsigned ICM0:1;
    unsigned ICM1:1;
    unsigned ICM2:1;
    unsigned :2;
    unsigned ICI0:1;
    unsigned ICI1:1;
  };
  struct {
    unsigned :13;
    unsigned ICSIDL:1;
  };
  struct {
    unsigned w:32;
  };
} __IC2CONbits_t;
volatile __IC2CONbits_t IC2CONbits __asm__ ("IC2CON");
volatile unsigned int        IC2CONCLR;
volatile unsigned int        IC2CONSET;
volatile unsigned int        IC2CONINV;
volatile unsigned int        IC2BUF;
volatile unsigned int        IC3CON;
typedef union {
  struct {
    unsigned ICM:3;
    unsigned ICBNE:1;
    unsigned ICOV:1;
    unsigned ICI:2;
    unsigned ICTMR:1;
    unsigned C32:1;
    unsigned FEDGE:1;
    unsigned :3;
    unsigned SIDL:1;
    unsigned :1;
    unsigned ON:1;
  };
  struct {
    unsigned ICM0:1;
    unsigned ICM1:1;
    unsigned ICM2:1;
    unsigned :2;
    unsigned ICI0:1;
    unsigned ICI1:1;
  };
  struct {
    unsigned :13;
    unsigned ICSIDL:1;
  };
  struct {
    unsigned w:32;
  };
} __IC3CONbits_t;
volatile __IC3CONbits_t IC3CONbits __asm__ ("IC3CON");
volatile unsigned int        IC3CONCLR;
volatile unsigned int        IC3CONSET;
volatile unsigned int        IC3CONINV;
volatile unsigned int        IC3BUF;
volatile unsigned int        IC4CON;
typedef union {
  struct {
    unsigned ICM:3;
    unsigned ICBNE:1;
    unsigned ICOV:1;
    unsigned ICI:2;
    unsigned ICTMR:1;
    unsigned C32:1;
    unsigned FEDGE:1;
    unsigned :3;
    unsigned SIDL:1;
    unsigned :1;
    unsigned ON:1;
  };
  struct {
    unsigned ICM0:1;
    unsigned ICM1:1;
    unsigned ICM2:1;
    unsigned :2;
    unsigned ICI0:1;
    unsigned ICI1:1;
  };
  struct {
    unsigned :13;
    unsigned ICSIDL:1;
  };
  struct {
    unsigned w:32;
  };
} __IC4CONbits_t;
volatile __IC4CONbits_t IC4CONbits __asm__ ("IC4CON");
volatile unsigned int        IC4CONCLR;
volatile unsigned int        IC4CONSET;
volatile unsigned int        IC4CONINV;
volatile unsigned int        IC4BUF;
volatile unsigned int        IC5CON;
typedef union {
  struct {
    unsigned ICM:3;
    unsigned ICBNE:1;
    unsigned ICOV:1;
    unsigned ICI:2;
    unsigned ICTMR:1;
    unsigned C32:1;
    unsigned FEDGE:1;
    unsigned :3;
    unsigned SIDL:1;
    unsigned :1;
    unsigned ON:1;
  };
  struct {
    unsigned ICM0:1;
    unsigned ICM1:1;
    unsigned ICM2:1;
    unsigned :2;
    unsigned ICI0:1;
    unsigned ICI1:1;
  };
  struct {
    unsigned :13;
    unsigned ICSIDL:1;
  };
  struct {
    unsigned w:32;
  };
} __IC5CONbits_t;
volatile __IC5CONbits_t IC5CONbits __asm__ ("IC5CON");
volatile unsigned int        IC5CONCLR;
volatile unsigned int        IC5CONSET;
volatile unsigned int        IC5CONINV;
volatile unsigned int        IC5BUF;
volatile unsigned int        OC1CON;
typedef union {
  struct {
    unsigned OCM:3;
    unsigned OCTSEL:1;
    unsigned OCFLT:1;
    unsigned OC32:1;
    unsigned :7;
    unsigned SIDL:1;
    unsigned :1;
    unsigned ON:1;
  };
  struct {
    unsigned OCM0:1;
    unsigned OCM1:1;
    unsigned OCM2:1;
  };
  struct {
    unsigned :13;
    unsigned OCSIDL:1;
  };
  struct {
    unsigned w:32;
  };
} __OC1CONbits_t;
volatile __OC1CONbits_t OC1CONbits __asm__ ("OC1CON");
volatile unsigned int        OC1CONCLR;
volatile unsigned int        OC1CONSET;
volatile unsigned int        OC1CONINV;
volatile unsigned int        OC1R;
volatile unsigned int        OC1RCLR;
volatile unsigned int        OC1RSET;
volatile unsigned int        OC1RINV;
volatile unsigned int        OC1RS;
volatile unsigned int        OC1RSCLR;
volatile unsigned int        OC1RSSET;
volatile unsigned int        OC1RSINV;
volatile unsigned int        OC2CON;
typedef union {
  struct {
    unsigned OCM:3;
    unsigned OCTSEL:1;
    unsigned OCFLT:1;
    unsigned OC32:1;
    unsigned :7;
    unsigned SIDL:1;
    unsigned :1;
    unsigned ON:1;
  };
  struct {
    unsigned OCM0:1;
    unsigned OCM1:1;
    unsigned OCM2:1;
  };
  struct {
    unsigned :13;
    unsigned OCSIDL:1;
  };
  struct {
    unsigned w:32;
  };
} __OC2CONbits_t;
volatile __OC2CONbits_t OC2CONbits __asm__ ("OC2CON");
volatile unsigned int        OC2CONCLR;
volatile unsigned int        OC2CONSET;
volatile unsigned int        OC2CONINV;
volatile unsigned int        OC2R;
volatile unsigned int        OC2RCLR;
volatile unsigned int        OC2RSET;
volatile unsigned int        OC2RINV;
volatile unsigned int        OC2RS;
volatile unsigned int        OC2RSCLR;
volatile unsigned int        OC2RSSET;
volatile unsigned int        OC2RSINV;
volatile unsigned int        OC3CON;
typedef union {
  struct {
    unsigned OCM:3;
    unsigned OCTSEL:1;
    unsigned OCFLT:1;
    unsigned OC32:1;
    unsigned :7;
    unsigned SIDL:1;
    unsigned :1;
    unsigned ON:1;
  };
  struct {
    unsigned OCM0:1;
    unsigned OCM1:1;
    unsigned OCM2:1;
  };
  struct {
    unsigned :13;
    unsigned OCSIDL:1;
  };
  struct {
    unsigned w:32;
  };
} __OC3CONbits_t;
volatile __OC3CONbits_t OC3CONbits __asm__ ("OC3CON");
volatile unsigned int        OC3CONCLR;
volatile unsigned int        OC3CONSET;
volatile unsigned int        OC3CONINV;
volatile unsigned int        OC3R;
volatile unsigned int        OC3RCLR;
volatile unsigned int        OC3RSET;
volatile unsigned int        OC3RINV;
volatile unsigned int        OC3RS;
volatile unsigned int        OC3RSCLR;
volatile unsigned int        OC3RSSET;
volatile unsigned int        OC3RSINV;
volatile unsigned int        OC4CON;
typedef union {
  struct {
    unsigned OCM:3;
    unsigned OCTSEL:1;
    unsigned OCFLT:1;
    unsigned OC32:1;
    unsigned :7;
    unsigned SIDL:1;
    unsigned :1;
    unsigned ON:1;
  };
  struct {
    unsigned OCM0:1;
    unsigned OCM1:1;
    unsigned OCM2:1;
  };
  struct {
    unsigned :13;
    unsigned OCSIDL:1;
  };
  struct {
    unsigned w:32;
  };
} __OC4CONbits_t;
volatile __OC4CONbits_t OC4CONbits __asm__ ("OC4CON");
volatile unsigned int        OC4CONCLR;
volatile unsigned int        OC4CONSET;
volatile unsigned int        OC4CONINV;
volatile unsigned int        OC4R;
volatile unsigned int        OC4RCLR;
volatile unsigned int        OC4RSET;
volatile unsigned int        OC4RINV;
volatile unsigned int        OC4RS;
volatile unsigned int        OC4RSCLR;
volatile unsigned int        OC4RSSET;
volatile unsigned int        OC4RSINV;
volatile unsigned int        OC5CON;
typedef union {
  struct {
    unsigned OCM:3;
    unsigned OCTSEL:1;
    unsigned OCFLT:1;
    unsigned OC32:1;
    unsigned :7;
    unsigned SIDL:1;
    unsigned :1;
    unsigned ON:1;
  };
  struct {
    unsigned OCM0:1;
    unsigned OCM1:1;
    unsigned OCM2:1;
  };
  struct {
    unsigned :13;
    unsigned OCSIDL:1;
  };
  struct {
    unsigned w:32;
  };
} __OC5CONbits_t;
volatile __OC5CONbits_t OC5CONbits __asm__ ("OC5CON");
volatile unsigned int        OC5CONCLR;
volatile unsigned int        OC5CONSET;
volatile unsigned int        OC5CONINV;
volatile unsigned int        OC5R;
volatile unsigned int        OC5RCLR;
volatile unsigned int        OC5RSET;
volatile unsigned int        OC5RINV;
volatile unsigned int        OC5RS;
volatile unsigned int        OC5RSCLR;
volatile unsigned int        OC5RSSET;
volatile unsigned int        OC5RSINV;
volatile unsigned int        I2C1111CON;
typedef union {
  struct {
    unsigned SEN:1;
    unsigned RSEN:1;
    unsigned PEN:1;
    unsigned RCEN:1;
    unsigned ACKEN:1;
    unsigned ACKDT:1;
    unsigned STREN:1;
    unsigned GCEN:1;
    unsigned SMEN:1;
    unsigned DISSLW:1;
    unsigned A10M:1;
    unsigned STRICT:1;
    unsigned SCLREL:1;
    unsigned SIDL:1;
    unsigned :1;
    unsigned ON:1;
  };
  struct {
    unsigned :11;
    unsigned IPMIEN:1;
    unsigned :1;
    unsigned I2CSIDL:1;
    unsigned :1;
    unsigned I2CEN:1;
  };
  struct {
    unsigned w:32;
  };
} __I2C1111CONbits_t;
volatile __I2C1111CONbits_t I2C1111CONbits __asm__ ("I2C1111CON");
volatile unsigned int        I2C1CON;
typedef union {
  struct {
    unsigned SEN:1;
    unsigned RSEN:1;
    unsigned PEN:1;
    unsigned RCEN:1;
    unsigned ACKEN:1;
    unsigned ACKDT:1;
    unsigned STREN:1;
    unsigned GCEN:1;
    unsigned SMEN:1;
    unsigned DISSLW:1;
    unsigned A10M:1;
    unsigned STRICT:1;
    unsigned SCLREL:1;
    unsigned SIDL:1;
    unsigned :1;
    unsigned ON:1;
  };
  struct {
    unsigned :11;
    unsigned IPMIEN:1;
    unsigned :1;
    unsigned I2CSIDL:1;
    unsigned :1;
    unsigned I2CEN:1;
  };
  struct {
    unsigned w:32;
  };
} __I2C1CONbits_t;
volatile __I2C1CONbits_t I2C1CONbits __asm__ ("I2C1CON");
volatile unsigned int        I2C1111CONCLR;
volatile unsigned int        I2C1CONCLR;
volatile unsigned int        I2C1111CONSET;
volatile unsigned int        I2C1CONSET;
volatile unsigned int        I2C1111CONINV;
volatile unsigned int        I2C1CONINV;
volatile unsigned int        I2C1111STAT;
typedef union {
  struct {
    unsigned TBF:1;
    unsigned RBF:1;
    unsigned R_W:1;
    unsigned S:1;
    unsigned P:1;
    unsigned D_A:1;
    unsigned I2COV:1;
    unsigned IWCOL:1;
    unsigned ADD10:1;
    unsigned GCSTAT:1;
    unsigned BCL:1;
    unsigned :3;
    unsigned TRSTAT:1;
    unsigned ACKSTAT:1;
  };
  struct {
    unsigned :6;
    unsigned I2CPOV:1;
  };
  struct {
    unsigned w:32;
  };
} __I2C1111STATbits_t;
volatile __I2C1111STATbits_t I2C1111STATbits __asm__ ("I2C1111STAT");
volatile unsigned int        I2C1STAT;
typedef union {
  struct {
    unsigned TBF:1;
    unsigned RBF:1;
    unsigned R_W:1;
    unsigned S:1;
    unsigned P:1;
    unsigned D_A:1;
    unsigned I2COV:1;
    unsigned IWCOL:1;
    unsigned ADD10:1;
    unsigned GCSTAT:1;
    unsigned BCL:1;
    unsigned :3;
    unsigned TRSTAT:1;
    unsigned ACKSTAT:1;
  };
  struct {
    unsigned :6;
    unsigned I2CPOV:1;
  };
  struct {
    unsigned w:32;
  };
} __I2C1STATbits_t;
volatile __I2C1STATbits_t I2C1STATbits __asm__ ("I2C1STAT");
volatile unsigned int        I2C1111STATCLR;
volatile unsigned int        I2C1STATCLR;
volatile unsigned int        I2C1111STATSET;
volatile unsigned int        I2C1STATSET;
volatile unsigned int        I2C1111STATINV;
volatile unsigned int        I2C1STATINV;
volatile unsigned int        I2C1111ADD;
volatile unsigned int        I2C1ADD;
volatile unsigned int        I2C1111ADDCLR;
volatile unsigned int        I2C1ADDCLR;
volatile unsigned int        I2C1111ADDSET;
volatile unsigned int        I2C1ADDSET;
volatile unsigned int        I2C1111ADDINV;
volatile unsigned int        I2C1ADDINV;
volatile unsigned int        I2C1111MSK;
volatile unsigned int        I2C1MSK;
volatile unsigned int        I2C1111MSKCLR;
volatile unsigned int        I2C1MSKCLR;
volatile unsigned int        I2C1111MSKSET;
volatile unsigned int        I2C1MSKSET;
volatile unsigned int        I2C1111MSKINV;
volatile unsigned int        I2C1MSKINV;
volatile unsigned int        I2C1111BRG;
volatile unsigned int        I2C1BRG;
volatile unsigned int        I2C1111BRGCLR;
volatile unsigned int        I2C1BRGCLR;
volatile unsigned int        I2C1111BRGSET;
volatile unsigned int        I2C1BRGSET;
volatile unsigned int        I2C1111BRGINV;
volatile unsigned int        I2C1BRGINV;
volatile unsigned int        I2C1111TRN;
volatile unsigned int        I2C1TRN;
volatile unsigned int        I2C1111TRNCLR;
volatile unsigned int        I2C1TRNCLR;
volatile unsigned int        I2C1111TRNSET;
volatile unsigned int        I2C1TRNSET;
volatile unsigned int        I2C1111TRNINV;
volatile unsigned int        I2C1TRNINV;
volatile unsigned int        I2C1111RCV;
volatile unsigned int        I2C1RCV;
volatile unsigned int        I2C2CON;
typedef union {
  struct {
    unsigned SEN:1;
    unsigned RSEN:1;
    unsigned PEN:1;
    unsigned RCEN:1;
    unsigned ACKEN:1;
    unsigned ACKDT:1;
    unsigned STREN:1;
    unsigned GCEN:1;
    unsigned SMEN:1;
    unsigned DISSLW:1;
    unsigned A10M:1;
    unsigned STRICT:1;
    unsigned SCLREL:1;
    unsigned SIDL:1;
    unsigned :1;
    unsigned ON:1;
  };
  struct {
    unsigned :11;
    unsigned IPMIEN:1;
    unsigned :1;
    unsigned I2CSIDL:1;
    unsigned :1;
    unsigned I2CEN:1;
  };
  struct {
    unsigned w:32;
  };
} __I2C2CONbits_t;
volatile __I2C2CONbits_t I2C2CONbits __asm__ ("I2C2CON");
volatile unsigned int        I2CABCON;
typedef union {
  struct {
    unsigned SEN:1;
    unsigned RSEN:1;
    unsigned PEN:1;
    unsigned RCEN:1;
    unsigned ACKEN:1;
    unsigned ACKDT:1;
    unsigned STREN:1;
    unsigned GCEN:1;
    unsigned SMEN:1;
    unsigned DISSLW:1;
    unsigned A10M:1;
    unsigned STRICT:1;
    unsigned SCLREL:1;
    unsigned SIDL:1;
    unsigned :1;
    unsigned ON:1;
  };
  struct {
    unsigned :11;
    unsigned IPMIEN:1;
    unsigned :1;
    unsigned I2CSIDL:1;
    unsigned :1;
    unsigned I2CEN:1;
  };
  struct {
    unsigned w:32;
  };
} __I2CABCONbits_t;
volatile __I2CABCONbits_t I2CABCONbits __asm__ ("I2CABCON");
volatile unsigned int        I2C2CONCLR;
volatile unsigned int        I2CABCONCLR;
volatile unsigned int        I2C2CONSET;
volatile unsigned int        I2CABCONSET;
volatile unsigned int        I2C2CONINV;
volatile unsigned int        I2CABCONINV;
volatile unsigned int        I2C2STAT;
typedef union {
  struct {
    unsigned TBF:1;
    unsigned RBF:1;
    unsigned R_W:1;
    unsigned S:1;
    unsigned P:1;
    unsigned D_A:1;
    unsigned I2COV:1;
    unsigned IWCOL:1;
    unsigned ADD10:1;
    unsigned GCSTAT:1;
    unsigned BCL:1;
    unsigned :3;
    unsigned TRSTAT:1;
    unsigned ACKSTAT:1;
  };
  struct {
    unsigned :6;
    unsigned I2CPOV:1;
  };
  struct {
    unsigned w:32;
  };
} __I2C2STATbits_t;
volatile __I2C2STATbits_t I2C2STATbits __asm__ ("I2C2STAT");
volatile unsigned int        I2CABSTAT;
typedef union {
  struct {
    unsigned TBF:1;
    unsigned RBF:1;
    unsigned R_W:1;
    unsigned S:1;
    unsigned P:1;
    unsigned D_A:1;
    unsigned I2COV:1;
    unsigned IWCOL:1;
    unsigned ADD10:1;
    unsigned GCSTAT:1;
    unsigned BCL:1;
    unsigned :3;
    unsigned TRSTAT:1;
    unsigned ACKSTAT:1;
  };
  struct {
    unsigned :6;
    unsigned I2CPOV:1;
  };
  struct {
    unsigned w:32;
  };
} __I2CABSTATbits_t;
volatile __I2CABSTATbits_t I2CABSTATbits __asm__ ("I2CABSTAT");
volatile unsigned int        I2C2STATCLR;
volatile unsigned int        I2CABSTATCLR;
volatile unsigned int        I2C2STATSET;
volatile unsigned int        I2CABSTATSET;
volatile unsigned int        I2C2STATINV;
volatile unsigned int        I2CABSTATINV;
volatile unsigned int        I2C2ADD;
volatile unsigned int        I2CABADD;
volatile unsigned int        I2C2ADDCLR;
volatile unsigned int        I2CABADDCLR;
volatile unsigned int        I2C2ADDSET;
volatile unsigned int        I2CABADDSET;
volatile unsigned int        I2C2ADDINV;
volatile unsigned int        I2CABADDINV;
volatile unsigned int        I2C2MSK;
volatile unsigned int        I2CABMSK;
volatile unsigned int        I2C2MSKCLR;
volatile unsigned int        I2CABMSKCLR;
volatile unsigned int        I2C2MSKSET;
volatile unsigned int        I2CABMSKSET;
volatile unsigned int        I2C2MSKINV;
volatile unsigned int        I2CABMSKINV;
volatile unsigned int        I2C2BRG;
volatile unsigned int        I2CABBRG;
volatile unsigned int        I2C2BRGCLR;
volatile unsigned int        I2CABBRGCLR;
volatile unsigned int        I2C2BRGSET;
volatile unsigned int        I2CABBRGSET;
volatile unsigned int        I2C2BRGINV;
volatile unsigned int        I2CABBRGINV;
volatile unsigned int        I2C2TRN;
volatile unsigned int        I2CABTRN;
volatile unsigned int        I2C2TRNCLR;
volatile unsigned int        I2CABTRNCLR;
volatile unsigned int        I2C2TRNSET;
volatile unsigned int        I2CABTRNSET;
volatile unsigned int        I2C2TRNINV;
volatile unsigned int        I2CABTRNINV;
volatile unsigned int        I2C2RCV;
volatile unsigned int        I2CABRCV;
volatile unsigned int        SPI1CON;
typedef union {
  struct {
    unsigned SRXISEL:2;
    unsigned STXISEL:2;
    unsigned DISSDI:1;
    unsigned MSTEN:1;
    unsigned CKP:1;
    unsigned SSEN:1;
    unsigned CKE:1;
    unsigned SMP:1;
    unsigned MODE16:1;
    unsigned MODE32:1;
    unsigned DISSDO:1;
    unsigned SIDL:1;
    unsigned :1;
    unsigned ON:1;
    unsigned ENHBUF:1;
    unsigned SPIFE:1;
    unsigned :5;
    unsigned MCLKSEL:1;
    unsigned FRMCNT:3;
    unsigned FRMSYPW:1;
    unsigned MSSEN:1;
    unsigned FRMPOL:1;
    unsigned FRMSYNC:1;
    unsigned FRMEN:1;
  };
  struct {
    unsigned w:32;
  };
} __SPI1CONbits_t;
volatile __SPI1CONbits_t SPI1CONbits __asm__ ("SPI1CON");
volatile unsigned int        SPI1CONCLR;
volatile unsigned int        SPI1CONSET;
volatile unsigned int        SPI1CONINV;
volatile unsigned int        SPI1STAT;
typedef union {
  struct {
    unsigned SPIRBF:1;
    unsigned SPITBF:1;
    unsigned :1;
    unsigned SPITBE:1;
    unsigned :1;
    unsigned SPIRBE:1;
    unsigned SPIROV:1;
    unsigned SRMT:1;
    unsigned SPITUR:1;
    unsigned :2;
    unsigned SPIBUSY:1;
    unsigned FRMERR:1;
    unsigned :3;
    unsigned TXBUFELM:5;
    unsigned :3;
    unsigned RXBUFELM:5;
  };
  struct {
    unsigned w:32;
  };
} __SPI1STATbits_t;
volatile __SPI1STATbits_t SPI1STATbits __asm__ ("SPI1STAT");
volatile unsigned int        SPI1STATCLR;
volatile unsigned int        SPI1STATSET;
volatile unsigned int        SPI1STATINV;
volatile unsigned int        SPI1BUF;
volatile unsigned int        SPI1BRG;
volatile unsigned int        SPI1BRGCLR;
volatile unsigned int        SPI1BRGSET;
volatile unsigned int        SPI1BRGINV;
volatile unsigned int        SPI1CON2;
typedef union {
  struct {
    unsigned AUDMOD:2;
    unsigned :1;
    unsigned AUDMONO:1;
    unsigned :3;
    unsigned AUDEN:1;
    unsigned IGNTUR:1;
    unsigned IGNROV:1;
    unsigned SPITUREN:1;
    unsigned SPIROVEN:1;
    unsigned FRMERREN:1;
    unsigned :2;
    unsigned SPISGNEXT:1;
  };
  struct {
    unsigned AUDMOD0:1;
    unsigned AUDMOD1:1;
  };
  struct {
    unsigned w:32;
  };
} __SPI1CON2bits_t;
volatile __SPI1CON2bits_t SPI1CON2bits __asm__ ("SPI1CON2");
volatile unsigned int        SPI1CON2CLR;
volatile unsigned int        SPI1CON2SET;
volatile unsigned int        SPI1CON2INV;
volatile unsigned int        SPI2CON;
typedef union {
  struct {
    unsigned SRXISEL:2;
    unsigned STXISEL:2;
    unsigned DISSDI:1;
    unsigned MSTEN:1;
    unsigned CKP:1;
    unsigned SSEN:1;
    unsigned CKE:1;
    unsigned SMP:1;
    unsigned MODE16:1;
    unsigned MODE32:1;
    unsigned DISSDO:1;
    unsigned SIDL:1;
    unsigned :1;
    unsigned ON:1;
    unsigned ENHBUF:1;
    unsigned SPIFE:1;
    unsigned :5;
    unsigned MCLKSEL:1;
    unsigned FRMCNT:3;
    unsigned FRMSYPW:1;
    unsigned MSSEN:1;
    unsigned FRMPOL:1;
    unsigned FRMSYNC:1;
    unsigned FRMEN:1;
  };
  struct {
    unsigned w:32;
  };
} __SPI2CONbits_t;
volatile __SPI2CONbits_t SPI2CONbits __asm__ ("SPI2CON");
volatile unsigned int        SPI2CONCLR;
volatile unsigned int        SPI2CONSET;
volatile unsigned int        SPI2CONINV;
unsigned int  SPI2STAT;
typedef union {
  struct {
    unsigned SPIRBF:1;
    unsigned SPITBF:1;
    unsigned :1;
    unsigned SPITBE:1;
    unsigned :1;
    unsigned SPIRBE:1;
    unsigned SPIROV:1;
    unsigned SRMT:1;
    unsigned SPITUR:1;
    unsigned :2;
    unsigned SPIBUSY:1;
    unsigned FRMERR:1;
    unsigned :3;
    unsigned TXBUFELM:5;
    unsigned :3;
    unsigned RXBUFELM:5;
  };
  struct {
    unsigned w:32;
  };
} __SPI2STATbits_t;
volatile __SPI2STATbits_t SPI2STATbits __asm__ ("SPI2STAT");
volatile unsigned int SPI2STATCLR;
volatile unsigned int SPI2STATSET;
volatile unsigned int SPI2STATINV;
unsigned int SPI2BUF;
volatile unsigned int SPI2BRG;
volatile unsigned int SPI2BRGCLR;
volatile unsigned int SPI2BRGSET;
volatile unsigned int SPI2BRGINV;
volatile unsigned int SPI2CON2;
typedef union {
  struct {
    unsigned AUDMOD:2;
    unsigned :1;
    unsigned AUDMONO:1;
    unsigned :3;
    unsigned AUDEN:1;
    unsigned IGNTUR:1;
    unsigned IGNROV:1;
    unsigned SPITUREN:1;
    unsigned SPIROVEN:1;
    unsigned FRMERREN:1;
    unsigned :2;
    unsigned SPISGNEXT:1;
  };
  struct {
    unsigned AUDMOD0:1;
    unsigned AUDMOD1:1;
  };
  struct {
    unsigned w:32;
  };
} __SPI2CON2bits_t;
volatile __SPI2CON2bits_t SPI2CON2bits __asm__ ("SPI2CON2");
volatile unsigned int        SPI2CON2CLR;
volatile unsigned int        SPI2CON2SET;
volatile unsigned int        SPI2CON2INV;
volatile unsigned int        U1MODE;
typedef union {
  struct {
    unsigned STSEL:1;
    unsigned PDSEL:2;
    unsigned BRGH:1;
    unsigned RXINV:1;
    unsigned ABAUD:1;
    unsigned LPBACK:1;
    unsigned WAKE:1;
    unsigned UEN:2;
    unsigned :1;
    unsigned RTSMD:1;
    unsigned IREN:1;
    unsigned SIDL:1;
    unsigned :1;
    unsigned ON:1;
  };
  struct {
    unsigned :1;
    unsigned PDSEL0:1;
    unsigned PDSEL1:1;
    unsigned :5;
    unsigned UEN0:1;
    unsigned UEN1:1;
  };
  struct {
    unsigned :13;
    unsigned USIDL:1;
    unsigned :1;
    unsigned UARTEN:1;
  };
  struct {
    unsigned w:32;
  };
} __U1MODEbits_t;
volatile __U1MODEbits_t U1MODEbits __asm__ ("U1MODE");
volatile unsigned int        UDCMODE;
typedef union {
  struct {
    unsigned STSEL:1;
    unsigned PDSEL:2;
    unsigned BRGH:1;
    unsigned RXINV:1;
    unsigned ABAUD:1;
    unsigned LPBACK:1;
    unsigned WAKE:1;
    unsigned UEN:2;
    unsigned :1;
    unsigned RTSMD:1;
    unsigned IREN:1;
    unsigned SIDL:1;
    unsigned :1;
    unsigned ON:1;
  };
  struct {
    unsigned :1;
    unsigned PDSEL0:1;
    unsigned PDSEL1:1;
    unsigned :5;
    unsigned UEN0:1;
    unsigned UEN1:1;
  };
  struct {
    unsigned :13;
    unsigned USIDL:1;
    unsigned :1;
    unsigned UARTEN:1;
  };
  struct {
    unsigned w:32;
  };
} __UDCMODEbits_t;
volatile __UDCMODEbits_t UDCMODEbits __asm__ ("UDCMODE");
volatile unsigned int        U1MODECLR;
volatile unsigned int        UDCMODECLR;
volatile unsigned int        U1MODESET;
volatile unsigned int        UDCMODESET;
volatile unsigned int        U1MODEINV;
volatile unsigned int        UDCMODEINV;
volatile unsigned int        U1STA;
typedef union {
  struct {
    unsigned URXDA:1;
    unsigned OERR:1;
    unsigned FERR:1;
    unsigned PERR:1;
    unsigned RIDLE:1;
    unsigned ADDEN:1;
    unsigned URXISEL:2;
    unsigned TRMT:1;
    unsigned UTXBF:1;
    unsigned UTXEN:1;
    unsigned UTXBRK:1;
    unsigned URXEN:1;
    unsigned UTXINV:1;
    unsigned UTXISEL:2;
    unsigned ADDR:8;
    unsigned ADM_EN:1;
  };
  struct {
    unsigned :6;
    unsigned URXISEL0:1;
    unsigned URXISEL1:1;
    unsigned :6;
    unsigned UTXISEL0:1;
    unsigned UTXISEL1:1;
  };
  struct {
    unsigned :14;
    unsigned UTXSEL:2;
  };
  struct {
    unsigned w:32;
  };
} __U1STAbits_t;
volatile __U1STAbits_t U1STAbits __asm__ ("U1STA");
volatile unsigned int        UDCSTA;
typedef union {
  struct {
    unsigned URXDA:1;
    unsigned OERR:1;
    unsigned FERR:1;
    unsigned PERR:1;
    unsigned RIDLE:1;
    unsigned ADDEN:1;
    unsigned URXISEL:2;
    unsigned TRMT:1;
    unsigned UTXBF:1;
    unsigned UTXEN:1;
    unsigned UTXBRK:1;
    unsigned URXEN:1;
    unsigned UTXINV:1;
    unsigned UTXISEL:2;
    unsigned ADDR:8;
    unsigned ADM_EN:1;
  };
  struct {
    unsigned :6;
    unsigned URXISEL0:1;
    unsigned URXISEL1:1;
    unsigned :6;
    unsigned UTXISEL0:1;
    unsigned UTXISEL1:1;
  };
  struct {
    unsigned :14;
    unsigned UTXSEL:2;
  };
  struct {
    unsigned w:32;
  };
} __UDCSTAbits_t;
volatile __UDCSTAbits_t UDCSTAbits __asm__ ("UDCSTA");
volatile unsigned int        U1STACLR;
volatile unsigned int        UDCSTACLR;
volatile unsigned int        U1STASET;
volatile unsigned int        UDCSTASET;
volatile unsigned int        U1STAINV;
volatile unsigned int        UDCSTAINV;
volatile unsigned int        U1TXREG;
volatile unsigned int        UDCTXREG;
volatile unsigned int        U1RXREG;
volatile unsigned int        UDCRXREG;
volatile unsigned int        U1BRG;
volatile unsigned int        UDCBRG;
volatile unsigned int        U1BRGCLR;
volatile unsigned int        UDCBRGCLR;
volatile unsigned int        U1BRGSET;
volatile unsigned int        UDCBRGSET;
volatile unsigned int        U1BRGINV;
volatile unsigned int        UDCBRGINV;
volatile unsigned int        U2MODE;
typedef union {
  struct {
    unsigned STSEL:1;
    unsigned PDSEL:2;
    unsigned BRGH:1;
    unsigned RXINV:1;
    unsigned ABAUD:1;
    unsigned LPBACK:1;
    unsigned WAKE:1;
    unsigned UEN:2;
    unsigned :1;
    unsigned RTSMD:1;
    unsigned IREN:1;
    unsigned SIDL:1;
    unsigned :1;
    unsigned ON:1;
  };
  struct {
    unsigned :1;
    unsigned PDSEL0:1;
    unsigned PDSEL1:1;
    unsigned :5;
    unsigned UEN0:1;
    unsigned UEN1:1;
  };
  struct {
    unsigned :13;
    unsigned USIDL:1;
    unsigned :1;
    unsigned UARTEN:1;
  };
  struct {
    unsigned w:32;
  };
} __U2MODEbits_t;
volatile __U2MODEbits_t U2MODEbits __asm__ ("U2MODE");
volatile unsigned int        U8932MODE;
typedef union {
  struct {
    unsigned STSEL:1;
    unsigned PDSEL:2;
    unsigned BRGH:1;
    unsigned RXINV:1;
    unsigned ABAUD:1;
    unsigned LPBACK:1;
    unsigned WAKE:1;
    unsigned UEN:2;
    unsigned :1;
    unsigned RTSMD:1;
    unsigned IREN:1;
    unsigned SIDL:1;
    unsigned :1;
    unsigned ON:1;
  };
  struct {
    unsigned :1;
    unsigned PDSEL0:1;
    unsigned PDSEL1:1;
    unsigned :5;
    unsigned UEN0:1;
    unsigned UEN1:1;
  };
  struct {
    unsigned :13;
    unsigned USIDL:1;
    unsigned :1;
    unsigned UARTEN:1;
  };
  struct {
    unsigned w:32;
  };
} __U8932MODEbits_t;
volatile __U8932MODEbits_t U8932MODEbits __asm__ ("U8932MODE");
volatile unsigned int        U2MODECLR;
volatile unsigned int        U8932MODECLR;
volatile unsigned int        U2MODESET;
volatile unsigned int        U8932MODESET;
volatile unsigned int        U2MODEINV;
volatile unsigned int        U8932MODEINV;
volatile unsigned int        U2STA;
typedef union {
  struct {
    unsigned URXDA:1;
    unsigned OERR:1;
    unsigned FERR:1;
    unsigned PERR:1;
    unsigned RIDLE:1;
    unsigned ADDEN:1;
    unsigned URXISEL:2;
    unsigned TRMT:1;
    unsigned UTXBF:1;
    unsigned UTXEN:1;
    unsigned UTXBRK:1;
    unsigned URXEN:1;
    unsigned UTXINV:1;
    unsigned UTXISEL:2;
    unsigned ADDR:8;
    unsigned ADM_EN:1;
  };
  struct {
    unsigned :6;
    unsigned URXISEL0:1;
    unsigned URXISEL1:1;
    unsigned :6;
    unsigned UTXISEL0:1;
    unsigned UTXISEL1:1;
  };
  struct {
    unsigned :14;
    unsigned UTXSEL:2;
  };
  struct {
    unsigned w:32;
  };
} __U2STAbits_t;
volatile __U2STAbits_t U2STAbits __asm__ ("U2STA");
volatile unsigned int        U8932STA;
typedef union {
  struct {
    unsigned URXDA:1;
    unsigned OERR:1;
    unsigned FERR:1;
    unsigned PERR:1;
    unsigned RIDLE:1;
    unsigned ADDEN:1;
    unsigned URXISEL:2;
    unsigned TRMT:1;
    unsigned UTXBF:1;
    unsigned UTXEN:1;
    unsigned UTXBRK:1;
    unsigned URXEN:1;
    unsigned UTXINV:1;
    unsigned UTXISEL:2;
    unsigned ADDR:8;
    unsigned ADM_EN:1;
  };
  struct {
    unsigned :6;
    unsigned URXISEL0:1;
    unsigned URXISEL1:1;
    unsigned :6;
    unsigned UTXISEL0:1;
    unsigned UTXISEL1:1;
  };
  struct {
    unsigned :14;
    unsigned UTXSEL:2;
  };
  struct {
    unsigned w:32;
  };
} __U8932STAbits_t;
volatile __U8932STAbits_t U8932STAbits __asm__ ("U8932STA");
volatile unsigned int        U2STACLR;
volatile unsigned int        U8932STACLR;
volatile unsigned int        U2STASET;
volatile unsigned int        U8932STASET;
volatile unsigned int        U2STAINV;
volatile unsigned int        U8932STAINV;
volatile unsigned int        U2TXREG;
volatile unsigned int        U8932TXREG;
volatile unsigned int        U2RXREG;
volatile unsigned int        U8932RXREG;
volatile unsigned int        U2BRG;
volatile unsigned int        U8932BRG;
volatile unsigned int        U2BRGCLR;
volatile unsigned int        U8932BRGCLR;
volatile unsigned int        U2BRGSET;
volatile unsigned int        U8932BRGSET;
volatile unsigned int        U2BRGINV;
volatile unsigned int        U8932BRGINV;
volatile unsigned int        U39MODE;
typedef union {
  struct {
    unsigned STSEL:1;
    unsigned PDSEL:2;
    unsigned BRGH:1;
    unsigned RXINV:1;
    unsigned ABAUD:1;
    unsigned LPBACK:1;
    unsigned WAKE:1;
    unsigned UEN:2;
    unsigned :1;
    unsigned RTSMD:1;
    unsigned IREN:1;
    unsigned SIDL:1;
    unsigned :1;
    unsigned ON:1;
  };
  struct {
    unsigned :1;
    unsigned PDSEL0:1;
    unsigned PDSEL1:1;
    unsigned :5;
    unsigned UEN0:1;
    unsigned UEN1:1;
  };
  struct {
    unsigned :13;
    unsigned USIDL:1;
    unsigned :1;
    unsigned UARTEN:1;
  };
  struct {
    unsigned w:32;
  };
} __U39MODEbits_t;
volatile __U39MODEbits_t U39MODEbits __asm__ ("U39MODE");
volatile unsigned int        U3MODE;
typedef union {
  struct {
    unsigned STSEL:1;
    unsigned PDSEL:2;
    unsigned BRGH:1;
    unsigned RXINV:1;
    unsigned ABAUD:1;
    unsigned LPBACK:1;
    unsigned WAKE:1;
    unsigned UEN:2;
    unsigned :1;
    unsigned RTSMD:1;
    unsigned IREN:1;
    unsigned SIDL:1;
    unsigned :1;
    unsigned ON:1;
  };
  struct {
    unsigned :1;
    unsigned PDSEL0:1;
    unsigned PDSEL1:1;
    unsigned :5;
    unsigned UEN0:1;
    unsigned UEN1:1;
  };
  struct {
    unsigned :13;
    unsigned USIDL:1;
    unsigned :1;
    unsigned UARTEN:1;
  };
  struct {
    unsigned w:32;
  };
} __U3MODEbits_t;
volatile __U3MODEbits_t U3MODEbits __asm__ ("U3MODE");
volatile unsigned int        U39MODECLR;
volatile unsigned int        U3MODECLR;
volatile unsigned int        U39MODESET;
volatile unsigned int        U3MODESET;
volatile unsigned int        U39MODEINV;
volatile unsigned int        U3MODEINV;
volatile unsigned int        U39STA;
typedef union {
  struct {
    unsigned URXDA:1;
    unsigned OERR:1;
    unsigned FERR:1;
    unsigned PERR:1;
    unsigned RIDLE:1;
    unsigned ADDEN:1;
    unsigned URXISEL:2;
    unsigned TRMT:1;
    unsigned UTXBF:1;
    unsigned UTXEN:1;
    unsigned UTXBRK:1;
    unsigned URXEN:1;
    unsigned UTXINV:1;
    unsigned UTXISEL:2;
    unsigned ADDR:8;
    unsigned ADM_EN:1;
  };
  struct {
    unsigned :6;
    unsigned URXISEL0:1;
    unsigned URXISEL1:1;
    unsigned :6;
    unsigned UTXISEL0:1;
    unsigned UTXISEL1:1;
  };
  struct {
    unsigned :14;
    unsigned UTXSEL:2;
  };
  struct {
    unsigned w:32;
  };
} __U39STAbits_t;
volatile __U39STAbits_t U39STAbits __asm__ ("U39STA");
volatile unsigned int        U3STA;
typedef union {
  struct {
    unsigned URXDA:1;
    unsigned OERR:1;
    unsigned FERR:1;
    unsigned PERR:1;
    unsigned RIDLE:1;
    unsigned ADDEN:1;
    unsigned URXISEL:2;
    unsigned TRMT:1;
    unsigned UTXBF:1;
    unsigned UTXEN:1;
    unsigned UTXBRK:1;
    unsigned URXEN:1;
    unsigned UTXINV:1;
    unsigned UTXISEL:2;
    unsigned ADDR:8;
    unsigned ADM_EN:1;
  };
  struct {
    unsigned :6;
    unsigned URXISEL0:1;
    unsigned URXISEL1:1;
    unsigned :6;
    unsigned UTXISEL0:1;
    unsigned UTXISEL1:1;
  };
  struct {
    unsigned :14;
    unsigned UTXSEL:2;
  };
  struct {
    unsigned w:32;
  };
} __U3STAbits_t;
volatile __U3STAbits_t U3STAbits __asm__ ("U3STA");
volatile unsigned int        U39STACLR;
volatile unsigned int        U3STACLR;
volatile unsigned int        U39STASET;
volatile unsigned int        U3STASET;
volatile unsigned int        U39STAINV;
volatile unsigned int        U3STAINV;
volatile unsigned int        U39TXREG;
volatile unsigned int        U3TXREG;
volatile unsigned int        U39RXREG;
volatile unsigned int        U3RXREG;
volatile unsigned int        U39BRG;
volatile unsigned int        U3BRG;
volatile unsigned int        U39BRGCLR;
volatile unsigned int        U3BRGCLR;
volatile unsigned int        U39BRGSET;
volatile unsigned int        U3BRGSET;
volatile unsigned int        U39BRGINV;
volatile unsigned int        U3BRGINV;
volatile unsigned int        U4MODE;
typedef union {
  struct {
    unsigned STSEL:1;
    unsigned PDSEL:2;
    unsigned BRGH:1;
    unsigned RXINV:1;
    unsigned ABAUD:1;
    unsigned LPBACK:1;
    unsigned WAKE:1;
    unsigned UEN:2;
    unsigned :1;
    unsigned RTSMD:1;
    unsigned IREN:1;
    unsigned SIDL:1;
    unsigned :1;
    unsigned ON:1;
  };
  struct {
    unsigned :1;
    unsigned PDSEL0:1;
    unsigned PDSEL1:1;
    unsigned :5;
    unsigned UEN0:1;
    unsigned UEN1:1;
  };
  struct {
    unsigned :13;
    unsigned USIDL:1;
    unsigned :1;
    unsigned UARTEN:1;
  };
  struct {
    unsigned w:32;
  };
} __U4MODEbits_t;
volatile __U4MODEbits_t U4MODEbits __asm__ ("U4MODE");
volatile unsigned int        UodMODE;
typedef union {
  struct {
    unsigned STSEL:1;
    unsigned PDSEL:2;
    unsigned BRGH:1;
    unsigned RXINV:1;
    unsigned ABAUD:1;
    unsigned LPBACK:1;
    unsigned WAKE:1;
    unsigned UEN:2;
    unsigned :1;
    unsigned RTSMD:1;
    unsigned IREN:1;
    unsigned SIDL:1;
    unsigned :1;
    unsigned ON:1;
  };
  struct {
    unsigned :1;
    unsigned PDSEL0:1;
    unsigned PDSEL1:1;
    unsigned :5;
    unsigned UEN0:1;
    unsigned UEN1:1;
  };
  struct {
    unsigned :13;
    unsigned USIDL:1;
    unsigned :1;
    unsigned UARTEN:1;
  };
  struct {
    unsigned w:32;
  };
} __UodMODEbits_t;
volatile __UodMODEbits_t UodMODEbits __asm__ ("UodMODE");
volatile unsigned int        U4MODECLR;
volatile unsigned int        UodMODECLR;
volatile unsigned int        U4MODESET;
volatile unsigned int        UodMODESET;
volatile unsigned int        U4MODEINV;
volatile unsigned int        UodMODEINV;
volatile unsigned int        U4STA;
typedef union {
  struct {
    unsigned URXDA:1;
    unsigned OERR:1;
    unsigned FERR:1;
    unsigned PERR:1;
    unsigned RIDLE:1;
    unsigned ADDEN:1;
    unsigned URXISEL:2;
    unsigned TRMT:1;
    unsigned UTXBF:1;
    unsigned UTXEN:1;
    unsigned UTXBRK:1;
    unsigned URXEN:1;
    unsigned UTXINV:1;
    unsigned UTXISEL:2;
    unsigned ADDR:8;
    unsigned ADM_EN:1;
  };
  struct {
    unsigned :6;
    unsigned URXISEL0:1;
    unsigned URXISEL1:1;
    unsigned :6;
    unsigned UTXISEL0:1;
    unsigned UTXISEL1:1;
  };
  struct {
    unsigned :14;
    unsigned UTXSEL:2;
  };
  struct {
    unsigned w:32;
  };
} __U4STAbits_t;
volatile __U4STAbits_t U4STAbits __asm__ ("U4STA");
volatile unsigned int        UodSTA;
typedef union {
  struct {
    unsigned URXDA:1;
    unsigned OERR:1;
    unsigned FERR:1;
    unsigned PERR:1;
    unsigned RIDLE:1;
    unsigned ADDEN:1;
    unsigned URXISEL:2;
    unsigned TRMT:1;
    unsigned UTXBF:1;
    unsigned UTXEN:1;
    unsigned UTXBRK:1;
    unsigned URXEN:1;
    unsigned UTXINV:1;
    unsigned UTXISEL:2;
    unsigned ADDR:8;
    unsigned ADM_EN:1;
  };
  struct {
    unsigned :6;
    unsigned URXISEL0:1;
    unsigned URXISEL1:1;
    unsigned :6;
    unsigned UTXISEL0:1;
    unsigned UTXISEL1:1;
  };
  struct {
    unsigned :14;
    unsigned UTXSEL:2;
  };
  struct {
    unsigned w:32;
  };
} __UodSTAbits_t;
volatile __UodSTAbits_t UodSTAbits __asm__ ("UodSTA");
volatile unsigned int        U4STACLR;
volatile unsigned int        UodSTACLR;
volatile unsigned int        U4STASET;
volatile unsigned int        UodSTASET;
volatile unsigned int        U4STAINV;
volatile unsigned int        UodSTAINV;
volatile unsigned int        U4TXREG;
volatile unsigned int        UodTXREG;
volatile unsigned int        U4RXREG;
volatile unsigned int        UodRXREG;
volatile unsigned int        U4BRG;
volatile unsigned int        UodBRG;
volatile unsigned int        U4BRGCLR;
volatile unsigned int        UodBRGCLR;
volatile unsigned int        U4BRGSET;
volatile unsigned int        UodBRGSET;
volatile unsigned int        U4BRGINV;
volatile unsigned int        UodBRGINV;
volatile unsigned int        PMCON;
typedef union {
  struct {
    unsigned RDSP:1;
    unsigned WRSP:1;
    unsigned :1;
    unsigned CS1P:1;
    unsigned CS2P:1;
    unsigned ALP:1;
    unsigned CSF:2;
    unsigned PTRDEN:1;
    unsigned PTWREN:1;
    unsigned PMPTTL:1;
    unsigned ADRMUX:2;
    unsigned SIDL:1;
    unsigned :1;
    unsigned ON:1;
  };
  struct {
    unsigned :6;
    unsigned CSF0:1;
    unsigned CSF1:1;
    unsigned :3;
    unsigned ADRMUX0:1;
    unsigned ADRMUX1:1;
  };
  struct {
    unsigned :13;
    unsigned PSIDL:1;
    unsigned :1;
    unsigned PMPEN:1;
  };
  struct {
    unsigned w:32;
  };
} __PMCONbits_t;
volatile __PMCONbits_t PMCONbits __asm__ ("PMCON");
volatile unsigned int        PMCONCLR;
volatile unsigned int        PMCONSET;
volatile unsigned int        PMCONINV;
volatile unsigned int        PMMODE;
typedef union {
  struct {
    unsigned WAITE:2;
    unsigned WAITM:4;
    unsigned WAITB:2;
    unsigned MODE:2;
    unsigned MODE16:1;
    unsigned INCM:2;
    unsigned IRQM:2;
    unsigned BUSY:1;
  };
  struct {
    unsigned WAITE0:1;
    unsigned WAITE1:1;
    unsigned WAITM0:1;
    unsigned WAITM1:1;
    unsigned WAITM2:1;
    unsigned WAITM3:1;
    unsigned WAITB0:1;
    unsigned WAITB1:1;
    unsigned MODE0:1;
    unsigned MODE1:1;
    unsigned :1;
    unsigned INCM0:1;
    unsigned INCM1:1;
    unsigned IRQM0:1;
    unsigned IRQM1:1;
  };
  struct {
    unsigned w:32;
  };
} __PMMODEbits_t;
volatile __PMMODEbits_t PMMODEbits __asm__ ("PMMODE");
volatile unsigned int        PMMODECLR;
volatile unsigned int        PMMODESET;
volatile unsigned int        PMMODEINV;
volatile unsigned int        PMADDR;
typedef union {
  struct {
    unsigned ADDR:14;
    unsigned CS:2;
  };
  struct {
    unsigned PADDR:14;
  };
  struct {
    unsigned :14;
    unsigned CS1:1;
    unsigned CS2:1;
  };
  struct {
    unsigned w:32;
  };
} __PMADDRbits_t;
volatile __PMADDRbits_t PMADDRbits __asm__ ("PMADDR");
volatile unsigned int        PMADDRCLR;
volatile unsigned int        PMADDRSET;
volatile unsigned int        PMADDRINV;
volatile unsigned int        PMDOUT;
typedef union {
  struct {
    unsigned DATAOUT:32;
  };
  struct {
    unsigned w:32;
  };
} __PMDOUTbits_t;
volatile __PMDOUTbits_t PMDOUTbits __asm__ ("PMDOUT");
volatile unsigned int        PMDOUTCLR;
volatile unsigned int        PMDOUTSET;
volatile unsigned int        PMDOUTINV;
volatile unsigned int        PMDIN;
typedef union {
  struct {
    unsigned DATAIN:32;
  };
  struct {
    unsigned w:32;
  };
} __PMDINbits_t;
volatile __PMDINbits_t PMDINbits __asm__ ("PMDIN");
volatile unsigned int        PMDINCLR;
volatile unsigned int        PMDINSET;
volatile unsigned int        PMDININV;
volatile unsigned int        PMAEN;
typedef union {
  struct {
    unsigned PTEN:16;
  };
  struct {
    unsigned PTEN0:1;
    unsigned PTEN1:1;
    unsigned PTEN2:1;
    unsigned PTEN3:1;
    unsigned PTEN4:1;
    unsigned PTEN5:1;
    unsigned PTEN6:1;
    unsigned PTEN7:1;
    unsigned PTEN8:1;
    unsigned PTEN9:1;
    unsigned PTEN10:1;
    unsigned PTEN11:1;
    unsigned PTEN12:1;
    unsigned PTEN13:1;
    unsigned PTEN14:1;
    unsigned PTEN15:1;
  };
  struct {
    unsigned w:32;
  };
} __PMAENbits_t;
volatile __PMAENbits_t PMAENbits __asm__ ("PMAEN");
volatile unsigned int        PMAENCLR;
volatile unsigned int        PMAENSET;
volatile unsigned int        PMAENINV;
volatile unsigned int        PMSTAT;
typedef union {
  struct {
    unsigned OB0E:1;
    unsigned OB1E:1;
    unsigned OB2E:1;
    unsigned OB3E:1;
    unsigned :2;
    unsigned OBUF:1;
    unsigned OBE:1;
    unsigned IB0F:1;
    unsigned IB1F:1;
    unsigned IB2F:1;
    unsigned IB3F:1;
    unsigned :2;
    unsigned IBOV:1;
    unsigned IBF:1;
  };
  struct {
    unsigned w:32;
  };
} __PMSTATbits_t;
volatile __PMSTATbits_t PMSTATbits __asm__ ("PMSTAT");
volatile unsigned int        PMSTATCLR;
volatile unsigned int        PMSTATSET;
volatile unsigned int        PMSTATINV;
volatile unsigned int        AD1CON1;
typedef union {
  struct {
    unsigned DONE:1;
    unsigned SAMP:1;
    unsigned ASAM:1;
    unsigned :1;
    unsigned CLRASAM:1;
    unsigned SSRC:3;
    unsigned FORM:3;
    unsigned :2;
    unsigned SIDL:1;
    unsigned :1;
    unsigned ON:1;
  };
  struct {
    unsigned :5;
    unsigned SSRC0:1;
    unsigned SSRC1:1;
    unsigned SSRC2:1;
    unsigned FORM0:1;
    unsigned FORM1:1;
    unsigned FORM2:1;
  };
  struct {
    unsigned :13;
    unsigned ADSIDL:1;
    unsigned :1;
    unsigned ADON:1;
  };
  struct {
    unsigned w:32;
  };
} __AD1CON1bits_t;
volatile __AD1CON1bits_t AD1CON1bits __asm__ ("AD1CON1");
volatile unsigned int        AD1CON1CLR;
volatile unsigned int        AD1CON1SET;
volatile unsigned int        AD1CON1INV;
volatile unsigned int        AD1CON2;
typedef union {
  struct {
    unsigned ALTS:1;
    unsigned BUFM:1;
    unsigned SMPI:4;
    unsigned :1;
    unsigned BUFS:1;
    unsigned :2;
    unsigned CSCNA:1;
    unsigned :1;
    unsigned OFFCAL:1;
    unsigned VCFG:3;
  };
  struct {
    unsigned :2;
    unsigned SMPI0:1;
    unsigned SMPI1:1;
    unsigned SMPI2:1;
    unsigned SMPI3:1;
    unsigned :7;
    unsigned VCFG0:1;
    unsigned VCFG1:1;
    unsigned VCFG2:1;
  };
  struct {
    unsigned w:32;
  };
} __AD1CON2bits_t;
volatile __AD1CON2bits_t AD1CON2bits __asm__ ("AD1CON2");
volatile unsigned int        AD1CON2CLR;
volatile unsigned int        AD1CON2SET;
volatile unsigned int        AD1CON2INV;
volatile unsigned int        AD1CON3;
typedef union {
  struct {
    unsigned ADCS:8;
    unsigned SAMC:5;
    unsigned :2;
    unsigned ADRC:1;
  };
  struct {
    unsigned ADCS0:1;
    unsigned ADCS1:1;
    unsigned ADCS2:1;
    unsigned ADCS3:1;
    unsigned ADCS4:1;
    unsigned ADCS5:1;
    unsigned ADCS6:1;
    unsigned ADCS7:1;
    unsigned SAMC0:1;
    unsigned SAMC1:1;
    unsigned SAMC2:1;
    unsigned SAMC3:1;
    unsigned SAMC4:1;
  };
  struct {
    unsigned w:32;
  };
} __AD1CON3bits_t;
volatile __AD1CON3bits_t AD1CON3bits __asm__ ("AD1CON3");
volatile unsigned int        AD1CON3CLR;
volatile unsigned int        AD1CON3SET;
volatile unsigned int        AD1CON3INV;
volatile unsigned int        AD1CHS;
typedef union {
  struct {
    unsigned :16;
    unsigned CH0SA:4;
    unsigned :3;
    unsigned CH0NA:1;
    unsigned CH0SB:4;
    unsigned :3;
    unsigned CH0NB:1;
  };
  struct {
    unsigned :16;
    unsigned CH0SA0:1;
    unsigned CH0SA1:1;
    unsigned CH0SA2:1;
    unsigned CH0SA3:1;
    unsigned :4;
    unsigned CH0SB0:1;
    unsigned CH0SB1:1;
    unsigned CH0SB2:1;
    unsigned CH0SB3:1;
  };
  struct {
    unsigned w:32;
  };
} __AD1CHSbits_t;
volatile __AD1CHSbits_t AD1CHSbits __asm__ ("AD1CHS");
volatile unsigned int        AD1CHSCLR;
volatile unsigned int        AD1CHSSET;
volatile unsigned int        AD1CHSINV;
volatile unsigned int        AD1CSSL;
typedef union {
  struct {
    unsigned CSSL:31;
  };
  struct {
    unsigned CSSL0:1;
    unsigned CSSL1:1;
    unsigned CSSL2:1;
    unsigned CSSL3:1;
    unsigned CSSL4:1;
    unsigned CSSL5:1;
    unsigned CSSL6:1;
    unsigned CSSL7:1;
    unsigned CSSL8:1;
    unsigned CSSL9:1;
    unsigned CSSL10:1;
    unsigned CSSL11:1;
    unsigned CSSL12:1;
    unsigned CSSL13:1;
    unsigned CSSL14:1;
    unsigned CSSL15:1;
    unsigned CSSL16:1;
    unsigned CSSL17:1;
    unsigned CSSL18:1;
    unsigned CSSL19:1;
    unsigned CSSL20:1;
    unsigned CSSL21:1;
    unsigned CSSL22:1;
    unsigned CSSL23:1;
    unsigned CSSL24:1;
    unsigned CSSL25:1;
    unsigned CSSL26:1;
    unsigned CSSL27:1;
    unsigned CSSL28:1;
    unsigned CSSL29:1;
    unsigned CSSL30:1;
  };
  struct {
    unsigned w:32;
  };
} __AD1CSSLbits_t;
volatile __AD1CSSLbits_t AD1CSSLbits __asm__ ("AD1CSSL");
volatile unsigned int        AD1CSSLCLR;
volatile unsigned int        AD1CSSLSET;
volatile unsigned int        AD1CSSLINV;
volatile unsigned int        ADC1BUF0;
volatile unsigned int        ADC1BUF1;
volatile unsigned int        ADC1BUF2;
volatile unsigned int        ADC1BUF3;
volatile unsigned int        ADC1BUF4;
volatile unsigned int        ADC1BUF5;
volatile unsigned int        ADC1BUF6;
volatile unsigned int        ADC1BUF7;
volatile unsigned int        ADC1BUF8;
volatile unsigned int        ADC1BUF9;
volatile unsigned int        ADC1BUFA;
volatile unsigned int        ADC1BUFB;
volatile unsigned int        ADC1BUFC;
volatile unsigned int        ADC1BUFD;
volatile unsigned int        ADC1BUFE;
volatile unsigned int        ADC1BUFF;
volatile unsigned int        CVRCON;
typedef union {
  struct {
    unsigned CVR:4;
    unsigned CVRSS:1;
    unsigned CVRR:1;
    unsigned CVROE:1;
    unsigned :1;
    unsigned BGSEL:2;
    unsigned VREFSEL:1;
    unsigned :4;
    unsigned ON:1;
  };
  struct {
    unsigned CVR0:1;
    unsigned CVR1:1;
    unsigned CVR2:1;
    unsigned CVR3:1;
    unsigned :4;
    unsigned BGSEL0:1;
    unsigned BGSEL1:1;
  };
  struct {
    unsigned w:32;
  };
} __CVRCONbits_t;
volatile __CVRCONbits_t CVRCONbits __asm__ ("CVRCON");
volatile unsigned int        CVRCONCLR;
volatile unsigned int        CVRCONSET;
volatile unsigned int        CVRCONINV;
volatile unsigned int        CM1CON;
typedef union {
  struct {
    unsigned CCH:2;
    unsigned :2;
    unsigned CREF:1;
    unsigned :1;
    unsigned EVPOL:2;
    unsigned COUT:1;
    unsigned :3;
    unsigned CLPWR:1;
    unsigned CPOL:1;
    unsigned COE:1;
    unsigned ON:1;
  };
  struct {
    unsigned CCH0:1;
    unsigned CCH1:1;
    unsigned :4;
    unsigned EVPOL0:1;
    unsigned EVPOL1:1;
  };
  struct {
    unsigned w:32;
  };
} __CM1CONbits_t;
volatile __CM1CONbits_t CM1CONbits __asm__ ("CM1CON");
volatile unsigned int        CM1CONCLR;
volatile unsigned int        CM1CONSET;
volatile unsigned int        CM1CONINV;
volatile unsigned int        CM2CON;
typedef union {
  struct {
    unsigned CCH:2;
    unsigned :2;
    unsigned CREF:1;
    unsigned :1;
    unsigned EVPOL:2;
    unsigned COUT:1;
    unsigned :3;
    unsigned CLPWR:1;
    unsigned CPOL:1;
    unsigned COE:1;
    unsigned ON:1;
  };
  struct {
    unsigned CCH0:1;
    unsigned CCH1:1;
    unsigned :4;
    unsigned EVPOL0:1;
    unsigned EVPOL1:1;
  };
  struct {
    unsigned w:32;
  };
} __CM2CONbits_t;
volatile __CM2CONbits_t CM2CONbits __asm__ ("CM2CON");
volatile unsigned int        CM2CONCLR;
volatile unsigned int        CM2CONSET;
volatile unsigned int        CM2CONINV;
volatile unsigned int        CMSTAT;
typedef union {
  struct {
    unsigned C1OUT:1;
    unsigned C2OUT:1;
    unsigned C3OUT:1;
    unsigned C4OUT:1;
    unsigned C5OUT:1;
    unsigned C6OUT:1;
    unsigned :7;
    unsigned SIDL:1;
  };
  struct {
    unsigned w:32;
  };
} __CMSTATbits_t;
volatile __CMSTATbits_t CMSTATbits __asm__ ("CMSTAT");
volatile unsigned int        CMSTATCLR;
volatile unsigned int        CMSTATSET;
volatile unsigned int        CMSTATINV;
volatile unsigned int        CTMUCON;
typedef union {
  struct {
    unsigned IRNG:2;
    unsigned ITRIM:6;
    unsigned CTTRIG:1;
    unsigned IDISSEN:1;
    unsigned EDGSEQEN:1;
    unsigned EDGEN:1;
    unsigned TGEN:1;
    unsigned CTMUSIDL:1;
    unsigned :1;
    unsigned ON:1;
    unsigned :2;
    unsigned EDG2SEL:4;
    unsigned EDG2POL:1;
    unsigned EDG2MOD:1;
    unsigned EDG1STAT:1;
    unsigned EDG2STAT:1;
    unsigned EDG1SEL:4;
    unsigned EDG1POL:1;
    unsigned EDG1MOD:1;
  };
  struct {
    unsigned w:32;
  };
} __CTMUCONbits_t;
volatile __CTMUCONbits_t CTMUCONbits __asm__ ("CTMUCON");
volatile unsigned int        CTMUCONCLR;
volatile unsigned int        CTMUCONSET;
volatile unsigned int        CTMUCONINV;
volatile unsigned int        OSCCON;
typedef union {
  struct {
    unsigned OSWEN:1;
    unsigned SOSCEN:1;
    unsigned UFRCEN:1;
    unsigned CF:1;
    unsigned SLPEN:1;
    unsigned SLOCK:1;
    unsigned ULOCK:1;
    unsigned CLKLOCK:1;
    unsigned NOSC:3;
    unsigned :1;
    unsigned COSC:3;
    unsigned :1;
    unsigned PLLMULT:3;
    unsigned PBDIV:2;
    unsigned PBDIVRDY:1;
    unsigned SOSCRDY:1;
    unsigned :1;
    unsigned FRCDIV:3;
    unsigned PLLODIV:3;
  };
  struct {
    unsigned :8;
    unsigned NOSC0:1;
    unsigned NOSC1:1;
    unsigned NOSC2:1;
    unsigned :1;
    unsigned COSC0:1;
    unsigned COSC1:1;
    unsigned COSC2:1;
    unsigned :1;
    unsigned PLLMULT0:1;
    unsigned PLLMULT1:1;
    unsigned PLLMULT2:1;
    unsigned PBDIV0:1;
    unsigned PBDIV1:1;
    unsigned :3;
    unsigned FRCDIV0:1;
    unsigned FRCDIV1:1;
    unsigned FRCDIV2:1;
    unsigned PLLODIV0:1;
    unsigned PLLODIV1:1;
    unsigned PLLODIV2:1;
  };
  struct {
    unsigned w:32;
  };
} __OSCCONbits_t;
volatile __OSCCONbits_t OSCCONbits __asm__ ("OSCCON");
volatile unsigned int        OSCCONCLR;
volatile unsigned int        OSCCONSET;
volatile unsigned int        OSCCONINV;
volatile unsigned int        OSCTUN;
typedef union {
  struct {
    unsigned TUN:6;
  };
  struct {
    unsigned TUN0:1;
    unsigned TUN1:1;
    unsigned TUN2:1;
    unsigned TUN3:1;
    unsigned TUN4:1;
    unsigned TUN5:1;
  };
  struct {
    unsigned w:32;
  };
} __OSCTUNbits_t;
volatile __OSCTUNbits_t OSCTUNbits __asm__ ("OSCTUN");
volatile unsigned int        OSCTUNCLR;
volatile unsigned int        OSCTUNSET;
volatile unsigned int        OSCTUNINV;
volatile unsigned int        REFOCON;
typedef union {
  struct {
    unsigned ROSEL:4;
    unsigned :4;
    unsigned ACTIVE:1;
    unsigned DIVSWEN:1;
    unsigned :1;
    unsigned RSLP:1;
    unsigned OE:1;
    unsigned SIDL:1;
    unsigned :1;
    unsigned ON:1;
    unsigned RODIV:15;
  };
  struct {
    unsigned w:32;
  };
} __REFOCONbits_t;
volatile __REFOCONbits_t REFOCONbits __asm__ ("REFOCON");
volatile unsigned int        REFOCONCLR;
volatile unsigned int        REFOCONSET;
volatile unsigned int        REFOCONINV;
volatile unsigned int        REFOTRIM;
typedef union {
  struct {
    unsigned :23;
    unsigned ROTRIM:9;
  };
  struct {
    unsigned w:32;
  };
} __REFOTRIMbits_t;
volatile __REFOTRIMbits_t REFOTRIMbits __asm__ ("REFOTRIM");
volatile unsigned int        REFOTRIMCLR;
volatile unsigned int        REFOTRIMSET;
volatile unsigned int        REFOTRIMINV;
volatile unsigned int        CFGCON;
typedef struct {
  unsigned TDOEN:1;
  unsigned :1;
  unsigned TROEN:1;
  unsigned JTAGEN:1;
  unsigned :8;
  unsigned PMDLOCK:1;
  unsigned IOLOCK:1;
} __CFGCONbits_t;
volatile __CFGCONbits_t CFGCONbits __asm__ ("CFGCON");
volatile unsigned int        DDPCON;
typedef struct {
  unsigned TDOEN:1;
  unsigned :1;
  unsigned TROEN:1;
  unsigned JTAGEN:1;
  unsigned :8;
  unsigned PMDLOCK:1;
  unsigned IOLOCK:1;
} __DDPCONbits_t;
volatile __DDPCONbits_t DDPCONbits __asm__ ("DDPCON");
volatile unsigned int        DEVID;
typedef struct {
  unsigned DEVID:28;
  unsigned VER:4;
} __DEVIDbits_t;
volatile __DEVIDbits_t DEVIDbits __asm__ ("DEVID");
volatile unsigned int        SYSKEY;
volatile unsigned int        SYSKEYCLR;
volatile unsigned int        SYSKEYSET;
volatile unsigned int        SYSKEYINV;
volatile unsigned int        PMD1;
typedef struct {
  unsigned AD1MD:1;
  unsigned :7;
  unsigned CTMUMD:1;
  unsigned :3;
  unsigned CVRMD:1;
} __PMD1bits_t;
volatile __PMD1bits_t PMD1bits __asm__ ("PMD1");
volatile unsigned int        PMD1CLR;
volatile unsigned int        PMD1SET;
volatile unsigned int        PMD1INV;
volatile unsigned int        PMD2;
typedef struct {
  unsigned CMP1MD:1;
  unsigned CMP2MD:1;
} __PMD2bits_t;
volatile __PMD2bits_t PMD2bits __asm__ ("PMD2");
volatile unsigned int        PMD2CLR;
volatile unsigned int        PMD2SET;
volatile unsigned int        PMD2INV;
volatile unsigned int        PMD3;
typedef struct {
  unsigned IC1MD:1;
  unsigned IC2MD:1;
  unsigned IC3MD:1;
  unsigned IC4MD:1;
  unsigned IC5MD:1;
  unsigned :11;
  unsigned OC1MD:1;
  unsigned OC2MD:1;
  unsigned OC3MD:1;
  unsigned OC4MD:1;
  unsigned OC5MD:1;
} __PMD3bits_t;
volatile __PMD3bits_t PMD3bits __asm__ ("PMD3");
volatile unsigned int        PMD3CLR;
volatile unsigned int        PMD3SET;
volatile unsigned int        PMD3INV;
volatile unsigned int        PMD4;
typedef struct {
  unsigned T1MD:1;
  unsigned T2MD:1;
  unsigned T3MD:1;
  unsigned T4MD:1;
  unsigned T5MD:1;
} __PMD4bits_t;
volatile __PMD4bits_t PMD4bits __asm__ ("PMD4");
volatile unsigned int        PMD4CLR;
volatile unsigned int        PMD4SET;
volatile unsigned int        PMD4INV;
volatile unsigned int        PMD5;
typedef struct {
  unsigned U1MD:1;
  unsigned U2MD:1;
  unsigned U3MD:1;
  unsigned U4MD:1;
  unsigned :4;
  unsigned SPI1MD:1;
  unsigned SPI2MD:1;
  unsigned :6;
  unsigned I2C1MD:1;
  unsigned I2C2MD:1;
  unsigned :6;
  unsigned USB1MD:1;
} __PMD5bits_t;
volatile __PMD5bits_t PMD5bits __asm__ ("PMD5");
volatile unsigned int        PMD5CLR;
volatile unsigned int        PMD5SET;
volatile unsigned int        PMD5INV;
volatile unsigned int        PMD6;
typedef struct {
  unsigned RTCCMD:1;
  unsigned REFOMD:1;
  unsigned :14;
  unsigned PMPMD:1;
} __PMD6bits_t;
volatile __PMD6bits_t PMD6bits __asm__ ("PMD6");
volatile unsigned int        PMD6CLR;
volatile unsigned int        PMD6SET;
volatile unsigned int        PMD6INV;
volatile unsigned int        NVMCON;
typedef union {
  struct {
    unsigned NVMOP:4;
    unsigned :7;
    unsigned LVDSTAT:1;
    unsigned LVDERR:1;
    unsigned WRERR:1;
    unsigned WREN:1;
    unsigned WR:1;
  };
  struct {
    unsigned NVMOP0:1;
    unsigned NVMOP1:1;
    unsigned NVMOP2:1;
    unsigned NVMOP3:1;
  };
  struct {
    unsigned PROGOP:4;
  };
  struct {
    unsigned PROGOP0:1;
    unsigned PROGOP1:1;
    unsigned PROGOP2:1;
    unsigned PROGOP3:1;
  };
  struct {
    unsigned w:32;
  };
} __NVMCONbits_t;
volatile __NVMCONbits_t NVMCONbits __asm__ ("NVMCON");
volatile unsigned int        NVMCONCLR;
volatile unsigned int        NVMCONSET;
volatile unsigned int        NVMCONINV;
volatile unsigned int        NVMKEY;
volatile unsigned int        NVMADDR;
volatile unsigned int        NVMADDRCLR;
volatile unsigned int        NVMADDRSET;
volatile unsigned int        NVMADDRINV;
volatile unsigned int        NVMDATA;
volatile unsigned int        NVMSRCADDR;
volatile unsigned int        RCON;
typedef union {
  struct {
    unsigned POR:1;
    unsigned BOR:1;
    unsigned IDLE:1;
    unsigned SLEEP:1;
    unsigned WDTO:1;
    unsigned :1;
    unsigned SWR:1;
    unsigned EXTR:1;
    unsigned VREGS:1;
    unsigned CMR:1;
    unsigned :19;
    unsigned HVDR:1;
  };
  struct {
    unsigned w:32;
  };
} __RCONbits_t;
volatile __RCONbits_t RCONbits __asm__ ("RCON");
volatile unsigned int        RCONCLR;
volatile unsigned int        RCONSET;
volatile unsigned int        RCONINV;
volatile unsigned int        RSWRST;
typedef union {
  struct {
    unsigned SWRST:1;
  };
  struct {
    unsigned w:32;
  };
} __RSWRSTbits_t;
volatile __RSWRSTbits_t RSWRSTbits __asm__ ("RSWRST");
volatile unsigned int        RSWRSTCLR;
volatile unsigned int        RSWRSTSET;
volatile unsigned int        RSWRSTINV;
volatile unsigned int        INT1R;
typedef struct {
  unsigned INT1R:4;
} __INT1Rbits_t;
volatile __INT1Rbits_t INT1Rbits __asm__ ("INT1R");
volatile unsigned int        INT2R;
typedef struct {
  unsigned INT2R:4;
} __INT2Rbits_t;
volatile __INT2Rbits_t INT2Rbits __asm__ ("INT2R");
volatile unsigned int        INT3R;
typedef struct {
  unsigned INT3R:4;
} __INT3Rbits_t;
volatile __INT3Rbits_t INT3Rbits __asm__ ("INT3R");
volatile unsigned int        INT4R;
typedef struct {
  unsigned INT4R:4;
} __INT4Rbits_t;
volatile __INT4Rbits_t INT4Rbits __asm__ ("INT4R");
volatile unsigned int        T2CKR;
typedef struct {
  unsigned T2CKR:4;
} __T2CKRbits_t;
volatile __T2CKRbits_t T2CKRbits __asm__ ("T2CKR");
volatile unsigned int        T3CKR;
typedef struct {
  unsigned T3CKR:4;
} __T3CKRbits_t;
volatile __T3CKRbits_t T3CKRbits __asm__ ("T3CKR");
volatile unsigned int        T4CKR;
typedef struct {
  unsigned T4CKR:4;
} __T4CKRbits_t;
volatile __T4CKRbits_t T4CKRbits __asm__ ("T4CKR");
volatile unsigned int        T5CKR;
typedef struct {
  unsigned T5CKR:4;
} __T5CKRbits_t;
volatile __T5CKRbits_t T5CKRbits __asm__ ("T5CKR");
volatile unsigned int        IC1R;
typedef struct {
  unsigned IC1R:4;
} __IC1Rbits_t;
volatile __IC1Rbits_t IC1Rbits __asm__ ("IC1R");
volatile unsigned int        IC2R;
typedef struct {
  unsigned IC2R:4;
} __IC2Rbits_t;
volatile __IC2Rbits_t IC2Rbits __asm__ ("IC2R");
volatile unsigned int        IC3R;
typedef struct {
  unsigned IC3R:4;
} __IC3Rbits_t;
volatile __IC3Rbits_t IC3Rbits __asm__ ("IC3R");
volatile unsigned int        IC4R;
typedef struct {
  unsigned IC4R:4;
} __IC4Rbits_t;
volatile __IC4Rbits_t IC4Rbits __asm__ ("IC4R");
volatile unsigned int        IC5R;
typedef struct {
  unsigned IC5R:4;
} __IC5Rbits_t;
volatile __IC5Rbits_t IC5Rbits __asm__ ("IC5R");
volatile unsigned int        OCFAR;
typedef struct {
  unsigned OCFAR:4;
} __OCFARbits_t;
volatile __OCFARbits_t OCFARbits __asm__ ("OCFAR");
volatile unsigned int        OCFBR;
typedef struct {
  unsigned OCFBR:4;
} __OCFBRbits_t;
volatile __OCFBRbits_t OCFBRbits __asm__ ("OCFBR");
volatile unsigned int        U1RXR;
typedef struct {
  unsigned U1RXR:4;
} __U1RXRbits_t;
volatile __U1RXRbits_t U1RXRbits __asm__ ("U1RXR");
volatile unsigned int        U1CTSR;
typedef struct {
  unsigned U1CTSR:4;
} __U1CTSRbits_t;
volatile __U1CTSRbits_t U1CTSRbits __asm__ ("U1CTSR");
volatile unsigned int        U2RXR;
typedef struct {
  unsigned U2RXR:4;
} __U2RXRbits_t;
volatile __U2RXRbits_t U2RXRbits __asm__ ("U2RXR");
volatile unsigned int        U2CTSR;
typedef struct {
  unsigned U2CTSR:4;
} __U2CTSRbits_t;
volatile __U2CTSRbits_t U2CTSRbits __asm__ ("U2CTSR");
volatile unsigned int        U3RXR;
typedef struct {
  unsigned U3RXR:4;
} __U3RXRbits_t;
volatile __U3RXRbits_t U3RXRbits __asm__ ("U3RXR");
volatile unsigned int        U3CTSR;
typedef struct {
  unsigned U3CTSR:4;
} __U3CTSRbits_t;
volatile __U3CTSRbits_t U3CTSRbits __asm__ ("U3CTSR");
volatile unsigned int        U4RXR;
typedef struct {
  unsigned U4RXR:4;
} __U4RXRbits_t;
volatile __U4RXRbits_t U4RXRbits __asm__ ("U4RXR");
volatile unsigned int        U4CTSR;
typedef struct {
  unsigned U4CTSR:4;
} __U4CTSRbits_t;
volatile __U4CTSRbits_t U4CTSRbits __asm__ ("U4CTSR");
volatile unsigned int        U5RXR;
typedef struct {
  unsigned U5RXR:4;
} __U5RXRbits_t;
volatile __U5RXRbits_t U5RXRbits __asm__ ("U5RXR");
volatile unsigned int        U5CTSR;
typedef struct {
  unsigned U5CTSR:4;
} __U5CTSRbits_t;
volatile __U5CTSRbits_t U5CTSRbits __asm__ ("U5CTSR");
volatile unsigned int        SDI1R;
typedef struct {
  unsigned SDI1R:4;
} __SDI1Rbits_t;
volatile __SDI1Rbits_t SDI1Rbits __asm__ ("SDI1R");
volatile unsigned int        SS1R;
typedef struct {
  unsigned SS1R:4;
} __SS1Rbits_t;
volatile __SS1Rbits_t SS1Rbits __asm__ ("SS1R");
volatile unsigned int        SDI2R;
typedef struct {
  unsigned SDI2R:4;
} __SDI2Rbits_t;
volatile __SDI2Rbits_t SDI2Rbits __asm__ ("SDI2R");
volatile unsigned int        SS2R;
typedef struct {
  unsigned SS2R:4;
} __SS2Rbits_t;
volatile __SS2Rbits_t SS2Rbits __asm__ ("SS2R");
volatile unsigned int        REFCLKIR;
typedef struct {
  unsigned REFCLKIR:4;
} __REFCLKIRbits_t;
volatile __REFCLKIRbits_t REFCLKIRbits __asm__ ("REFCLKIR");
volatile unsigned int        RPB0R;
typedef struct {
  unsigned RPB0R:4;
} __RPB0Rbits_t;
volatile __RPB0Rbits_t RPB0Rbits __asm__ ("RPB0R");
volatile unsigned int        RPB1R;
typedef struct {
  unsigned RPB1R:4;
} __RPB1Rbits_t;
volatile __RPB1Rbits_t RPB1Rbits __asm__ ("RPB1R");
volatile unsigned int        RPB2R;
typedef struct {
  unsigned RPB2R:4;
} __RPB2Rbits_t;
volatile __RPB2Rbits_t RPB2Rbits __asm__ ("RPB2R");
volatile unsigned int        RPB3R;
typedef struct {
  unsigned RPB3R:4;
} __RPB3Rbits_t;
volatile __RPB3Rbits_t RPB3Rbits __asm__ ("RPB3R");
volatile unsigned int        RPB5R;
typedef struct {
  unsigned RPB5R:4;
} __RPB5Rbits_t;
volatile __RPB5Rbits_t RPB5Rbits __asm__ ("RPB5R");
volatile unsigned int        RPB6R;
typedef struct {
  unsigned RPB6R:4;
} __RPB6Rbits_t;
volatile __RPB6Rbits_t RPB6Rbits __asm__ ("RPB6R");
volatile unsigned int        RPB7R;
typedef struct {
  unsigned RPB7R:4;
} __RPB7Rbits_t;
volatile __RPB7Rbits_t RPB7Rbits __asm__ ("RPB7R");
volatile unsigned int        RPB8R;
typedef struct {
  unsigned RPB8R:4;
} __RPB8Rbits_t;
volatile __RPB8Rbits_t RPB8Rbits __asm__ ("RPB8R");
volatile unsigned int        RPB9R;
typedef struct {
  unsigned RPB9R:4;
} __RPB9Rbits_t;
volatile __RPB9Rbits_t RPB9Rbits __asm__ ("RPB9R");
volatile unsigned int        RPB10R;
typedef struct {
  unsigned RPB10R:4;
} __RPB10Rbits_t;
volatile __RPB10Rbits_t RPB10Rbits __asm__ ("RPB10R");
volatile unsigned int        RPB14R;
typedef struct {
  unsigned RPB14R:4;
} __RPB14Rbits_t;
volatile __RPB14Rbits_t RPB14Rbits __asm__ ("RPB14R");
volatile unsigned int        RPB15R;
typedef struct {
  unsigned RPB15R:4;
} __RPB15Rbits_t;
volatile __RPB15Rbits_t RPB15Rbits __asm__ ("RPB15R");
volatile unsigned int        RPD0R;
typedef struct {
  unsigned RPD0R:4;
} __RPD0Rbits_t;
volatile __RPD0Rbits_t RPD0Rbits __asm__ ("RPD0R");
volatile unsigned int        RPD1R;
typedef struct {
  unsigned RPD1R:4;
} __RPD1Rbits_t;
volatile __RPD1Rbits_t RPD1Rbits __asm__ ("RPD1R");
volatile unsigned int        RPD2R;
typedef struct {
  unsigned RPD2R:4;
} __RPD2Rbits_t;
volatile __RPD2Rbits_t RPD2Rbits __asm__ ("RPD2R");
volatile unsigned int        RPD3R;
typedef struct {
  unsigned RPD3R:4;
} __RPD3Rbits_t;
volatile __RPD3Rbits_t RPD3Rbits __asm__ ("RPD3R");
volatile unsigned int        RPD4R;
typedef struct {
  unsigned RPD4R:4;
} __RPD4Rbits_t;
volatile __RPD4Rbits_t RPD4Rbits __asm__ ("RPD4R");
volatile unsigned int        RPD5R;
typedef struct {
  unsigned RPD5R:4;
} __RPD5Rbits_t;
volatile __RPD5Rbits_t RPD5Rbits __asm__ ("RPD5R");
volatile unsigned int        RPD8R;
typedef struct {
  unsigned RPD8R:4;
} __RPD8Rbits_t;
volatile __RPD8Rbits_t RPD8Rbits __asm__ ("RPD8R");
volatile unsigned int        RPD9R;
typedef struct {
  unsigned RPD9R:4;
} __RPD9Rbits_t;
volatile __RPD9Rbits_t RPD9Rbits __asm__ ("RPD9R");
volatile unsigned int        RPD10R;
typedef struct {
  unsigned RPD10R:4;
} __RPD10Rbits_t;
volatile __RPD10Rbits_t RPD10Rbits __asm__ ("RPD10R");
volatile unsigned int        RPD11R;
typedef struct {
  unsigned RPD11R:4;
} __RPD11Rbits_t;
volatile __RPD11Rbits_t RPD11Rbits __asm__ ("RPD11R");
volatile unsigned int        RPD12R;
typedef struct {
  unsigned RPD12R:4;
} __RPD12Rbits_t;
volatile __RPD12Rbits_t RPD12Rbits __asm__ ("RPD12R");
volatile unsigned int        RPD14R;
typedef struct {
  unsigned RPD14R:4;
} __RPD14Rbits_t;
volatile __RPD14Rbits_t RPD14Rbits __asm__ ("RPD14R");
volatile unsigned int        RPD15R;
typedef struct {
  unsigned RPD15R:4;
} __RPD15Rbits_t;
volatile __RPD15Rbits_t RPD15Rbits __asm__ ("RPD15R");
volatile unsigned int        RPE3R;
typedef struct {
  unsigned RPE3R:4;
} __RPE3Rbits_t;
volatile __RPE3Rbits_t RPE3Rbits __asm__ ("RPE3R");
volatile unsigned int        RPE5R;
typedef struct {
  unsigned RPE5R:4;
} __RPE5Rbits_t;
volatile __RPE5Rbits_t RPE5Rbits __asm__ ("RPE5R");
volatile unsigned int        RPE8R;
typedef struct {
  unsigned RPE8R:4;
} __RPE8Rbits_t;
volatile __RPE8Rbits_t RPE8Rbits __asm__ ("RPE8R");
volatile unsigned int        RPE9R;
typedef struct {
  unsigned RPE9R:4;
} __RPE9Rbits_t;
volatile __RPE9Rbits_t RPE9Rbits __asm__ ("RPE9R");
volatile unsigned int        RPF0R;
typedef struct {
  unsigned RPF0R:4;
} __RPF0Rbits_t;
volatile __RPF0Rbits_t RPF0Rbits __asm__ ("RPF0R");
volatile unsigned int        RPF1R;
typedef struct {
  unsigned RPF1R:4;
} __RPF1Rbits_t;
volatile __RPF1Rbits_t RPF1Rbits __asm__ ("RPF1R");
volatile unsigned int        RPF2R;
typedef struct {
  unsigned RPF2R:4;
} __RPF2Rbits_t;
volatile __RPF2Rbits_t RPF2Rbits __asm__ ("RPF2R");
volatile unsigned int        RPF3R;
typedef struct {
  unsigned RPF3R:4;
} __RPF3Rbits_t;
volatile __RPF3Rbits_t RPF3Rbits __asm__ ("RPF3R");
volatile unsigned int        RPF4R;
typedef struct {
  unsigned RPF4R:4;
} __RPF4Rbits_t;
volatile __RPF4Rbits_t RPF4Rbits __asm__ ("RPF4R");
volatile unsigned int        RPF5R;
typedef struct {
  unsigned RPF5R:4;
} __RPF5Rbits_t;
volatile __RPF5Rbits_t RPF5Rbits __asm__ ("RPF5R");
volatile unsigned int        RPF6R;
typedef struct {
  unsigned RPF6R:4;
} __RPF6Rbits_t;
volatile __RPF6Rbits_t RPF6Rbits __asm__ ("RPF6R");
volatile unsigned int        RPG6R;
typedef struct {
  unsigned RPG6R:4;
} __RPG6Rbits_t;
volatile __RPG6Rbits_t RPG6Rbits __asm__ ("RPG6R");
volatile unsigned int        RPG7R;
typedef struct {
  unsigned RPG7R:4;
} __RPG7Rbits_t;
volatile __RPG7Rbits_t RPG7Rbits __asm__ ("RPG7R");
volatile unsigned int        RPG8R;
typedef struct {
  unsigned RPG8R:4;
} __RPG8Rbits_t;
volatile __RPG8Rbits_t RPG8Rbits __asm__ ("RPG8R");
volatile unsigned int        RPG9R;
typedef struct {
  unsigned RPG9R:4;
} __RPG9Rbits_t;
volatile __RPG9Rbits_t RPG9Rbits __asm__ ("RPG9R");
volatile unsigned int        INTCON;
typedef union {
  struct {
    unsigned INT0EP:1;
    unsigned INT1EP:1;
    unsigned INT2EP:1;
    unsigned INT3EP:1;
    unsigned INT4EP:1;
    unsigned :3;
    unsigned TPC:3;
    unsigned :1;
    unsigned MVEC:1;
    unsigned :3;
    unsigned SS0:1;
  };
  struct {
    unsigned w:32;
  };
} __INTCONbits_t;
volatile __INTCONbits_t INTCONbits __asm__ ("INTCON");
volatile unsigned int        INTCONCLR;
volatile unsigned int        INTCONSET;
volatile unsigned int        INTCONINV;
volatile unsigned int        INTSTAT;
typedef struct {
  unsigned VEC:6;
  unsigned :2;
  unsigned SRIPL:3;
} __INTSTATbits_t;
volatile __INTSTATbits_t INTSTATbits __asm__ ("INTSTAT");
volatile unsigned int        IPTMR;
volatile unsigned int        IPTMRCLR;
volatile unsigned int        IPTMRSET;
volatile unsigned int        IPTMRINV;
volatile unsigned int        IFS0;
typedef union {
  struct {
    unsigned CTIF:1;
    unsigned CS0IF:1;
    unsigned CS1IF:1;
    unsigned INT0IF:1;
    unsigned T1IF:1;
    unsigned IC1EIF:1;
    unsigned IC1IF:1;
    unsigned OC1IF:1;
    unsigned INT1IF:1;
    unsigned T2IF:1;
    unsigned IC2EIF:1;
    unsigned IC2IF:1;
    unsigned OC2IF:1;
    unsigned INT2IF:1;
    unsigned T3IF:1;
    unsigned IC3EIF:1;
    unsigned IC3IF:1;
    unsigned OC3IF:1;
    unsigned INT3IF:1;
    unsigned T4IF:1;
    unsigned IC4EIF:1;
    unsigned IC4IF:1;
    unsigned OC4IF:1;
    unsigned INT4IF:1;
    unsigned T5IF:1;
    unsigned IC5EIF:1;
    unsigned IC5IF:1;
    unsigned OC5IF:1;
    unsigned AD1IF:1;
    unsigned FSCMIF:1;
    unsigned RTCCIF:1;
    unsigned FCEIF:1;
  };
  struct {
    unsigned w:32;
  };
} __IFS0bits_t;
volatile __IFS0bits_t IFS0bits __asm__ ("IFS0");
volatile unsigned int        IFS0CLR;
volatile unsigned int        IFS0SET;
volatile unsigned int        IFS0INV;
volatile unsigned int        IFS1;
typedef union {
  struct {
    unsigned CMP1IF:1;
    unsigned CMP2IF:1;
    unsigned USBIF:1;
    unsigned SPI1EIF:1;
    unsigned SPI1RXIF:1;
    unsigned SPI1TXIF:1;
    unsigned U1EIF:1;
    unsigned U1RXIF:1;
    unsigned U1TXIF:1;
    unsigned I2C1BIF:1;
    unsigned I2C1SIF:1;
    unsigned I2C1MIF:1;
    unsigned CNAIF:1;
    unsigned CNBIF:1;
    unsigned CNCIF:1;
    unsigned CNDIF:1;
    unsigned CNEIF:1;
    unsigned CNFIF:1;
    unsigned CNGIF:1;
    unsigned PMPIF:1;
    unsigned PMPEIF:1;
    unsigned SPI2EIF:1;
    unsigned SPI2RXIF:1;
    unsigned SPI2TXIF:1;
    unsigned U2EIF:1;
    unsigned U2RXIF:1;
    unsigned U2TXIF:1;
    unsigned I2C2BIF:1;
    unsigned I2C2SIF:1;
    unsigned I2C2MIF:1;
    unsigned U3EIF:1;
    unsigned U3RXIF:1;
  };
  struct {
    unsigned w:32;
  };
} __IFS1bits_t;
volatile __IFS1bits_t IFS1bits __asm__ ("IFS1");
volatile unsigned int        IFS1CLR;
volatile unsigned int        IFS1SET;
volatile unsigned int        IFS1INV;
volatile unsigned int        IFS2;
typedef struct {
  unsigned U3TXIF:1;
  unsigned U4EIF:1;
  unsigned U4RXIF:1;
  unsigned U4TXIF:1;
  unsigned :3;
  unsigned CTMUIF:1;
  unsigned DMA0IF:1;
  unsigned DMA1IF:1;
  unsigned DMA2IF:1;
  unsigned DMA3IF:1;
} __IFS2bits_t;
volatile __IFS2bits_t IFS2bits __asm__ ("IFS2");
volatile unsigned int        IFS2CLR;
volatile unsigned int        IFS2SET;
volatile unsigned int        IFS2INV;
volatile unsigned int        IEC0;
typedef union {
  struct {
    unsigned CTIE:1;
    unsigned CS0IE:1;
    unsigned CS1IE:1;
    unsigned INT0IE:1;
    unsigned T1IE:1;
    unsigned IC1EIE:1;
    unsigned IC1IE:1;
    unsigned OC1IE:1;
    unsigned INT1IE:1;
    unsigned T2IE:1;
    unsigned IC2EIE:1;
    unsigned IC2IE:1;
    unsigned OC2IE:1;
    unsigned INT2IE:1;
    unsigned T3IE:1;
    unsigned IC3EIE:1;
    unsigned IC3IE:1;
    unsigned OC3IE:1;
    unsigned INT3IE:1;
    unsigned T4IE:1;
    unsigned IC4EIE:1;
    unsigned IC4IE:1;
    unsigned OC4IE:1;
    unsigned INT4IE:1;
    unsigned T5IE:1;
    unsigned IC5EIE:1;
    unsigned IC5IE:1;
    unsigned OC5IE:1;
    unsigned AD1IE:1;
    unsigned FSCMIE:1;
    unsigned RTCCIE:1;
    unsigned FCEIE:1;
  };
  struct {
    unsigned w:32;
  };
} __IEC0bits_t;
volatile __IEC0bits_t IEC0bits __asm__ ("IEC0");
volatile unsigned int        IEC0CLR;
volatile unsigned int        IEC0SET;
volatile unsigned int        IEC0INV;
volatile unsigned int        IEC1;
typedef union {
  struct {
    unsigned CMP1IE:1;
    unsigned CMP2IE:1;
    unsigned USBIE:1;
    unsigned SPI1EIE:1;
    unsigned SPI1RXIE:1;
    unsigned SPI1TXIE:1;
    unsigned U1EIE:1;
    unsigned U1RXIE:1;
    unsigned U1TXIE:1;
    unsigned I2C1BIE:1;
    unsigned I2C1SIE:1;
    unsigned I2C1MIE:1;
    unsigned CNAIE:1;
    unsigned CNBIE:1;
    unsigned CNCIE:1;
    unsigned CNDIE:1;
    unsigned CNEIE:1;
    unsigned CNFIE:1;
    unsigned CNGIE:1;
    unsigned PMPIE:1;
    unsigned PMPEIE:1;
    unsigned SPI2EIE:1;
    unsigned SPI2RXIE:1;
    unsigned SPI2TXIE:1;
    unsigned U2EIE:1;
    unsigned U2RXIE:1;
    unsigned U2TXIE:1;
    unsigned I2C2BIE:1;
    unsigned I2C2SIE:1;
    unsigned I2CMIE:1;
    unsigned U3EIE:1;
    unsigned U3RXIE:1;
  };
  struct {
    unsigned w:32;
  };
} __IEC1bits_t;
volatile __IEC1bits_t IEC1bits __asm__ ("IEC1");
volatile unsigned int        IEC1CLR;
volatile unsigned int        IEC1SET;
volatile unsigned int        IEC1INV;
volatile unsigned int        IEC2;
typedef struct {
  unsigned U3TXIE:1;
  unsigned U4EIE:1;
  unsigned U4RXIE:1;
  unsigned U4TXIE:1;
  unsigned :3;
  unsigned CTMUIE:1;
  unsigned DMA0IE:1;
  unsigned DMA1IE:1;
  unsigned DMA2IE:1;
  unsigned DMA3IE:1;
} __IEC2bits_t;
volatile __IEC2bits_t IEC2bits __asm__ ("IEC2");
volatile unsigned int        IEC2CLR;
volatile unsigned int        IEC2SET;
volatile unsigned int        IEC2INV;
volatile unsigned int        IPC0;
typedef union {
  struct {
    unsigned CTIS:2;
    unsigned CTIP:3;
    unsigned :3;
    unsigned CS0IS:2;
    unsigned CS0IP:3;
    unsigned :3;
    unsigned CS1IS:2;
    unsigned CS1IP:3;
    unsigned :3;
    unsigned INT0IS:2;
    unsigned INT0IP:3;
  };
  struct {
    unsigned w:32;
  };
} __IPC0bits_t;
volatile __IPC0bits_t IPC0bits __asm__ ("IPC0");
volatile unsigned int        IPC0CLR;
volatile unsigned int        IPC0SET;
volatile unsigned int        IPC0INV;
volatile unsigned int        IPC1;
typedef union {
  struct {
    unsigned T1IS:2;
    unsigned T1IP:3;
    unsigned :3;
    unsigned IC1IS:2;
    unsigned IC1IP:3;
    unsigned :3;
    unsigned OC1IS:2;
    unsigned OC1IP:3;
    unsigned :3;
    unsigned INT1IS:2;
    unsigned INT1IP:3;
  };
  struct {
    unsigned w:32;
  };
} __IPC1bits_t;
volatile __IPC1bits_t IPC1bits __asm__ ("IPC1");
volatile unsigned int        IPC1CLR;
volatile unsigned int        IPC1SET;
volatile unsigned int        IPC1INV;
volatile unsigned int        IPC2;
typedef union {
  struct {
    unsigned T2IS:2;
    unsigned T2IP:3;
    unsigned :3;
    unsigned IC2IS:2;
    unsigned IC2IP:3;
    unsigned :3;
    unsigned OC2IS:2;
    unsigned OC2IP:3;
    unsigned :3;
    unsigned INT2IS:2;
    unsigned INT2IP:3;
  };
  struct {
    unsigned w:32;
  };
} __IPC2bits_t;
volatile __IPC2bits_t IPC2bits __asm__ ("IPC2");
volatile unsigned int        IPC2CLR;
volatile unsigned int        IPC2SET;
volatile unsigned int        IPC2INV;
volatile unsigned int        IPC3;
typedef union {
  struct {
    unsigned T3IS:2;
    unsigned T3IP:3;
    unsigned :3;
    unsigned IC3IS:2;
    unsigned IC3IP:3;
    unsigned :3;
    unsigned OC3IS:2;
    unsigned OC3IP:3;
    unsigned :3;
    unsigned INT3IS:2;
    unsigned INT3IP:3;
  };
  struct {
    unsigned w:32;
  };
} __IPC3bits_t;
volatile __IPC3bits_t IPC3bits __asm__ ("IPC3");
volatile unsigned int        IPC3CLR;
volatile unsigned int        IPC3SET;
volatile unsigned int        IPC3INV;
volatile unsigned int        IPC4;
typedef union {
  struct {
    unsigned T4IS:2;
    unsigned T4IP:3;
    unsigned :3;
    unsigned IC4IS:2;
    unsigned IC4IP:3;
    unsigned :3;
    unsigned OC4IS:2;
    unsigned OC4IP:3;
    unsigned :3;
    unsigned INT4IS:2;
    unsigned INT4IP:3;
  };
  struct {
    unsigned w:32;
  };
} __IPC4bits_t;
volatile __IPC4bits_t IPC4bits __asm__ ("IPC4");
volatile unsigned int        IPC4CLR;
volatile unsigned int        IPC4SET;
volatile unsigned int        IPC4INV;
volatile unsigned int        IPC5;
typedef union {
  struct {
    unsigned T5IS:2;
    unsigned T5IP:3;
    unsigned :3;
    unsigned IC5IS:2;
    unsigned IC5IP:3;
    unsigned :3;
    unsigned OC5IS:2;
    unsigned OC5IP:3;
    unsigned :3;
    unsigned AD1IS:2;
    unsigned AD1IP:3;
  };
  struct {
    unsigned w:32;
  };
} __IPC5bits_t;
volatile __IPC5bits_t IPC5bits __asm__ ("IPC5");
volatile unsigned int        IPC5CLR;
volatile unsigned int        IPC5SET;
volatile unsigned int        IPC5INV;
volatile unsigned int        IPC6;
typedef union {
  struct {
    unsigned FSCMIS:2;
    unsigned FSCMIP:3;
    unsigned :3;
    unsigned RTCCIS:2;
    unsigned RTCCIP:3;
    unsigned :3;
    unsigned FCEIS:2;
    unsigned FCEIP:3;
    unsigned :3;
    unsigned CMP1IS:2;
    unsigned CMP1IP:3;
  };
  struct {
    unsigned w:32;
  };
} __IPC6bits_t;
volatile __IPC6bits_t IPC6bits __asm__ ("IPC6");
volatile unsigned int        IPC6CLR;
volatile unsigned int        IPC6SET;
volatile unsigned int        IPC6INV;
volatile unsigned int        IPC7;
typedef union {
  struct {
    unsigned CMP2IS:2;
    unsigned CMP2IP:3;
    unsigned :3;
    unsigned USBIS:2;
    unsigned USBIP:3;
    unsigned :3;
    unsigned SPI1IS:2;
    unsigned SPI1IP:3;
    unsigned :3;
    unsigned U1IS:2;
    unsigned U1IP:3;
  };
  struct {
    unsigned w:32;
  };
} __IPC7bits_t;
volatile __IPC7bits_t IPC7bits __asm__ ("IPC7");
volatile unsigned int        IPC7CLR;
volatile unsigned int        IPC7SET;
volatile unsigned int        IPC7INV;
volatile unsigned int        IPC8;
typedef union {
  struct {
    unsigned I2C1IS:2;
    unsigned I2C1IP:3;
    unsigned :3;
    unsigned CNIS:2;
    unsigned CNIP:3;
    unsigned :3;
    unsigned PMPIS:2;
    unsigned PMPIP:3;
    unsigned :3;
    unsigned SPI2IS:2;
    unsigned SPI2IP:3;
  };
  struct {
    unsigned w:32;
  };
} __IPC8bits_t;
volatile __IPC8bits_t IPC8bits __asm__ ("IPC8");
volatile unsigned int        IPC8CLR;
volatile unsigned int        IPC8SET;
volatile unsigned int        IPC8INV;
volatile unsigned int        IPC9;
typedef union {
  struct {
    unsigned U2IS:2;
    unsigned U2IP:3;
    unsigned :3;
    unsigned I2C2IS:2;
    unsigned I2C2IP:3;
    unsigned :3;
    unsigned U3IS:2;
    unsigned U3IP:3;
    unsigned :3;
    unsigned U4IS:2;
    unsigned U4IP:3;
  };
  struct {
    unsigned w:32;
  };
} __IPC9bits_t;
volatile __IPC9bits_t IPC9bits __asm__ ("IPC9");
volatile unsigned int        IPC9CLR;
volatile unsigned int        IPC9SET;
volatile unsigned int        IPC9INV;
volatile unsigned int        IPC10;
typedef union {
  struct {
    unsigned :8;
    unsigned CTMUIP:2;
    unsigned CTMUIS:3;
    unsigned :3;
    unsigned DMA0IS:2;
    unsigned DMA0IP:3;
    unsigned :3;
    unsigned DMA1IS:2;
    unsigned DMA1IP:3;
  };
  struct {
    unsigned w:32;
  };
} __IPC10bits_t;
volatile __IPC10bits_t IPC10bits __asm__ ("IPC10");
volatile unsigned int        IPC10CLR;
volatile unsigned int        IPC10SET;
volatile unsigned int        IPC10INV;
volatile unsigned int        IPC11;
typedef union {
  struct {
    unsigned DMA2IS:2;
    unsigned DMA2IP:3;
    unsigned :3;
    unsigned DMA3IS:2;
    unsigned DMA3IP:3;
  };
  struct {
    unsigned w:32;
  };
} __IPC11bits_t;
volatile __IPC11bits_t IPC11bits __asm__ ("IPC11");
volatile unsigned int        IPC11CLR;
volatile unsigned int        IPC11SET;
volatile unsigned int        IPC11INV;
volatile unsigned int        BMXCON;
typedef union {
  struct {
    unsigned BMXARB:3;
    unsigned :3;
    unsigned BMXWSDRM:1;
    unsigned :9;
    unsigned BMXERRIS:1;
    unsigned BMXERRDS:1;
    unsigned BMXERRDMA:1;
    unsigned BMXERRICD:1;
    unsigned BMXERRIXI:1;
    unsigned :5;
    unsigned BMXCHEDMA:1;
  };
  struct {
    unsigned w:32;
  };
} __BMXCONbits_t;
volatile __BMXCONbits_t BMXCONbits __asm__ ("BMXCON");
volatile unsigned int        BMXCONCLR;
volatile unsigned int        BMXCONSET;
volatile unsigned int        BMXCONINV;
volatile unsigned int        BMXDKPBA;
volatile unsigned int        BMXDKPBACLR;
volatile unsigned int        BMXDKPBASET;
volatile unsigned int        BMXDKPBAINV;
volatile unsigned int        BMXDUDBA;
volatile unsigned int        BMXDUDBACLR;
volatile unsigned int        BMXDUDBASET;
volatile unsigned int        BMXDUDBAINV;
volatile unsigned int        BMXDUPBA;
volatile unsigned int        BMXDUPBACLR;
volatile unsigned int        BMXDUPBASET;
volatile unsigned int        BMXDUPBAINV;
volatile unsigned int        BMXDRMSZ;
volatile unsigned int        BMXPUPBA;
volatile unsigned int        BMXPUPBACLR;
volatile unsigned int        BMXPUPBASET;
volatile unsigned int        BMXPUPBAINV;
volatile unsigned int        BMXPFMSZ;
volatile unsigned int        BMXBOOTSZ;
volatile unsigned int        DMACON;
typedef union {
  struct {
    unsigned :11;
    unsigned DMABUSY:1;
    unsigned SUSPEND:1;
    unsigned :2;
    unsigned ON:1;
  };
  struct {
    unsigned w:32;
  };
} __DMACONbits_t;
volatile __DMACONbits_t DMACONbits __asm__ ("DMACON");
volatile unsigned int        DMACONCLR;
volatile unsigned int        DMACONSET;
volatile unsigned int        DMACONINV;
volatile unsigned int        DMASTAT;
typedef union {
  struct {
    unsigned DMACH:3;
    unsigned RDWR:1;
  };
  struct {
    unsigned w:32;
  };
} __DMASTATbits_t;
volatile __DMASTATbits_t DMASTATbits __asm__ ("DMASTAT");
volatile unsigned int        DMASTATCLR;
volatile unsigned int        DMASTATSET;
volatile unsigned int        DMASTATINV;
volatile unsigned int        DMAADDR;
volatile unsigned int        DMAADDRCLR;
volatile unsigned int        DMAADDRSET;
volatile unsigned int        DMAADDRINV;
volatile unsigned int        DCRCCON;
typedef union {
  struct {
    unsigned CRCCH:3;
    unsigned :2;
    unsigned CRCTYP:1;
    unsigned CRCAPP:1;
    unsigned CRCEN:1;
    unsigned PLEN:5;
    unsigned :11;
    unsigned BITO:1;
    unsigned :2;
    unsigned WBO:1;
    unsigned BYTO:2;
  };
  struct {
    unsigned w:32;
  };
} __DCRCCONbits_t;
volatile __DCRCCONbits_t DCRCCONbits __asm__ ("DCRCCON");
volatile unsigned int        DCRCCONCLR;
volatile unsigned int        DCRCCONSET;
volatile unsigned int        DCRCCONINV;
volatile unsigned int        DCRCDATA;
volatile unsigned int        DCRCDATACLR;
volatile unsigned int        DCRCDATASET;
volatile unsigned int        DCRCDATAINV;
volatile unsigned int        DCRCXOR;
volatile unsigned int        DCRCXORCLR;
volatile unsigned int        DCRCXORSET;
volatile unsigned int        DCRCXORINV;
volatile unsigned int        DCH0CON;
typedef union {
  struct {
    unsigned CHPRI:2;
    unsigned CHEDET:1;
    unsigned :1;
    unsigned CHAEN:1;
    unsigned CHCHN:1;
    unsigned CHAED:1;
    unsigned CHEN:1;
    unsigned CHCHNS:1;
    unsigned :6;
    unsigned CHBUSY:1;
  };
  struct {
    unsigned w:32;
  };
} __DCH0CONbits_t;
volatile __DCH0CONbits_t DCH0CONbits __asm__ ("DCH0CON");
volatile unsigned int        DCH0CONCLR;
volatile unsigned int        DCH0CONSET;
volatile unsigned int        DCH0CONINV;
volatile unsigned int        DCH0ECON;
typedef union {
  struct {
    unsigned :3;
    unsigned AIRQEN:1;
    unsigned SIRQEN:1;
    unsigned PATEN:1;
    unsigned CABORT:1;
    unsigned CFORCE:1;
    unsigned CHSIRQ:8;
    unsigned CHAIRQ:8;
  };
  struct {
    unsigned w:32;
  };
} __DCH0ECONbits_t;
volatile __DCH0ECONbits_t DCH0ECONbits __asm__ ("DCH0ECON");
volatile unsigned int        DCH0ECONCLR;
volatile unsigned int        DCH0ECONSET;
volatile unsigned int        DCH0ECONINV;
volatile unsigned int        DCH0INT;
typedef union {
  struct {
    unsigned CHERIF:1;
    unsigned CHTAIF:1;
    unsigned CHCCIF:1;
    unsigned CHBCIF:1;
    unsigned CHDHIF:1;
    unsigned CHDDIF:1;
    unsigned CHSHIF:1;
    unsigned CHSDIF:1;
    unsigned :8;
    unsigned CHERIE:1;
    unsigned CHTAIE:1;
    unsigned CHCCIE:1;
    unsigned CHBCIE:1;
    unsigned CHDHIE:1;
    unsigned CHDDIE:1;
    unsigned CHSHIE:1;
    unsigned CHSDIE:1;
  };
  struct {
    unsigned w:32;
  };
} __DCH0INTbits_t;
volatile __DCH0INTbits_t DCH0INTbits __asm__ ("DCH0INT");
volatile unsigned int        DCH0INTCLR;
volatile unsigned int        DCH0INTSET;
volatile unsigned int        DCH0INTINV;
volatile unsigned int        DCH0SSA;
volatile unsigned int        DCH0SSACLR;
volatile unsigned int        DCH0SSASET;
volatile unsigned int        DCH0SSAINV;
volatile unsigned int        DCH0DSA;
volatile unsigned int        DCH0DSACLR;
volatile unsigned int        DCH0DSASET;
volatile unsigned int        DCH0DSAINV;
volatile unsigned int        DCH0SSIZ;
volatile unsigned int        DCH0SSIZCLR;
volatile unsigned int        DCH0SSIZSET;
volatile unsigned int        DCH0SSIZINV;
volatile unsigned int        DCH0DSIZ;
volatile unsigned int        DCH0DSIZCLR;
volatile unsigned int        DCH0DSIZSET;
volatile unsigned int        DCH0DSIZINV;
volatile unsigned int        DCH0SPTR;
volatile unsigned int        DCH0SPTRCLR;
volatile unsigned int        DCH0SPTRSET;
volatile unsigned int        DCH0SPTRINV;
volatile unsigned int        DCH0DPTR;
volatile unsigned int        DCH0DPTRCLR;
volatile unsigned int        DCH0DPTRSET;
volatile unsigned int        DCH0DPTRINV;
volatile unsigned int        DCH0CSIZ;
volatile unsigned int        DCH0CSIZCLR;
volatile unsigned int        DCH0CSIZSET;
volatile unsigned int        DCH0CSIZINV;
volatile unsigned int        DCH0CPTR;
volatile unsigned int        DCH0CPTRCLR;
volatile unsigned int        DCH0CPTRSET;
volatile unsigned int        DCH0CPTRINV;
volatile unsigned int        DCH0DAT;
volatile unsigned int        DCH0DATCLR;
volatile unsigned int        DCH0DATSET;
volatile unsigned int        DCH0DATINV;
volatile unsigned int        DCH1CON;
typedef union {
  struct {
    unsigned CHPRI:2;
    unsigned CHEDET:1;
    unsigned :1;
    unsigned CHAEN:1;
    unsigned CHCHN:1;
    unsigned CHAED:1;
    unsigned CHEN:1;
    unsigned CHCHNS:1;
    unsigned :6;
    unsigned CHBUSY:1;
  };
  struct {
    unsigned w:32;
  };
} __DCH1CONbits_t;
volatile __DCH1CONbits_t DCH1CONbits __asm__ ("DCH1CON");
volatile unsigned int        DCH1CONCLR;
volatile unsigned int        DCH1CONSET;
volatile unsigned int        DCH1CONINV;
volatile unsigned int        DCH1ECON;
typedef union {
  struct {
    unsigned :3;
    unsigned AIRQEN:1;
    unsigned SIRQEN:1;
    unsigned PATEN:1;
    unsigned CABORT:1;
    unsigned CFORCE:1;
    unsigned CHSIRQ:8;
    unsigned CHAIRQ:8;
  };
  struct {
    unsigned w:32;
  };
} __DCH1ECONbits_t;
volatile __DCH1ECONbits_t DCH1ECONbits __asm__ ("DCH1ECON");
volatile unsigned int        DCH1ECONCLR;
volatile unsigned int        DCH1ECONSET;
volatile unsigned int        DCH1ECONINV;
volatile unsigned int        DCH1INT;
typedef union {
  struct {
    unsigned CHERIF:1;
    unsigned CHTAIF:1;
    unsigned CHCCIF:1;
    unsigned CHBCIF:1;
    unsigned CHDHIF:1;
    unsigned CHDDIF:1;
    unsigned CHSHIF:1;
    unsigned CHSDIF:1;
    unsigned :8;
    unsigned CHERIE:1;
    unsigned CHTAIE:1;
    unsigned CHCCIE:1;
    unsigned CHBCIE:1;
    unsigned CHDHIE:1;
    unsigned CHDDIE:1;
    unsigned CHSHIE:1;
    unsigned CHSDIE:1;
  };
  struct {
    unsigned w:32;
  };
} __DCH1INTbits_t;
volatile __DCH1INTbits_t DCH1INTbits __asm__ ("DCH1INT");
volatile unsigned int        DCH1INTCLR;
volatile unsigned int        DCH1INTSET;
volatile unsigned int        DCH1INTINV;
volatile unsigned int        DCH1SSA;
volatile unsigned int        DCH1SSACLR;
volatile unsigned int        DCH1SSASET;
volatile unsigned int        DCH1SSAINV;
volatile unsigned int        DCH1DSA;
volatile unsigned int        DCH1DSACLR;
volatile unsigned int        DCH1DSASET;
volatile unsigned int        DCH1DSAINV;
volatile unsigned int        DCH1SSIZ;
volatile unsigned int        DCH1SSIZCLR;
volatile unsigned int        DCH1SSIZSET;
volatile unsigned int        DCH1SSIZINV;
volatile unsigned int        DCH1DSIZ;
volatile unsigned int        DCH1DSIZCLR;
volatile unsigned int        DCH1DSIZSET;
volatile unsigned int        DCH1DSIZINV;
volatile unsigned int        DCH1SPTR;
volatile unsigned int        DCH1SPTRCLR;
volatile unsigned int        DCH1SPTRSET;
volatile unsigned int        DCH1SPTRINV;
volatile unsigned int        DCH1DPTR;
volatile unsigned int        DCH1DPTRCLR;
volatile unsigned int        DCH1DPTRSET;
volatile unsigned int        DCH1DPTRINV;
volatile unsigned int        DCH1CSIZ;
volatile unsigned int        DCH1CSIZCLR;
volatile unsigned int        DCH1CSIZSET;
volatile unsigned int        DCH1CSIZINV;
volatile unsigned int        DCH1CPTR;
volatile unsigned int        DCH1CPTRCLR;
volatile unsigned int        DCH1CPTRSET;
volatile unsigned int        DCH1CPTRINV;
volatile unsigned int        DCH1DAT;
volatile unsigned int        DCH1DATCLR;
volatile unsigned int        DCH1DATSET;
volatile unsigned int        DCH1DATINV;
volatile unsigned int        DCH2CON;
typedef union {
  struct {
    unsigned CHPRI:2;
    unsigned CHEDET:1;
    unsigned :1;
    unsigned CHAEN:1;
    unsigned CHCHN:1;
    unsigned CHAED:1;
    unsigned CHEN:1;
    unsigned CHCHNS:1;
    unsigned :6;
    unsigned CHBUSY:1;
  };
  struct {
    unsigned w:32;
  };
} __DCH2CONbits_t;
volatile __DCH2CONbits_t DCH2CONbits __asm__ ("DCH2CON");
volatile unsigned int        DCH2CONCLR;
volatile unsigned int        DCH2CONSET;
volatile unsigned int        DCH2CONINV;
volatile unsigned int        DCH2ECON;
typedef union {
  struct {
    unsigned :3;
    unsigned AIRQEN:1;
    unsigned SIRQEN:1;
    unsigned PATEN:1;
    unsigned CABORT:1;
    unsigned CFORCE:1;
    unsigned CHSIRQ:8;
    unsigned CHAIRQ:8;
  };
  struct {
    unsigned w:32;
  };
} __DCH2ECONbits_t;
volatile __DCH2ECONbits_t DCH2ECONbits __asm__ ("DCH2ECON");
volatile unsigned int        DCH2ECONCLR;
volatile unsigned int        DCH2ECONSET;
volatile unsigned int        DCH2ECONINV;
volatile unsigned int        DCH2INT;
typedef union {
  struct {
    unsigned CHERIF:1;
    unsigned CHTAIF:1;
    unsigned CHCCIF:1;
    unsigned CHBCIF:1;
    unsigned CHDHIF:1;
    unsigned CHDDIF:1;
    unsigned CHSHIF:1;
    unsigned CHSDIF:1;
    unsigned :8;
    unsigned CHERIE:1;
    unsigned CHTAIE:1;
    unsigned CHCCIE:1;
    unsigned CHBCIE:1;
    unsigned CHDHIE:1;
    unsigned CHDDIE:1;
    unsigned CHSHIE:1;
    unsigned CHSDIE:1;
  };
  struct {
    unsigned w:32;
  };
} __DCH2INTbits_t;
volatile __DCH2INTbits_t DCH2INTbits __asm__ ("DCH2INT");
volatile unsigned int        DCH2INTCLR;
volatile unsigned int        DCH2INTSET;
volatile unsigned int        DCH2INTINV;
volatile unsigned int        DCH2SSA;
volatile unsigned int        DCH2SSACLR;
volatile unsigned int        DCH2SSASET;
volatile unsigned int        DCH2SSAINV;
volatile unsigned int        DCH2DSA;
volatile unsigned int        DCH2DSACLR;
volatile unsigned int        DCH2DSASET;
volatile unsigned int        DCH2DSAINV;
volatile unsigned int        DCH2SSIZ;
volatile unsigned int        DCH2SSIZCLR;
volatile unsigned int        DCH2SSIZSET;
volatile unsigned int        DCH2SSIZINV;
volatile unsigned int        DCH2DSIZ;
volatile unsigned int        DCH2DSIZCLR;
volatile unsigned int        DCH2DSIZSET;
volatile unsigned int        DCH2DSIZINV;
volatile unsigned int        DCH2SPTR;
volatile unsigned int        DCH2SPTRCLR;
volatile unsigned int        DCH2SPTRSET;
volatile unsigned int        DCH2SPTRINV;
volatile unsigned int        DCH2DPTR;
volatile unsigned int        DCH2DPTRCLR;
volatile unsigned int        DCH2DPTRSET;
volatile unsigned int        DCH2DPTRINV;
volatile unsigned int        DCH2CSIZ;
volatile unsigned int        DCH2CSIZCLR;
volatile unsigned int        DCH2CSIZSET;
volatile unsigned int        DCH2CSIZINV;
volatile unsigned int        DCH2CPTR;
volatile unsigned int        DCH2CPTRCLR;
volatile unsigned int        DCH2CPTRSET;
volatile unsigned int        DCH2CPTRINV;
volatile unsigned int        DCH2DAT;
volatile unsigned int        DCH2DATCLR;
volatile unsigned int        DCH2DATSET;
volatile unsigned int        DCH2DATINV;
volatile unsigned int        DCH3CON;
typedef union {
  struct {
    unsigned CHPRI:2;
    unsigned CHEDET:1;
    unsigned :1;
    unsigned CHAEN:1;
    unsigned CHCHN:1;
    unsigned CHAED:1;
    unsigned CHEN:1;
    unsigned CHCHNS:1;
    unsigned :6;
    unsigned CHBUSY:1;
  };
  struct {
    unsigned w:32;
  };
} __DCH3CONbits_t;
volatile __DCH3CONbits_t DCH3CONbits __asm__ ("DCH3CON");
volatile unsigned int        DCH3CONCLR;
volatile unsigned int        DCH3CONSET;
volatile unsigned int        DCH3CONINV;
volatile unsigned int        DCH3ECON;
typedef union {
  struct {
    unsigned :3;
    unsigned AIRQEN:1;
    unsigned SIRQEN:1;
    unsigned PATEN:1;
    unsigned CABORT:1;
    unsigned CFORCE:1;
    unsigned CHSIRQ:8;
    unsigned CHAIRQ:8;
  };
  struct {
    unsigned w:32;
  };
} __DCH3ECONbits_t;
volatile __DCH3ECONbits_t DCH3ECONbits __asm__ ("DCH3ECON");
volatile unsigned int        DCH3ECONCLR;
volatile unsigned int        DCH3ECONSET;
volatile unsigned int        DCH3ECONINV;
volatile unsigned int        DCH3INT;
typedef union {
  struct {
    unsigned CHERIF:1;
    unsigned CHTAIF:1;
    unsigned CHCCIF:1;
    unsigned CHBCIF:1;
    unsigned CHDHIF:1;
    unsigned CHDDIF:1;
    unsigned CHSHIF:1;
    unsigned CHSDIF:1;
    unsigned :8;
    unsigned CHERIE:1;
    unsigned CHTAIE:1;
    unsigned CHCCIE:1;
    unsigned CHBCIE:1;
    unsigned CHDHIE:1;
    unsigned CHDDIE:1;
    unsigned CHSHIE:1;
    unsigned CHSDIE:1;
  };
  struct {
    unsigned w:32;
  };
} __DCH3INTbits_t;
volatile __DCH3INTbits_t DCH3INTbits __asm__ ("DCH3INT");
volatile unsigned int        DCH3INTCLR;
volatile unsigned int        DCH3INTSET;
volatile unsigned int        DCH3INTINV;
volatile unsigned int        DCH3SSA;
volatile unsigned int        DCH3SSACLR;
volatile unsigned int        DCH3SSASET;
volatile unsigned int        DCH3SSAINV;
volatile unsigned int        DCH3DSA;
volatile unsigned int        DCH3DSACLR;
volatile unsigned int        DCH3DSASET;
volatile unsigned int        DCH3DSAINV;
volatile unsigned int        DCH3SSIZ;
volatile unsigned int        DCH3SSIZCLR;
volatile unsigned int        DCH3SSIZSET;
volatile unsigned int        DCH3SSIZINV;
volatile unsigned int        DCH3DSIZ;
volatile unsigned int        DCH3DSIZCLR;
volatile unsigned int        DCH3DSIZSET;
volatile unsigned int        DCH3DSIZINV;
volatile unsigned int        DCH3SPTR;
volatile unsigned int        DCH3SPTRCLR;
volatile unsigned int        DCH3SPTRSET;
volatile unsigned int        DCH3SPTRINV;
volatile unsigned int        DCH3DPTR;
volatile unsigned int        DCH3DPTRCLR;
volatile unsigned int        DCH3DPTRSET;
volatile unsigned int        DCH3DPTRINV;
volatile unsigned int        DCH3CSIZ;
volatile unsigned int        DCH3CSIZCLR;
volatile unsigned int        DCH3CSIZSET;
volatile unsigned int        DCH3CSIZINV;
volatile unsigned int        DCH3CPTR;
volatile unsigned int        DCH3CPTRCLR;
volatile unsigned int        DCH3CPTRSET;
volatile unsigned int        DCH3CPTRINV;
volatile unsigned int        DCH3DAT;
volatile unsigned int        DCH3DATCLR;
volatile unsigned int        DCH3DATSET;
volatile unsigned int        DCH3DATINV;
volatile unsigned int        CHECON;
typedef union {
  struct {
    unsigned PFMWS:3;
    unsigned :1;
    unsigned PREFEN:2;
    unsigned :2;
    unsigned DCSZ:2;
    unsigned :6;
    unsigned CHECOH:1;
  };
  struct {
    unsigned w:32;
  };
} __CHECONbits_t;
volatile __CHECONbits_t CHECONbits __asm__ ("CHECON");
volatile unsigned int        CHECONCLR;
volatile unsigned int        CHECONSET;
volatile unsigned int        CHECONINV;
volatile unsigned int        CHEACC;
typedef struct {
  unsigned CHEIDX:4;
  unsigned :27;
  unsigned CHEWEN:1;
} __CHEACCbits_t;
volatile __CHEACCbits_t CHEACCbits __asm__ ("CHEACC");
volatile unsigned int        CHEACCCLR;
volatile unsigned int        CHEACCSET;
volatile unsigned int        CHEACCINV;
volatile unsigned int        CHETAG;
typedef union {
  struct {
    unsigned :1;
    unsigned LTYPE:1;
    unsigned LLOCK:1;
    unsigned LVALID:1;
    unsigned LTAG:20;
    unsigned :7;
    unsigned LTAGBOOT:1;
  };
  struct {
    unsigned w:32;
  };
} __CHETAGbits_t;
volatile __CHETAGbits_t CHETAGbits __asm__ ("CHETAG");
volatile unsigned int        CHETAGCLR;
volatile unsigned int        CHETAGSET;
volatile unsigned int        CHETAGINV;
volatile unsigned int        CHEMSK;
typedef struct {
  unsigned :5;
  unsigned LMASK:11;
} __CHEMSKbits_t;
volatile __CHEMSKbits_t CHEMSKbits __asm__ ("CHEMSK");
volatile unsigned int        CHEMSKCLR;
volatile unsigned int        CHEMSKSET;
volatile unsigned int        CHEMSKINV;
volatile unsigned int        CHEW0;
typedef struct {
  unsigned CHEW0:32;
} __CHEW0bits_t;
volatile __CHEW0bits_t CHEW0bits __asm__ ("CHEW0");
volatile unsigned int        CHEW1;
typedef struct {
  unsigned CHEW1:32;
} __CHEW1bits_t;
volatile __CHEW1bits_t CHEW1bits __asm__ ("CHEW1");
volatile unsigned int        CHEW2;
typedef struct {
  unsigned CHEW2:32;
} __CHEW2bits_t;
volatile __CHEW2bits_t CHEW2bits __asm__ ("CHEW2");
volatile unsigned int        CHEW3;
typedef struct {
  unsigned CHEW3:32;
} __CHEW3bits_t;
volatile __CHEW3bits_t CHEW3bits __asm__ ("CHEW3");
volatile unsigned int        CHELRU;
typedef struct {
  unsigned CHELRU:25;
} __CHELRUbits_t;
volatile __CHELRUbits_t CHELRUbits __asm__ ("CHELRU");
volatile unsigned int        CHEHIT;
typedef struct {
  unsigned CHEHIT:32;
} __CHEHITbits_t;
volatile __CHEHITbits_t CHEHITbits __asm__ ("CHEHIT");
volatile unsigned int        CHEMIS;
typedef struct {
  unsigned CHEMIS:32;
} __CHEMISbits_t;
volatile __CHEMISbits_t CHEMISbits __asm__ ("CHEMIS");
volatile unsigned int        RESERVED1;
volatile unsigned int        CHEPFABT;
typedef struct {
  unsigned CHEPFABT:32;
} __CHEPFABTbits_t;
volatile __CHEPFABTbits_t CHEPFABTbits __asm__ ("CHEPFABT");
volatile unsigned int        U1OTGIR;
typedef struct {
  unsigned VBUSVDIF:1;
  unsigned :1;
  unsigned SESENDIF:1;
  unsigned SESVDIF:1;
  unsigned ACTVIF:1;
  unsigned LSTATEIF:1;
  unsigned T1MSECIF:1;
  unsigned IDIF:1;
} __U1OTGIRbits_t;
volatile __U1OTGIRbits_t U1OTGIRbits __asm__ ("U1OTGIR");
volatile unsigned int        U1OTGIRCLR;
volatile unsigned int        U1OTGIE;
typedef struct {
  unsigned VBUSVDIE:1;
  unsigned :1;
  unsigned SESENDIE:1;
  unsigned SESVDIE:1;
  unsigned ACTVIE:1;
  unsigned LSTATEIE:1;
  unsigned T1MSECIE:1;
  unsigned IDIE:1;
} __U1OTGIEbits_t;
volatile __U1OTGIEbits_t U1OTGIEbits __asm__ ("U1OTGIE");
volatile unsigned int        U1OTGIECLR;
volatile unsigned int        U1OTGIESET;
volatile unsigned int        U1OTGIEINV;
volatile unsigned int        U1OTGSTAT;
typedef struct {
  unsigned VBUSVD:1;
  unsigned :1;
  unsigned SESEND:1;
  unsigned SESVD:1;
  unsigned :1;
  unsigned LSTATE:1;
  unsigned :1;
  unsigned ID:1;
} __U1OTGSTATbits_t;
volatile __U1OTGSTATbits_t U1OTGSTATbits __asm__ ("U1OTGSTAT");
volatile unsigned int        U1OTGCON;
typedef struct {
  unsigned VBUSDIS:1;
  unsigned VBUSCHG:1;
  unsigned OTGEN:1;
  unsigned VBUSON:1;
  unsigned DMPULDWN:1;
  unsigned DPPULDWN:1;
  unsigned DMPULUP:1;
  unsigned DPPULUP:1;
} __U1OTGCONbits_t;
volatile __U1OTGCONbits_t U1OTGCONbits __asm__ ("U1OTGCON");
volatile unsigned int        U1OTGCONCLR;
volatile unsigned int        U1OTGCONSET;
volatile unsigned int        U1OTGCONINV;
volatile unsigned int        U1PWRC;
typedef struct {
  unsigned USBPWR:1;
  unsigned USUSPEND:1;
  unsigned :1;
  unsigned USBBUSY:1;
  unsigned USLPGRD:1;
  unsigned :2;
  unsigned UACTPND:1;
} __U1PWRCbits_t;
volatile __U1PWRCbits_t U1PWRCbits __asm__ ("U1PWRC");
volatile unsigned int        U1PWRCCLR;
volatile unsigned int        U1PWRCSET;
volatile unsigned int        U1PWRCINV;
volatile unsigned int        U1IR;
typedef union {
  struct {
    unsigned URSTIF_DETACHIF:1;
    unsigned UERRIF:1;
    unsigned SOFIF:1;
    unsigned TRNIF:1;
    unsigned IDLEIF:1;
    unsigned RESUMEIF:1;
    unsigned ATTACHIF:1;
    unsigned STALLIF:1;
  };
  struct {
    unsigned DETACHIF:1;
  };
  struct {
    unsigned URSTIF:1;
  };
} __U1IRbits_t;
volatile __U1IRbits_t U1IRbits __asm__ ("U1IR");
volatile unsigned int        U1IRCLR;
volatile unsigned int        U1IE;
typedef union {
  struct {
    unsigned URSTIE_DETACHIE:1;
    unsigned UERRIE:1;
    unsigned SOFIE:1;
    unsigned TRNIE:1;
    unsigned IDLEIE:1;
    unsigned RESUMEIE:1;
    unsigned ATTACHIE:1;
    unsigned STALLIE:1;
  };
  struct {
    unsigned DETACHIE:1;
  };
  struct {
    unsigned URSTIE:1;
  };
} __U1IEbits_t;
volatile __U1IEbits_t U1IEbits __asm__ ("U1IE");
volatile unsigned int        U1IECLR;
volatile unsigned int        U1IESET;
volatile unsigned int        U1IEINV;
volatile unsigned int        U1EIR;
typedef union {
  struct {
    unsigned PIDEF:1;
    unsigned CRC5EF_EOFEF:1;
    unsigned CRC16EF:1;
    unsigned DFN8EF:1;
    unsigned BTOEF:1;
    unsigned DMAEF:1;
    unsigned BMXEF:1;
    unsigned BTSEF:1;
  };
  struct {
    unsigned :1;
    unsigned CRC5EF:1;
  };
  struct {
    unsigned :1;
    unsigned EOFEF:1;
  };
} __U1EIRbits_t;
volatile __U1EIRbits_t U1EIRbits __asm__ ("U1EIR");
volatile unsigned int        U1EIRCLR;
volatile unsigned int        U1EIE;
typedef union {
  struct {
    unsigned PIDEE:1;
    unsigned CRC5EE_EOFEE:1;
    unsigned CRC16EE:1;
    unsigned DFN8EE:1;
    unsigned BTOEE:1;
    unsigned DMAEE:1;
    unsigned BMXEE:1;
    unsigned BTSEE:1;
  };
  struct {
    unsigned :1;
    unsigned CRC5EE:1;
  };
  struct {
    unsigned :1;
    unsigned EOFEE:1;
  };
} __U1EIEbits_t;
volatile __U1EIEbits_t U1EIEbits __asm__ ("U1EIE");
volatile unsigned int        U1EIECLR;
volatile unsigned int        U1EIESET;
volatile unsigned int        U1EIEINV;
volatile unsigned int        U1STAT;
typedef union {
  struct {
    unsigned :2;
    unsigned PPBI:1;
    unsigned DIR:1;
    unsigned ENDPT:4;
  };
  struct {
    unsigned :4;
    unsigned ENDPT0:1;
    unsigned ENDPT1:1;
    unsigned ENDPT2:1;
    unsigned ENDPT3:1;
  };
} __U1STATbits_t;
volatile __U1STATbits_t U1STATbits __asm__ ("U1STAT");
volatile unsigned int        U1CON;
typedef union {
  struct {
    unsigned USBEN_SOFEN:1;
    unsigned PPBRST:1;
    unsigned RESUME:1;
    unsigned HOSTEN:1;
    unsigned USBRST:1;
    unsigned PKTDIS_TOKBUSY:1;
    unsigned SE0:1;
    unsigned JSTATE:1;
  };
  struct {
    unsigned USBEN:1;
  };
  struct {
    unsigned SOFEN:1;
    unsigned :4;
    unsigned PKTDIS:1;
  };
  struct {
    unsigned :5;
    unsigned TOKBUSY:1;
  };
} __U1CONbits_t;
volatile __U1CONbits_t U1CONbits __asm__ ("U1CON");
volatile unsigned int        U1CONCLR;
volatile unsigned int        U1CONSET;
volatile unsigned int        U1CONINV;
volatile unsigned int        U1ADDR;
typedef union {
  struct {
    unsigned DEVADDR:7;
    unsigned LSPDEN:1;
  };
  struct {
    unsigned DEVADDR0:1;
    unsigned DEVADDR1:1;
    unsigned DEVADDR2:1;
    unsigned DEVADDR3:1;
    unsigned DEVADDR4:1;
    unsigned DEVADDR5:1;
    unsigned DEVADDR6:1;
  };
} __U1ADDRbits_t;
volatile __U1ADDRbits_t U1ADDRbits __asm__ ("U1ADDR");
volatile unsigned int        U1ADDRCLR;
volatile unsigned int        U1ADDRSET;
volatile unsigned int        U1ADDRINV;
volatile unsigned int        U1BDTP1;
typedef struct {
  unsigned :1;
  unsigned BDTPTRL:7;
} __U1BDTP1bits_t;
volatile __U1BDTP1bits_t U1BDTP1bits __asm__ ("U1BDTP1");
volatile unsigned int        U1BDTP1CLR;
volatile unsigned int        U1BDTP1SET;
volatile unsigned int        U1BDTP1INV;
volatile unsigned int        U1FRML;
typedef union {
  struct {
    unsigned FRML:8;
  };
  struct {
    unsigned FRM0:1;
    unsigned FRM1:1;
    unsigned FRM2:1;
    unsigned FRM3:1;
    unsigned FRM4:1;
    unsigned FRM5:1;
    unsigned FRM6:1;
    unsigned FRM7:1;
  };
} __U1FRMLbits_t;
volatile __U1FRMLbits_t U1FRMLbits __asm__ ("U1FRML");
volatile unsigned int        U1FRMH;
typedef union {
  struct {
    unsigned FRMH:3;
  };
  struct {
    unsigned FRM8:1;
    unsigned FRM9:1;
    unsigned FRM10:1;
  };
} __U1FRMHbits_t;
volatile __U1FRMHbits_t U1FRMHbits __asm__ ("U1FRMH");
volatile unsigned int        U1TOK;
typedef union {
  struct {
    unsigned EP:4;
    unsigned PID:4;
  };
  struct {
    unsigned EP0:1;
  };
  struct {
    unsigned :1;
    unsigned EP1:1;
    unsigned EP2:1;
    unsigned EP3:1;
    unsigned PID0:1;
  };
  struct {
    unsigned :5;
    unsigned PID1:1;
    unsigned PID2:1;
    unsigned PID3:1;
  };
} __U1TOKbits_t;
volatile __U1TOKbits_t U1TOKbits __asm__ ("U1TOK");
volatile unsigned int        U1TOKCLR;
volatile unsigned int        U1TOKSET;
volatile unsigned int        U1TOKINV;
volatile unsigned int        U1SOF;
typedef struct {
  unsigned CNT:8;
} __U1SOFbits_t;
volatile __U1SOFbits_t U1SOFbits __asm__ ("U1SOF");
volatile unsigned int        U1SOFCLR;
volatile unsigned int        U1SOFSET;
volatile unsigned int        U1SOFINV;
volatile unsigned int        U1BDTP2;
typedef struct {
  unsigned BDTPTRH:8;
} __U1BDTP2bits_t;
volatile __U1BDTP2bits_t U1BDTP2bits __asm__ ("U1BDTP2");
volatile unsigned int        U1BDTP2CLR;
volatile unsigned int        U1BDTP2SET;
volatile unsigned int        U1BDTP2INV;
volatile unsigned int        U1BDTP3;
typedef struct {
  unsigned BDTPTRU:8;
} __U1BDTP3bits_t;
volatile __U1BDTP3bits_t U1BDTP3bits __asm__ ("U1BDTP3");
volatile unsigned int        U1BDTP3CLR;
volatile unsigned int        U1BDTP3SET;
volatile unsigned int        U1BDTP3INV;
volatile unsigned int        U1CNFG1;
typedef struct {
  unsigned UASUSPND:1;
  unsigned :3;
  unsigned USBSIDL:1;
  unsigned :1;
  unsigned UOEMON:1;
  unsigned UTEYE:1;
} __U1CNFG1bits_t;
volatile __U1CNFG1bits_t U1CNFG1bits __asm__ ("U1CNFG1");
volatile unsigned int        U1CNFG1CLR;
volatile unsigned int        U1CNFG1SET;
volatile unsigned int        U1CNFG1INV;
volatile unsigned int        U1EP0;
typedef struct {
  unsigned EPHSHK:1;
  unsigned EPSTALL:1;
  unsigned EPTXEN:1;
  unsigned EPRXEN:1;
  unsigned EPCONDIS:1;
  unsigned :1;
  unsigned RETRYDIS:1;
  unsigned LSPD:1;
} __U1EP0bits_t;
volatile __U1EP0bits_t U1EP0bits __asm__ ("U1EP0");
volatile unsigned int        U1EP0CLR;
volatile unsigned int        U1EP0SET;
volatile unsigned int        U1EP0INV;
volatile unsigned int        U1EP1;
typedef struct {
  unsigned EPHSHK:1;
  unsigned EPSTALL:1;
  unsigned EPTXEN:1;
  unsigned EPRXEN:1;
  unsigned EPCONDIS:1;
} __U1EP1bits_t;
volatile __U1EP1bits_t U1EP1bits __asm__ ("U1EP1");
volatile unsigned int        U1EP1CLR;
volatile unsigned int        U1EP1SET;
volatile unsigned int        U1EP1INV;
volatile unsigned int        U1EP2;
typedef struct {
  unsigned EPHSHK:1;
  unsigned EPSTALL:1;
  unsigned EPTXEN:1;
  unsigned EPRXEN:1;
  unsigned EPCONDIS:1;
} __U1EP2bits_t;
volatile __U1EP2bits_t U1EP2bits __asm__ ("U1EP2");
volatile unsigned int        U1EP2CLR;
volatile unsigned int        U1EP2SET;
volatile unsigned int        U1EP2INV;
volatile unsigned int        U1EP3;
typedef struct {
  unsigned EPHSHK:1;
  unsigned EPSTALL:1;
  unsigned EPTXEN:1;
  unsigned EPRXEN:1;
  unsigned EPCONDIS:1;
} __U1EP3bits_t;
volatile __U1EP3bits_t U1EP3bits __asm__ ("U1EP3");
volatile unsigned int        U1EP3CLR;
volatile unsigned int        U1EP3SET;
volatile unsigned int        U1EP3INV;
volatile unsigned int        U1EP4;
typedef struct {
  unsigned EPHSHK:1;
  unsigned EPSTALL:1;
  unsigned EPTXEN:1;
  unsigned EPRXEN:1;
  unsigned EPCONDIS:1;
} __U1EP4bits_t;
volatile __U1EP4bits_t U1EP4bits __asm__ ("U1EP4");
volatile unsigned int        U1EP4CLR;
volatile unsigned int        U1EP4SET;
volatile unsigned int        U1EP4INV;
volatile unsigned int        U1EP5;
typedef struct {
  unsigned EPHSHK:1;
  unsigned EPSTALL:1;
  unsigned EPTXEN:1;
  unsigned EPRXEN:1;
  unsigned EPCONDIS:1;
} __U1EP5bits_t;
volatile __U1EP5bits_t U1EP5bits __asm__ ("U1EP5");
volatile unsigned int        U1EP5CLR;
volatile unsigned int        U1EP5SET;
volatile unsigned int        U1EP5INV;
volatile unsigned int        U1EP6;
typedef struct {
  unsigned EPHSHK:1;
  unsigned EPSTALL:1;
  unsigned EPTXEN:1;
  unsigned EPRXEN:1;
  unsigned EPCONDIS:1;
} __U1EP6bits_t;
volatile __U1EP6bits_t U1EP6bits __asm__ ("U1EP6");
volatile unsigned int        U1EP6CLR;
volatile unsigned int        U1EP6SET;
volatile unsigned int        U1EP6INV;
volatile unsigned int        U1EP7;
typedef struct {
  unsigned EPHSHK:1;
  unsigned EPSTALL:1;
  unsigned EPTXEN:1;
  unsigned EPRXEN:1;
  unsigned EPCONDIS:1;
} __U1EP7bits_t;
volatile __U1EP7bits_t U1EP7bits __asm__ ("U1EP7");
volatile unsigned int        U1EP7CLR;
volatile unsigned int        U1EP7SET;
volatile unsigned int        U1EP7INV;
volatile unsigned int        U1EP8;
typedef struct {
  unsigned EPHSHK:1;
  unsigned EPSTALL:1;
  unsigned EPTXEN:1;
  unsigned EPRXEN:1;
  unsigned EPCONDIS:1;
} __U1EP8bits_t;
volatile __U1EP8bits_t U1EP8bits __asm__ ("U1EP8");
volatile unsigned int        U1EP8CLR;
volatile unsigned int        U1EP8SET;
volatile unsigned int        U1EP8INV;
volatile unsigned int        U1EP9;
typedef struct {
  unsigned EPHSHK:1;
  unsigned EPSTALL:1;
  unsigned EPTXEN:1;
  unsigned EPRXEN:1;
  unsigned EPCONDIS:1;
} __U1EP9bits_t;
volatile __U1EP9bits_t U1EP9bits __asm__ ("U1EP9");
volatile unsigned int        U1EP9CLR;
volatile unsigned int        U1EP9SET;
volatile unsigned int        U1EP9INV;
volatile unsigned int        U1EP10;
typedef struct {
  unsigned EPHSHK:1;
  unsigned EPSTALL:1;
  unsigned EPTXEN:1;
  unsigned EPRXEN:1;
  unsigned EPCONDIS:1;
} __U1EP10bits_t;
volatile __U1EP10bits_t U1EP10bits __asm__ ("U1EP10");
volatile unsigned int        U1EP10CLR;
volatile unsigned int        U1EP10SET;
volatile unsigned int        U1EP10INV;
volatile unsigned int        U1EP11;
typedef struct {
  unsigned EPHSHK:1;
  unsigned EPSTALL:1;
  unsigned EPTXEN:1;
  unsigned EPRXEN:1;
  unsigned EPCONDIS:1;
} __U1EP11bits_t;
volatile __U1EP11bits_t U1EP11bits __asm__ ("U1EP11");
volatile unsigned int        U1EP11CLR;
volatile unsigned int        U1EP11SET;
volatile unsigned int        U1EP11INV;
volatile unsigned int        U1EP12;
typedef struct {
  unsigned EPHSHK:1;
  unsigned EPSTALL:1;
  unsigned EPTXEN:1;
  unsigned EPRXEN:1;
  unsigned EPCONDIS:1;
} __U1EP12bits_t;
volatile __U1EP12bits_t U1EP12bits __asm__ ("U1EP12");
volatile unsigned int        U1EP12CLR;
volatile unsigned int        U1EP12SET;
volatile unsigned int        U1EP12INV;
volatile unsigned int        U1EP13;
typedef struct {
  unsigned EPHSHK:1;
  unsigned EPSTALL:1;
  unsigned EPTXEN:1;
  unsigned EPRXEN:1;
  unsigned EPCONDIS:1;
} __U1EP13bits_t;
volatile __U1EP13bits_t U1EP13bits __asm__ ("U1EP13");
volatile unsigned int        U1EP13CLR;
volatile unsigned int        U1EP13SET;
volatile unsigned int        U1EP13INV;
volatile unsigned int        U1EP14;
typedef struct {
  unsigned EPHSHK:1;
  unsigned EPSTALL:1;
  unsigned EPTXEN:1;
  unsigned EPRXEN:1;
  unsigned EPCONDIS:1;
} __U1EP14bits_t;
volatile __U1EP14bits_t U1EP14bits __asm__ ("U1EP14");
volatile unsigned int        U1EP14CLR;
volatile unsigned int        U1EP14SET;
volatile unsigned int        U1EP14INV;
volatile unsigned int        U1EP15;
typedef struct {
  unsigned EPHSHK:1;
  unsigned EPSTALL:1;
  unsigned EPTXEN:1;
  unsigned EPRXEN:1;
  unsigned EPCONDIS:1;
} __U1EP15bits_t;
volatile __U1EP15bits_t U1EP15bits __asm__ ("U1EP15");
volatile unsigned int        U1EP15CLR;
volatile unsigned int        U1EP15SET;
volatile unsigned int        U1EP15INV;
volatile unsigned int        ANSELB;
typedef union {
  struct {
    unsigned ANSB0:1;
    unsigned ANSB1:1;
    unsigned ANSB2:1;
    unsigned ANSB3:1;
    unsigned ANSB4:1;
    unsigned ANSB5:1;
    unsigned ANSB6:1;
    unsigned ANSB7:1;
    unsigned ANSB8:1;
    unsigned ANSB9:1;
    unsigned ANSB10:1;
    unsigned ANSB11:1;
    unsigned ANSB12:1;
    unsigned ANSB13:1;
    unsigned ANSB14:1;
    unsigned ANSB15:1;
  };
  struct {
    unsigned w:32;
  };
} __ANSELBbits_t;
volatile __ANSELBbits_t ANSELBbits __asm__ ("ANSELB");
volatile unsigned int        ANSELBCLR;
volatile unsigned int        ANSELBSET;
volatile unsigned int        ANSELBINV;
volatile unsigned int        TRISB;
typedef union {
  struct {
    unsigned TRISB0:1;
    unsigned TRISB1:1;
    unsigned TRISB2:1;
    unsigned TRISB3:1;
    unsigned TRISB4:1;
    unsigned TRISB5:1;
    unsigned TRISB6:1;
    unsigned TRISB7:1;
    unsigned TRISB8:1;
    unsigned TRISB9:1;
    unsigned TRISB10:1;
    unsigned TRISB11:1;
    unsigned TRISB12:1;
    unsigned TRISB13:1;
    unsigned TRISB14:1;
    unsigned TRISB15:1;
  };
  struct {
    unsigned w:32;
  };
} __TRISBbits_t;
volatile __TRISBbits_t TRISBbits __asm__ ("TRISB");
volatile unsigned int        TRISBCLR;
volatile unsigned int        TRISBSET;
volatile unsigned int        TRISBINV;
volatile unsigned int        PORTB;
typedef union {
  struct {
    unsigned RB0:1;
    unsigned RB1:1;
    unsigned RB2:1;
    unsigned RB3:1;
    unsigned RB4:1;
    unsigned RB5:1;
    unsigned RB6:1;
    unsigned RB7:1;
    unsigned RB8:1;
    unsigned RB9:1;
    unsigned RB10:1;
    unsigned RB11:1;
    unsigned RB12:1;
    unsigned RB13:1;
    unsigned RB14:1;
    unsigned RB15:1;
  };
  struct {
    unsigned w:32;
  };
} __PORTBbits_t;
volatile __PORTBbits_t PORTBbits __asm__ ("PORTB");
volatile unsigned int        PORTBCLR;
volatile unsigned int        PORTBSET;
volatile unsigned int        PORTBINV;
volatile unsigned int        LATB;
typedef union {
  struct {
    unsigned LATB0:1;
    unsigned LATB1:1;
    unsigned LATB2:1;
    unsigned LATB3:1;
    unsigned LATB4:1;
    unsigned LATB5:1;
    unsigned LATB6:1;
    unsigned LATB7:1;
    unsigned LATB8:1;
    unsigned LATB9:1;
    unsigned LATB10:1;
    unsigned LATB11:1;
    unsigned LATB12:1;
    unsigned LATB13:1;
    unsigned LATB14:1;
    unsigned LATB15:1;
  };
  struct {
    unsigned w:32;
  };
} __LATBbits_t;
extern volatile __LATBbits_t LATBbits __asm__ ("LATB");
volatile unsigned int        LATBCLR;
volatile unsigned int        LATBSET;
volatile unsigned int        LATBINV;
volatile unsigned int        ODCB;
typedef union {
  struct {
    unsigned ODCB0:1;
    unsigned ODCB1:1;
    unsigned ODCB2:1;
    unsigned ODCB3:1;
    unsigned ODCB4:1;
    unsigned ODCB5:1;
    unsigned ODCB6:1;
    unsigned ODCB7:1;
    unsigned ODCB8:1;
    unsigned ODCB9:1;
    unsigned ODCB10:1;
    unsigned ODCB11:1;
    unsigned ODCB12:1;
    unsigned ODCB13:1;
    unsigned ODCB14:1;
    unsigned ODCB15:1;
  };
  struct {
    unsigned w:32;
  };
} __ODCBbits_t;
volatile __ODCBbits_t ODCBbits __asm__ ("ODCB");
volatile unsigned int        ODCBCLR;
volatile unsigned int        ODCBSET;
volatile unsigned int        ODCBINV;
volatile unsigned int        CNPUB;
typedef union {
  struct {
    unsigned CNPUB0:1;
    unsigned CNPUB1:1;
    unsigned CNPUB2:1;
    unsigned CNPUB3:1;
    unsigned CNPUB4:1;
    unsigned CNPUB5:1;
    unsigned CNPUB6:1;
    unsigned CNPUB7:1;
    unsigned CNPUB8:1;
    unsigned CNPUB9:1;
    unsigned CNPUB10:1;
    unsigned CNPUB11:1;
    unsigned CNPUB12:1;
    unsigned CNPUB13:1;
    unsigned CNPUB14:1;
    unsigned CNPUB15:1;
  };
  struct {
    unsigned w:32;
  };
} __CNPUBbits_t;
volatile __CNPUBbits_t CNPUBbits __asm__ ("CNPUB");
volatile unsigned int        CNPUBCLR;
volatile unsigned int        CNPUBSET;
volatile unsigned int        CNPUBINV;
volatile unsigned int        CNPDB;
typedef union {
  struct {
    unsigned CNPDB0:1;
    unsigned CNPDB1:1;
    unsigned CNPDB2:1;
    unsigned CNPDB3:1;
    unsigned CNPDB4:1;
    unsigned CNPDB5:1;
    unsigned CNPDB6:1;
    unsigned CNPDB7:1;
    unsigned CNPDB8:1;
    unsigned CNPDB9:1;
    unsigned CNPDB10:1;
    unsigned CNPDB11:1;
    unsigned CNPDB12:1;
    unsigned CNPDB13:1;
    unsigned CNPDB14:1;
    unsigned CNPDB15:1;
  };
  struct {
    unsigned w:32;
  };
} __CNPDBbits_t;
volatile __CNPDBbits_t CNPDBbits __asm__ ("CNPDB");
volatile unsigned int        CNPDBCLR;
volatile unsigned int        CNPDBSET;
volatile unsigned int        CNPDBINV;
volatile unsigned int        CNCONB;
typedef union {
  struct {
    unsigned :13;
    unsigned SIDL:1;
    unsigned :1;
    unsigned ON:1;
  };
  struct {
    unsigned w:32;
  };
} __CNCONBbits_t;
volatile __CNCONBbits_t CNCONBbits __asm__ ("CNCONB");
volatile unsigned int        CNCONBCLR;
volatile unsigned int        CNCONBSET;
volatile unsigned int        CNCONBINV;
volatile unsigned int        CNENB;
typedef union {
  struct {
    unsigned CNIEB0:1;
    unsigned CNIEB1:1;
    unsigned CNIEB2:1;
    unsigned CNIEB3:1;
    unsigned CNIEB4:1;
    unsigned CNIEB5:1;
    unsigned CNIEB6:1;
    unsigned CNIEB7:1;
    unsigned CNIEB8:1;
    unsigned CNIEB9:1;
    unsigned CNIEB10:1;
    unsigned CNIEB11:1;
    unsigned CNIEB12:1;
    unsigned CNIEB13:1;
    unsigned CNIEB14:1;
    unsigned CNIEB15:1;
  };
  struct {
    unsigned w:32;
  };
} __CNENBbits_t;
volatile __CNENBbits_t CNENBbits __asm__ ("CNENB");
volatile unsigned int        CNENBCLR;
volatile unsigned int        CNENBSET;
volatile unsigned int        CNENBINV;
volatile unsigned int        CNSTATB;
typedef union {
  struct {
    unsigned CNSTATB0:1;
    unsigned CNSTATB1:1;
    unsigned CNSTATB2:1;
    unsigned CNSTATB3:1;
    unsigned CNSTATB4:1;
    unsigned CNSTATB5:1;
    unsigned CNSTATB6:1;
    unsigned CNSTATB7:1;
    unsigned CNSTATB8:1;
    unsigned CNSTATB9:1;
    unsigned CNSTATB10:1;
    unsigned CNSTATB11:1;
    unsigned CNSTATB12:1;
    unsigned CNSTATB13:1;
    unsigned CNSTATB14:1;
    unsigned CNSTATB15:1;
  };
  struct {
    unsigned w:32;
  };
} __CNSTATBbits_t;
volatile __CNSTATBbits_t CNSTATBbits __asm__ ("CNSTATB");
volatile unsigned int        CNSTATBCLR;
volatile unsigned int        CNSTATBSET;
volatile unsigned int        CNSTATBINV;
volatile unsigned int        ANSELC;
typedef union {
  struct {
    unsigned :12;
    unsigned ANSC12:1;
    unsigned ANSC13:1;
    unsigned ANSC14:1;
    unsigned ANSC15:1;
  };
  struct {
    unsigned w:32;
  };
} __ANSELCbits_t;
volatile __ANSELCbits_t ANSELCbits __asm__ ("ANSELC");
volatile unsigned int        ANSELCCLR;
volatile unsigned int        ANSELCSET;
volatile unsigned int        ANSELCINV;
volatile unsigned int        TRISC;
typedef union {
  struct {
    unsigned :12;
    unsigned TRISC12:1;
    unsigned TRISC13:1;
    unsigned TRISC14:1;
    unsigned TRISC15:1;
  };
  struct {
    unsigned w:32;
  };
} __TRISCbits_t;
volatile __TRISCbits_t TRISCbits __asm__ ("TRISC");
volatile unsigned int        TRISCCLR;
volatile unsigned int        TRISCSET;
volatile unsigned int        TRISCINV;
volatile unsigned int        PORTC;
typedef union {
  struct {
    unsigned :12;
    unsigned RC12:1;
    unsigned RC13:1;
    unsigned RC14:1;
    unsigned RC15:1;
  };
  struct {
    unsigned w:32;
  };
} __PORTCbits_t;
volatile __PORTCbits_t PORTCbits __asm__ ("PORTC");
volatile unsigned int        PORTCCLR;
volatile unsigned int        PORTCSET;
volatile unsigned int        PORTCINV;
volatile unsigned int        LATC;
typedef union {
  struct {
    unsigned :12;
    unsigned LATC12:1;
    unsigned LATC13:1;
    unsigned LATC14:1;
    unsigned LATC15:1;
  };
  struct {
    unsigned w:32;
  };
} __LATCbits_t;
extern volatile __LATCbits_t LATCbits __asm__ ("LATC");
volatile unsigned int        LATCCLR;
volatile unsigned int        LATCSET;
volatile unsigned int        LATCINV;
volatile unsigned int        ODCC;
typedef union {
  struct {
    unsigned :12;
    unsigned ODCC12:1;
    unsigned ODCC13:1;
    unsigned ODCC14:1;
    unsigned ODCC15:1;
  };
  struct {
    unsigned w:32;
  };
} __ODCCbits_t;
volatile __ODCCbits_t ODCCbits __asm__ ("ODCC");
volatile unsigned int        ODCCCLR;
volatile unsigned int        ODCCSET;
volatile unsigned int        ODCCINV;
volatile unsigned int        CNPUC;
typedef union {
  struct {
    unsigned :12;
    unsigned CNPUC12:1;
    unsigned CNPUC13:1;
    unsigned CNPUC14:1;
    unsigned CNPUC15:1;
  };
  struct {
    unsigned w:32;
  };
} __CNPUCbits_t;
volatile __CNPUCbits_t CNPUCbits __asm__ ("CNPUC");
volatile unsigned int        CNPUCCLR;
volatile unsigned int        CNPUCSET;
volatile unsigned int        CNPUCINV;
volatile unsigned int        CNPDC;
typedef union {
  struct {
    unsigned :12;
    unsigned CNPDC12:1;
    unsigned CNPDC13:1;
    unsigned CNPDC14:1;
    unsigned CNPDC15:1;
  };
  struct {
    unsigned w:32;
  };
} __CNPDCbits_t;
volatile __CNPDCbits_t CNPDCbits __asm__ ("CNPDC");
volatile unsigned int        CNPDCCLR;
volatile unsigned int        CNPDCSET;
volatile unsigned int        CNPDCINV;
volatile unsigned int        CNCONC;
typedef union {
  struct {
    unsigned :13;
    unsigned SIDL:1;
    unsigned :1;
    unsigned ON:1;
  };
  struct {
    unsigned w:32;
  };
} __CNCONCbits_t;
volatile __CNCONCbits_t CNCONCbits __asm__ ("CNCONC");
volatile unsigned int        CNCONCCLR;
volatile unsigned int        CNCONCSET;
volatile unsigned int        CNCONCINV;
volatile unsigned int        CNENC;
typedef union {
  struct {
    unsigned :12;
    unsigned CNIEC12:1;
    unsigned CNIEC13:1;
    unsigned CNIEC14:1;
    unsigned CNIEC15:1;
  };
  struct {
    unsigned w:32;
  };
} __CNENCbits_t;
volatile __CNENCbits_t CNENCbits __asm__ ("CNENC");
volatile unsigned int        CNENCCLR;
volatile unsigned int        CNENCSET;
volatile unsigned int        CNENCINV;
volatile unsigned int        CNSTATC;
typedef union {
  struct {
    unsigned :12;
    unsigned CNSTATC12:1;
    unsigned CNSTATC13:1;
    unsigned CNSTATC14:1;
    unsigned CNSTATC15:1;
  };
  struct {
    unsigned w:32;
  };
} __CNSTATCbits_t;
volatile __CNSTATCbits_t CNSTATCbits __asm__ ("CNSTATC");
volatile unsigned int        CNSTATCCLR;
volatile unsigned int        CNSTATCSET;
volatile unsigned int        CNSTATCINV;
volatile unsigned int        ANSELD;
typedef union {
  struct {
    unsigned :1;
    unsigned ANSD1:1;
    unsigned ANSD2:1;
    unsigned ANSD3:1;
  };
  struct {
    unsigned w:32;
  };
} __ANSELDbits_t;
volatile __ANSELDbits_t ANSELDbits __asm__ ("ANSELD");
volatile unsigned int        ANSELDCLR;
volatile unsigned int        ANSELDSET;
volatile unsigned int        ANSELDINV;
volatile unsigned int        TRISD;
typedef union {
  struct {
    unsigned TRISD0:1;
    unsigned TRISD1:1;
    unsigned TRISD2:1;
    unsigned TRISD3:1;
    unsigned TRISD4:1;
    unsigned TRISD5:1;
    unsigned TRISD6:1;
    unsigned TRISD7:1;
    unsigned TRISD8:1;
    unsigned TRISD9:1;
    unsigned TRISD10:1;
    unsigned TRISD11:1;
  };
  struct {
    unsigned w:32;
  };
} __TRISDbits_t;
volatile __TRISDbits_t TRISDbits __asm__ ("TRISD");
volatile unsigned int        TRISDCLR;
volatile unsigned int        TRISDSET;
volatile unsigned int        TRISDINV;
volatile unsigned int        PORTD;
typedef union {
  struct {
    unsigned RD0:1;
    unsigned RD1:1;
    unsigned RD2:1;
    unsigned RD3:1;
    unsigned RD4:1;
    unsigned RD5:1;
    unsigned RD6:1;
    unsigned RD7:1;
    unsigned RD8:1;
    unsigned RD9:1;
    unsigned RD10:1;
    unsigned RD11:1;
  };
  struct {
    unsigned w:32;
  };
} __PORTDbits_t;
volatile __PORTDbits_t PORTDbits __asm__ ("PORTD");
volatile unsigned int        PORTDCLR;
volatile unsigned int        PORTDSET;
volatile unsigned int        PORTDINV;
volatile unsigned int        LATD;
typedef union {
  struct {
    unsigned LATD0:1;
    unsigned LATD1:1;
    unsigned LATD2:1;
    unsigned LATD3:1;
    unsigned LATD4:1;
    unsigned LATD5:1;
    unsigned LATD6:1;
    unsigned LATD7:1;
    unsigned LATD8:1;
    unsigned LATD9:1;
    unsigned LATD10:1;
    unsigned LATD11:1;
  };
  struct {
    unsigned w:32;
  };
} __LATDbits_t;
extern volatile __LATDbits_t LATDbits __asm__ ("LATD");
volatile unsigned int        LATDCLR;
volatile unsigned int        LATDSET;
volatile unsigned int        LATDINV;
volatile unsigned int        ODCD;
typedef union {
  struct {
    unsigned ODCD0:1;
    unsigned ODCD1:1;
    unsigned ODCD2:1;
    unsigned ODCD3:1;
    unsigned ODCD4:1;
    unsigned ODCD5:1;
    unsigned ODCD6:1;
    unsigned ODCD7:1;
    unsigned ODCD8:1;
    unsigned ODCD9:1;
    unsigned ODCD10:1;
    unsigned ODCD11:1;
  };
  struct {
    unsigned w:32;
  };
} __ODCDbits_t;
volatile __ODCDbits_t ODCDbits __asm__ ("ODCD");
volatile unsigned int        ODCDCLR;
volatile unsigned int        ODCDSET;
volatile unsigned int        ODCDINV;
volatile unsigned int        CNPUD;
typedef union {
  struct {
    unsigned CNPUD0:1;
    unsigned CNPUD1:1;
    unsigned CNPUD2:1;
    unsigned CNPUD3:1;
    unsigned CNPUD4:1;
    unsigned CNPUD5:1;
    unsigned CNPUD6:1;
    unsigned CNPUD7:1;
    unsigned CNPUD8:1;
    unsigned CNPUD9:1;
    unsigned CNPUD10:1;
    unsigned CNPUD11:1;
  };
  struct {
    unsigned w:32;
  };
} __CNPUDbits_t;
volatile __CNPUDbits_t CNPUDbits __asm__ ("CNPUD");
volatile unsigned int        CNPUDCLR;
volatile unsigned int        CNPUDSET;
volatile unsigned int        CNPUDINV;
volatile unsigned int        CNPDD;
typedef union {
  struct {
    unsigned CNPDD0:1;
    unsigned CNPDD1:1;
    unsigned CNPDD2:1;
    unsigned CNPDD3:1;
    unsigned CNPDD4:1;
    unsigned CNPDD5:1;
    unsigned CNPDD6:1;
    unsigned CNPDD7:1;
    unsigned CNPDD8:1;
    unsigned CNPDD9:1;
    unsigned CNPDD10:1;
    unsigned CNPDD11:1;
  };
  struct {
    unsigned w:32;
  };
} __CNPDDbits_t;
volatile __CNPDDbits_t CNPDDbits __asm__ ("CNPDD");
volatile unsigned int        CNPDDCLR;
volatile unsigned int        CNPDDSET;
volatile unsigned int        CNPDDINV;
volatile unsigned int        CNCOND;
typedef union {
  struct {
    unsigned :13;
    unsigned SIDL:1;
    unsigned :1;
    unsigned ON:1;
  };
  struct {
    unsigned w:32;
  };
} __CNCONDbits_t;
volatile __CNCONDbits_t CNCONDbits __asm__ ("CNCOND");
volatile unsigned int        CNCONDCLR;
volatile unsigned int        CNCONDSET;
volatile unsigned int        CNCONDINV;
volatile unsigned int        CNEND;
typedef union {
  struct {
    unsigned CNIED0:1;
    unsigned CNIED1:1;
    unsigned CNIED2:1;
    unsigned CNIED3:1;
    unsigned CNIED4:1;
    unsigned CNIED5:1;
    unsigned CNIED6:1;
    unsigned CNIED7:1;
    unsigned CNIED8:1;
    unsigned CNIED9:1;
    unsigned CNIED10:1;
    unsigned CNIED11:1;
  };
  struct {
    unsigned w:32;
  };
} __CNENDbits_t;
volatile __CNENDbits_t CNENDbits __asm__ ("CNEND");
volatile unsigned int        CNENDCLR;
volatile unsigned int        CNENDSET;
volatile unsigned int        CNENDINV;
volatile unsigned int        CNSTATD;
typedef union {
  struct {
    unsigned CNSTATD0:1;
    unsigned CNSTATD1:1;
    unsigned CNSTATD2:1;
    unsigned CNSTATD3:1;
    unsigned CNSTATD4:1;
    unsigned CNSTATD5:1;
    unsigned CNSTATD6:1;
    unsigned CNSTATD7:1;
    unsigned CNSTATD8:1;
    unsigned CNSTATD9:1;
    unsigned CNSTATD10:1;
    unsigned CNSTATD11:1;
  };
  struct {
    unsigned w:32;
  };
} __CNSTATDbits_t;
volatile __CNSTATDbits_t CNSTATDbits __asm__ ("CNSTATD");
volatile unsigned int        CNSTATDCLR;
volatile unsigned int        CNSTATDSET;
volatile unsigned int        CNSTATDINV;
volatile unsigned int        ANSELE;
typedef union {
  struct {
    unsigned :2;
    unsigned ANSE2:1;
    unsigned :1;
    unsigned ANSE4:1;
    unsigned ANSE5:1;
    unsigned ANSE6:1;
    unsigned ANSE7:1;
  };
  struct {
    unsigned w:32;
  };
} __ANSELEbits_t;
volatile __ANSELEbits_t ANSELEbits __asm__ ("ANSELE");
volatile unsigned int        ANSELECLR;
volatile unsigned int        ANSELESET;
volatile unsigned int        ANSELEINV;
volatile unsigned int        TRISE;
typedef union {
  struct {
    unsigned TRISE0:1;
    unsigned TRISE1:1;
    unsigned TRISE2:1;
    unsigned TRISE3:1;
    unsigned TRISE4:1;
    unsigned TRISE5:1;
    unsigned TRISE6:1;
    unsigned TRISE7:1;
  };
  struct {
    unsigned w:32;
  };
} __TRISEbits_t;
volatile __TRISEbits_t TRISEbits __asm__ ("TRISE");
volatile unsigned int        TRISECLR;
volatile unsigned int        TRISESET;
volatile unsigned int        TRISEINV;
volatile unsigned int        PORTE;
typedef union {
  struct {
    unsigned RE0:1;
    unsigned RE1:1;
    unsigned RE2:1;
    unsigned RE3:1;
    unsigned RE4:1;
    unsigned RE5:1;
    unsigned RE6:1;
    unsigned RE7:1;
  };
  struct {
    unsigned w:32;
  };
} __PORTEbits_t;
volatile __PORTEbits_t PORTEbits __asm__ ("PORTE");
volatile unsigned int        PORTECLR;
volatile unsigned int        PORTESET;
volatile unsigned int        PORTEINV;
volatile unsigned int        LATE;
typedef union {
  struct {
    unsigned LATE0:1;
    unsigned LATE1:1;
    unsigned LATE2:1;
    unsigned LATE3:1;
    unsigned LATE4:1;
    unsigned LATE5:1;
    unsigned LATE6:1;
    unsigned LATE7:1;
  };
  struct {
    unsigned w:32;
  };
} __LATEbits_t;
extern volatile __LATEbits_t LATEbits __asm__ ("LATE");
volatile unsigned int        LATECLR;
volatile unsigned int        LATESET;
volatile unsigned int        LATEINV;
volatile unsigned int        ODCE;
typedef union {
  struct {
    unsigned ODCE0:1;
    unsigned ODCE1:1;
    unsigned ODCE2:1;
    unsigned ODCE3:1;
    unsigned ODCE4:1;
    unsigned ODCE5:1;
    unsigned ODCE6:1;
    unsigned ODCE7:1;
  };
  struct {
    unsigned w:32;
  };
} __ODCEbits_t;
volatile __ODCEbits_t ODCEbits __asm__ ("ODCE");
volatile unsigned int        ODCECLR;
volatile unsigned int        ODCESET;
volatile unsigned int        ODCEINV;
volatile unsigned int        CNPUE;
typedef union {
  struct {
    unsigned CNPUE0:1;
    unsigned CNPUE1:1;
    unsigned CNPUE2:1;
    unsigned CNPUE3:1;
    unsigned CNPUE4:1;
    unsigned CNPUE5:1;
    unsigned CNPUE6:1;
    unsigned CNPUE7:1;
  };
  struct {
    unsigned w:32;
  };
} __CNPUEbits_t;
volatile __CNPUEbits_t CNPUEbits __asm__ ("CNPUE");
volatile unsigned int        CNPUECLR;
volatile unsigned int        CNPUESET;
volatile unsigned int        CNPUEINV;
volatile unsigned int        CNPDE;
typedef union {
  struct {
    unsigned CNPDE0:1;
    unsigned CNPDE1:1;
    unsigned CNPDE2:1;
    unsigned CNPDE3:1;
    unsigned CNPDE4:1;
    unsigned CNPDE5:1;
    unsigned CNPDE6:1;
    unsigned CNPDE7:1;
  };
  struct {
    unsigned w:32;
  };
} __CNPDEbits_t;
volatile __CNPDEbits_t CNPDEbits __asm__ ("CNPDE");
volatile unsigned int        CNPDECLR;
volatile unsigned int        CNPDESET;
volatile unsigned int        CNPDEINV;
volatile unsigned int        CNCONE;
typedef union {
  struct {
    unsigned :13;
    unsigned SIDL:1;
    unsigned :1;
    unsigned ON:1;
  };
  struct {
    unsigned w:32;
  };
} __CNCONEbits_t;
volatile __CNCONEbits_t CNCONEbits __asm__ ("CNCONE");
volatile unsigned int        CNCONECLR;
volatile unsigned int        CNCONESET;
volatile unsigned int        CNCONEINV;
volatile unsigned int        CNENE;
typedef union {
  struct {
    unsigned CNIEE0:1;
    unsigned CNIEE1:1;
    unsigned CNIEE2:1;
    unsigned CNIEE3:1;
    unsigned CNIEE4:1;
    unsigned CNIEE5:1;
    unsigned CNIEE6:1;
    unsigned CNIEE7:1;
  };
  struct {
    unsigned w:32;
  };
} __CNENEbits_t;
volatile __CNENEbits_t CNENEbits __asm__ ("CNENE");
volatile unsigned int        CNENECLR;
volatile unsigned int        CNENESET;
volatile unsigned int        CNENEINV;
volatile unsigned int        CNSTATE;
typedef union {
  struct {
    unsigned CNSTATE0:1;
    unsigned CNSTATE1:1;
    unsigned CNSTATE2:1;
    unsigned CNSTATE3:1;
    unsigned CNSTATE4:1;
    unsigned CNSTATE5:1;
    unsigned CNSTATE6:1;
    unsigned CNSTATE7:1;
  };
  struct {
    unsigned w:32;
  };
} __CNSTATEbits_t;
volatile __CNSTATEbits_t CNSTATEbits __asm__ ("CNSTATE");
volatile unsigned int        CNSTATECLR;
volatile unsigned int        CNSTATESET;
volatile unsigned int        CNSTATEINV;
volatile unsigned int        ANSELF;
typedef struct {
  unsigned w:32;
} __ANSELFbits_t;
volatile __ANSELFbits_t ANSELFbits __asm__ ("ANSELF");
volatile unsigned int        ANSELFCLR;
volatile unsigned int        ANSELFSET;
volatile unsigned int        ANSELFINV;
volatile unsigned int        TRISF;
typedef union {
  struct {
    unsigned TRISF0:1;
    unsigned TRISF1:1;
    unsigned :1;
    unsigned TRISF3:1;
    unsigned TRISF4:1;
    unsigned TRISF5:1;
  };
  struct {
    unsigned w:32;
  };
} __TRISFbits_t;
volatile __TRISFbits_t TRISFbits __asm__ ("TRISF");
volatile unsigned int        TRISFCLR;
volatile unsigned int        TRISFSET;
volatile unsigned int        TRISFINV;
volatile unsigned int        PORTF;
typedef union {
  struct {
    unsigned RF0:1;
    unsigned RF1:1;
    unsigned :1;
    unsigned RF3:1;
    unsigned RF4:1;
    unsigned RF5:1;
  };
  struct {
    unsigned w:32;
  };
} __PORTFbits_t;
volatile __PORTFbits_t PORTFbits __asm__ ("PORTF");
volatile unsigned int        PORTFCLR;
volatile unsigned int        PORTFSET;
volatile unsigned int        PORTFINV;
volatile unsigned int        LATF;
typedef union {
  struct {
    unsigned LATF0:1;
    unsigned LATF1:1;
    unsigned :1;
    unsigned LATF3:1;
    unsigned LATF4:1;
    unsigned LATF5:1;
  };
  struct {
    unsigned w:32;
  };
} __LATFbits_t;
extern volatile __LATFbits_t LATFbits __asm__ ("LATF");
volatile unsigned int        LATFCLR;
volatile unsigned int        LATFSET;
volatile unsigned int        LATFINV;
volatile unsigned int        ODCF;
typedef union {
  struct {
    unsigned ODCF0:1;
    unsigned ODCF1:1;
    unsigned :1;
    unsigned ODCF3:1;
    unsigned ODCF4:1;
    unsigned ODCF5:1;
  };
  struct {
    unsigned w:32;
  };
} __ODCFbits_t;
volatile __ODCFbits_t ODCFbits __asm__ ("ODCF");
volatile unsigned int        ODCFCLR;
volatile unsigned int        ODCFSET;
volatile unsigned int        ODCFINV;
volatile unsigned int        CNPUF;
typedef union {
  struct {
    unsigned CNPUF0:1;
    unsigned CNPUF1:1;
    unsigned :1;
    unsigned CNPUF3:1;
    unsigned CNPUF4:1;
    unsigned CNPUF5:1;
  };
  struct {
    unsigned w:32;
  };
} __CNPUFbits_t;
volatile __CNPUFbits_t CNPUFbits __asm__ ("CNPUF");
volatile unsigned int        CNPUFCLR;
volatile unsigned int        CNPUFSET;
volatile unsigned int        CNPUFINV;
volatile unsigned int        CNPDF;
typedef union {
  struct {
    unsigned CNPDF0:1;
    unsigned CNPDF1:1;
    unsigned :1;
    unsigned CNPDF3:1;
    unsigned CNPDF4:1;
    unsigned CNPDF5:1;
  };
  struct {
    unsigned w:32;
  };
} __CNPDFbits_t;
volatile __CNPDFbits_t CNPDFbits __asm__ ("CNPDF");
volatile unsigned int        CNPDFCLR;
volatile unsigned int        CNPDFSET;
volatile unsigned int        CNPDFINV;
volatile unsigned int        CNCONF;
typedef union {
  struct {
    unsigned :13;
    unsigned SIDL:1;
    unsigned :1;
    unsigned ON:1;
  };
  struct {
    unsigned w:32;
  };
} __CNCONFbits_t;
volatile __CNCONFbits_t CNCONFbits __asm__ ("CNCONF");
volatile unsigned int        CNCONFCLR;
volatile unsigned int        CNCONFSET;
volatile unsigned int        CNCONFINV;
volatile unsigned int        CNENF;
typedef union {
  struct {
    unsigned CNIEF0:1;
    unsigned CNIEF1:1;
    unsigned :1;
    unsigned CNIEF3:1;
    unsigned CNIEF4:1;
    unsigned CNIEF5:1;
  };
  struct {
    unsigned w:32;
  };
} __CNENFbits_t;
volatile __CNENFbits_t CNENFbits __asm__ ("CNENF");
volatile unsigned int        CNENFCLR;
volatile unsigned int        CNENFSET;
volatile unsigned int        CNENFINV;
volatile unsigned int        CNSTATF;
typedef union {
  struct {
    unsigned CNSTATF0:1;
    unsigned CNSTATF1:1;
    unsigned :1;
    unsigned CNSTATF3:1;
    unsigned CNSTATF4:1;
    unsigned CNSTATF5:1;
  };
  struct {
    unsigned w:32;
  };
} __CNSTATFbits_t;
volatile __CNSTATFbits_t CNSTATFbits __asm__ ("CNSTATF");
volatile unsigned int        CNSTATFCLR;
volatile unsigned int        CNSTATFSET;
volatile unsigned int        CNSTATFINV;
volatile unsigned int        ANSELG;
typedef union {
  struct {
    unsigned :6;
    unsigned ANSG6:1;
    unsigned ANSG7:1;
    unsigned ANSG8:1;
    unsigned ANSG9:1;
  };
  struct {
    unsigned w:32;
  };
} __ANSELGbits_t;
volatile __ANSELGbits_t ANSELGbits __asm__ ("ANSELG");
volatile unsigned int        ANSELGCLR;
volatile unsigned int        ANSELGSET;
volatile unsigned int        ANSELGINV;
volatile unsigned int        TRISG;
typedef union {
  struct {
    unsigned :2;
    unsigned TRISG2:1;
    unsigned TRISG3:1;
    unsigned :2;
    unsigned TRISG6:1;
    unsigned TRISG7:1;
    unsigned TRISG8:1;
    unsigned TRISG9:1;
  };
  struct {
    unsigned w:32;
  };
} __TRISGbits_t;
volatile __TRISGbits_t TRISGbits __asm__ ("TRISG");
volatile unsigned int        TRISGCLR;
volatile unsigned int        TRISGSET;
volatile unsigned int        TRISGINV;
volatile unsigned int        PORTG;
typedef union {
  struct {
    unsigned :2;
    unsigned RG2:1;
    unsigned RG3:1;
    unsigned :2;
    unsigned RG6:1;
    unsigned RG7:1;
    unsigned RG8:1;
    unsigned RG9:1;
  };
  struct {
    unsigned w:32;
  };
} __PORTGbits_t;
volatile __PORTGbits_t PORTGbits __asm__ ("PORTG");
volatile unsigned int        PORTGCLR;
volatile unsigned int        PORTGSET;
volatile unsigned int        PORTGINV;
volatile unsigned int        LATG;
typedef union {
  struct {
    unsigned :2;
    unsigned LATG2:1;
    unsigned LATG3:1;
    unsigned :2;
    unsigned LATG6:1;
    unsigned LATG7:1;
    unsigned LATG8:1;
    unsigned LATG9:1;
  };
  struct {
    unsigned w:32;
  };
} __LATGbits_t;
extern volatile __LATGbits_t LATGbits __asm__ ("LATG");
volatile unsigned int        LATGCLR;
volatile unsigned int        LATGSET;
volatile unsigned int        LATGINV;
volatile unsigned int        ODCG;
typedef union {
  struct {
    unsigned :2;
    unsigned ODCG2:1;
    unsigned ODCG3:1;
    unsigned :2;
    unsigned ODCG6:1;
    unsigned ODCG7:1;
    unsigned ODCG8:1;
    unsigned ODCG9:1;
  };
  struct {
    unsigned w:32;
  };
} __ODCGbits_t;
volatile __ODCGbits_t ODCGbits __asm__ ("ODCG");
volatile unsigned int        ODCGCLR;
volatile unsigned int        ODCGSET;
volatile unsigned int        ODCGINV;
volatile unsigned int        CNPUG;
typedef union {
  struct {
    unsigned :2;
    unsigned CNPUG2:1;
    unsigned CNPUG3:1;
    unsigned :2;
    unsigned CNPUG6:1;
    unsigned CNPUG7:1;
    unsigned CNPUG8:1;
    unsigned CNPUG9:1;
  };
  struct {
    unsigned w:32;
  };
} __CNPUGbits_t;
volatile __CNPUGbits_t CNPUGbits __asm__ ("CNPUG");
volatile unsigned int        CNPUGCLR;
volatile unsigned int        CNPUGSET;
volatile unsigned int        CNPUGINV;
volatile unsigned int        CNPDG;
typedef union {
  struct {
    unsigned :2;
    unsigned CNPDG2:1;
    unsigned CNPDG3:1;
    unsigned :2;
    unsigned CNPDG6:1;
    unsigned CNPDG7:1;
    unsigned CNPDG8:1;
    unsigned CNPDG9:1;
  };
  struct {
    unsigned w:32;
  };
} __CNPDGbits_t;
volatile __CNPDGbits_t CNPDGbits __asm__ ("CNPDG");
volatile unsigned int        CNPDGCLR;
volatile unsigned int        CNPDGSET;
volatile unsigned int        CNPDGINV;
volatile unsigned int        CNCONG;
typedef union {
  struct {
    unsigned :13;
    unsigned SIDL:1;
    unsigned :1;
    unsigned ON:1;
  };
  struct {
    unsigned w:32;
  };
} __CNCONGbits_t;
volatile __CNCONGbits_t CNCONGbits __asm__ ("CNCONG");
volatile unsigned int        CNCONGCLR;
volatile unsigned int        CNCONGSET;
volatile unsigned int        CNCONGINV;
volatile unsigned int        CNENG;
typedef union {
  struct {
    unsigned :2;
    unsigned CNIEG2:1;
    unsigned CNIEG3:1;
    unsigned :2;
    unsigned CNIEG6:1;
    unsigned CNIEG7:1;
    unsigned CNIEG8:1;
    unsigned CNIEG9:1;
  };
  struct {
    unsigned w:32;
  };
} __CNENGbits_t;
volatile __CNENGbits_t CNENGbits __asm__ ("CNENG");
volatile unsigned int        CNENGCLR;
volatile unsigned int        CNENGSET;
volatile unsigned int        CNENGINV;
volatile unsigned int        CNSTATG;
typedef union {
  struct {
    unsigned :2;
    unsigned CNSTATG2:1;
    unsigned CNSTATG3:1;
    unsigned :2;
    unsigned CNSTATG6:1;
    unsigned CNSTATG7:1;
    unsigned CNSTATG8:1;
    unsigned CNSTATG9:1;
  };
  struct {
    unsigned w:32;
  };
} __CNSTATGbits_t;
volatile __CNSTATGbits_t CNSTATGbits __asm__ ("CNSTATG");
volatile unsigned int        CNSTATGCLR;
volatile unsigned int        CNSTATGSET;
volatile unsigned int        CNSTATGINV;
volatile unsigned int        DEVCFG3;
typedef union {
  struct {
    unsigned USERID:16;
    unsigned FSRSSEL:3;
    unsigned :9;
    unsigned PMDL1WAY:1;
    unsigned IOL1WAY:1;
    unsigned FUSBIDIO:1;
    unsigned FVBUSONIO:1;
  };
  struct {
    unsigned w:32;
  };
} __DEVCFG3bits_t;
volatile __DEVCFG3bits_t DEVCFG3bits __asm__ ("DEVCFG3");
volatile unsigned int        DEVCFG2;
typedef union {
  struct {
    unsigned FPLLIDIV:3;
    unsigned :1;
    unsigned FPLLMUL:3;
    unsigned :1;
    unsigned UPLLIDIV:3;
    unsigned :4;
    unsigned UPLLEN:1;
    unsigned FPLLODIV:3;
  };
  struct {
    unsigned w:32;
  };
} __DEVCFG2bits_t;
volatile __DEVCFG2bits_t DEVCFG2bits __asm__ ("DEVCFG2");
volatile unsigned int        DEVCFG1;
typedef union {
  struct {
    unsigned FNOSC:3;
    unsigned :2;
    unsigned FSOSCEN:1;
    unsigned :1;
    unsigned IESO:1;
    unsigned POSCMOD:2;
    unsigned OSCIOFNC:1;
    unsigned :1;
    unsigned FPBDIV:2;
    unsigned FCKSM:2;
    unsigned WDTPS:5;
    unsigned :1;
    unsigned WINDIS:1;
    unsigned FWDTEN:1;
    unsigned FWDTWINSZ:2;
  };
  struct {
    unsigned w:32;
  };
} __DEVCFG1bits_t;
volatile __DEVCFG1bits_t DEVCFG1bits __asm__ ("DEVCFG1");
volatile unsigned int        DEVCFG0;
typedef union {
  struct {
    unsigned DEBUG:2;
    unsigned JTAGEN:1;
    unsigned ICESEL:2;
    unsigned :7;
    unsigned PWP:8;
    unsigned :4;
    unsigned BWP:1;
    unsigned :3;
    unsigned CP:1;
  };
  struct {
    unsigned FDEBUG:2;
  };
  struct {
    unsigned w:32;
  };
} __DEVCFG0bits_t;
volatile __DEVCFG0bits_t DEVCFG0bits __asm__ ("DEVCFG0");


/* #define _WDTCON_WDTCLR_POSITION                  0x00000000 */
/* #define _WDTCON_WDTCLR_MASK                      0x00000001 */
/* #define _WDTCON_WDTCLR_LENGTH                    0x00000001 */

/* #define _WDTCON_WDTWINEN_POSITION                0x00000001 */
/* #define _WDTCON_WDTWINEN_MASK                    0x00000002 */
/* #define _WDTCON_WDTWINEN_LENGTH                  0x00000001 */

/* #define _WDTCON_SWDTPS_POSITION                  0x00000002 */
/* #define _WDTCON_SWDTPS_MASK                      0x0000007C */
/* #define _WDTCON_SWDTPS_LENGTH                    0x00000005 */

/* #define _WDTCON_ON_POSITION                      0x0000000F */
/* #define _WDTCON_ON_MASK                          0x00008000 */
/* #define _WDTCON_ON_LENGTH                        0x00000001 */

/* #define _WDTCON_SWDTPS0_POSITION                 0x00000002 */
/* #define _WDTCON_SWDTPS0_MASK                     0x00000004 */
/* #define _WDTCON_SWDTPS0_LENGTH                   0x00000001 */

/* #define _WDTCON_SWDTPS1_POSITION                 0x00000003 */
/* #define _WDTCON_SWDTPS1_MASK                     0x00000008 */
/* #define _WDTCON_SWDTPS1_LENGTH                   0x00000001 */

/* #define _WDTCON_SWDTPS2_POSITION                 0x00000004 */
/* #define _WDTCON_SWDTPS2_MASK                     0x00000010 */
/* #define _WDTCON_SWDTPS2_LENGTH                   0x00000001 */

/* #define _WDTCON_SWDTPS3_POSITION                 0x00000005 */
/* #define _WDTCON_SWDTPS3_MASK                     0x00000020 */
/* #define _WDTCON_SWDTPS3_LENGTH                   0x00000001 */

/* #define _WDTCON_SWDTPS4_POSITION                 0x00000006 */
/* #define _WDTCON_SWDTPS4_MASK                     0x00000040 */
/* #define _WDTCON_SWDTPS4_LENGTH                   0x00000001 */

/* #define _WDTCON_WDTPSTA_POSITION                 0x00000002 */
/* #define _WDTCON_WDTPSTA_MASK                     0x0000007C */
/* #define _WDTCON_WDTPSTA_LENGTH                   0x00000005 */

/* #define _WDTCON_WDTPS_POSITION                   0x00000002 */
/* #define _WDTCON_WDTPS_MASK                       0x0000007C */
/* #define _WDTCON_WDTPS_LENGTH                     0x00000005 */

/* #define _WDTCON_w_POSITION                       0x00000000 */
/* #define _WDTCON_w_MASK                           0xFFFFFFFF */
/* #define _WDTCON_w_LENGTH                         0x00000020 */

/* #define _RTCCON_RTCOE_POSITION                   0x00000000 */
/* #define _RTCCON_RTCOE_MASK                       0x00000001 */
/* #define _RTCCON_RTCOE_LENGTH                     0x00000001 */

/* #define _RTCCON_HALFSEC_POSITION                 0x00000001 */
/* #define _RTCCON_HALFSEC_MASK                     0x00000002 */
/* #define _RTCCON_HALFSEC_LENGTH                   0x00000001 */

/* #define _RTCCON_RTCSYNC_POSITION                 0x00000002 */
/* #define _RTCCON_RTCSYNC_MASK                     0x00000004 */
/* #define _RTCCON_RTCSYNC_LENGTH                   0x00000001 */

/* #define _RTCCON_RTCWREN_POSITION                 0x00000003 */
/* #define _RTCCON_RTCWREN_MASK                     0x00000008 */
/* #define _RTCCON_RTCWREN_LENGTH                   0x00000001 */

/* #define _RTCCON_RTCCLKON_POSITION                0x00000006 */
/* #define _RTCCON_RTCCLKON_MASK                    0x00000040 */
/* #define _RTCCON_RTCCLKON_LENGTH                  0x00000001 */

/* #define _RTCCON_RTSECSEL_POSITION                0x00000007 */
/* #define _RTCCON_RTSECSEL_MASK                    0x00000080 */
/* #define _RTCCON_RTSECSEL_LENGTH                  0x00000001 */

/* #define _RTCCON_SIDL_POSITION                    0x0000000D */
/* #define _RTCCON_SIDL_MASK                        0x00002000 */
/* #define _RTCCON_SIDL_LENGTH                      0x00000001 */

/* #define _RTCCON_ON_POSITION                      0x0000000F */
/* #define _RTCCON_ON_MASK                          0x00008000 */
/* #define _RTCCON_ON_LENGTH                        0x00000001 */

/* #define _RTCCON_CAL_POSITION                     0x00000010 */
/* #define _RTCCON_CAL_MASK                         0x03FF0000 */
/* #define _RTCCON_CAL_LENGTH                       0x0000000A */

/* #define _RTCCON_w_POSITION                       0x00000000 */
/* #define _RTCCON_w_MASK                           0xFFFFFFFF */
/* #define _RTCCON_w_LENGTH                         0x00000020 */

/* #define _RTCALRM_ARPT_POSITION                   0x00000000 */
/* #define _RTCALRM_ARPT_MASK                       0x000000FF */
/* #define _RTCALRM_ARPT_LENGTH                     0x00000008 */

/* #define _RTCALRM_AMASK_POSITION                  0x00000008 */
/* #define _RTCALRM_AMASK_MASK                      0x00000F00 */
/* #define _RTCALRM_AMASK_LENGTH                    0x00000004 */

/* #define _RTCALRM_ALRMSYNC_POSITION               0x0000000C */
/* #define _RTCALRM_ALRMSYNC_MASK                   0x00001000 */
/* #define _RTCALRM_ALRMSYNC_LENGTH                 0x00000001 */

/* #define _RTCALRM_PIV_POSITION                    0x0000000D */
/* #define _RTCALRM_PIV_MASK                        0x00002000 */
/* #define _RTCALRM_PIV_LENGTH                      0x00000001 */

/* #define _RTCALRM_CHIME_POSITION                  0x0000000E */
/* #define _RTCALRM_CHIME_MASK                      0x00004000 */
/* #define _RTCALRM_CHIME_LENGTH                    0x00000001 */

/* #define _RTCALRM_ALRMEN_POSITION                 0x0000000F */
/* #define _RTCALRM_ALRMEN_MASK                     0x00008000 */
/* #define _RTCALRM_ALRMEN_LENGTH                   0x00000001 */

/* #define _RTCALRM_w_POSITION                      0x00000000 */
/* #define _RTCALRM_w_MASK                          0xFFFFFFFF */
/* #define _RTCALRM_w_LENGTH                        0x00000020 */

/* #define _RTCTIME_SEC01_POSITION                  0x00000008 */
/* #define _RTCTIME_SEC01_MASK                      0x00000F00 */
/* #define _RTCTIME_SEC01_LENGTH                    0x00000004 */

/* #define _RTCTIME_SEC10_POSITION                  0x0000000C */
/* #define _RTCTIME_SEC10_MASK                      0x0000F000 */
/* #define _RTCTIME_SEC10_LENGTH                    0x00000004 */

/* #define _RTCTIME_MIN01_POSITION                  0x00000010 */
/* #define _RTCTIME_MIN01_MASK                      0x000F0000 */
/* #define _RTCTIME_MIN01_LENGTH                    0x00000004 */

/* #define _RTCTIME_MIN10_POSITION                  0x00000014 */
/* #define _RTCTIME_MIN10_MASK                      0x00F00000 */
/* #define _RTCTIME_MIN10_LENGTH                    0x00000004 */

/* #define _RTCTIME_HR01_POSITION                   0x00000018 */
/* #define _RTCTIME_HR01_MASK                       0x0F000000 */
/* #define _RTCTIME_HR01_LENGTH                     0x00000004 */

/* #define _RTCTIME_HR10_POSITION                   0x0000001C */
/* #define _RTCTIME_HR10_MASK                       0xF0000000 */
/* #define _RTCTIME_HR10_LENGTH                     0x00000004 */

/* #define _RTCTIME_w_POSITION                      0x00000000 */
/* #define _RTCTIME_w_MASK                          0xFFFFFFFF */
/* #define _RTCTIME_w_LENGTH                        0x00000020 */

/* #define _RTCDATE_WDAY01_POSITION                 0x00000000 */
/* #define _RTCDATE_WDAY01_MASK                     0x0000000F */
/* #define _RTCDATE_WDAY01_LENGTH                   0x00000004 */

/* #define _RTCDATE_DAY01_POSITION                  0x00000008 */
/* #define _RTCDATE_DAY01_MASK                      0x00000F00 */
/* #define _RTCDATE_DAY01_LENGTH                    0x00000004 */

/* #define _RTCDATE_DAY10_POSITION                  0x0000000C */
/* #define _RTCDATE_DAY10_MASK                      0x0000F000 */
/* #define _RTCDATE_DAY10_LENGTH                    0x00000004 */

/* #define _RTCDATE_MONTH01_POSITION                0x00000010 */
/* #define _RTCDATE_MONTH01_MASK                    0x000F0000 */
/* #define _RTCDATE_MONTH01_LENGTH                  0x00000004 */

/* #define _RTCDATE_MONTH10_POSITION                0x00000014 */
/* #define _RTCDATE_MONTH10_MASK                    0x00F00000 */
/* #define _RTCDATE_MONTH10_LENGTH                  0x00000004 */

/* #define _RTCDATE_YEAR01_POSITION                 0x00000018 */
/* #define _RTCDATE_YEAR01_MASK                     0x0F000000 */
/* #define _RTCDATE_YEAR01_LENGTH                   0x00000004 */

/* #define _RTCDATE_YEAR10_POSITION                 0x0000001C */
/* #define _RTCDATE_YEAR10_MASK                     0xF0000000 */
/* #define _RTCDATE_YEAR10_LENGTH                   0x00000004 */

/* #define _RTCDATE_w_POSITION                      0x00000000 */
/* #define _RTCDATE_w_MASK                          0xFFFFFFFF */
/* #define _RTCDATE_w_LENGTH                        0x00000020 */

/* #define _ALRMTIME_SEC01_POSITION                 0x00000008 */
/* #define _ALRMTIME_SEC01_MASK                     0x00000F00 */
/* #define _ALRMTIME_SEC01_LENGTH                   0x00000004 */

/* #define _ALRMTIME_SEC10_POSITION                 0x0000000C */
/* #define _ALRMTIME_SEC10_MASK                     0x0000F000 */
/* #define _ALRMTIME_SEC10_LENGTH                   0x00000004 */

/* #define _ALRMTIME_MIN01_POSITION                 0x00000010 */
/* #define _ALRMTIME_MIN01_MASK                     0x000F0000 */
/* #define _ALRMTIME_MIN01_LENGTH                   0x00000004 */

/* #define _ALRMTIME_MIN10_POSITION                 0x00000014 */
/* #define _ALRMTIME_MIN10_MASK                     0x00F00000 */
/* #define _ALRMTIME_MIN10_LENGTH                   0x00000004 */

/* #define _ALRMTIME_HR01_POSITION                  0x00000018 */
/* #define _ALRMTIME_HR01_MASK                      0x0F000000 */
/* #define _ALRMTIME_HR01_LENGTH                    0x00000004 */

/* #define _ALRMTIME_HR10_POSITION                  0x0000001C */
/* #define _ALRMTIME_HR10_MASK                      0xF0000000 */
/* #define _ALRMTIME_HR10_LENGTH                    0x00000004 */

/* #define _ALRMTIME_w_POSITION                     0x00000000 */
/* #define _ALRMTIME_w_MASK                         0xFFFFFFFF */
/* #define _ALRMTIME_w_LENGTH                       0x00000020 */

/* #define _ALRMDATE_WDAY01_POSITION                0x00000000 */
/* #define _ALRMDATE_WDAY01_MASK                    0x0000000F */
/* #define _ALRMDATE_WDAY01_LENGTH                  0x00000004 */

/* #define _ALRMDATE_DAY01_POSITION                 0x00000008 */
/* #define _ALRMDATE_DAY01_MASK                     0x00000F00 */
/* #define _ALRMDATE_DAY01_LENGTH                   0x00000004 */

/* #define _ALRMDATE_DAY10_POSITION                 0x0000000C */
/* #define _ALRMDATE_DAY10_MASK                     0x0000F000 */
/* #define _ALRMDATE_DAY10_LENGTH                   0x00000004 */

/* #define _ALRMDATE_MONTH01_POSITION               0x00000010 */
/* #define _ALRMDATE_MONTH01_MASK                   0x000F0000 */
/* #define _ALRMDATE_MONTH01_LENGTH                 0x00000004 */

/* #define _ALRMDATE_MONTH10_POSITION               0x00000014 */
/* #define _ALRMDATE_MONTH10_MASK                   0x00F00000 */
/* #define _ALRMDATE_MONTH10_LENGTH                 0x00000004 */

/* #define _ALRMDATE_w_POSITION                     0x00000000 */
/* #define _ALRMDATE_w_MASK                         0xFFFFFFFF */
/* #define _ALRMDATE_w_LENGTH                       0x00000020 */

/* #define _T1CON_TCS_POSITION                      0x00000001 */
/* #define _T1CON_TCS_MASK                          0x00000002 */
/* #define _T1CON_TCS_LENGTH                        0x00000001 */

/* #define _T1CON_TSYNC_POSITION                    0x00000002 */
/* #define _T1CON_TSYNC_MASK                        0x00000004 */
/* #define _T1CON_TSYNC_LENGTH                      0x00000001 */

/* #define _T1CON_TCKPS_POSITION                    0x00000004 */
/* #define _T1CON_TCKPS_MASK                        0x00000030 */
/* #define _T1CON_TCKPS_LENGTH                      0x00000002 */

/* #define _T1CON_TGATE_POSITION                    0x00000007 */
/* #define _T1CON_TGATE_MASK                        0x00000080 */
/* #define _T1CON_TGATE_LENGTH                      0x00000001 */

/* #define _T1CON_TWIP_POSITION                     0x0000000B */
/* #define _T1CON_TWIP_MASK                         0x00000800 */
/* #define _T1CON_TWIP_LENGTH                       0x00000001 */

/* #define _T1CON_TWDIS_POSITION                    0x0000000C */
/* #define _T1CON_TWDIS_MASK                        0x00001000 */
/* #define _T1CON_TWDIS_LENGTH                      0x00000001 */

/* #define _T1CON_SIDL_POSITION                     0x0000000D */
/* #define _T1CON_SIDL_MASK                         0x00002000 */
/* #define _T1CON_SIDL_LENGTH                       0x00000001 */

/* #define _T1CON_ON_POSITION                       0x0000000F */
/* #define _T1CON_ON_MASK                           0x00008000 */
/* #define _T1CON_ON_LENGTH                         0x00000001 */

/* #define _T1CON_TCKPS0_POSITION                   0x00000004 */
/* #define _T1CON_TCKPS0_MASK                       0x00000010 */
/* #define _T1CON_TCKPS0_LENGTH                     0x00000001 */

/* #define _T1CON_TCKPS1_POSITION                   0x00000005 */
/* #define _T1CON_TCKPS1_MASK                       0x00000020 */
/* #define _T1CON_TCKPS1_LENGTH                     0x00000001 */

/* #define _T1CON_TSIDL_POSITION                    0x0000000D */
/* #define _T1CON_TSIDL_MASK                        0x00002000 */
/* #define _T1CON_TSIDL_LENGTH                      0x00000001 */

/* #define _T1CON_TON_POSITION                      0x0000000F */
/* #define _T1CON_TON_MASK                          0x00008000 */
/* #define _T1CON_TON_LENGTH                        0x00000001 */

/* #define _T1CON_w_POSITION                        0x00000000 */
/* #define _T1CON_w_MASK                            0xFFFFFFFF */
/* #define _T1CON_w_LENGTH                          0x00000020 */

/* #define _T2CON_TCS_POSITION                      0x00000001 */
/* #define _T2CON_TCS_MASK                          0x00000002 */
/* #define _T2CON_TCS_LENGTH                        0x00000001 */

/* #define _T2CON_T32_POSITION                      0x00000003 */
/* #define _T2CON_T32_MASK                          0x00000008 */
/* #define _T2CON_T32_LENGTH                        0x00000001 */

/* #define _T2CON_TCKPS_POSITION                    0x00000004 */
/* #define _T2CON_TCKPS_MASK                        0x00000070 */
/* #define _T2CON_TCKPS_LENGTH                      0x00000003 */

/* #define _T2CON_TGATE_POSITION                    0x00000007 */
/* #define _T2CON_TGATE_MASK                        0x00000080 */
/* #define _T2CON_TGATE_LENGTH                      0x00000001 */

/* #define _T2CON_SIDL_POSITION                     0x0000000D */
/* #define _T2CON_SIDL_MASK                         0x00002000 */
/* #define _T2CON_SIDL_LENGTH                       0x00000001 */

/* #define _T2CON_ON_POSITION                       0x0000000F */
/* #define _T2CON_ON_MASK                           0x00008000 */
/* #define _T2CON_ON_LENGTH                         0x00000001 */

/* #define _T2CON_TCKPS0_POSITION                   0x00000004 */
/* #define _T2CON_TCKPS0_MASK                       0x00000010 */
/* #define _T2CON_TCKPS0_LENGTH                     0x00000001 */

/* #define _T2CON_TCKPS1_POSITION                   0x00000005 */
/* #define _T2CON_TCKPS1_MASK                       0x00000020 */
/* #define _T2CON_TCKPS1_LENGTH                     0x00000001 */

/* #define _T2CON_TCKPS2_POSITION                   0x00000006 */
/* #define _T2CON_TCKPS2_MASK                       0x00000040 */
/* #define _T2CON_TCKPS2_LENGTH                     0x00000001 */

/* #define _T2CON_TSIDL_POSITION                    0x0000000D */
/* #define _T2CON_TSIDL_MASK                        0x00002000 */
/* #define _T2CON_TSIDL_LENGTH                      0x00000001 */

/* #define _T2CON_TON_POSITION                      0x0000000F */
/* #define _T2CON_TON_MASK                          0x00008000 */
/* #define _T2CON_TON_LENGTH                        0x00000001 */

/* #define _T2CON_w_POSITION                        0x00000000 */
/* #define _T2CON_w_MASK                            0xFFFFFFFF */
/* #define _T2CON_w_LENGTH                          0x00000020 */

/* #define _T3CON_TCS_POSITION                      0x00000001 */
/* #define _T3CON_TCS_MASK                          0x00000002 */
/* #define _T3CON_TCS_LENGTH                        0x00000001 */

/* #define _T3CON_T32_POSITION                      0x00000003 */
/* #define _T3CON_T32_MASK                          0x00000008 */
/* #define _T3CON_T32_LENGTH                        0x00000001 */

/* #define _T3CON_TCKPS_POSITION                    0x00000004 */
/* #define _T3CON_TCKPS_MASK                        0x00000070 */
/* #define _T3CON_TCKPS_LENGTH                      0x00000003 */

/* #define _T3CON_TGATE_POSITION                    0x00000007 */
/* #define _T3CON_TGATE_MASK                        0x00000080 */
/* #define _T3CON_TGATE_LENGTH                      0x00000001 */

/* #define _T3CON_SIDL_POSITION                     0x0000000D */
/* #define _T3CON_SIDL_MASK                         0x00002000 */
/* #define _T3CON_SIDL_LENGTH                       0x00000001 */

/* #define _T3CON_ON_POSITION                       0x0000000F */
/* #define _T3CON_ON_MASK                           0x00008000 */
/* #define _T3CON_ON_LENGTH                         0x00000001 */

/* #define _T3CON_TCKPS0_POSITION                   0x00000004 */
/* #define _T3CON_TCKPS0_MASK                       0x00000010 */
/* #define _T3CON_TCKPS0_LENGTH                     0x00000001 */

/* #define _T3CON_TCKPS1_POSITION                   0x00000005 */
/* #define _T3CON_TCKPS1_MASK                       0x00000020 */
/* #define _T3CON_TCKPS1_LENGTH                     0x00000001 */

/* #define _T3CON_TCKPS2_POSITION                   0x00000006 */
/* #define _T3CON_TCKPS2_MASK                       0x00000040 */
/* #define _T3CON_TCKPS2_LENGTH                     0x00000001 */

/* #define _T3CON_TSIDL_POSITION                    0x0000000D */
/* #define _T3CON_TSIDL_MASK                        0x00002000 */
/* #define _T3CON_TSIDL_LENGTH                      0x00000001 */

/* #define _T3CON_TON_POSITION                      0x0000000F */
/* #define _T3CON_TON_MASK                          0x00008000 */
/* #define _T3CON_TON_LENGTH                        0x00000001 */

/* #define _T3CON_w_POSITION                        0x00000000 */
/* #define _T3CON_w_MASK                            0xFFFFFFFF */
/* #define _T3CON_w_LENGTH                          0x00000020 */

/* #define _T4CON_TCS_POSITION                      0x00000001 */
/* #define _T4CON_TCS_MASK                          0x00000002 */
/* #define _T4CON_TCS_LENGTH                        0x00000001 */

/* #define _T4CON_T32_POSITION                      0x00000003 */
/* #define _T4CON_T32_MASK                          0x00000008 */
/* #define _T4CON_T32_LENGTH                        0x00000001 */

/* #define _T4CON_TCKPS_POSITION                    0x00000004 */
/* #define _T4CON_TCKPS_MASK                        0x00000070 */
/* #define _T4CON_TCKPS_LENGTH                      0x00000003 */

/* #define _T4CON_TGATE_POSITION                    0x00000007 */
/* #define _T4CON_TGATE_MASK                        0x00000080 */
/* #define _T4CON_TGATE_LENGTH                      0x00000001 */

/* #define _T4CON_SIDL_POSITION                     0x0000000D */
/* #define _T4CON_SIDL_MASK                         0x00002000 */
/* #define _T4CON_SIDL_LENGTH                       0x00000001 */

/* #define _T4CON_ON_POSITION                       0x0000000F */
/* #define _T4CON_ON_MASK                           0x00008000 */
/* #define _T4CON_ON_LENGTH                         0x00000001 */

/* #define _T4CON_TCKPS0_POSITION                   0x00000004 */
/* #define _T4CON_TCKPS0_MASK                       0x00000010 */
/* #define _T4CON_TCKPS0_LENGTH                     0x00000001 */

/* #define _T4CON_TCKPS1_POSITION                   0x00000005 */
/* #define _T4CON_TCKPS1_MASK                       0x00000020 */
/* #define _T4CON_TCKPS1_LENGTH                     0x00000001 */

/* #define _T4CON_TCKPS2_POSITION                   0x00000006 */
/* #define _T4CON_TCKPS2_MASK                       0x00000040 */
/* #define _T4CON_TCKPS2_LENGTH                     0x00000001 */

/* #define _T4CON_TSIDL_POSITION                    0x0000000D */
/* #define _T4CON_TSIDL_MASK                        0x00002000 */
/* #define _T4CON_TSIDL_LENGTH                      0x00000001 */

/* #define _T4CON_TON_POSITION                      0x0000000F */
/* #define _T4CON_TON_MASK                          0x00008000 */
/* #define _T4CON_TON_LENGTH                        0x00000001 */

/* #define _T4CON_w_POSITION                        0x00000000 */
/* #define _T4CON_w_MASK                            0xFFFFFFFF */
/* #define _T4CON_w_LENGTH                          0x00000020 */

/* #define _T5CON_TCS_POSITION                      0x00000001 */
/* #define _T5CON_TCS_MASK                          0x00000002 */
/* #define _T5CON_TCS_LENGTH                        0x00000001 */

/* #define _T5CON_T32_POSITION                      0x00000003 */
/* #define _T5CON_T32_MASK                          0x00000008 */
/* #define _T5CON_T32_LENGTH                        0x00000001 */

/* #define _T5CON_TCKPS_POSITION                    0x00000004 */
/* #define _T5CON_TCKPS_MASK                        0x00000070 */
/* #define _T5CON_TCKPS_LENGTH                      0x00000003 */

/* #define _T5CON_TGATE_POSITION                    0x00000007 */
/* #define _T5CON_TGATE_MASK                        0x00000080 */
/* #define _T5CON_TGATE_LENGTH                      0x00000001 */

/* #define _T5CON_SIDL_POSITION                     0x0000000D */
/* #define _T5CON_SIDL_MASK                         0x00002000 */
/* #define _T5CON_SIDL_LENGTH                       0x00000001 */

/* #define _T5CON_ON_POSITION                       0x0000000F */
/* #define _T5CON_ON_MASK                           0x00008000 */
/* #define _T5CON_ON_LENGTH                         0x00000001 */

/* #define _T5CON_TCKPS0_POSITION                   0x00000004 */
/* #define _T5CON_TCKPS0_MASK                       0x00000010 */
/* #define _T5CON_TCKPS0_LENGTH                     0x00000001 */

/* #define _T5CON_TCKPS1_POSITION                   0x00000005 */
/* #define _T5CON_TCKPS1_MASK                       0x00000020 */
/* #define _T5CON_TCKPS1_LENGTH                     0x00000001 */

/* #define _T5CON_TCKPS2_POSITION                   0x00000006 */
/* #define _T5CON_TCKPS2_MASK                       0x00000040 */
/* #define _T5CON_TCKPS2_LENGTH                     0x00000001 */

/* #define _T5CON_TSIDL_POSITION                    0x0000000D */
/* #define _T5CON_TSIDL_MASK                        0x00002000 */
/* #define _T5CON_TSIDL_LENGTH                      0x00000001 */

/* #define _T5CON_TON_POSITION                      0x0000000F */
/* #define _T5CON_TON_MASK                          0x00008000 */
/* #define _T5CON_TON_LENGTH                        0x00000001 */

/* #define _T5CON_w_POSITION                        0x00000000 */
/* #define _T5CON_w_MASK                            0xFFFFFFFF */
/* #define _T5CON_w_LENGTH                          0x00000020 */

/* #define _IC1CON_ICM_POSITION                     0x00000000 */
/* #define _IC1CON_ICM_MASK                         0x00000007 */
/* #define _IC1CON_ICM_LENGTH                       0x00000003 */

/* #define _IC1CON_ICBNE_POSITION                   0x00000003 */
/* #define _IC1CON_ICBNE_MASK                       0x00000008 */
/* #define _IC1CON_ICBNE_LENGTH                     0x00000001 */

/* #define _IC1CON_ICOV_POSITION                    0x00000004 */
/* #define _IC1CON_ICOV_MASK                        0x00000010 */
/* #define _IC1CON_ICOV_LENGTH                      0x00000001 */

/* #define _IC1CON_ICI_POSITION                     0x00000005 */
/* #define _IC1CON_ICI_MASK                         0x00000060 */
/* #define _IC1CON_ICI_LENGTH                       0x00000002 */

/* #define _IC1CON_ICTMR_POSITION                   0x00000007 */
/* #define _IC1CON_ICTMR_MASK                       0x00000080 */
/* #define _IC1CON_ICTMR_LENGTH                     0x00000001 */

/* #define _IC1CON_C32_POSITION                     0x00000008 */
/* #define _IC1CON_C32_MASK                         0x00000100 */
/* #define _IC1CON_C32_LENGTH                       0x00000001 */

/* #define _IC1CON_FEDGE_POSITION                   0x00000009 */
/* #define _IC1CON_FEDGE_MASK                       0x00000200 */
/* #define _IC1CON_FEDGE_LENGTH                     0x00000001 */

/* #define _IC1CON_SIDL_POSITION                    0x0000000D */
/* #define _IC1CON_SIDL_MASK                        0x00002000 */
/* #define _IC1CON_SIDL_LENGTH                      0x00000001 */

/* #define _IC1CON_ON_POSITION                      0x0000000F */
/* #define _IC1CON_ON_MASK                          0x00008000 */
/* #define _IC1CON_ON_LENGTH                        0x00000001 */

/* #define _IC1CON_ICM0_POSITION                    0x00000000 */
/* #define _IC1CON_ICM0_MASK                        0x00000001 */
/* #define _IC1CON_ICM0_LENGTH                      0x00000001 */

/* #define _IC1CON_ICM1_POSITION                    0x00000001 */
/* #define _IC1CON_ICM1_MASK                        0x00000002 */
/* #define _IC1CON_ICM1_LENGTH                      0x00000001 */

/* #define _IC1CON_ICM2_POSITION                    0x00000002 */
/* #define _IC1CON_ICM2_MASK                        0x00000004 */
/* #define _IC1CON_ICM2_LENGTH                      0x00000001 */

/* #define _IC1CON_ICI0_POSITION                    0x00000005 */
/* #define _IC1CON_ICI0_MASK                        0x00000020 */
/* #define _IC1CON_ICI0_LENGTH                      0x00000001 */

/* #define _IC1CON_ICI1_POSITION                    0x00000006 */
/* #define _IC1CON_ICI1_MASK                        0x00000040 */
/* #define _IC1CON_ICI1_LENGTH                      0x00000001 */

/* #define _IC1CON_ICSIDL_POSITION                  0x0000000D */
/* #define _IC1CON_ICSIDL_MASK                      0x00002000 */
/* #define _IC1CON_ICSIDL_LENGTH                    0x00000001 */

/* #define _IC1CON_w_POSITION                       0x00000000 */
/* #define _IC1CON_w_MASK                           0xFFFFFFFF */
/* #define _IC1CON_w_LENGTH                         0x00000020 */

/* #define _IC2CON_ICM_POSITION                     0x00000000 */
/* #define _IC2CON_ICM_MASK                         0x00000007 */
/* #define _IC2CON_ICM_LENGTH                       0x00000003 */

/* #define _IC2CON_ICBNE_POSITION                   0x00000003 */
/* #define _IC2CON_ICBNE_MASK                       0x00000008 */
/* #define _IC2CON_ICBNE_LENGTH                     0x00000001 */

/* #define _IC2CON_ICOV_POSITION                    0x00000004 */
/* #define _IC2CON_ICOV_MASK                        0x00000010 */
/* #define _IC2CON_ICOV_LENGTH                      0x00000001 */

/* #define _IC2CON_ICI_POSITION                     0x00000005 */
/* #define _IC2CON_ICI_MASK                         0x00000060 */
/* #define _IC2CON_ICI_LENGTH                       0x00000002 */

/* #define _IC2CON_ICTMR_POSITION                   0x00000007 */
/* #define _IC2CON_ICTMR_MASK                       0x00000080 */
/* #define _IC2CON_ICTMR_LENGTH                     0x00000001 */

/* #define _IC2CON_C32_POSITION                     0x00000008 */
/* #define _IC2CON_C32_MASK                         0x00000100 */
/* #define _IC2CON_C32_LENGTH                       0x00000001 */

/* #define _IC2CON_FEDGE_POSITION                   0x00000009 */
/* #define _IC2CON_FEDGE_MASK                       0x00000200 */
/* #define _IC2CON_FEDGE_LENGTH                     0x00000001 */

/* #define _IC2CON_SIDL_POSITION                    0x0000000D */
/* #define _IC2CON_SIDL_MASK                        0x00002000 */
/* #define _IC2CON_SIDL_LENGTH                      0x00000001 */

/* #define _IC2CON_ON_POSITION                      0x0000000F */
/* #define _IC2CON_ON_MASK                          0x00008000 */
/* #define _IC2CON_ON_LENGTH                        0x00000001 */

/* #define _IC2CON_ICM0_POSITION                    0x00000000 */
/* #define _IC2CON_ICM0_MASK                        0x00000001 */
/* #define _IC2CON_ICM0_LENGTH                      0x00000001 */

/* #define _IC2CON_ICM1_POSITION                    0x00000001 */
/* #define _IC2CON_ICM1_MASK                        0x00000002 */
/* #define _IC2CON_ICM1_LENGTH                      0x00000001 */

/* #define _IC2CON_ICM2_POSITION                    0x00000002 */
/* #define _IC2CON_ICM2_MASK                        0x00000004 */
/* #define _IC2CON_ICM2_LENGTH                      0x00000001 */

/* #define _IC2CON_ICI0_POSITION                    0x00000005 */
/* #define _IC2CON_ICI0_MASK                        0x00000020 */
/* #define _IC2CON_ICI0_LENGTH                      0x00000001 */

/* #define _IC2CON_ICI1_POSITION                    0x00000006 */
/* #define _IC2CON_ICI1_MASK                        0x00000040 */
/* #define _IC2CON_ICI1_LENGTH                      0x00000001 */

/* #define _IC2CON_ICSIDL_POSITION                  0x0000000D */
/* #define _IC2CON_ICSIDL_MASK                      0x00002000 */
/* #define _IC2CON_ICSIDL_LENGTH                    0x00000001 */

/* #define _IC2CON_w_POSITION                       0x00000000 */
/* #define _IC2CON_w_MASK                           0xFFFFFFFF */
/* #define _IC2CON_w_LENGTH                         0x00000020 */

/* #define _IC3CON_ICM_POSITION                     0x00000000 */
/* #define _IC3CON_ICM_MASK                         0x00000007 */
/* #define _IC3CON_ICM_LENGTH                       0x00000003 */

/* #define _IC3CON_ICBNE_POSITION                   0x00000003 */
/* #define _IC3CON_ICBNE_MASK                       0x00000008 */
/* #define _IC3CON_ICBNE_LENGTH                     0x00000001 */

/* #define _IC3CON_ICOV_POSITION                    0x00000004 */
/* #define _IC3CON_ICOV_MASK                        0x00000010 */
/* #define _IC3CON_ICOV_LENGTH                      0x00000001 */

/* #define _IC3CON_ICI_POSITION                     0x00000005 */
/* #define _IC3CON_ICI_MASK                         0x00000060 */
/* #define _IC3CON_ICI_LENGTH                       0x00000002 */

/* #define _IC3CON_ICTMR_POSITION                   0x00000007 */
/* #define _IC3CON_ICTMR_MASK                       0x00000080 */
/* #define _IC3CON_ICTMR_LENGTH                     0x00000001 */

/* #define _IC3CON_C32_POSITION                     0x00000008 */
/* #define _IC3CON_C32_MASK                         0x00000100 */
/* #define _IC3CON_C32_LENGTH                       0x00000001 */

/* #define _IC3CON_FEDGE_POSITION                   0x00000009 */
/* #define _IC3CON_FEDGE_MASK                       0x00000200 */
/* #define _IC3CON_FEDGE_LENGTH                     0x00000001 */

/* #define _IC3CON_SIDL_POSITION                    0x0000000D */
/* #define _IC3CON_SIDL_MASK                        0x00002000 */
/* #define _IC3CON_SIDL_LENGTH                      0x00000001 */

/* #define _IC3CON_ON_POSITION                      0x0000000F */
/* #define _IC3CON_ON_MASK                          0x00008000 */
/* #define _IC3CON_ON_LENGTH                        0x00000001 */

/* #define _IC3CON_ICM0_POSITION                    0x00000000 */
/* #define _IC3CON_ICM0_MASK                        0x00000001 */
/* #define _IC3CON_ICM0_LENGTH                      0x00000001 */

/* #define _IC3CON_ICM1_POSITION                    0x00000001 */
/* #define _IC3CON_ICM1_MASK                        0x00000002 */
/* #define _IC3CON_ICM1_LENGTH                      0x00000001 */

/* #define _IC3CON_ICM2_POSITION                    0x00000002 */
/* #define _IC3CON_ICM2_MASK                        0x00000004 */
/* #define _IC3CON_ICM2_LENGTH                      0x00000001 */

/* #define _IC3CON_ICI0_POSITION                    0x00000005 */
/* #define _IC3CON_ICI0_MASK                        0x00000020 */
/* #define _IC3CON_ICI0_LENGTH                      0x00000001 */

/* #define _IC3CON_ICI1_POSITION                    0x00000006 */
/* #define _IC3CON_ICI1_MASK                        0x00000040 */
/* #define _IC3CON_ICI1_LENGTH                      0x00000001 */

/* #define _IC3CON_ICSIDL_POSITION                  0x0000000D */
/* #define _IC3CON_ICSIDL_MASK                      0x00002000 */
/* #define _IC3CON_ICSIDL_LENGTH                    0x00000001 */

/* #define _IC3CON_w_POSITION                       0x00000000 */
/* #define _IC3CON_w_MASK                           0xFFFFFFFF */
/* #define _IC3CON_w_LENGTH                         0x00000020 */

/* #define _IC4CON_ICM_POSITION                     0x00000000 */
/* #define _IC4CON_ICM_MASK                         0x00000007 */
/* #define _IC4CON_ICM_LENGTH                       0x00000003 */

/* #define _IC4CON_ICBNE_POSITION                   0x00000003 */
/* #define _IC4CON_ICBNE_MASK                       0x00000008 */
/* #define _IC4CON_ICBNE_LENGTH                     0x00000001 */

/* #define _IC4CON_ICOV_POSITION                    0x00000004 */
/* #define _IC4CON_ICOV_MASK                        0x00000010 */
/* #define _IC4CON_ICOV_LENGTH                      0x00000001 */

/* #define _IC4CON_ICI_POSITION                     0x00000005 */
/* #define _IC4CON_ICI_MASK                         0x00000060 */
/* #define _IC4CON_ICI_LENGTH                       0x00000002 */

/* #define _IC4CON_ICTMR_POSITION                   0x00000007 */
/* #define _IC4CON_ICTMR_MASK                       0x00000080 */
/* #define _IC4CON_ICTMR_LENGTH                     0x00000001 */

/* #define _IC4CON_C32_POSITION                     0x00000008 */
/* #define _IC4CON_C32_MASK                         0x00000100 */
/* #define _IC4CON_C32_LENGTH                       0x00000001 */

/* #define _IC4CON_FEDGE_POSITION                   0x00000009 */
/* #define _IC4CON_FEDGE_MASK                       0x00000200 */
/* #define _IC4CON_FEDGE_LENGTH                     0x00000001 */

/* #define _IC4CON_SIDL_POSITION                    0x0000000D */
/* #define _IC4CON_SIDL_MASK                        0x00002000 */
/* #define _IC4CON_SIDL_LENGTH                      0x00000001 */

/* #define _IC4CON_ON_POSITION                      0x0000000F */
/* #define _IC4CON_ON_MASK                          0x00008000 */
/* #define _IC4CON_ON_LENGTH                        0x00000001 */

/* #define _IC4CON_ICM0_POSITION                    0x00000000 */
/* #define _IC4CON_ICM0_MASK                        0x00000001 */
/* #define _IC4CON_ICM0_LENGTH                      0x00000001 */

/* #define _IC4CON_ICM1_POSITION                    0x00000001 */
/* #define _IC4CON_ICM1_MASK                        0x00000002 */
/* #define _IC4CON_ICM1_LENGTH                      0x00000001 */

/* #define _IC4CON_ICM2_POSITION                    0x00000002 */
/* #define _IC4CON_ICM2_MASK                        0x00000004 */
/* #define _IC4CON_ICM2_LENGTH                      0x00000001 */

/* #define _IC4CON_ICI0_POSITION                    0x00000005 */
/* #define _IC4CON_ICI0_MASK                        0x00000020 */
/* #define _IC4CON_ICI0_LENGTH                      0x00000001 */

/* #define _IC4CON_ICI1_POSITION                    0x00000006 */
/* #define _IC4CON_ICI1_MASK                        0x00000040 */
/* #define _IC4CON_ICI1_LENGTH                      0x00000001 */

/* #define _IC4CON_ICSIDL_POSITION                  0x0000000D */
/* #define _IC4CON_ICSIDL_MASK                      0x00002000 */
/* #define _IC4CON_ICSIDL_LENGTH                    0x00000001 */

/* #define _IC4CON_w_POSITION                       0x00000000 */
/* #define _IC4CON_w_MASK                           0xFFFFFFFF */
/* #define _IC4CON_w_LENGTH                         0x00000020 */

/* #define _IC5CON_ICM_POSITION                     0x00000000 */
/* #define _IC5CON_ICM_MASK                         0x00000007 */
/* #define _IC5CON_ICM_LENGTH                       0x00000003 */

/* #define _IC5CON_ICBNE_POSITION                   0x00000003 */
/* #define _IC5CON_ICBNE_MASK                       0x00000008 */
/* #define _IC5CON_ICBNE_LENGTH                     0x00000001 */

/* #define _IC5CON_ICOV_POSITION                    0x00000004 */
/* #define _IC5CON_ICOV_MASK                        0x00000010 */
/* #define _IC5CON_ICOV_LENGTH                      0x00000001 */

/* #define _IC5CON_ICI_POSITION                     0x00000005 */
/* #define _IC5CON_ICI_MASK                         0x00000060 */
/* #define _IC5CON_ICI_LENGTH                       0x00000002 */

/* #define _IC5CON_ICTMR_POSITION                   0x00000007 */
/* #define _IC5CON_ICTMR_MASK                       0x00000080 */
/* #define _IC5CON_ICTMR_LENGTH                     0x00000001 */

/* #define _IC5CON_C32_POSITION                     0x00000008 */
/* #define _IC5CON_C32_MASK                         0x00000100 */
/* #define _IC5CON_C32_LENGTH                       0x00000001 */

/* #define _IC5CON_FEDGE_POSITION                   0x00000009 */
/* #define _IC5CON_FEDGE_MASK                       0x00000200 */
/* #define _IC5CON_FEDGE_LENGTH                     0x00000001 */

/* #define _IC5CON_SIDL_POSITION                    0x0000000D */
/* #define _IC5CON_SIDL_MASK                        0x00002000 */
/* #define _IC5CON_SIDL_LENGTH                      0x00000001 */

/* #define _IC5CON_ON_POSITION                      0x0000000F */
/* #define _IC5CON_ON_MASK                          0x00008000 */
/* #define _IC5CON_ON_LENGTH                        0x00000001 */

/* #define _IC5CON_ICM0_POSITION                    0x00000000 */
/* #define _IC5CON_ICM0_MASK                        0x00000001 */
/* #define _IC5CON_ICM0_LENGTH                      0x00000001 */

/* #define _IC5CON_ICM1_POSITION                    0x00000001 */
/* #define _IC5CON_ICM1_MASK                        0x00000002 */
/* #define _IC5CON_ICM1_LENGTH                      0x00000001 */

/* #define _IC5CON_ICM2_POSITION                    0x00000002 */
/* #define _IC5CON_ICM2_MASK                        0x00000004 */
/* #define _IC5CON_ICM2_LENGTH                      0x00000001 */

/* #define _IC5CON_ICI0_POSITION                    0x00000005 */
/* #define _IC5CON_ICI0_MASK                        0x00000020 */
/* #define _IC5CON_ICI0_LENGTH                      0x00000001 */

/* #define _IC5CON_ICI1_POSITION                    0x00000006 */
/* #define _IC5CON_ICI1_MASK                        0x00000040 */
/* #define _IC5CON_ICI1_LENGTH                      0x00000001 */

/* #define _IC5CON_ICSIDL_POSITION                  0x0000000D */
/* #define _IC5CON_ICSIDL_MASK                      0x00002000 */
/* #define _IC5CON_ICSIDL_LENGTH                    0x00000001 */

/* #define _IC5CON_w_POSITION                       0x00000000 */
/* #define _IC5CON_w_MASK                           0xFFFFFFFF */
/* #define _IC5CON_w_LENGTH                         0x00000020 */

/* #define _OC1CON_OCM_POSITION                     0x00000000 */
/* #define _OC1CON_OCM_MASK                         0x00000007 */
/* #define _OC1CON_OCM_LENGTH                       0x00000003 */

/* #define _OC1CON_OCTSEL_POSITION                  0x00000003 */
/* #define _OC1CON_OCTSEL_MASK                      0x00000008 */
/* #define _OC1CON_OCTSEL_LENGTH                    0x00000001 */

/* #define _OC1CON_OCFLT_POSITION                   0x00000004 */
/* #define _OC1CON_OCFLT_MASK                       0x00000010 */
/* #define _OC1CON_OCFLT_LENGTH                     0x00000001 */

/* #define _OC1CON_OC32_POSITION                    0x00000005 */
/* #define _OC1CON_OC32_MASK                        0x00000020 */
/* #define _OC1CON_OC32_LENGTH                      0x00000001 */

/* #define _OC1CON_SIDL_POSITION                    0x0000000D */
/* #define _OC1CON_SIDL_MASK                        0x00002000 */
/* #define _OC1CON_SIDL_LENGTH                      0x00000001 */

/* #define _OC1CON_ON_POSITION                      0x0000000F */
/* #define _OC1CON_ON_MASK                          0x00008000 */
/* #define _OC1CON_ON_LENGTH                        0x00000001 */

/* #define _OC1CON_OCM0_POSITION                    0x00000000 */
/* #define _OC1CON_OCM0_MASK                        0x00000001 */
/* #define _OC1CON_OCM0_LENGTH                      0x00000001 */

/* #define _OC1CON_OCM1_POSITION                    0x00000001 */
/* #define _OC1CON_OCM1_MASK                        0x00000002 */
/* #define _OC1CON_OCM1_LENGTH                      0x00000001 */

/* #define _OC1CON_OCM2_POSITION                    0x00000002 */
/* #define _OC1CON_OCM2_MASK                        0x00000004 */
/* #define _OC1CON_OCM2_LENGTH                      0x00000001 */

/* #define _OC1CON_OCSIDL_POSITION                  0x0000000D */
/* #define _OC1CON_OCSIDL_MASK                      0x00002000 */
/* #define _OC1CON_OCSIDL_LENGTH                    0x00000001 */

/* #define _OC1CON_w_POSITION                       0x00000000 */
/* #define _OC1CON_w_MASK                           0xFFFFFFFF */
/* #define _OC1CON_w_LENGTH                         0x00000020 */

/* #define _OC2CON_OCM_POSITION                     0x00000000 */
/* #define _OC2CON_OCM_MASK                         0x00000007 */
/* #define _OC2CON_OCM_LENGTH                       0x00000003 */

/* #define _OC2CON_OCTSEL_POSITION                  0x00000003 */
/* #define _OC2CON_OCTSEL_MASK                      0x00000008 */
/* #define _OC2CON_OCTSEL_LENGTH                    0x00000001 */

/* #define _OC2CON_OCFLT_POSITION                   0x00000004 */
/* #define _OC2CON_OCFLT_MASK                       0x00000010 */
/* #define _OC2CON_OCFLT_LENGTH                     0x00000001 */

/* #define _OC2CON_OC32_POSITION                    0x00000005 */
/* #define _OC2CON_OC32_MASK                        0x00000020 */
/* #define _OC2CON_OC32_LENGTH                      0x00000001 */

/* #define _OC2CON_SIDL_POSITION                    0x0000000D */
/* #define _OC2CON_SIDL_MASK                        0x00002000 */
/* #define _OC2CON_SIDL_LENGTH                      0x00000001 */

#define _OC2CON_ON_POSITION                      0x0000000F
#define _OC2CON_ON_MASK                          0x00008000
#define _OC2CON_ON_LENGTH                        0x00000001

/* #define _OC2CON_OCM0_POSITION                    0x00000000 */
/* #define _OC2CON_OCM0_MASK                        0x00000001 */
/* #define _OC2CON_OCM0_LENGTH                      0x00000001 */

/* #define _OC2CON_OCM1_POSITION                    0x00000001 */
/* #define _OC2CON_OCM1_MASK                        0x00000002 */
/* #define _OC2CON_OCM1_LENGTH                      0x00000001 */

/* #define _OC2CON_OCM2_POSITION                    0x00000002 */
/* #define _OC2CON_OCM2_MASK                        0x00000004 */
/* #define _OC2CON_OCM2_LENGTH                      0x00000001 */

/* #define _OC2CON_OCSIDL_POSITION                  0x0000000D */
/* #define _OC2CON_OCSIDL_MASK                      0x00002000 */
/* #define _OC2CON_OCSIDL_LENGTH                    0x00000001 */

/* #define _OC2CON_w_POSITION                       0x00000000 */
/* #define _OC2CON_w_MASK                           0xFFFFFFFF */
/* #define _OC2CON_w_LENGTH                         0x00000020 */

/* #define _OC3CON_OCM_POSITION                     0x00000000 */
/* #define _OC3CON_OCM_MASK                         0x00000007 */
/* #define _OC3CON_OCM_LENGTH                       0x00000003 */

/* #define _OC3CON_OCTSEL_POSITION                  0x00000003 */
/* #define _OC3CON_OCTSEL_MASK                      0x00000008 */
/* #define _OC3CON_OCTSEL_LENGTH                    0x00000001 */

/* #define _OC3CON_OCFLT_POSITION                   0x00000004 */
/* #define _OC3CON_OCFLT_MASK                       0x00000010 */
/* #define _OC3CON_OCFLT_LENGTH                     0x00000001 */

/* #define _OC3CON_OC32_POSITION                    0x00000005 */
/* #define _OC3CON_OC32_MASK                        0x00000020 */
/* #define _OC3CON_OC32_LENGTH                      0x00000001 */

/* #define _OC3CON_SIDL_POSITION                    0x0000000D */
/* #define _OC3CON_SIDL_MASK                        0x00002000 */
/* #define _OC3CON_SIDL_LENGTH                      0x00000001 */

/* #define _OC3CON_ON_POSITION                      0x0000000F */
/* #define _OC3CON_ON_MASK                          0x00008000 */
/* #define _OC3CON_ON_LENGTH                        0x00000001 */

/* #define _OC3CON_OCM0_POSITION                    0x00000000 */
/* #define _OC3CON_OCM0_MASK                        0x00000001 */
/* #define _OC3CON_OCM0_LENGTH                      0x00000001 */

/* #define _OC3CON_OCM1_POSITION                    0x00000001 */
/* #define _OC3CON_OCM1_MASK                        0x00000002 */
/* #define _OC3CON_OCM1_LENGTH                      0x00000001 */

/* #define _OC3CON_OCM2_POSITION                    0x00000002 */
/* #define _OC3CON_OCM2_MASK                        0x00000004 */
/* #define _OC3CON_OCM2_LENGTH                      0x00000001 */

/* #define _OC3CON_OCSIDL_POSITION                  0x0000000D */
/* #define _OC3CON_OCSIDL_MASK                      0x00002000 */
/* #define _OC3CON_OCSIDL_LENGTH                    0x00000001 */

/* #define _OC3CON_w_POSITION                       0x00000000 */
/* #define _OC3CON_w_MASK                           0xFFFFFFFF */
/* #define _OC3CON_w_LENGTH                         0x00000020 */

/* #define _OC4CON_OCM_POSITION                     0x00000000 */
/* #define _OC4CON_OCM_MASK                         0x00000007 */
/* #define _OC4CON_OCM_LENGTH                       0x00000003 */

/* #define _OC4CON_OCTSEL_POSITION                  0x00000003 */
/* #define _OC4CON_OCTSEL_MASK                      0x00000008 */
/* #define _OC4CON_OCTSEL_LENGTH                    0x00000001 */

/* #define _OC4CON_OCFLT_POSITION                   0x00000004 */
/* #define _OC4CON_OCFLT_MASK                       0x00000010 */
/* #define _OC4CON_OCFLT_LENGTH                     0x00000001 */

/* #define _OC4CON_OC32_POSITION                    0x00000005 */
/* #define _OC4CON_OC32_MASK                        0x00000020 */
/* #define _OC4CON_OC32_LENGTH                      0x00000001 */

/* #define _OC4CON_SIDL_POSITION                    0x0000000D */
/* #define _OC4CON_SIDL_MASK                        0x00002000 */
/* #define _OC4CON_SIDL_LENGTH                      0x00000001 */

#define _OC4CON_ON_POSITION                      0x0000000F
#define _OC4CON_ON_MASK                          0x00008000
#define _OC4CON_ON_LENGTH                        0x00000001

/* #define _OC4CON_OCM0_POSITION                    0x00000000 */
/* #define _OC4CON_OCM0_MASK                        0x00000001 */
/* #define _OC4CON_OCM0_LENGTH                      0x00000001 */

/* #define _OC4CON_OCM1_POSITION                    0x00000001 */
/* #define _OC4CON_OCM1_MASK                        0x00000002 */
/* #define _OC4CON_OCM1_LENGTH                      0x00000001 */

/* #define _OC4CON_OCM2_POSITION                    0x00000002 */
/* #define _OC4CON_OCM2_MASK                        0x00000004 */
/* #define _OC4CON_OCM2_LENGTH                      0x00000001 */

/* #define _OC4CON_OCSIDL_POSITION                  0x0000000D */
/* #define _OC4CON_OCSIDL_MASK                      0x00002000 */
/* #define _OC4CON_OCSIDL_LENGTH                    0x00000001 */

/* #define _OC4CON_w_POSITION                       0x00000000 */
/* #define _OC4CON_w_MASK                           0xFFFFFFFF */
/* #define _OC4CON_w_LENGTH                         0x00000020 */

/* #define _OC5CON_OCM_POSITION                     0x00000000 */
/* #define _OC5CON_OCM_MASK                         0x00000007 */
/* #define _OC5CON_OCM_LENGTH                       0x00000003 */

/* #define _OC5CON_OCTSEL_POSITION                  0x00000003 */
/* #define _OC5CON_OCTSEL_MASK                      0x00000008 */
/* #define _OC5CON_OCTSEL_LENGTH                    0x00000001 */

/* #define _OC5CON_OCFLT_POSITION                   0x00000004 */
/* #define _OC5CON_OCFLT_MASK                       0x00000010 */
/* #define _OC5CON_OCFLT_LENGTH                     0x00000001 */

/* #define _OC5CON_OC32_POSITION                    0x00000005 */
/* #define _OC5CON_OC32_MASK                        0x00000020 */
/* #define _OC5CON_OC32_LENGTH                      0x00000001 */

/* #define _OC5CON_SIDL_POSITION                    0x0000000D */
/* #define _OC5CON_SIDL_MASK                        0x00002000 */
/* #define _OC5CON_SIDL_LENGTH                      0x00000001 */

/* #define _OC5CON_ON_POSITION                      0x0000000F */
/* #define _OC5CON_ON_MASK                          0x00008000 */
/* #define _OC5CON_ON_LENGTH                        0x00000001 */

/* #define _OC5CON_OCM0_POSITION                    0x00000000 */
/* #define _OC5CON_OCM0_MASK                        0x00000001 */
/* #define _OC5CON_OCM0_LENGTH                      0x00000001 */

/* #define _OC5CON_OCM1_POSITION                    0x00000001 */
/* #define _OC5CON_OCM1_MASK                        0x00000002 */
/* #define _OC5CON_OCM1_LENGTH                      0x00000001 */

/* #define _OC5CON_OCM2_POSITION                    0x00000002 */
/* #define _OC5CON_OCM2_MASK                        0x00000004 */
/* #define _OC5CON_OCM2_LENGTH                      0x00000001 */

/* #define _OC5CON_OCSIDL_POSITION                  0x0000000D */
/* #define _OC5CON_OCSIDL_MASK                      0x00002000 */
/* #define _OC5CON_OCSIDL_LENGTH                    0x00000001 */

/* #define _OC5CON_w_POSITION                       0x00000000 */
/* #define _OC5CON_w_MASK                           0xFFFFFFFF */
/* #define _OC5CON_w_LENGTH                         0x00000020 */

/* #define _I2C1111CON_SEN_POSITION                 0x00000000 */
/* #define _I2C1111CON_SEN_MASK                     0x00000001 */
/* #define _I2C1111CON_SEN_LENGTH                   0x00000001 */

/* #define _I2C1111CON_RSEN_POSITION                0x00000001 */
/* #define _I2C1111CON_RSEN_MASK                    0x00000002 */
/* #define _I2C1111CON_RSEN_LENGTH                  0x00000001 */

/* #define _I2C1111CON_PEN_POSITION                 0x00000002 */
/* #define _I2C1111CON_PEN_MASK                     0x00000004 */
/* #define _I2C1111CON_PEN_LENGTH                   0x00000001 */

/* #define _I2C1111CON_RCEN_POSITION                0x00000003 */
/* #define _I2C1111CON_RCEN_MASK                    0x00000008 */
/* #define _I2C1111CON_RCEN_LENGTH                  0x00000001 */

/* #define _I2C1111CON_ACKEN_POSITION               0x00000004 */
/* #define _I2C1111CON_ACKEN_MASK                   0x00000010 */
/* #define _I2C1111CON_ACKEN_LENGTH                 0x00000001 */

/* #define _I2C1111CON_ACKDT_POSITION               0x00000005 */
/* #define _I2C1111CON_ACKDT_MASK                   0x00000020 */
/* #define _I2C1111CON_ACKDT_LENGTH                 0x00000001 */

/* #define _I2C1111CON_STREN_POSITION               0x00000006 */
/* #define _I2C1111CON_STREN_MASK                   0x00000040 */
/* #define _I2C1111CON_STREN_LENGTH                 0x00000001 */

/* #define _I2C1111CON_GCEN_POSITION                0x00000007 */
/* #define _I2C1111CON_GCEN_MASK                    0x00000080 */
/* #define _I2C1111CON_GCEN_LENGTH                  0x00000001 */

/* #define _I2C1111CON_SMEN_POSITION                0x00000008 */
/* #define _I2C1111CON_SMEN_MASK                    0x00000100 */
/* #define _I2C1111CON_SMEN_LENGTH                  0x00000001 */

/* #define _I2C1111CON_DISSLW_POSITION              0x00000009 */
/* #define _I2C1111CON_DISSLW_MASK                  0x00000200 */
/* #define _I2C1111CON_DISSLW_LENGTH                0x00000001 */

/* #define _I2C1111CON_A10M_POSITION                0x0000000A */
/* #define _I2C1111CON_A10M_MASK                    0x00000400 */
/* #define _I2C1111CON_A10M_LENGTH                  0x00000001 */

/* #define _I2C1111CON_STRICT_POSITION              0x0000000B */
/* #define _I2C1111CON_STRICT_MASK                  0x00000800 */
/* #define _I2C1111CON_STRICT_LENGTH                0x00000001 */

/* #define _I2C1111CON_SCLREL_POSITION              0x0000000C */
/* #define _I2C1111CON_SCLREL_MASK                  0x00001000 */
/* #define _I2C1111CON_SCLREL_LENGTH                0x00000001 */

/* #define _I2C1111CON_SIDL_POSITION                0x0000000D */
/* #define _I2C1111CON_SIDL_MASK                    0x00002000 */
/* #define _I2C1111CON_SIDL_LENGTH                  0x00000001 */

/* #define _I2C1111CON_ON_POSITION                  0x0000000F */
/* #define _I2C1111CON_ON_MASK                      0x00008000 */
/* #define _I2C1111CON_ON_LENGTH                    0x00000001 */

/* #define _I2C1111CON_IPMIEN_POSITION              0x0000000B */
/* #define _I2C1111CON_IPMIEN_MASK                  0x00000800 */
/* #define _I2C1111CON_IPMIEN_LENGTH                0x00000001 */

/* #define _I2C1111CON_I2CSIDL_POSITION             0x0000000D */
/* #define _I2C1111CON_I2CSIDL_MASK                 0x00002000 */
/* #define _I2C1111CON_I2CSIDL_LENGTH               0x00000001 */

/* #define _I2C1111CON_I2CEN_POSITION               0x0000000F */
/* #define _I2C1111CON_I2CEN_MASK                   0x00008000 */
/* #define _I2C1111CON_I2CEN_LENGTH                 0x00000001 */

/* #define _I2C1111CON_w_POSITION                   0x00000000 */
/* #define _I2C1111CON_w_MASK                       0xFFFFFFFF */
/* #define _I2C1111CON_w_LENGTH                     0x00000020 */

/* #define _I2C1CON_SEN_POSITION                    0x00000000 */
/* #define _I2C1CON_SEN_MASK                        0x00000001 */
/* #define _I2C1CON_SEN_LENGTH                      0x00000001 */

/* #define _I2C1CON_RSEN_POSITION                   0x00000001 */
/* #define _I2C1CON_RSEN_MASK                       0x00000002 */
/* #define _I2C1CON_RSEN_LENGTH                     0x00000001 */

/* #define _I2C1CON_PEN_POSITION                    0x00000002 */
/* #define _I2C1CON_PEN_MASK                        0x00000004 */
/* #define _I2C1CON_PEN_LENGTH                      0x00000001 */

/* #define _I2C1CON_RCEN_POSITION                   0x00000003 */
/* #define _I2C1CON_RCEN_MASK                       0x00000008 */
/* #define _I2C1CON_RCEN_LENGTH                     0x00000001 */

/* #define _I2C1CON_ACKEN_POSITION                  0x00000004 */
/* #define _I2C1CON_ACKEN_MASK                      0x00000010 */
/* #define _I2C1CON_ACKEN_LENGTH                    0x00000001 */

/* #define _I2C1CON_ACKDT_POSITION                  0x00000005 */
/* #define _I2C1CON_ACKDT_MASK                      0x00000020 */
/* #define _I2C1CON_ACKDT_LENGTH                    0x00000001 */

/* #define _I2C1CON_STREN_POSITION                  0x00000006 */
/* #define _I2C1CON_STREN_MASK                      0x00000040 */
/* #define _I2C1CON_STREN_LENGTH                    0x00000001 */

/* #define _I2C1CON_GCEN_POSITION                   0x00000007 */
/* #define _I2C1CON_GCEN_MASK                       0x00000080 */
/* #define _I2C1CON_GCEN_LENGTH                     0x00000001 */

/* #define _I2C1CON_SMEN_POSITION                   0x00000008 */
/* #define _I2C1CON_SMEN_MASK                       0x00000100 */
/* #define _I2C1CON_SMEN_LENGTH                     0x00000001 */

/* #define _I2C1CON_DISSLW_POSITION                 0x00000009 */
/* #define _I2C1CON_DISSLW_MASK                     0x00000200 */
/* #define _I2C1CON_DISSLW_LENGTH                   0x00000001 */

/* #define _I2C1CON_A10M_POSITION                   0x0000000A */
/* #define _I2C1CON_A10M_MASK                       0x00000400 */
/* #define _I2C1CON_A10M_LENGTH                     0x00000001 */

/* #define _I2C1CON_STRICT_POSITION                 0x0000000B */
/* #define _I2C1CON_STRICT_MASK                     0x00000800 */
/* #define _I2C1CON_STRICT_LENGTH                   0x00000001 */

/* #define _I2C1CON_SCLREL_POSITION                 0x0000000C */
/* #define _I2C1CON_SCLREL_MASK                     0x00001000 */
/* #define _I2C1CON_SCLREL_LENGTH                   0x00000001 */

/* #define _I2C1CON_SIDL_POSITION                   0x0000000D */
/* #define _I2C1CON_SIDL_MASK                       0x00002000 */
/* #define _I2C1CON_SIDL_LENGTH                     0x00000001 */

/* #define _I2C1CON_ON_POSITION                     0x0000000F */
/* #define _I2C1CON_ON_MASK                         0x00008000 */
/* #define _I2C1CON_ON_LENGTH                       0x00000001 */

/* #define _I2C1CON_IPMIEN_POSITION                 0x0000000B */
/* #define _I2C1CON_IPMIEN_MASK                     0x00000800 */
/* #define _I2C1CON_IPMIEN_LENGTH                   0x00000001 */

/* #define _I2C1CON_I2CSIDL_POSITION                0x0000000D */
/* #define _I2C1CON_I2CSIDL_MASK                    0x00002000 */
/* #define _I2C1CON_I2CSIDL_LENGTH                  0x00000001 */

/* #define _I2C1CON_I2CEN_POSITION                  0x0000000F */
/* #define _I2C1CON_I2CEN_MASK                      0x00008000 */
/* #define _I2C1CON_I2CEN_LENGTH                    0x00000001 */

/* #define _I2C1CON_w_POSITION                      0x00000000 */
/* #define _I2C1CON_w_MASK                          0xFFFFFFFF */
/* #define _I2C1CON_w_LENGTH                        0x00000020 */

/* #define _I2C1111STAT_TBF_POSITION                0x00000000 */
/* #define _I2C1111STAT_TBF_MASK                    0x00000001 */
/* #define _I2C1111STAT_TBF_LENGTH                  0x00000001 */

/* #define _I2C1111STAT_RBF_POSITION                0x00000001 */
/* #define _I2C1111STAT_RBF_MASK                    0x00000002 */
/* #define _I2C1111STAT_RBF_LENGTH                  0x00000001 */

/* #define _I2C1111STAT_R_W_POSITION                0x00000002 */
/* #define _I2C1111STAT_R_W_MASK                    0x00000004 */
/* #define _I2C1111STAT_R_W_LENGTH                  0x00000001 */

/* #define _I2C1111STAT_S_POSITION                  0x00000003 */
/* #define _I2C1111STAT_S_MASK                      0x00000008 */
/* #define _I2C1111STAT_S_LENGTH                    0x00000001 */

/* #define _I2C1111STAT_P_POSITION                  0x00000004 */
/* #define _I2C1111STAT_P_MASK                      0x00000010 */
/* #define _I2C1111STAT_P_LENGTH                    0x00000001 */

/* #define _I2C1111STAT_D_A_POSITION                0x00000005 */
/* #define _I2C1111STAT_D_A_MASK                    0x00000020 */
/* #define _I2C1111STAT_D_A_LENGTH                  0x00000001 */

/* #define _I2C1111STAT_I2COV_POSITION              0x00000006 */
/* #define _I2C1111STAT_I2COV_MASK                  0x00000040 */
/* #define _I2C1111STAT_I2COV_LENGTH                0x00000001 */

/* #define _I2C1111STAT_IWCOL_POSITION              0x00000007 */
/* #define _I2C1111STAT_IWCOL_MASK                  0x00000080 */
/* #define _I2C1111STAT_IWCOL_LENGTH                0x00000001 */

/* #define _I2C1111STAT_ADD10_POSITION              0x00000008 */
/* #define _I2C1111STAT_ADD10_MASK                  0x00000100 */
/* #define _I2C1111STAT_ADD10_LENGTH                0x00000001 */

/* #define _I2C1111STAT_GCSTAT_POSITION             0x00000009 */
/* #define _I2C1111STAT_GCSTAT_MASK                 0x00000200 */
/* #define _I2C1111STAT_GCSTAT_LENGTH               0x00000001 */

/* #define _I2C1111STAT_BCL_POSITION                0x0000000A */
/* #define _I2C1111STAT_BCL_MASK                    0x00000400 */
/* #define _I2C1111STAT_BCL_LENGTH                  0x00000001 */

/* #define _I2C1111STAT_TRSTAT_POSITION             0x0000000E */
/* #define _I2C1111STAT_TRSTAT_MASK                 0x00004000 */
/* #define _I2C1111STAT_TRSTAT_LENGTH               0x00000001 */

/* #define _I2C1111STAT_ACKSTAT_POSITION            0x0000000F */
/* #define _I2C1111STAT_ACKSTAT_MASK                0x00008000 */
/* #define _I2C1111STAT_ACKSTAT_LENGTH              0x00000001 */

/* #define _I2C1111STAT_I2CPOV_POSITION             0x00000006 */
/* #define _I2C1111STAT_I2CPOV_MASK                 0x00000040 */
/* #define _I2C1111STAT_I2CPOV_LENGTH               0x00000001 */

/* #define _I2C1111STAT_w_POSITION                  0x00000000 */
/* #define _I2C1111STAT_w_MASK                      0xFFFFFFFF */
/* #define _I2C1111STAT_w_LENGTH                    0x00000020 */

/* #define _I2C1STAT_TBF_POSITION                   0x00000000 */
/* #define _I2C1STAT_TBF_MASK                       0x00000001 */
/* #define _I2C1STAT_TBF_LENGTH                     0x00000001 */

/* #define _I2C1STAT_RBF_POSITION                   0x00000001 */
/* #define _I2C1STAT_RBF_MASK                       0x00000002 */
/* #define _I2C1STAT_RBF_LENGTH                     0x00000001 */

/* #define _I2C1STAT_R_W_POSITION                   0x00000002 */
/* #define _I2C1STAT_R_W_MASK                       0x00000004 */
/* #define _I2C1STAT_R_W_LENGTH                     0x00000001 */

/* #define _I2C1STAT_S_POSITION                     0x00000003 */
/* #define _I2C1STAT_S_MASK                         0x00000008 */
/* #define _I2C1STAT_S_LENGTH                       0x00000001 */

/* #define _I2C1STAT_P_POSITION                     0x00000004 */
/* #define _I2C1STAT_P_MASK                         0x00000010 */
/* #define _I2C1STAT_P_LENGTH                       0x00000001 */

/* #define _I2C1STAT_D_A_POSITION                   0x00000005 */
/* #define _I2C1STAT_D_A_MASK                       0x00000020 */
/* #define _I2C1STAT_D_A_LENGTH                     0x00000001 */

/* #define _I2C1STAT_I2COV_POSITION                 0x00000006 */
/* #define _I2C1STAT_I2COV_MASK                     0x00000040 */
/* #define _I2C1STAT_I2COV_LENGTH                   0x00000001 */

/* #define _I2C1STAT_IWCOL_POSITION                 0x00000007 */
/* #define _I2C1STAT_IWCOL_MASK                     0x00000080 */
/* #define _I2C1STAT_IWCOL_LENGTH                   0x00000001 */

/* #define _I2C1STAT_ADD10_POSITION                 0x00000008 */
/* #define _I2C1STAT_ADD10_MASK                     0x00000100 */
/* #define _I2C1STAT_ADD10_LENGTH                   0x00000001 */

/* #define _I2C1STAT_GCSTAT_POSITION                0x00000009 */
/* #define _I2C1STAT_GCSTAT_MASK                    0x00000200 */
/* #define _I2C1STAT_GCSTAT_LENGTH                  0x00000001 */

/* #define _I2C1STAT_BCL_POSITION                   0x0000000A */
/* #define _I2C1STAT_BCL_MASK                       0x00000400 */
/* #define _I2C1STAT_BCL_LENGTH                     0x00000001 */

/* #define _I2C1STAT_TRSTAT_POSITION                0x0000000E */
/* #define _I2C1STAT_TRSTAT_MASK                    0x00004000 */
/* #define _I2C1STAT_TRSTAT_LENGTH                  0x00000001 */

/* #define _I2C1STAT_ACKSTAT_POSITION               0x0000000F */
/* #define _I2C1STAT_ACKSTAT_MASK                   0x00008000 */
/* #define _I2C1STAT_ACKSTAT_LENGTH                 0x00000001 */

/* #define _I2C1STAT_I2CPOV_POSITION                0x00000006 */
/* #define _I2C1STAT_I2CPOV_MASK                    0x00000040 */
/* #define _I2C1STAT_I2CPOV_LENGTH                  0x00000001 */

/* #define _I2C1STAT_w_POSITION                     0x00000000 */
/* #define _I2C1STAT_w_MASK                         0xFFFFFFFF */
/* #define _I2C1STAT_w_LENGTH                       0x00000020 */

/* #define _I2C2CON_SEN_POSITION                    0x00000000 */
/* #define _I2C2CON_SEN_MASK                        0x00000001 */
/* #define _I2C2CON_SEN_LENGTH                      0x00000001 */

/* #define _I2C2CON_RSEN_POSITION                   0x00000001 */
/* #define _I2C2CON_RSEN_MASK                       0x00000002 */
/* #define _I2C2CON_RSEN_LENGTH                     0x00000001 */

/* #define _I2C2CON_PEN_POSITION                    0x00000002 */
/* #define _I2C2CON_PEN_MASK                        0x00000004 */
/* #define _I2C2CON_PEN_LENGTH                      0x00000001 */

/* #define _I2C2CON_RCEN_POSITION                   0x00000003 */
/* #define _I2C2CON_RCEN_MASK                       0x00000008 */
/* #define _I2C2CON_RCEN_LENGTH                     0x00000001 */

/* #define _I2C2CON_ACKEN_POSITION                  0x00000004 */
/* #define _I2C2CON_ACKEN_MASK                      0x00000010 */
/* #define _I2C2CON_ACKEN_LENGTH                    0x00000001 */

/* #define _I2C2CON_ACKDT_POSITION                  0x00000005 */
/* #define _I2C2CON_ACKDT_MASK                      0x00000020 */
/* #define _I2C2CON_ACKDT_LENGTH                    0x00000001 */

/* #define _I2C2CON_STREN_POSITION                  0x00000006 */
/* #define _I2C2CON_STREN_MASK                      0x00000040 */
/* #define _I2C2CON_STREN_LENGTH                    0x00000001 */

/* #define _I2C2CON_GCEN_POSITION                   0x00000007 */
/* #define _I2C2CON_GCEN_MASK                       0x00000080 */
/* #define _I2C2CON_GCEN_LENGTH                     0x00000001 */

/* #define _I2C2CON_SMEN_POSITION                   0x00000008 */
/* #define _I2C2CON_SMEN_MASK                       0x00000100 */
/* #define _I2C2CON_SMEN_LENGTH                     0x00000001 */

/* #define _I2C2CON_DISSLW_POSITION                 0x00000009 */
/* #define _I2C2CON_DISSLW_MASK                     0x00000200 */
/* #define _I2C2CON_DISSLW_LENGTH                   0x00000001 */

/* #define _I2C2CON_A10M_POSITION                   0x0000000A */
/* #define _I2C2CON_A10M_MASK                       0x00000400 */
/* #define _I2C2CON_A10M_LENGTH                     0x00000001 */

/* #define _I2C2CON_STRICT_POSITION                 0x0000000B */
/* #define _I2C2CON_STRICT_MASK                     0x00000800 */
/* #define _I2C2CON_STRICT_LENGTH                   0x00000001 */

/* #define _I2C2CON_SCLREL_POSITION                 0x0000000C */
/* #define _I2C2CON_SCLREL_MASK                     0x00001000 */
/* #define _I2C2CON_SCLREL_LENGTH                   0x00000001 */

/* #define _I2C2CON_SIDL_POSITION                   0x0000000D */
/* #define _I2C2CON_SIDL_MASK                       0x00002000 */
/* #define _I2C2CON_SIDL_LENGTH                     0x00000001 */

/* #define _I2C2CON_ON_POSITION                     0x0000000F */
/* #define _I2C2CON_ON_MASK                         0x00008000 */
/* #define _I2C2CON_ON_LENGTH                       0x00000001 */

/* #define _I2C2CON_IPMIEN_POSITION                 0x0000000B */
/* #define _I2C2CON_IPMIEN_MASK                     0x00000800 */
/* #define _I2C2CON_IPMIEN_LENGTH                   0x00000001 */

/* #define _I2C2CON_I2CSIDL_POSITION                0x0000000D */
/* #define _I2C2CON_I2CSIDL_MASK                    0x00002000 */
/* #define _I2C2CON_I2CSIDL_LENGTH                  0x00000001 */

/* #define _I2C2CON_I2CEN_POSITION                  0x0000000F */
/* #define _I2C2CON_I2CEN_MASK                      0x00008000 */
/* #define _I2C2CON_I2CEN_LENGTH                    0x00000001 */

/* #define _I2C2CON_w_POSITION                      0x00000000 */
/* #define _I2C2CON_w_MASK                          0xFFFFFFFF */
/* #define _I2C2CON_w_LENGTH                        0x00000020 */

/* #define _I2CABCON_SEN_POSITION                   0x00000000 */
/* #define _I2CABCON_SEN_MASK                       0x00000001 */
/* #define _I2CABCON_SEN_LENGTH                     0x00000001 */

/* #define _I2CABCON_RSEN_POSITION                  0x00000001 */
/* #define _I2CABCON_RSEN_MASK                      0x00000002 */
/* #define _I2CABCON_RSEN_LENGTH                    0x00000001 */

/* #define _I2CABCON_PEN_POSITION                   0x00000002 */
/* #define _I2CABCON_PEN_MASK                       0x00000004 */
/* #define _I2CABCON_PEN_LENGTH                     0x00000001 */

/* #define _I2CABCON_RCEN_POSITION                  0x00000003 */
/* #define _I2CABCON_RCEN_MASK                      0x00000008 */
/* #define _I2CABCON_RCEN_LENGTH                    0x00000001 */

/* #define _I2CABCON_ACKEN_POSITION                 0x00000004 */
/* #define _I2CABCON_ACKEN_MASK                     0x00000010 */
/* #define _I2CABCON_ACKEN_LENGTH                   0x00000001 */

/* #define _I2CABCON_ACKDT_POSITION                 0x00000005 */
/* #define _I2CABCON_ACKDT_MASK                     0x00000020 */
/* #define _I2CABCON_ACKDT_LENGTH                   0x00000001 */

/* #define _I2CABCON_STREN_POSITION                 0x00000006 */
/* #define _I2CABCON_STREN_MASK                     0x00000040 */
/* #define _I2CABCON_STREN_LENGTH                   0x00000001 */

/* #define _I2CABCON_GCEN_POSITION                  0x00000007 */
/* #define _I2CABCON_GCEN_MASK                      0x00000080 */
/* #define _I2CABCON_GCEN_LENGTH                    0x00000001 */

/* #define _I2CABCON_SMEN_POSITION                  0x00000008 */
/* #define _I2CABCON_SMEN_MASK                      0x00000100 */
/* #define _I2CABCON_SMEN_LENGTH                    0x00000001 */

/* #define _I2CABCON_DISSLW_POSITION                0x00000009 */
/* #define _I2CABCON_DISSLW_MASK                    0x00000200 */
/* #define _I2CABCON_DISSLW_LENGTH                  0x00000001 */

/* #define _I2CABCON_A10M_POSITION                  0x0000000A */
/* #define _I2CABCON_A10M_MASK                      0x00000400 */
/* #define _I2CABCON_A10M_LENGTH                    0x00000001 */

/* #define _I2CABCON_STRICT_POSITION                0x0000000B */
/* #define _I2CABCON_STRICT_MASK                    0x00000800 */
/* #define _I2CABCON_STRICT_LENGTH                  0x00000001 */

/* #define _I2CABCON_SCLREL_POSITION                0x0000000C */
/* #define _I2CABCON_SCLREL_MASK                    0x00001000 */
/* #define _I2CABCON_SCLREL_LENGTH                  0x00000001 */

/* #define _I2CABCON_SIDL_POSITION                  0x0000000D */
/* #define _I2CABCON_SIDL_MASK                      0x00002000 */
/* #define _I2CABCON_SIDL_LENGTH                    0x00000001 */

/* #define _I2CABCON_ON_POSITION                    0x0000000F */
/* #define _I2CABCON_ON_MASK                        0x00008000 */
/* #define _I2CABCON_ON_LENGTH                      0x00000001 */

/* #define _I2CABCON_IPMIEN_POSITION                0x0000000B */
/* #define _I2CABCON_IPMIEN_MASK                    0x00000800 */
/* #define _I2CABCON_IPMIEN_LENGTH                  0x00000001 */

/* #define _I2CABCON_I2CSIDL_POSITION               0x0000000D */
/* #define _I2CABCON_I2CSIDL_MASK                   0x00002000 */
/* #define _I2CABCON_I2CSIDL_LENGTH                 0x00000001 */

/* #define _I2CABCON_I2CEN_POSITION                 0x0000000F */
/* #define _I2CABCON_I2CEN_MASK                     0x00008000 */
/* #define _I2CABCON_I2CEN_LENGTH                   0x00000001 */

/* #define _I2CABCON_w_POSITION                     0x00000000 */
/* #define _I2CABCON_w_MASK                         0xFFFFFFFF */
/* #define _I2CABCON_w_LENGTH                       0x00000020 */

/* #define _I2C2STAT_TBF_POSITION                   0x00000000 */
/* #define _I2C2STAT_TBF_MASK                       0x00000001 */
/* #define _I2C2STAT_TBF_LENGTH                     0x00000001 */

/* #define _I2C2STAT_RBF_POSITION                   0x00000001 */
/* #define _I2C2STAT_RBF_MASK                       0x00000002 */
/* #define _I2C2STAT_RBF_LENGTH                     0x00000001 */

/* #define _I2C2STAT_R_W_POSITION                   0x00000002 */
/* #define _I2C2STAT_R_W_MASK                       0x00000004 */
/* #define _I2C2STAT_R_W_LENGTH                     0x00000001 */

/* #define _I2C2STAT_S_POSITION                     0x00000003 */
/* #define _I2C2STAT_S_MASK                         0x00000008 */
/* #define _I2C2STAT_S_LENGTH                       0x00000001 */

/* #define _I2C2STAT_P_POSITION                     0x00000004 */
/* #define _I2C2STAT_P_MASK                         0x00000010 */
/* #define _I2C2STAT_P_LENGTH                       0x00000001 */

/* #define _I2C2STAT_D_A_POSITION                   0x00000005 */
/* #define _I2C2STAT_D_A_MASK                       0x00000020 */
/* #define _I2C2STAT_D_A_LENGTH                     0x00000001 */

/* #define _I2C2STAT_I2COV_POSITION                 0x00000006 */
/* #define _I2C2STAT_I2COV_MASK                     0x00000040 */
/* #define _I2C2STAT_I2COV_LENGTH                   0x00000001 */

/* #define _I2C2STAT_IWCOL_POSITION                 0x00000007 */
/* #define _I2C2STAT_IWCOL_MASK                     0x00000080 */
/* #define _I2C2STAT_IWCOL_LENGTH                   0x00000001 */

/* #define _I2C2STAT_ADD10_POSITION                 0x00000008 */
/* #define _I2C2STAT_ADD10_MASK                     0x00000100 */
/* #define _I2C2STAT_ADD10_LENGTH                   0x00000001 */

/* #define _I2C2STAT_GCSTAT_POSITION                0x00000009 */
/* #define _I2C2STAT_GCSTAT_MASK                    0x00000200 */
/* #define _I2C2STAT_GCSTAT_LENGTH                  0x00000001 */

/* #define _I2C2STAT_BCL_POSITION                   0x0000000A */
/* #define _I2C2STAT_BCL_MASK                       0x00000400 */
/* #define _I2C2STAT_BCL_LENGTH                     0x00000001 */

/* #define _I2C2STAT_TRSTAT_POSITION                0x0000000E */
/* #define _I2C2STAT_TRSTAT_MASK                    0x00004000 */
/* #define _I2C2STAT_TRSTAT_LENGTH                  0x00000001 */

/* #define _I2C2STAT_ACKSTAT_POSITION               0x0000000F */
/* #define _I2C2STAT_ACKSTAT_MASK                   0x00008000 */
/* #define _I2C2STAT_ACKSTAT_LENGTH                 0x00000001 */

/* #define _I2C2STAT_I2CPOV_POSITION                0x00000006 */
/* #define _I2C2STAT_I2CPOV_MASK                    0x00000040 */
/* #define _I2C2STAT_I2CPOV_LENGTH                  0x00000001 */

/* #define _I2C2STAT_w_POSITION                     0x00000000 */
/* #define _I2C2STAT_w_MASK                         0xFFFFFFFF */
/* #define _I2C2STAT_w_LENGTH                       0x00000020 */

/* #define _I2CABSTAT_TBF_POSITION                  0x00000000 */
/* #define _I2CABSTAT_TBF_MASK                      0x00000001 */
/* #define _I2CABSTAT_TBF_LENGTH                    0x00000001 */

/* #define _I2CABSTAT_RBF_POSITION                  0x00000001 */
/* #define _I2CABSTAT_RBF_MASK                      0x00000002 */
/* #define _I2CABSTAT_RBF_LENGTH                    0x00000001 */

/* #define _I2CABSTAT_R_W_POSITION                  0x00000002 */
/* #define _I2CABSTAT_R_W_MASK                      0x00000004 */
/* #define _I2CABSTAT_R_W_LENGTH                    0x00000001 */

/* #define _I2CABSTAT_S_POSITION                    0x00000003 */
/* #define _I2CABSTAT_S_MASK                        0x00000008 */
/* #define _I2CABSTAT_S_LENGTH                      0x00000001 */

/* #define _I2CABSTAT_P_POSITION                    0x00000004 */
/* #define _I2CABSTAT_P_MASK                        0x00000010 */
/* #define _I2CABSTAT_P_LENGTH                      0x00000001 */

/* #define _I2CABSTAT_D_A_POSITION                  0x00000005 */
/* #define _I2CABSTAT_D_A_MASK                      0x00000020 */
/* #define _I2CABSTAT_D_A_LENGTH                    0x00000001 */

/* #define _I2CABSTAT_I2COV_POSITION                0x00000006 */
/* #define _I2CABSTAT_I2COV_MASK                    0x00000040 */
/* #define _I2CABSTAT_I2COV_LENGTH                  0x00000001 */

/* #define _I2CABSTAT_IWCOL_POSITION                0x00000007 */
/* #define _I2CABSTAT_IWCOL_MASK                    0x00000080 */
/* #define _I2CABSTAT_IWCOL_LENGTH                  0x00000001 */

/* #define _I2CABSTAT_ADD10_POSITION                0x00000008 */
/* #define _I2CABSTAT_ADD10_MASK                    0x00000100 */
/* #define _I2CABSTAT_ADD10_LENGTH                  0x00000001 */

/* #define _I2CABSTAT_GCSTAT_POSITION               0x00000009 */
/* #define _I2CABSTAT_GCSTAT_MASK                   0x00000200 */
/* #define _I2CABSTAT_GCSTAT_LENGTH                 0x00000001 */

/* #define _I2CABSTAT_BCL_POSITION                  0x0000000A */
/* #define _I2CABSTAT_BCL_MASK                      0x00000400 */
/* #define _I2CABSTAT_BCL_LENGTH                    0x00000001 */

/* #define _I2CABSTAT_TRSTAT_POSITION               0x0000000E */
/* #define _I2CABSTAT_TRSTAT_MASK                   0x00004000 */
/* #define _I2CABSTAT_TRSTAT_LENGTH                 0x00000001 */

/* #define _I2CABSTAT_ACKSTAT_POSITION              0x0000000F */
/* #define _I2CABSTAT_ACKSTAT_MASK                  0x00008000 */
/* #define _I2CABSTAT_ACKSTAT_LENGTH                0x00000001 */

/* #define _I2CABSTAT_I2CPOV_POSITION               0x00000006 */
/* #define _I2CABSTAT_I2CPOV_MASK                   0x00000040 */
/* #define _I2CABSTAT_I2CPOV_LENGTH                 0x00000001 */

/* #define _I2CABSTAT_w_POSITION                    0x00000000 */
/* #define _I2CABSTAT_w_MASK                        0xFFFFFFFF */
/* #define _I2CABSTAT_w_LENGTH                      0x00000020 */

/* #define _SPI1CON_SRXISEL_POSITION                0x00000000 */
/* #define _SPI1CON_SRXISEL_MASK                    0x00000003 */
/* #define _SPI1CON_SRXISEL_LENGTH                  0x00000002 */

/* #define _SPI1CON_STXISEL_POSITION                0x00000002 */
/* #define _SPI1CON_STXISEL_MASK                    0x0000000C */
/* #define _SPI1CON_STXISEL_LENGTH                  0x00000002 */

/* #define _SPI1CON_DISSDI_POSITION                 0x00000004 */
/* #define _SPI1CON_DISSDI_MASK                     0x00000010 */
/* #define _SPI1CON_DISSDI_LENGTH                   0x00000001 */

/* #define _SPI1CON_MSTEN_POSITION                  0x00000005 */
/* #define _SPI1CON_MSTEN_MASK                      0x00000020 */
/* #define _SPI1CON_MSTEN_LENGTH                    0x00000001 */

/* #define _SPI1CON_CKP_POSITION                    0x00000006 */
/* #define _SPI1CON_CKP_MASK                        0x00000040 */
/* #define _SPI1CON_CKP_LENGTH                      0x00000001 */

/* #define _SPI1CON_SSEN_POSITION                   0x00000007 */
/* #define _SPI1CON_SSEN_MASK                       0x00000080 */
/* #define _SPI1CON_SSEN_LENGTH                     0x00000001 */

/* #define _SPI1CON_CKE_POSITION                    0x00000008 */
/* #define _SPI1CON_CKE_MASK                        0x00000100 */
/* #define _SPI1CON_CKE_LENGTH                      0x00000001 */

/* #define _SPI1CON_SMP_POSITION                    0x00000009 */
/* #define _SPI1CON_SMP_MASK                        0x00000200 */
/* #define _SPI1CON_SMP_LENGTH                      0x00000001 */

/* #define _SPI1CON_MODE16_POSITION                 0x0000000A */
/* #define _SPI1CON_MODE16_MASK                     0x00000400 */
/* #define _SPI1CON_MODE16_LENGTH                   0x00000001 */

/* #define _SPI1CON_MODE32_POSITION                 0x0000000B */
/* #define _SPI1CON_MODE32_MASK                     0x00000800 */
/* #define _SPI1CON_MODE32_LENGTH                   0x00000001 */

/* #define _SPI1CON_DISSDO_POSITION                 0x0000000C */
/* #define _SPI1CON_DISSDO_MASK                     0x00001000 */
/* #define _SPI1CON_DISSDO_LENGTH                   0x00000001 */

/* #define _SPI1CON_SIDL_POSITION                   0x0000000D */
/* #define _SPI1CON_SIDL_MASK                       0x00002000 */
/* #define _SPI1CON_SIDL_LENGTH                     0x00000001 */

/* #define _SPI1CON_ON_POSITION                     0x0000000F */
/* #define _SPI1CON_ON_MASK                         0x00008000 */
/* #define _SPI1CON_ON_LENGTH                       0x00000001 */

/* #define _SPI1CON_ENHBUF_POSITION                 0x00000010 */
/* #define _SPI1CON_ENHBUF_MASK                     0x00010000 */
/* #define _SPI1CON_ENHBUF_LENGTH                   0x00000001 */

/* #define _SPI1CON_SPIFE_POSITION                  0x00000011 */
/* #define _SPI1CON_SPIFE_MASK                      0x00020000 */
/* #define _SPI1CON_SPIFE_LENGTH                    0x00000001 */

/* #define _SPI1CON_MCLKSEL_POSITION                0x00000017 */
/* #define _SPI1CON_MCLKSEL_MASK                    0x00800000 */
/* #define _SPI1CON_MCLKSEL_LENGTH                  0x00000001 */

/* #define _SPI1CON_FRMCNT_POSITION                 0x00000018 */
/* #define _SPI1CON_FRMCNT_MASK                     0x07000000 */
/* #define _SPI1CON_FRMCNT_LENGTH                   0x00000003 */

/* #define _SPI1CON_FRMSYPW_POSITION                0x0000001B */
/* #define _SPI1CON_FRMSYPW_MASK                    0x08000000 */
/* #define _SPI1CON_FRMSYPW_LENGTH                  0x00000001 */

/* #define _SPI1CON_MSSEN_POSITION                  0x0000001C */
/* #define _SPI1CON_MSSEN_MASK                      0x10000000 */
/* #define _SPI1CON_MSSEN_LENGTH                    0x00000001 */

/* #define _SPI1CON_FRMPOL_POSITION                 0x0000001D */
/* #define _SPI1CON_FRMPOL_MASK                     0x20000000 */
/* #define _SPI1CON_FRMPOL_LENGTH                   0x00000001 */

/* #define _SPI1CON_FRMSYNC_POSITION                0x0000001E */
/* #define _SPI1CON_FRMSYNC_MASK                    0x40000000 */
/* #define _SPI1CON_FRMSYNC_LENGTH                  0x00000001 */

/* #define _SPI1CON_FRMEN_POSITION                  0x0000001F */
/* #define _SPI1CON_FRMEN_MASK                      0x80000000 */
/* #define _SPI1CON_FRMEN_LENGTH                    0x00000001 */

/* #define _SPI1CON_w_POSITION                      0x00000000 */
/* #define _SPI1CON_w_MASK                          0xFFFFFFFF */
/* #define _SPI1CON_w_LENGTH                        0x00000020 */

/* #define _SPI1STAT_SPIRBF_POSITION                0x00000000 */
/* #define _SPI1STAT_SPIRBF_MASK                    0x00000001 */
/* #define _SPI1STAT_SPIRBF_LENGTH                  0x00000001 */

/* #define _SPI1STAT_SPITBF_POSITION                0x00000001 */
/* #define _SPI1STAT_SPITBF_MASK                    0x00000002 */
/* #define _SPI1STAT_SPITBF_LENGTH                  0x00000001 */

/* #define _SPI1STAT_SPITBE_POSITION                0x00000003 */
/* #define _SPI1STAT_SPITBE_MASK                    0x00000008 */
/* #define _SPI1STAT_SPITBE_LENGTH                  0x00000001 */

/* #define _SPI1STAT_SPIRBE_POSITION                0x00000005 */
/* #define _SPI1STAT_SPIRBE_MASK                    0x00000020 */
/* #define _SPI1STAT_SPIRBE_LENGTH                  0x00000001 */

/* #define _SPI1STAT_SPIROV_POSITION                0x00000006 */
/* #define _SPI1STAT_SPIROV_MASK                    0x00000040 */
/* #define _SPI1STAT_SPIROV_LENGTH                  0x00000001 */

/* #define _SPI1STAT_SRMT_POSITION                  0x00000007 */
/* #define _SPI1STAT_SRMT_MASK                      0x00000080 */
/* #define _SPI1STAT_SRMT_LENGTH                    0x00000001 */

/* #define _SPI1STAT_SPITUR_POSITION                0x00000008 */
/* #define _SPI1STAT_SPITUR_MASK                    0x00000100 */
/* #define _SPI1STAT_SPITUR_LENGTH                  0x00000001 */

/* #define _SPI1STAT_SPIBUSY_POSITION               0x0000000B */
/* #define _SPI1STAT_SPIBUSY_MASK                   0x00000800 */
/* #define _SPI1STAT_SPIBUSY_LENGTH                 0x00000001 */

/* #define _SPI1STAT_FRMERR_POSITION                0x0000000C */
/* #define _SPI1STAT_FRMERR_MASK                    0x00001000 */
/* #define _SPI1STAT_FRMERR_LENGTH                  0x00000001 */

/* #define _SPI1STAT_TXBUFELM_POSITION              0x00000010 */
/* #define _SPI1STAT_TXBUFELM_MASK                  0x001F0000 */
/* #define _SPI1STAT_TXBUFELM_LENGTH                0x00000005 */

/* #define _SPI1STAT_RXBUFELM_POSITION              0x00000018 */
/* #define _SPI1STAT_RXBUFELM_MASK                  0x1F000000 */
/* #define _SPI1STAT_RXBUFELM_LENGTH                0x00000005 */

/* #define _SPI1STAT_w_POSITION                     0x00000000 */
/* #define _SPI1STAT_w_MASK                         0xFFFFFFFF */
/* #define _SPI1STAT_w_LENGTH                       0x00000020 */

/* #define _SPI1CON2_AUDMOD_POSITION                0x00000000 */
/* #define _SPI1CON2_AUDMOD_MASK                    0x00000003 */
/* #define _SPI1CON2_AUDMOD_LENGTH                  0x00000002 */

/* #define _SPI1CON2_AUDMONO_POSITION               0x00000003 */
/* #define _SPI1CON2_AUDMONO_MASK                   0x00000008 */
/* #define _SPI1CON2_AUDMONO_LENGTH                 0x00000001 */

/* #define _SPI1CON2_AUDEN_POSITION                 0x00000007 */
/* #define _SPI1CON2_AUDEN_MASK                     0x00000080 */
/* #define _SPI1CON2_AUDEN_LENGTH                   0x00000001 */

/* #define _SPI1CON2_IGNTUR_POSITION                0x00000008 */
/* #define _SPI1CON2_IGNTUR_MASK                    0x00000100 */
/* #define _SPI1CON2_IGNTUR_LENGTH                  0x00000001 */

/* #define _SPI1CON2_IGNROV_POSITION                0x00000009 */
/* #define _SPI1CON2_IGNROV_MASK                    0x00000200 */
/* #define _SPI1CON2_IGNROV_LENGTH                  0x00000001 */

/* #define _SPI1CON2_SPITUREN_POSITION              0x0000000A */
/* #define _SPI1CON2_SPITUREN_MASK                  0x00000400 */
/* #define _SPI1CON2_SPITUREN_LENGTH                0x00000001 */

/* #define _SPI1CON2_SPIROVEN_POSITION              0x0000000B */
/* #define _SPI1CON2_SPIROVEN_MASK                  0x00000800 */
/* #define _SPI1CON2_SPIROVEN_LENGTH                0x00000001 */

/* #define _SPI1CON2_FRMERREN_POSITION              0x0000000C */
/* #define _SPI1CON2_FRMERREN_MASK                  0x00001000 */
/* #define _SPI1CON2_FRMERREN_LENGTH                0x00000001 */

/* #define _SPI1CON2_SPISGNEXT_POSITION             0x0000000F */
/* #define _SPI1CON2_SPISGNEXT_MASK                 0x00008000 */
/* #define _SPI1CON2_SPISGNEXT_LENGTH               0x00000001 */

/* #define _SPI1CON2_AUDMOD0_POSITION               0x00000000 */
/* #define _SPI1CON2_AUDMOD0_MASK                   0x00000001 */
/* #define _SPI1CON2_AUDMOD0_LENGTH                 0x00000001 */

/* #define _SPI1CON2_AUDMOD1_POSITION               0x00000001 */
/* #define _SPI1CON2_AUDMOD1_MASK                   0x00000002 */
/* #define _SPI1CON2_AUDMOD1_LENGTH                 0x00000001 */

/* #define _SPI1CON2_w_POSITION                     0x00000000 */
/* #define _SPI1CON2_w_MASK                         0xFFFFFFFF */
/* #define _SPI1CON2_w_LENGTH                       0x00000020 */

/* #define _SPI2CON_SRXISEL_POSITION                0x00000000 */
/* #define _SPI2CON_SRXISEL_MASK                    0x00000003 */
/* #define _SPI2CON_SRXISEL_LENGTH                  0x00000002 */

/* #define _SPI2CON_STXISEL_POSITION                0x00000002 */
/* #define _SPI2CON_STXISEL_MASK                    0x0000000C */
/* #define _SPI2CON_STXISEL_LENGTH                  0x00000002 */

/* #define _SPI2CON_DISSDI_POSITION                 0x00000004 */
/* #define _SPI2CON_DISSDI_MASK                     0x00000010 */
/* #define _SPI2CON_DISSDI_LENGTH                   0x00000001 */

/* #define _SPI2CON_MSTEN_POSITION                  0x00000005 */
/* #define _SPI2CON_MSTEN_MASK                      0x00000020 */
/* #define _SPI2CON_MSTEN_LENGTH                    0x00000001 */

/* #define _SPI2CON_CKP_POSITION                    0x00000006 */
/* #define _SPI2CON_CKP_MASK                        0x00000040 */
/* #define _SPI2CON_CKP_LENGTH                      0x00000001 */

/* #define _SPI2CON_SSEN_POSITION                   0x00000007 */
/* #define _SPI2CON_SSEN_MASK                       0x00000080 */
/* #define _SPI2CON_SSEN_LENGTH                     0x00000001 */

/* #define _SPI2CON_CKE_POSITION                    0x00000008 */
/* #define _SPI2CON_CKE_MASK                        0x00000100 */
/* #define _SPI2CON_CKE_LENGTH                      0x00000001 */

/* #define _SPI2CON_SMP_POSITION                    0x00000009 */
/* #define _SPI2CON_SMP_MASK                        0x00000200 */
/* #define _SPI2CON_SMP_LENGTH                      0x00000001 */

/* #define _SPI2CON_MODE16_POSITION                 0x0000000A */
/* #define _SPI2CON_MODE16_MASK                     0x00000400 */
/* #define _SPI2CON_MODE16_LENGTH                   0x00000001 */

/* #define _SPI2CON_MODE32_POSITION                 0x0000000B */
/* #define _SPI2CON_MODE32_MASK                     0x00000800 */
/* #define _SPI2CON_MODE32_LENGTH                   0x00000001 */

/* #define _SPI2CON_DISSDO_POSITION                 0x0000000C */
/* #define _SPI2CON_DISSDO_MASK                     0x00001000 */
/* #define _SPI2CON_DISSDO_LENGTH                   0x00000001 */

/* #define _SPI2CON_SIDL_POSITION                   0x0000000D */
/* #define _SPI2CON_SIDL_MASK                       0x00002000 */
/* #define _SPI2CON_SIDL_LENGTH                     0x00000001 */

/* #define _SPI2CON_ON_POSITION                     0x0000000F */
/* #define _SPI2CON_ON_MASK                         0x00008000 */
/* #define _SPI2CON_ON_LENGTH                       0x00000001 */

/* #define _SPI2CON_ENHBUF_POSITION                 0x00000010 */
/* #define _SPI2CON_ENHBUF_MASK                     0x00010000 */
/* #define _SPI2CON_ENHBUF_LENGTH                   0x00000001 */

/* #define _SPI2CON_SPIFE_POSITION                  0x00000011 */
/* #define _SPI2CON_SPIFE_MASK                      0x00020000 */
/* #define _SPI2CON_SPIFE_LENGTH                    0x00000001 */

/* #define _SPI2CON_MCLKSEL_POSITION                0x00000017 */
/* #define _SPI2CON_MCLKSEL_MASK                    0x00800000 */
/* #define _SPI2CON_MCLKSEL_LENGTH                  0x00000001 */

/* #define _SPI2CON_FRMCNT_POSITION                 0x00000018 */
/* #define _SPI2CON_FRMCNT_MASK                     0x07000000 */
/* #define _SPI2CON_FRMCNT_LENGTH                   0x00000003 */

/* #define _SPI2CON_FRMSYPW_POSITION                0x0000001B */
/* #define _SPI2CON_FRMSYPW_MASK                    0x08000000 */
/* #define _SPI2CON_FRMSYPW_LENGTH                  0x00000001 */

/* #define _SPI2CON_MSSEN_POSITION                  0x0000001C */
/* #define _SPI2CON_MSSEN_MASK                      0x10000000 */
/* #define _SPI2CON_MSSEN_LENGTH                    0x00000001 */

/* #define _SPI2CON_FRMPOL_POSITION                 0x0000001D */
/* #define _SPI2CON_FRMPOL_MASK                     0x20000000 */
/* #define _SPI2CON_FRMPOL_LENGTH                   0x00000001 */

/* #define _SPI2CON_FRMSYNC_POSITION                0x0000001E */
/* #define _SPI2CON_FRMSYNC_MASK                    0x40000000 */
/* #define _SPI2CON_FRMSYNC_LENGTH                  0x00000001 */

/* #define _SPI2CON_FRMEN_POSITION                  0x0000001F */
/* #define _SPI2CON_FRMEN_MASK                      0x80000000 */
/* #define _SPI2CON_FRMEN_LENGTH                    0x00000001 */

/* #define _SPI2CON_w_POSITION                      0x00000000 */
/* #define _SPI2CON_w_MASK                          0xFFFFFFFF */
/* #define _SPI2CON_w_LENGTH                        0x00000020 */

/* #define _SPI2STAT_SPIRBF_POSITION                0x00000000 */
/* #define _SPI2STAT_SPIRBF_MASK                    0x00000001 */
/* #define _SPI2STAT_SPIRBF_LENGTH                  0x00000001 */

/* #define _SPI2STAT_SPITBF_POSITION                0x00000001 */
/* #define _SPI2STAT_SPITBF_MASK                    0x00000002 */
/* #define _SPI2STAT_SPITBF_LENGTH                  0x00000001 */

/* #define _SPI2STAT_SPITBE_POSITION                0x00000003 */
/* #define _SPI2STAT_SPITBE_MASK                    0x00000008 */
/* #define _SPI2STAT_SPITBE_LENGTH                  0x00000001 */

/* #define _SPI2STAT_SPIRBE_POSITION                0x00000005 */
/* #define _SPI2STAT_SPIRBE_MASK                    0x00000020 */
/* #define _SPI2STAT_SPIRBE_LENGTH                  0x00000001 */

/* #define _SPI2STAT_SPIROV_POSITION                0x00000006 */
/* #define _SPI2STAT_SPIROV_MASK                    0x00000040 */
/* #define _SPI2STAT_SPIROV_LENGTH                  0x00000001 */

/* #define _SPI2STAT_SRMT_POSITION                  0x00000007 */
/* #define _SPI2STAT_SRMT_MASK                      0x00000080 */
/* #define _SPI2STAT_SRMT_LENGTH                    0x00000001 */

/* #define _SPI2STAT_SPITUR_POSITION                0x00000008 */
/* #define _SPI2STAT_SPITUR_MASK                    0x00000100 */
/* #define _SPI2STAT_SPITUR_LENGTH                  0x00000001 */

/* #define _SPI2STAT_SPIBUSY_POSITION               0x0000000B */
/* #define _SPI2STAT_SPIBUSY_MASK                   0x00000800 */
/* #define _SPI2STAT_SPIBUSY_LENGTH                 0x00000001 */

/* #define _SPI2STAT_FRMERR_POSITION                0x0000000C */
/* #define _SPI2STAT_FRMERR_MASK                    0x00001000 */
/* #define _SPI2STAT_FRMERR_LENGTH                  0x00000001 */

/* #define _SPI2STAT_TXBUFELM_POSITION              0x00000010 */
/* #define _SPI2STAT_TXBUFELM_MASK                  0x001F0000 */
/* #define _SPI2STAT_TXBUFELM_LENGTH                0x00000005 */

/* #define _SPI2STAT_RXBUFELM_POSITION              0x00000018 */
/* #define _SPI2STAT_RXBUFELM_MASK                  0x1F000000 */
/* #define _SPI2STAT_RXBUFELM_LENGTH                0x00000005 */

/* #define _SPI2STAT_w_POSITION                     0x00000000 */
/* #define _SPI2STAT_w_MASK                         0xFFFFFFFF */
/* #define _SPI2STAT_w_LENGTH                       0x00000020 */

/* #define _SPI2CON2_AUDMOD_POSITION                0x00000000 */
/* #define _SPI2CON2_AUDMOD_MASK                    0x00000003 */
/* #define _SPI2CON2_AUDMOD_LENGTH                  0x00000002 */

/* #define _SPI2CON2_AUDMONO_POSITION               0x00000003 */
/* #define _SPI2CON2_AUDMONO_MASK                   0x00000008 */
/* #define _SPI2CON2_AUDMONO_LENGTH                 0x00000001 */

/* #define _SPI2CON2_AUDEN_POSITION                 0x00000007 */
/* #define _SPI2CON2_AUDEN_MASK                     0x00000080 */
/* #define _SPI2CON2_AUDEN_LENGTH                   0x00000001 */

/* #define _SPI2CON2_IGNTUR_POSITION                0x00000008 */
/* #define _SPI2CON2_IGNTUR_MASK                    0x00000100 */
/* #define _SPI2CON2_IGNTUR_LENGTH                  0x00000001 */

/* #define _SPI2CON2_IGNROV_POSITION                0x00000009 */
/* #define _SPI2CON2_IGNROV_MASK                    0x00000200 */
/* #define _SPI2CON2_IGNROV_LENGTH                  0x00000001 */

/* #define _SPI2CON2_SPITUREN_POSITION              0x0000000A */
/* #define _SPI2CON2_SPITUREN_MASK                  0x00000400 */
/* #define _SPI2CON2_SPITUREN_LENGTH                0x00000001 */

/* #define _SPI2CON2_SPIROVEN_POSITION              0x0000000B */
/* #define _SPI2CON2_SPIROVEN_MASK                  0x00000800 */
/* #define _SPI2CON2_SPIROVEN_LENGTH                0x00000001 */

/* #define _SPI2CON2_FRMERREN_POSITION              0x0000000C */
/* #define _SPI2CON2_FRMERREN_MASK                  0x00001000 */
/* #define _SPI2CON2_FRMERREN_LENGTH                0x00000001 */

/* #define _SPI2CON2_SPISGNEXT_POSITION             0x0000000F */
/* #define _SPI2CON2_SPISGNEXT_MASK                 0x00008000 */
/* #define _SPI2CON2_SPISGNEXT_LENGTH               0x00000001 */

/* #define _SPI2CON2_AUDMOD0_POSITION               0x00000000 */
/* #define _SPI2CON2_AUDMOD0_MASK                   0x00000001 */
/* #define _SPI2CON2_AUDMOD0_LENGTH                 0x00000001 */

/* #define _SPI2CON2_AUDMOD1_POSITION               0x00000001 */
/* #define _SPI2CON2_AUDMOD1_MASK                   0x00000002 */
/* #define _SPI2CON2_AUDMOD1_LENGTH                 0x00000001 */

/* #define _SPI2CON2_w_POSITION                     0x00000000 */
/* #define _SPI2CON2_w_MASK                         0xFFFFFFFF */
/* #define _SPI2CON2_w_LENGTH                       0x00000020 */

/* #define _U1MODE_STSEL_POSITION                   0x00000000 */
/* #define _U1MODE_STSEL_MASK                       0x00000001 */
/* #define _U1MODE_STSEL_LENGTH                     0x00000001 */

/* #define _U1MODE_PDSEL_POSITION                   0x00000001 */
/* #define _U1MODE_PDSEL_MASK                       0x00000006 */
/* #define _U1MODE_PDSEL_LENGTH                     0x00000002 */

/* #define _U1MODE_BRGH_POSITION                    0x00000003 */
/* #define _U1MODE_BRGH_MASK                        0x00000008 */
/* #define _U1MODE_BRGH_LENGTH                      0x00000001 */

/* #define _U1MODE_RXINV_POSITION                   0x00000004 */
/* #define _U1MODE_RXINV_MASK                       0x00000010 */
/* #define _U1MODE_RXINV_LENGTH                     0x00000001 */

/* #define _U1MODE_ABAUD_POSITION                   0x00000005 */
/* #define _U1MODE_ABAUD_MASK                       0x00000020 */
/* #define _U1MODE_ABAUD_LENGTH                     0x00000001 */

/* #define _U1MODE_LPBACK_POSITION                  0x00000006 */
/* #define _U1MODE_LPBACK_MASK                      0x00000040 */
/* #define _U1MODE_LPBACK_LENGTH                    0x00000001 */

/* #define _U1MODE_WAKE_POSITION                    0x00000007 */
/* #define _U1MODE_WAKE_MASK                        0x00000080 */
/* #define _U1MODE_WAKE_LENGTH                      0x00000001 */

/* #define _U1MODE_UEN_POSITION                     0x00000008 */
/* #define _U1MODE_UEN_MASK                         0x00000300 */
/* #define _U1MODE_UEN_LENGTH                       0x00000002 */

/* #define _U1MODE_RTSMD_POSITION                   0x0000000B */
/* #define _U1MODE_RTSMD_MASK                       0x00000800 */
/* #define _U1MODE_RTSMD_LENGTH                     0x00000001 */

/* #define _U1MODE_IREN_POSITION                    0x0000000C */
/* #define _U1MODE_IREN_MASK                        0x00001000 */
/* #define _U1MODE_IREN_LENGTH                      0x00000001 */

/* #define _U1MODE_SIDL_POSITION                    0x0000000D */
/* #define _U1MODE_SIDL_MASK                        0x00002000 */
/* #define _U1MODE_SIDL_LENGTH                      0x00000001 */

/* #define _U1MODE_ON_POSITION                      0x0000000F */
/* #define _U1MODE_ON_MASK                          0x00008000 */
/* #define _U1MODE_ON_LENGTH                        0x00000001 */

/* #define _U1MODE_PDSEL0_POSITION                  0x00000001 */
/* #define _U1MODE_PDSEL0_MASK                      0x00000002 */
/* #define _U1MODE_PDSEL0_LENGTH                    0x00000001 */

/* #define _U1MODE_PDSEL1_POSITION                  0x00000002 */
/* #define _U1MODE_PDSEL1_MASK                      0x00000004 */
/* #define _U1MODE_PDSEL1_LENGTH                    0x00000001 */

/* #define _U1MODE_UEN0_POSITION                    0x00000008 */
/* #define _U1MODE_UEN0_MASK                        0x00000100 */
/* #define _U1MODE_UEN0_LENGTH                      0x00000001 */

/* #define _U1MODE_UEN1_POSITION                    0x00000009 */
/* #define _U1MODE_UEN1_MASK                        0x00000200 */
/* #define _U1MODE_UEN1_LENGTH                      0x00000001 */

/* #define _U1MODE_USIDL_POSITION                   0x0000000D */
/* #define _U1MODE_USIDL_MASK                       0x00002000 */
/* #define _U1MODE_USIDL_LENGTH                     0x00000001 */

/* #define _U1MODE_UARTEN_POSITION                  0x0000000F */
/* #define _U1MODE_UARTEN_MASK                      0x00008000 */
/* #define _U1MODE_UARTEN_LENGTH                    0x00000001 */

/* #define _U1MODE_w_POSITION                       0x00000000 */
/* #define _U1MODE_w_MASK                           0xFFFFFFFF */
/* #define _U1MODE_w_LENGTH                         0x00000020 */

/* #define _UDCMODE_STSEL_POSITION                  0x00000000 */
/* #define _UDCMODE_STSEL_MASK                      0x00000001 */
/* #define _UDCMODE_STSEL_LENGTH                    0x00000001 */

/* #define _UDCMODE_PDSEL_POSITION                  0x00000001 */
/* #define _UDCMODE_PDSEL_MASK                      0x00000006 */
/* #define _UDCMODE_PDSEL_LENGTH                    0x00000002 */

/* #define _UDCMODE_BRGH_POSITION                   0x00000003 */
/* #define _UDCMODE_BRGH_MASK                       0x00000008 */
/* #define _UDCMODE_BRGH_LENGTH                     0x00000001 */

/* #define _UDCMODE_RXINV_POSITION                  0x00000004 */
/* #define _UDCMODE_RXINV_MASK                      0x00000010 */
/* #define _UDCMODE_RXINV_LENGTH                    0x00000001 */

/* #define _UDCMODE_ABAUD_POSITION                  0x00000005 */
/* #define _UDCMODE_ABAUD_MASK                      0x00000020 */
/* #define _UDCMODE_ABAUD_LENGTH                    0x00000001 */

/* #define _UDCMODE_LPBACK_POSITION                 0x00000006 */
/* #define _UDCMODE_LPBACK_MASK                     0x00000040 */
/* #define _UDCMODE_LPBACK_LENGTH                   0x00000001 */

/* #define _UDCMODE_WAKE_POSITION                   0x00000007 */
/* #define _UDCMODE_WAKE_MASK                       0x00000080 */
/* #define _UDCMODE_WAKE_LENGTH                     0x00000001 */

/* #define _UDCMODE_UEN_POSITION                    0x00000008 */
/* #define _UDCMODE_UEN_MASK                        0x00000300 */
/* #define _UDCMODE_UEN_LENGTH                      0x00000002 */

/* #define _UDCMODE_RTSMD_POSITION                  0x0000000B */
/* #define _UDCMODE_RTSMD_MASK                      0x00000800 */
/* #define _UDCMODE_RTSMD_LENGTH                    0x00000001 */

/* #define _UDCMODE_IREN_POSITION                   0x0000000C */
/* #define _UDCMODE_IREN_MASK                       0x00001000 */
/* #define _UDCMODE_IREN_LENGTH                     0x00000001 */

/* #define _UDCMODE_SIDL_POSITION                   0x0000000D */
/* #define _UDCMODE_SIDL_MASK                       0x00002000 */
/* #define _UDCMODE_SIDL_LENGTH                     0x00000001 */

/* #define _UDCMODE_ON_POSITION                     0x0000000F */
/* #define _UDCMODE_ON_MASK                         0x00008000 */
/* #define _UDCMODE_ON_LENGTH                       0x00000001 */

/* #define _UDCMODE_PDSEL0_POSITION                 0x00000001 */
/* #define _UDCMODE_PDSEL0_MASK                     0x00000002 */
/* #define _UDCMODE_PDSEL0_LENGTH                   0x00000001 */

/* #define _UDCMODE_PDSEL1_POSITION                 0x00000002 */
/* #define _UDCMODE_PDSEL1_MASK                     0x00000004 */
/* #define _UDCMODE_PDSEL1_LENGTH                   0x00000001 */

/* #define _UDCMODE_UEN0_POSITION                   0x00000008 */
/* #define _UDCMODE_UEN0_MASK                       0x00000100 */
/* #define _UDCMODE_UEN0_LENGTH                     0x00000001 */

/* #define _UDCMODE_UEN1_POSITION                   0x00000009 */
/* #define _UDCMODE_UEN1_MASK                       0x00000200 */
/* #define _UDCMODE_UEN1_LENGTH                     0x00000001 */

/* #define _UDCMODE_USIDL_POSITION                  0x0000000D */
/* #define _UDCMODE_USIDL_MASK                      0x00002000 */
/* #define _UDCMODE_USIDL_LENGTH                    0x00000001 */

/* #define _UDCMODE_UARTEN_POSITION                 0x0000000F */
/* #define _UDCMODE_UARTEN_MASK                     0x00008000 */
/* #define _UDCMODE_UARTEN_LENGTH                   0x00000001 */

/* #define _UDCMODE_w_POSITION                      0x00000000 */
/* #define _UDCMODE_w_MASK                          0xFFFFFFFF */
/* #define _UDCMODE_w_LENGTH                        0x00000020 */

/* #define _U1STA_URXDA_POSITION                    0x00000000 */
/* #define _U1STA_URXDA_MASK                        0x00000001 */
/* #define _U1STA_URXDA_LENGTH                      0x00000001 */

/* #define _U1STA_OERR_POSITION                     0x00000001 */
/* #define _U1STA_OERR_MASK                         0x00000002 */
/* #define _U1STA_OERR_LENGTH                       0x00000001 */

/* #define _U1STA_FERR_POSITION                     0x00000002 */
/* #define _U1STA_FERR_MASK                         0x00000004 */
/* #define _U1STA_FERR_LENGTH                       0x00000001 */

/* #define _U1STA_PERR_POSITION                     0x00000003 */
/* #define _U1STA_PERR_MASK                         0x00000008 */
/* #define _U1STA_PERR_LENGTH                       0x00000001 */

/* #define _U1STA_RIDLE_POSITION                    0x00000004 */
/* #define _U1STA_RIDLE_MASK                        0x00000010 */
/* #define _U1STA_RIDLE_LENGTH                      0x00000001 */

/* #define _U1STA_ADDEN_POSITION                    0x00000005 */
/* #define _U1STA_ADDEN_MASK                        0x00000020 */
/* #define _U1STA_ADDEN_LENGTH                      0x00000001 */

/* #define _U1STA_URXISEL_POSITION                  0x00000006 */
/* #define _U1STA_URXISEL_MASK                      0x000000C0 */
/* #define _U1STA_URXISEL_LENGTH                    0x00000002 */

/* #define _U1STA_TRMT_POSITION                     0x00000008 */
/* #define _U1STA_TRMT_MASK                         0x00000100 */
/* #define _U1STA_TRMT_LENGTH                       0x00000001 */

/* #define _U1STA_UTXBF_POSITION                    0x00000009 */
/* #define _U1STA_UTXBF_MASK                        0x00000200 */
/* #define _U1STA_UTXBF_LENGTH                      0x00000001 */

/* #define _U1STA_UTXEN_POSITION                    0x0000000A */
/* #define _U1STA_UTXEN_MASK                        0x00000400 */
/* #define _U1STA_UTXEN_LENGTH                      0x00000001 */

/* #define _U1STA_UTXBRK_POSITION                   0x0000000B */
/* #define _U1STA_UTXBRK_MASK                       0x00000800 */
/* #define _U1STA_UTXBRK_LENGTH                     0x00000001 */

/* #define _U1STA_URXEN_POSITION                    0x0000000C */
/* #define _U1STA_URXEN_MASK                        0x00001000 */
/* #define _U1STA_URXEN_LENGTH                      0x00000001 */

/* #define _U1STA_UTXINV_POSITION                   0x0000000D */
/* #define _U1STA_UTXINV_MASK                       0x00002000 */
/* #define _U1STA_UTXINV_LENGTH                     0x00000001 */

/* #define _U1STA_UTXISEL_POSITION                  0x0000000E */
/* #define _U1STA_UTXISEL_MASK                      0x0000C000 */
/* #define _U1STA_UTXISEL_LENGTH                    0x00000002 */

/* #define _U1STA_ADDR_POSITION                     0x00000010 */
/* #define _U1STA_ADDR_MASK                         0x00FF0000 */
/* #define _U1STA_ADDR_LENGTH                       0x00000008 */

/* #define _U1STA_ADM_EN_POSITION                   0x00000018 */
/* #define _U1STA_ADM_EN_MASK                       0x01000000 */
/* #define _U1STA_ADM_EN_LENGTH                     0x00000001 */

/* #define _U1STA_URXISEL0_POSITION                 0x00000006 */
/* #define _U1STA_URXISEL0_MASK                     0x00000040 */
/* #define _U1STA_URXISEL0_LENGTH                   0x00000001 */

/* #define _U1STA_URXISEL1_POSITION                 0x00000007 */
/* #define _U1STA_URXISEL1_MASK                     0x00000080 */
/* #define _U1STA_URXISEL1_LENGTH                   0x00000001 */

/* #define _U1STA_UTXISEL0_POSITION                 0x0000000E */
/* #define _U1STA_UTXISEL0_MASK                     0x00004000 */
/* #define _U1STA_UTXISEL0_LENGTH                   0x00000001 */

/* #define _U1STA_UTXISEL1_POSITION                 0x0000000F */
/* #define _U1STA_UTXISEL1_MASK                     0x00008000 */
/* #define _U1STA_UTXISEL1_LENGTH                   0x00000001 */

/* #define _U1STA_UTXSEL_POSITION                   0x0000000E */
/* #define _U1STA_UTXSEL_MASK                       0x0000C000 */
/* #define _U1STA_UTXSEL_LENGTH                     0x00000002 */

/* #define _U1STA_w_POSITION                        0x00000000 */
/* #define _U1STA_w_MASK                            0xFFFFFFFF */
/* #define _U1STA_w_LENGTH                          0x00000020 */

/* #define _UDCSTA_URXDA_POSITION                   0x00000000 */
/* #define _UDCSTA_URXDA_MASK                       0x00000001 */
/* #define _UDCSTA_URXDA_LENGTH                     0x00000001 */

/* #define _UDCSTA_OERR_POSITION                    0x00000001 */
/* #define _UDCSTA_OERR_MASK                        0x00000002 */
/* #define _UDCSTA_OERR_LENGTH                      0x00000001 */

/* #define _UDCSTA_FERR_POSITION                    0x00000002 */
/* #define _UDCSTA_FERR_MASK                        0x00000004 */
/* #define _UDCSTA_FERR_LENGTH                      0x00000001 */

/* #define _UDCSTA_PERR_POSITION                    0x00000003 */
/* #define _UDCSTA_PERR_MASK                        0x00000008 */
/* #define _UDCSTA_PERR_LENGTH                      0x00000001 */

/* #define _UDCSTA_RIDLE_POSITION                   0x00000004 */
/* #define _UDCSTA_RIDLE_MASK                       0x00000010 */
/* #define _UDCSTA_RIDLE_LENGTH                     0x00000001 */

/* #define _UDCSTA_ADDEN_POSITION                   0x00000005 */
/* #define _UDCSTA_ADDEN_MASK                       0x00000020 */
/* #define _UDCSTA_ADDEN_LENGTH                     0x00000001 */

/* #define _UDCSTA_URXISEL_POSITION                 0x00000006 */
/* #define _UDCSTA_URXISEL_MASK                     0x000000C0 */
/* #define _UDCSTA_URXISEL_LENGTH                   0x00000002 */

/* #define _UDCSTA_TRMT_POSITION                    0x00000008 */
/* #define _UDCSTA_TRMT_MASK                        0x00000100 */
/* #define _UDCSTA_TRMT_LENGTH                      0x00000001 */

/* #define _UDCSTA_UTXBF_POSITION                   0x00000009 */
/* #define _UDCSTA_UTXBF_MASK                       0x00000200 */
/* #define _UDCSTA_UTXBF_LENGTH                     0x00000001 */

/* #define _UDCSTA_UTXEN_POSITION                   0x0000000A */
/* #define _UDCSTA_UTXEN_MASK                       0x00000400 */
/* #define _UDCSTA_UTXEN_LENGTH                     0x00000001 */

/* #define _UDCSTA_UTXBRK_POSITION                  0x0000000B */
/* #define _UDCSTA_UTXBRK_MASK                      0x00000800 */
/* #define _UDCSTA_UTXBRK_LENGTH                    0x00000001 */

/* #define _UDCSTA_URXEN_POSITION                   0x0000000C */
/* #define _UDCSTA_URXEN_MASK                       0x00001000 */
/* #define _UDCSTA_URXEN_LENGTH                     0x00000001 */

/* #define _UDCSTA_UTXINV_POSITION                  0x0000000D */
/* #define _UDCSTA_UTXINV_MASK                      0x00002000 */
/* #define _UDCSTA_UTXINV_LENGTH                    0x00000001 */

/* #define _UDCSTA_UTXISEL_POSITION                 0x0000000E */
/* #define _UDCSTA_UTXISEL_MASK                     0x0000C000 */
/* #define _UDCSTA_UTXISEL_LENGTH                   0x00000002 */

/* #define _UDCSTA_ADDR_POSITION                    0x00000010 */
/* #define _UDCSTA_ADDR_MASK                        0x00FF0000 */
/* #define _UDCSTA_ADDR_LENGTH                      0x00000008 */

/* #define _UDCSTA_ADM_EN_POSITION                  0x00000018 */
/* #define _UDCSTA_ADM_EN_MASK                      0x01000000 */
/* #define _UDCSTA_ADM_EN_LENGTH                    0x00000001 */

/* #define _UDCSTA_URXISEL0_POSITION                0x00000006 */
/* #define _UDCSTA_URXISEL0_MASK                    0x00000040 */
/* #define _UDCSTA_URXISEL0_LENGTH                  0x00000001 */

/* #define _UDCSTA_URXISEL1_POSITION                0x00000007 */
/* #define _UDCSTA_URXISEL1_MASK                    0x00000080 */
/* #define _UDCSTA_URXISEL1_LENGTH                  0x00000001 */

/* #define _UDCSTA_UTXISEL0_POSITION                0x0000000E */
/* #define _UDCSTA_UTXISEL0_MASK                    0x00004000 */
/* #define _UDCSTA_UTXISEL0_LENGTH                  0x00000001 */

/* #define _UDCSTA_UTXISEL1_POSITION                0x0000000F */
/* #define _UDCSTA_UTXISEL1_MASK                    0x00008000 */
/* #define _UDCSTA_UTXISEL1_LENGTH                  0x00000001 */

/* #define _UDCSTA_UTXSEL_POSITION                  0x0000000E */
/* #define _UDCSTA_UTXSEL_MASK                      0x0000C000 */
/* #define _UDCSTA_UTXSEL_LENGTH                    0x00000002 */

/* #define _UDCSTA_w_POSITION                       0x00000000 */
/* #define _UDCSTA_w_MASK                           0xFFFFFFFF */
/* #define _UDCSTA_w_LENGTH                         0x00000020 */

/* #define _U2MODE_STSEL_POSITION                   0x00000000 */
/* #define _U2MODE_STSEL_MASK                       0x00000001 */
/* #define _U2MODE_STSEL_LENGTH                     0x00000001 */

/* #define _U2MODE_PDSEL_POSITION                   0x00000001 */
/* #define _U2MODE_PDSEL_MASK                       0x00000006 */
/* #define _U2MODE_PDSEL_LENGTH                     0x00000002 */

/* #define _U2MODE_BRGH_POSITION                    0x00000003 */
/* #define _U2MODE_BRGH_MASK                        0x00000008 */
/* #define _U2MODE_BRGH_LENGTH                      0x00000001 */

/* #define _U2MODE_RXINV_POSITION                   0x00000004 */
/* #define _U2MODE_RXINV_MASK                       0x00000010 */
/* #define _U2MODE_RXINV_LENGTH                     0x00000001 */

/* #define _U2MODE_ABAUD_POSITION                   0x00000005 */
/* #define _U2MODE_ABAUD_MASK                       0x00000020 */
/* #define _U2MODE_ABAUD_LENGTH                     0x00000001 */

/* #define _U2MODE_LPBACK_POSITION                  0x00000006 */
/* #define _U2MODE_LPBACK_MASK                      0x00000040 */
/* #define _U2MODE_LPBACK_LENGTH                    0x00000001 */

/* #define _U2MODE_WAKE_POSITION                    0x00000007 */
/* #define _U2MODE_WAKE_MASK                        0x00000080 */
/* #define _U2MODE_WAKE_LENGTH                      0x00000001 */

/* #define _U2MODE_UEN_POSITION                     0x00000008 */
/* #define _U2MODE_UEN_MASK                         0x00000300 */
/* #define _U2MODE_UEN_LENGTH                       0x00000002 */

/* #define _U2MODE_RTSMD_POSITION                   0x0000000B */
/* #define _U2MODE_RTSMD_MASK                       0x00000800 */
/* #define _U2MODE_RTSMD_LENGTH                     0x00000001 */

/* #define _U2MODE_IREN_POSITION                    0x0000000C */
/* #define _U2MODE_IREN_MASK                        0x00001000 */
/* #define _U2MODE_IREN_LENGTH                      0x00000001 */

/* #define _U2MODE_SIDL_POSITION                    0x0000000D */
/* #define _U2MODE_SIDL_MASK                        0x00002000 */
/* #define _U2MODE_SIDL_LENGTH                      0x00000001 */

/* #define _U2MODE_ON_POSITION                      0x0000000F */
/* #define _U2MODE_ON_MASK                          0x00008000 */
/* #define _U2MODE_ON_LENGTH                        0x00000001 */

/* #define _U2MODE_PDSEL0_POSITION                  0x00000001 */
/* #define _U2MODE_PDSEL0_MASK                      0x00000002 */
/* #define _U2MODE_PDSEL0_LENGTH                    0x00000001 */

/* #define _U2MODE_PDSEL1_POSITION                  0x00000002 */
/* #define _U2MODE_PDSEL1_MASK                      0x00000004 */
/* #define _U2MODE_PDSEL1_LENGTH                    0x00000001 */

/* #define _U2MODE_UEN0_POSITION                    0x00000008 */
/* #define _U2MODE_UEN0_MASK                        0x00000100 */
/* #define _U2MODE_UEN0_LENGTH                      0x00000001 */

/* #define _U2MODE_UEN1_POSITION                    0x00000009 */
/* #define _U2MODE_UEN1_MASK                        0x00000200 */
/* #define _U2MODE_UEN1_LENGTH                      0x00000001 */

/* #define _U2MODE_USIDL_POSITION                   0x0000000D */
/* #define _U2MODE_USIDL_MASK                       0x00002000 */
/* #define _U2MODE_USIDL_LENGTH                     0x00000001 */

/* #define _U2MODE_UARTEN_POSITION                  0x0000000F */
/* #define _U2MODE_UARTEN_MASK                      0x00008000 */
/* #define _U2MODE_UARTEN_LENGTH                    0x00000001 */

/* #define _U2MODE_w_POSITION                       0x00000000 */
/* #define _U2MODE_w_MASK                           0xFFFFFFFF */
/* #define _U2MODE_w_LENGTH                         0x00000020 */

/* #define _U8932MODE_STSEL_POSITION                0x00000000 */
/* #define _U8932MODE_STSEL_MASK                    0x00000001 */
/* #define _U8932MODE_STSEL_LENGTH                  0x00000001 */

/* #define _U8932MODE_PDSEL_POSITION                0x00000001 */
/* #define _U8932MODE_PDSEL_MASK                    0x00000006 */
/* #define _U8932MODE_PDSEL_LENGTH                  0x00000002 */

/* #define _U8932MODE_BRGH_POSITION                 0x00000003 */
/* #define _U8932MODE_BRGH_MASK                     0x00000008 */
/* #define _U8932MODE_BRGH_LENGTH                   0x00000001 */

/* #define _U8932MODE_RXINV_POSITION                0x00000004 */
/* #define _U8932MODE_RXINV_MASK                    0x00000010 */
/* #define _U8932MODE_RXINV_LENGTH                  0x00000001 */

/* #define _U8932MODE_ABAUD_POSITION                0x00000005 */
/* #define _U8932MODE_ABAUD_MASK                    0x00000020 */
/* #define _U8932MODE_ABAUD_LENGTH                  0x00000001 */

/* #define _U8932MODE_LPBACK_POSITION               0x00000006 */
/* #define _U8932MODE_LPBACK_MASK                   0x00000040 */
/* #define _U8932MODE_LPBACK_LENGTH                 0x00000001 */

/* #define _U8932MODE_WAKE_POSITION                 0x00000007 */
/* #define _U8932MODE_WAKE_MASK                     0x00000080 */
/* #define _U8932MODE_WAKE_LENGTH                   0x00000001 */

/* #define _U8932MODE_UEN_POSITION                  0x00000008 */
/* #define _U8932MODE_UEN_MASK                      0x00000300 */
/* #define _U8932MODE_UEN_LENGTH                    0x00000002 */

/* #define _U8932MODE_RTSMD_POSITION                0x0000000B */
/* #define _U8932MODE_RTSMD_MASK                    0x00000800 */
/* #define _U8932MODE_RTSMD_LENGTH                  0x00000001 */

/* #define _U8932MODE_IREN_POSITION                 0x0000000C */
/* #define _U8932MODE_IREN_MASK                     0x00001000 */
/* #define _U8932MODE_IREN_LENGTH                   0x00000001 */

/* #define _U8932MODE_SIDL_POSITION                 0x0000000D */
/* #define _U8932MODE_SIDL_MASK                     0x00002000 */
/* #define _U8932MODE_SIDL_LENGTH                   0x00000001 */

/* #define _U8932MODE_ON_POSITION                   0x0000000F */
/* #define _U8932MODE_ON_MASK                       0x00008000 */
/* #define _U8932MODE_ON_LENGTH                     0x00000001 */

/* #define _U8932MODE_PDSEL0_POSITION               0x00000001 */
/* #define _U8932MODE_PDSEL0_MASK                   0x00000002 */
/* #define _U8932MODE_PDSEL0_LENGTH                 0x00000001 */

/* #define _U8932MODE_PDSEL1_POSITION               0x00000002 */
/* #define _U8932MODE_PDSEL1_MASK                   0x00000004 */
/* #define _U8932MODE_PDSEL1_LENGTH                 0x00000001 */

/* #define _U8932MODE_UEN0_POSITION                 0x00000008 */
/* #define _U8932MODE_UEN0_MASK                     0x00000100 */
/* #define _U8932MODE_UEN0_LENGTH                   0x00000001 */

/* #define _U8932MODE_UEN1_POSITION                 0x00000009 */
/* #define _U8932MODE_UEN1_MASK                     0x00000200 */
/* #define _U8932MODE_UEN1_LENGTH                   0x00000001 */

/* #define _U8932MODE_USIDL_POSITION                0x0000000D */
/* #define _U8932MODE_USIDL_MASK                    0x00002000 */
/* #define _U8932MODE_USIDL_LENGTH                  0x00000001 */

/* #define _U8932MODE_UARTEN_POSITION               0x0000000F */
/* #define _U8932MODE_UARTEN_MASK                   0x00008000 */
/* #define _U8932MODE_UARTEN_LENGTH                 0x00000001 */

/* #define _U8932MODE_w_POSITION                    0x00000000 */
/* #define _U8932MODE_w_MASK                        0xFFFFFFFF */
/* #define _U8932MODE_w_LENGTH                      0x00000020 */

/* #define _U2STA_URXDA_POSITION                    0x00000000 */
/* #define _U2STA_URXDA_MASK                        0x00000001 */
/* #define _U2STA_URXDA_LENGTH                      0x00000001 */

/* #define _U2STA_OERR_POSITION                     0x00000001 */
/* #define _U2STA_OERR_MASK                         0x00000002 */
/* #define _U2STA_OERR_LENGTH                       0x00000001 */

/* #define _U2STA_FERR_POSITION                     0x00000002 */
/* #define _U2STA_FERR_MASK                         0x00000004 */
/* #define _U2STA_FERR_LENGTH                       0x00000001 */

/* #define _U2STA_PERR_POSITION                     0x00000003 */
/* #define _U2STA_PERR_MASK                         0x00000008 */
/* #define _U2STA_PERR_LENGTH                       0x00000001 */

/* #define _U2STA_RIDLE_POSITION                    0x00000004 */
/* #define _U2STA_RIDLE_MASK                        0x00000010 */
/* #define _U2STA_RIDLE_LENGTH                      0x00000001 */

/* #define _U2STA_ADDEN_POSITION                    0x00000005 */
/* #define _U2STA_ADDEN_MASK                        0x00000020 */
/* #define _U2STA_ADDEN_LENGTH                      0x00000001 */

/* #define _U2STA_URXISEL_POSITION                  0x00000006 */
/* #define _U2STA_URXISEL_MASK                      0x000000C0 */
/* #define _U2STA_URXISEL_LENGTH                    0x00000002 */

/* #define _U2STA_TRMT_POSITION                     0x00000008 */
/* #define _U2STA_TRMT_MASK                         0x00000100 */
/* #define _U2STA_TRMT_LENGTH                       0x00000001 */

/* #define _U2STA_UTXBF_POSITION                    0x00000009 */
/* #define _U2STA_UTXBF_MASK                        0x00000200 */
/* #define _U2STA_UTXBF_LENGTH                      0x00000001 */

/* #define _U2STA_UTXEN_POSITION                    0x0000000A */
/* #define _U2STA_UTXEN_MASK                        0x00000400 */
/* #define _U2STA_UTXEN_LENGTH                      0x00000001 */

/* #define _U2STA_UTXBRK_POSITION                   0x0000000B */
/* #define _U2STA_UTXBRK_MASK                       0x00000800 */
/* #define _U2STA_UTXBRK_LENGTH                     0x00000001 */

/* #define _U2STA_URXEN_POSITION                    0x0000000C */
/* #define _U2STA_URXEN_MASK                        0x00001000 */
/* #define _U2STA_URXEN_LENGTH                      0x00000001 */

/* #define _U2STA_UTXINV_POSITION                   0x0000000D */
/* #define _U2STA_UTXINV_MASK                       0x00002000 */
/* #define _U2STA_UTXINV_LENGTH                     0x00000001 */

/* #define _U2STA_UTXISEL_POSITION                  0x0000000E */
/* #define _U2STA_UTXISEL_MASK                      0x0000C000 */
/* #define _U2STA_UTXISEL_LENGTH                    0x00000002 */

/* #define _U2STA_ADDR_POSITION                     0x00000010 */
/* #define _U2STA_ADDR_MASK                         0x00FF0000 */
/* #define _U2STA_ADDR_LENGTH                       0x00000008 */

/* #define _U2STA_ADM_EN_POSITION                   0x00000018 */
/* #define _U2STA_ADM_EN_MASK                       0x01000000 */
/* #define _U2STA_ADM_EN_LENGTH                     0x00000001 */

/* #define _U2STA_URXISEL0_POSITION                 0x00000006 */
/* #define _U2STA_URXISEL0_MASK                     0x00000040 */
/* #define _U2STA_URXISEL0_LENGTH                   0x00000001 */

/* #define _U2STA_URXISEL1_POSITION                 0x00000007 */
/* #define _U2STA_URXISEL1_MASK                     0x00000080 */
/* #define _U2STA_URXISEL1_LENGTH                   0x00000001 */

/* #define _U2STA_UTXISEL0_POSITION                 0x0000000E */
/* #define _U2STA_UTXISEL0_MASK                     0x00004000 */
/* #define _U2STA_UTXISEL0_LENGTH                   0x00000001 */

/* #define _U2STA_UTXISEL1_POSITION                 0x0000000F */
/* #define _U2STA_UTXISEL1_MASK                     0x00008000 */
/* #define _U2STA_UTXISEL1_LENGTH                   0x00000001 */

/* #define _U2STA_UTXSEL_POSITION                   0x0000000E */
/* #define _U2STA_UTXSEL_MASK                       0x0000C000 */
/* #define _U2STA_UTXSEL_LENGTH                     0x00000002 */

/* #define _U2STA_w_POSITION                        0x00000000 */
/* #define _U2STA_w_MASK                            0xFFFFFFFF */
/* #define _U2STA_w_LENGTH                          0x00000020 */

/* #define _U8932STA_URXDA_POSITION                 0x00000000 */
/* #define _U8932STA_URXDA_MASK                     0x00000001 */
/* #define _U8932STA_URXDA_LENGTH                   0x00000001 */

/* #define _U8932STA_OERR_POSITION                  0x00000001 */
/* #define _U8932STA_OERR_MASK                      0x00000002 */
/* #define _U8932STA_OERR_LENGTH                    0x00000001 */

/* #define _U8932STA_FERR_POSITION                  0x00000002 */
/* #define _U8932STA_FERR_MASK                      0x00000004 */
/* #define _U8932STA_FERR_LENGTH                    0x00000001 */

/* #define _U8932STA_PERR_POSITION                  0x00000003 */
/* #define _U8932STA_PERR_MASK                      0x00000008 */
/* #define _U8932STA_PERR_LENGTH                    0x00000001 */

/* #define _U8932STA_RIDLE_POSITION                 0x00000004 */
/* #define _U8932STA_RIDLE_MASK                     0x00000010 */
/* #define _U8932STA_RIDLE_LENGTH                   0x00000001 */

/* #define _U8932STA_ADDEN_POSITION                 0x00000005 */
/* #define _U8932STA_ADDEN_MASK                     0x00000020 */
/* #define _U8932STA_ADDEN_LENGTH                   0x00000001 */

/* #define _U8932STA_URXISEL_POSITION               0x00000006 */
/* #define _U8932STA_URXISEL_MASK                   0x000000C0 */
/* #define _U8932STA_URXISEL_LENGTH                 0x00000002 */

/* #define _U8932STA_TRMT_POSITION                  0x00000008 */
/* #define _U8932STA_TRMT_MASK                      0x00000100 */
/* #define _U8932STA_TRMT_LENGTH                    0x00000001 */

/* #define _U8932STA_UTXBF_POSITION                 0x00000009 */
/* #define _U8932STA_UTXBF_MASK                     0x00000200 */
/* #define _U8932STA_UTXBF_LENGTH                   0x00000001 */

/* #define _U8932STA_UTXEN_POSITION                 0x0000000A */
/* #define _U8932STA_UTXEN_MASK                     0x00000400 */
/* #define _U8932STA_UTXEN_LENGTH                   0x00000001 */

/* #define _U8932STA_UTXBRK_POSITION                0x0000000B */
/* #define _U8932STA_UTXBRK_MASK                    0x00000800 */
/* #define _U8932STA_UTXBRK_LENGTH                  0x00000001 */

/* #define _U8932STA_URXEN_POSITION                 0x0000000C */
/* #define _U8932STA_URXEN_MASK                     0x00001000 */
/* #define _U8932STA_URXEN_LENGTH                   0x00000001 */

/* #define _U8932STA_UTXINV_POSITION                0x0000000D */
/* #define _U8932STA_UTXINV_MASK                    0x00002000 */
/* #define _U8932STA_UTXINV_LENGTH                  0x00000001 */

/* #define _U8932STA_UTXISEL_POSITION               0x0000000E */
/* #define _U8932STA_UTXISEL_MASK                   0x0000C000 */
/* #define _U8932STA_UTXISEL_LENGTH                 0x00000002 */

/* #define _U8932STA_ADDR_POSITION                  0x00000010 */
/* #define _U8932STA_ADDR_MASK                      0x00FF0000 */
/* #define _U8932STA_ADDR_LENGTH                    0x00000008 */

/* #define _U8932STA_ADM_EN_POSITION                0x00000018 */
/* #define _U8932STA_ADM_EN_MASK                    0x01000000 */
/* #define _U8932STA_ADM_EN_LENGTH                  0x00000001 */

/* #define _U8932STA_URXISEL0_POSITION              0x00000006 */
/* #define _U8932STA_URXISEL0_MASK                  0x00000040 */
/* #define _U8932STA_URXISEL0_LENGTH                0x00000001 */

/* #define _U8932STA_URXISEL1_POSITION              0x00000007 */
/* #define _U8932STA_URXISEL1_MASK                  0x00000080 */
/* #define _U8932STA_URXISEL1_LENGTH                0x00000001 */

/* #define _U8932STA_UTXISEL0_POSITION              0x0000000E */
/* #define _U8932STA_UTXISEL0_MASK                  0x00004000 */
/* #define _U8932STA_UTXISEL0_LENGTH                0x00000001 */

/* #define _U8932STA_UTXISEL1_POSITION              0x0000000F */
/* #define _U8932STA_UTXISEL1_MASK                  0x00008000 */
/* #define _U8932STA_UTXISEL1_LENGTH                0x00000001 */

/* #define _U8932STA_UTXSEL_POSITION                0x0000000E */
/* #define _U8932STA_UTXSEL_MASK                    0x0000C000 */
/* #define _U8932STA_UTXSEL_LENGTH                  0x00000002 */

/* #define _U8932STA_w_POSITION                     0x00000000 */
/* #define _U8932STA_w_MASK                         0xFFFFFFFF */
/* #define _U8932STA_w_LENGTH                       0x00000020 */

/* #define _U39MODE_STSEL_POSITION                  0x00000000 */
/* #define _U39MODE_STSEL_MASK                      0x00000001 */
/* #define _U39MODE_STSEL_LENGTH                    0x00000001 */

/* #define _U39MODE_PDSEL_POSITION                  0x00000001 */
/* #define _U39MODE_PDSEL_MASK                      0x00000006 */
/* #define _U39MODE_PDSEL_LENGTH                    0x00000002 */

/* #define _U39MODE_BRGH_POSITION                   0x00000003 */
/* #define _U39MODE_BRGH_MASK                       0x00000008 */
/* #define _U39MODE_BRGH_LENGTH                     0x00000001 */

/* #define _U39MODE_RXINV_POSITION                  0x00000004 */
/* #define _U39MODE_RXINV_MASK                      0x00000010 */
/* #define _U39MODE_RXINV_LENGTH                    0x00000001 */

/* #define _U39MODE_ABAUD_POSITION                  0x00000005 */
/* #define _U39MODE_ABAUD_MASK                      0x00000020 */
/* #define _U39MODE_ABAUD_LENGTH                    0x00000001 */

/* #define _U39MODE_LPBACK_POSITION                 0x00000006 */
/* #define _U39MODE_LPBACK_MASK                     0x00000040 */
/* #define _U39MODE_LPBACK_LENGTH                   0x00000001 */

/* #define _U39MODE_WAKE_POSITION                   0x00000007 */
/* #define _U39MODE_WAKE_MASK                       0x00000080 */
/* #define _U39MODE_WAKE_LENGTH                     0x00000001 */

/* #define _U39MODE_UEN_POSITION                    0x00000008 */
/* #define _U39MODE_UEN_MASK                        0x00000300 */
/* #define _U39MODE_UEN_LENGTH                      0x00000002 */

/* #define _U39MODE_RTSMD_POSITION                  0x0000000B */
/* #define _U39MODE_RTSMD_MASK                      0x00000800 */
/* #define _U39MODE_RTSMD_LENGTH                    0x00000001 */

/* #define _U39MODE_IREN_POSITION                   0x0000000C */
/* #define _U39MODE_IREN_MASK                       0x00001000 */
/* #define _U39MODE_IREN_LENGTH                     0x00000001 */

/* #define _U39MODE_SIDL_POSITION                   0x0000000D */
/* #define _U39MODE_SIDL_MASK                       0x00002000 */
/* #define _U39MODE_SIDL_LENGTH                     0x00000001 */

/* #define _U39MODE_ON_POSITION                     0x0000000F */
/* #define _U39MODE_ON_MASK                         0x00008000 */
/* #define _U39MODE_ON_LENGTH                       0x00000001 */

/* #define _U39MODE_PDSEL0_POSITION                 0x00000001 */
/* #define _U39MODE_PDSEL0_MASK                     0x00000002 */
/* #define _U39MODE_PDSEL0_LENGTH                   0x00000001 */

/* #define _U39MODE_PDSEL1_POSITION                 0x00000002 */
/* #define _U39MODE_PDSEL1_MASK                     0x00000004 */
/* #define _U39MODE_PDSEL1_LENGTH                   0x00000001 */

/* #define _U39MODE_UEN0_POSITION                   0x00000008 */
/* #define _U39MODE_UEN0_MASK                       0x00000100 */
/* #define _U39MODE_UEN0_LENGTH                     0x00000001 */

/* #define _U39MODE_UEN1_POSITION                   0x00000009 */
/* #define _U39MODE_UEN1_MASK                       0x00000200 */
/* #define _U39MODE_UEN1_LENGTH                     0x00000001 */

/* #define _U39MODE_USIDL_POSITION                  0x0000000D */
/* #define _U39MODE_USIDL_MASK                      0x00002000 */
/* #define _U39MODE_USIDL_LENGTH                    0x00000001 */

/* #define _U39MODE_UARTEN_POSITION                 0x0000000F */
/* #define _U39MODE_UARTEN_MASK                     0x00008000 */
/* #define _U39MODE_UARTEN_LENGTH                   0x00000001 */

/* #define _U39MODE_w_POSITION                      0x00000000 */
/* #define _U39MODE_w_MASK                          0xFFFFFFFF */
/* #define _U39MODE_w_LENGTH                        0x00000020 */

/* #define _U3MODE_STSEL_POSITION                   0x00000000 */
/* #define _U3MODE_STSEL_MASK                       0x00000001 */
/* #define _U3MODE_STSEL_LENGTH                     0x00000001 */

/* #define _U3MODE_PDSEL_POSITION                   0x00000001 */
/* #define _U3MODE_PDSEL_MASK                       0x00000006 */
/* #define _U3MODE_PDSEL_LENGTH                     0x00000002 */

/* #define _U3MODE_BRGH_POSITION                    0x00000003 */
/* #define _U3MODE_BRGH_MASK                        0x00000008 */
/* #define _U3MODE_BRGH_LENGTH                      0x00000001 */

/* #define _U3MODE_RXINV_POSITION                   0x00000004 */
/* #define _U3MODE_RXINV_MASK                       0x00000010 */
/* #define _U3MODE_RXINV_LENGTH                     0x00000001 */

/* #define _U3MODE_ABAUD_POSITION                   0x00000005 */
/* #define _U3MODE_ABAUD_MASK                       0x00000020 */
/* #define _U3MODE_ABAUD_LENGTH                     0x00000001 */

/* #define _U3MODE_LPBACK_POSITION                  0x00000006 */
/* #define _U3MODE_LPBACK_MASK                      0x00000040 */
/* #define _U3MODE_LPBACK_LENGTH                    0x00000001 */

/* #define _U3MODE_WAKE_POSITION                    0x00000007 */
/* #define _U3MODE_WAKE_MASK                        0x00000080 */
/* #define _U3MODE_WAKE_LENGTH                      0x00000001 */

/* #define _U3MODE_UEN_POSITION                     0x00000008 */
/* #define _U3MODE_UEN_MASK                         0x00000300 */
/* #define _U3MODE_UEN_LENGTH                       0x00000002 */

/* #define _U3MODE_RTSMD_POSITION                   0x0000000B */
/* #define _U3MODE_RTSMD_MASK                       0x00000800 */
/* #define _U3MODE_RTSMD_LENGTH                     0x00000001 */

/* #define _U3MODE_IREN_POSITION                    0x0000000C */
/* #define _U3MODE_IREN_MASK                        0x00001000 */
/* #define _U3MODE_IREN_LENGTH                      0x00000001 */

/* #define _U3MODE_SIDL_POSITION                    0x0000000D */
/* #define _U3MODE_SIDL_MASK                        0x00002000 */
/* #define _U3MODE_SIDL_LENGTH                      0x00000001 */

/* #define _U3MODE_ON_POSITION                      0x0000000F */
/* #define _U3MODE_ON_MASK                          0x00008000 */
/* #define _U3MODE_ON_LENGTH                        0x00000001 */

/* #define _U3MODE_PDSEL0_POSITION                  0x00000001 */
/* #define _U3MODE_PDSEL0_MASK                      0x00000002 */
/* #define _U3MODE_PDSEL0_LENGTH                    0x00000001 */

/* #define _U3MODE_PDSEL1_POSITION                  0x00000002 */
/* #define _U3MODE_PDSEL1_MASK                      0x00000004 */
/* #define _U3MODE_PDSEL1_LENGTH                    0x00000001 */

/* #define _U3MODE_UEN0_POSITION                    0x00000008 */
/* #define _U3MODE_UEN0_MASK                        0x00000100 */
/* #define _U3MODE_UEN0_LENGTH                      0x00000001 */

/* #define _U3MODE_UEN1_POSITION                    0x00000009 */
/* #define _U3MODE_UEN1_MASK                        0x00000200 */
/* #define _U3MODE_UEN1_LENGTH                      0x00000001 */

/* #define _U3MODE_USIDL_POSITION                   0x0000000D */
/* #define _U3MODE_USIDL_MASK                       0x00002000 */
/* #define _U3MODE_USIDL_LENGTH                     0x00000001 */

/* #define _U3MODE_UARTEN_POSITION                  0x0000000F */
/* #define _U3MODE_UARTEN_MASK                      0x00008000 */
/* #define _U3MODE_UARTEN_LENGTH                    0x00000001 */

/* #define _U3MODE_w_POSITION                       0x00000000 */
/* #define _U3MODE_w_MASK                           0xFFFFFFFF */
/* #define _U3MODE_w_LENGTH                         0x00000020 */

/* #define _U39STA_URXDA_POSITION                   0x00000000 */
/* #define _U39STA_URXDA_MASK                       0x00000001 */
/* #define _U39STA_URXDA_LENGTH                     0x00000001 */

/* #define _U39STA_OERR_POSITION                    0x00000001 */
/* #define _U39STA_OERR_MASK                        0x00000002 */
/* #define _U39STA_OERR_LENGTH                      0x00000001 */

/* #define _U39STA_FERR_POSITION                    0x00000002 */
/* #define _U39STA_FERR_MASK                        0x00000004 */
/* #define _U39STA_FERR_LENGTH                      0x00000001 */

/* #define _U39STA_PERR_POSITION                    0x00000003 */
/* #define _U39STA_PERR_MASK                        0x00000008 */
/* #define _U39STA_PERR_LENGTH                      0x00000001 */

/* #define _U39STA_RIDLE_POSITION                   0x00000004 */
/* #define _U39STA_RIDLE_MASK                       0x00000010 */
/* #define _U39STA_RIDLE_LENGTH                     0x00000001 */

/* #define _U39STA_ADDEN_POSITION                   0x00000005 */
/* #define _U39STA_ADDEN_MASK                       0x00000020 */
/* #define _U39STA_ADDEN_LENGTH                     0x00000001 */

/* #define _U39STA_URXISEL_POSITION                 0x00000006 */
/* #define _U39STA_URXISEL_MASK                     0x000000C0 */
/* #define _U39STA_URXISEL_LENGTH                   0x00000002 */

/* #define _U39STA_TRMT_POSITION                    0x00000008 */
/* #define _U39STA_TRMT_MASK                        0x00000100 */
/* #define _U39STA_TRMT_LENGTH                      0x00000001 */

/* #define _U39STA_UTXBF_POSITION                   0x00000009 */
/* #define _U39STA_UTXBF_MASK                       0x00000200 */
/* #define _U39STA_UTXBF_LENGTH                     0x00000001 */

/* #define _U39STA_UTXEN_POSITION                   0x0000000A */
/* #define _U39STA_UTXEN_MASK                       0x00000400 */
/* #define _U39STA_UTXEN_LENGTH                     0x00000001 */

/* #define _U39STA_UTXBRK_POSITION                  0x0000000B */
/* #define _U39STA_UTXBRK_MASK                      0x00000800 */
/* #define _U39STA_UTXBRK_LENGTH                    0x00000001 */

/* #define _U39STA_URXEN_POSITION                   0x0000000C */
/* #define _U39STA_URXEN_MASK                       0x00001000 */
/* #define _U39STA_URXEN_LENGTH                     0x00000001 */

/* #define _U39STA_UTXINV_POSITION                  0x0000000D */
/* #define _U39STA_UTXINV_MASK                      0x00002000 */
/* #define _U39STA_UTXINV_LENGTH                    0x00000001 */

/* #define _U39STA_UTXISEL_POSITION                 0x0000000E */
/* #define _U39STA_UTXISEL_MASK                     0x0000C000 */
/* #define _U39STA_UTXISEL_LENGTH                   0x00000002 */

/* #define _U39STA_ADDR_POSITION                    0x00000010 */
/* #define _U39STA_ADDR_MASK                        0x00FF0000 */
/* #define _U39STA_ADDR_LENGTH                      0x00000008 */

/* #define _U39STA_ADM_EN_POSITION                  0x00000018 */
/* #define _U39STA_ADM_EN_MASK                      0x01000000 */
/* #define _U39STA_ADM_EN_LENGTH                    0x00000001 */

/* #define _U39STA_URXISEL0_POSITION                0x00000006 */
/* #define _U39STA_URXISEL0_MASK                    0x00000040 */
/* #define _U39STA_URXISEL0_LENGTH                  0x00000001 */

/* #define _U39STA_URXISEL1_POSITION                0x00000007 */
/* #define _U39STA_URXISEL1_MASK                    0x00000080 */
/* #define _U39STA_URXISEL1_LENGTH                  0x00000001 */

/* #define _U39STA_UTXISEL0_POSITION                0x0000000E */
/* #define _U39STA_UTXISEL0_MASK                    0x00004000 */
/* #define _U39STA_UTXISEL0_LENGTH                  0x00000001 */

/* #define _U39STA_UTXISEL1_POSITION                0x0000000F */
/* #define _U39STA_UTXISEL1_MASK                    0x00008000 */
/* #define _U39STA_UTXISEL1_LENGTH                  0x00000001 */

/* #define _U39STA_UTXSEL_POSITION                  0x0000000E */
/* #define _U39STA_UTXSEL_MASK                      0x0000C000 */
/* #define _U39STA_UTXSEL_LENGTH                    0x00000002 */

/* #define _U39STA_w_POSITION                       0x00000000 */
/* #define _U39STA_w_MASK                           0xFFFFFFFF */
/* #define _U39STA_w_LENGTH                         0x00000020 */

/* #define _U3STA_URXDA_POSITION                    0x00000000 */
/* #define _U3STA_URXDA_MASK                        0x00000001 */
/* #define _U3STA_URXDA_LENGTH                      0x00000001 */

/* #define _U3STA_OERR_POSITION                     0x00000001 */
/* #define _U3STA_OERR_MASK                         0x00000002 */
/* #define _U3STA_OERR_LENGTH                       0x00000001 */

/* #define _U3STA_FERR_POSITION                     0x00000002 */
/* #define _U3STA_FERR_MASK                         0x00000004 */
/* #define _U3STA_FERR_LENGTH                       0x00000001 */

/* #define _U3STA_PERR_POSITION                     0x00000003 */
/* #define _U3STA_PERR_MASK                         0x00000008 */
/* #define _U3STA_PERR_LENGTH                       0x00000001 */

/* #define _U3STA_RIDLE_POSITION                    0x00000004 */
/* #define _U3STA_RIDLE_MASK                        0x00000010 */
/* #define _U3STA_RIDLE_LENGTH                      0x00000001 */

/* #define _U3STA_ADDEN_POSITION                    0x00000005 */
/* #define _U3STA_ADDEN_MASK                        0x00000020 */
/* #define _U3STA_ADDEN_LENGTH                      0x00000001 */

/* #define _U3STA_URXISEL_POSITION                  0x00000006 */
/* #define _U3STA_URXISEL_MASK                      0x000000C0 */
/* #define _U3STA_URXISEL_LENGTH                    0x00000002 */

/* #define _U3STA_TRMT_POSITION                     0x00000008 */
/* #define _U3STA_TRMT_MASK                         0x00000100 */
/* #define _U3STA_TRMT_LENGTH                       0x00000001 */

/* #define _U3STA_UTXBF_POSITION                    0x00000009 */
/* #define _U3STA_UTXBF_MASK                        0x00000200 */
/* #define _U3STA_UTXBF_LENGTH                      0x00000001 */

/* #define _U3STA_UTXEN_POSITION                    0x0000000A */
/* #define _U3STA_UTXEN_MASK                        0x00000400 */
/* #define _U3STA_UTXEN_LENGTH                      0x00000001 */

/* #define _U3STA_UTXBRK_POSITION                   0x0000000B */
/* #define _U3STA_UTXBRK_MASK                       0x00000800 */
/* #define _U3STA_UTXBRK_LENGTH                     0x00000001 */

/* #define _U3STA_URXEN_POSITION                    0x0000000C */
/* #define _U3STA_URXEN_MASK                        0x00001000 */
/* #define _U3STA_URXEN_LENGTH                      0x00000001 */

/* #define _U3STA_UTXINV_POSITION                   0x0000000D */
/* #define _U3STA_UTXINV_MASK                       0x00002000 */
/* #define _U3STA_UTXINV_LENGTH                     0x00000001 */

/* #define _U3STA_UTXISEL_POSITION                  0x0000000E */
/* #define _U3STA_UTXISEL_MASK                      0x0000C000 */
/* #define _U3STA_UTXISEL_LENGTH                    0x00000002 */

/* #define _U3STA_ADDR_POSITION                     0x00000010 */
/* #define _U3STA_ADDR_MASK                         0x00FF0000 */
/* #define _U3STA_ADDR_LENGTH                       0x00000008 */

/* #define _U3STA_ADM_EN_POSITION                   0x00000018 */
/* #define _U3STA_ADM_EN_MASK                       0x01000000 */
/* #define _U3STA_ADM_EN_LENGTH                     0x00000001 */

/* #define _U3STA_URXISEL0_POSITION                 0x00000006 */
/* #define _U3STA_URXISEL0_MASK                     0x00000040 */
/* #define _U3STA_URXISEL0_LENGTH                   0x00000001 */

/* #define _U3STA_URXISEL1_POSITION                 0x00000007 */
/* #define _U3STA_URXISEL1_MASK                     0x00000080 */
/* #define _U3STA_URXISEL1_LENGTH                   0x00000001 */

/* #define _U3STA_UTXISEL0_POSITION                 0x0000000E */
/* #define _U3STA_UTXISEL0_MASK                     0x00004000 */
/* #define _U3STA_UTXISEL0_LENGTH                   0x00000001 */

/* #define _U3STA_UTXISEL1_POSITION                 0x0000000F */
/* #define _U3STA_UTXISEL1_MASK                     0x00008000 */
/* #define _U3STA_UTXISEL1_LENGTH                   0x00000001 */

/* #define _U3STA_UTXSEL_POSITION                   0x0000000E */
/* #define _U3STA_UTXSEL_MASK                       0x0000C000 */
/* #define _U3STA_UTXSEL_LENGTH                     0x00000002 */

/* #define _U3STA_w_POSITION                        0x00000000 */
/* #define _U3STA_w_MASK                            0xFFFFFFFF */
/* #define _U3STA_w_LENGTH                          0x00000020 */

/* #define _U4MODE_STSEL_POSITION                   0x00000000 */
/* #define _U4MODE_STSEL_MASK                       0x00000001 */
/* #define _U4MODE_STSEL_LENGTH                     0x00000001 */

/* #define _U4MODE_PDSEL_POSITION                   0x00000001 */
/* #define _U4MODE_PDSEL_MASK                       0x00000006 */
/* #define _U4MODE_PDSEL_LENGTH                     0x00000002 */

/* #define _U4MODE_BRGH_POSITION                    0x00000003 */
/* #define _U4MODE_BRGH_MASK                        0x00000008 */
/* #define _U4MODE_BRGH_LENGTH                      0x00000001 */

/* #define _U4MODE_RXINV_POSITION                   0x00000004 */
/* #define _U4MODE_RXINV_MASK                       0x00000010 */
/* #define _U4MODE_RXINV_LENGTH                     0x00000001 */

/* #define _U4MODE_ABAUD_POSITION                   0x00000005 */
/* #define _U4MODE_ABAUD_MASK                       0x00000020 */
/* #define _U4MODE_ABAUD_LENGTH                     0x00000001 */

/* #define _U4MODE_LPBACK_POSITION                  0x00000006 */
/* #define _U4MODE_LPBACK_MASK                      0x00000040 */
/* #define _U4MODE_LPBACK_LENGTH                    0x00000001 */

/* #define _U4MODE_WAKE_POSITION                    0x00000007 */
/* #define _U4MODE_WAKE_MASK                        0x00000080 */
/* #define _U4MODE_WAKE_LENGTH                      0x00000001 */

/* #define _U4MODE_UEN_POSITION                     0x00000008 */
/* #define _U4MODE_UEN_MASK                         0x00000300 */
/* #define _U4MODE_UEN_LENGTH                       0x00000002 */

/* #define _U4MODE_RTSMD_POSITION                   0x0000000B */
/* #define _U4MODE_RTSMD_MASK                       0x00000800 */
/* #define _U4MODE_RTSMD_LENGTH                     0x00000001 */

/* #define _U4MODE_IREN_POSITION                    0x0000000C */
/* #define _U4MODE_IREN_MASK                        0x00001000 */
/* #define _U4MODE_IREN_LENGTH                      0x00000001 */

/* #define _U4MODE_SIDL_POSITION                    0x0000000D */
/* #define _U4MODE_SIDL_MASK                        0x00002000 */
/* #define _U4MODE_SIDL_LENGTH                      0x00000001 */

/* #define _U4MODE_ON_POSITION                      0x0000000F */
/* #define _U4MODE_ON_MASK                          0x00008000 */
/* #define _U4MODE_ON_LENGTH                        0x00000001 */

/* #define _U4MODE_PDSEL0_POSITION                  0x00000001 */
/* #define _U4MODE_PDSEL0_MASK                      0x00000002 */
/* #define _U4MODE_PDSEL0_LENGTH                    0x00000001 */

/* #define _U4MODE_PDSEL1_POSITION                  0x00000002 */
/* #define _U4MODE_PDSEL1_MASK                      0x00000004 */
/* #define _U4MODE_PDSEL1_LENGTH                    0x00000001 */

/* #define _U4MODE_UEN0_POSITION                    0x00000008 */
/* #define _U4MODE_UEN0_MASK                        0x00000100 */
/* #define _U4MODE_UEN0_LENGTH                      0x00000001 */

/* #define _U4MODE_UEN1_POSITION                    0x00000009 */
/* #define _U4MODE_UEN1_MASK                        0x00000200 */
/* #define _U4MODE_UEN1_LENGTH                      0x00000001 */

/* #define _U4MODE_USIDL_POSITION                   0x0000000D */
/* #define _U4MODE_USIDL_MASK                       0x00002000 */
/* #define _U4MODE_USIDL_LENGTH                     0x00000001 */

/* #define _U4MODE_UARTEN_POSITION                  0x0000000F */
/* #define _U4MODE_UARTEN_MASK                      0x00008000 */
/* #define _U4MODE_UARTEN_LENGTH                    0x00000001 */

/* #define _U4MODE_w_POSITION                       0x00000000 */
/* #define _U4MODE_w_MASK                           0xFFFFFFFF */
/* #define _U4MODE_w_LENGTH                         0x00000020 */

/* #define _UodMODE_STSEL_POSITION                  0x00000000 */
/* #define _UodMODE_STSEL_MASK                      0x00000001 */
/* #define _UodMODE_STSEL_LENGTH                    0x00000001 */

/* #define _UodMODE_PDSEL_POSITION                  0x00000001 */
/* #define _UodMODE_PDSEL_MASK                      0x00000006 */
/* #define _UodMODE_PDSEL_LENGTH                    0x00000002 */

/* #define _UodMODE_BRGH_POSITION                   0x00000003 */
/* #define _UodMODE_BRGH_MASK                       0x00000008 */
/* #define _UodMODE_BRGH_LENGTH                     0x00000001 */

/* #define _UodMODE_RXINV_POSITION                  0x00000004 */
/* #define _UodMODE_RXINV_MASK                      0x00000010 */
/* #define _UodMODE_RXINV_LENGTH                    0x00000001 */

/* #define _UodMODE_ABAUD_POSITION                  0x00000005 */
/* #define _UodMODE_ABAUD_MASK                      0x00000020 */
/* #define _UodMODE_ABAUD_LENGTH                    0x00000001 */

/* #define _UodMODE_LPBACK_POSITION                 0x00000006 */
/* #define _UodMODE_LPBACK_MASK                     0x00000040 */
/* #define _UodMODE_LPBACK_LENGTH                   0x00000001 */

/* #define _UodMODE_WAKE_POSITION                   0x00000007 */
/* #define _UodMODE_WAKE_MASK                       0x00000080 */
/* #define _UodMODE_WAKE_LENGTH                     0x00000001 */

/* #define _UodMODE_UEN_POSITION                    0x00000008 */
/* #define _UodMODE_UEN_MASK                        0x00000300 */
/* #define _UodMODE_UEN_LENGTH                      0x00000002 */

/* #define _UodMODE_RTSMD_POSITION                  0x0000000B */
/* #define _UodMODE_RTSMD_MASK                      0x00000800 */
/* #define _UodMODE_RTSMD_LENGTH                    0x00000001 */

/* #define _UodMODE_IREN_POSITION                   0x0000000C */
/* #define _UodMODE_IREN_MASK                       0x00001000 */
/* #define _UodMODE_IREN_LENGTH                     0x00000001 */

/* #define _UodMODE_SIDL_POSITION                   0x0000000D */
/* #define _UodMODE_SIDL_MASK                       0x00002000 */
/* #define _UodMODE_SIDL_LENGTH                     0x00000001 */

/* #define _UodMODE_ON_POSITION                     0x0000000F */
/* #define _UodMODE_ON_MASK                         0x00008000 */
/* #define _UodMODE_ON_LENGTH                       0x00000001 */

/* #define _UodMODE_PDSEL0_POSITION                 0x00000001 */
/* #define _UodMODE_PDSEL0_MASK                     0x00000002 */
/* #define _UodMODE_PDSEL0_LENGTH                   0x00000001 */

/* #define _UodMODE_PDSEL1_POSITION                 0x00000002 */
/* #define _UodMODE_PDSEL1_MASK                     0x00000004 */
/* #define _UodMODE_PDSEL1_LENGTH                   0x00000001 */

/* #define _UodMODE_UEN0_POSITION                   0x00000008 */
/* #define _UodMODE_UEN0_MASK                       0x00000100 */
/* #define _UodMODE_UEN0_LENGTH                     0x00000001 */

/* #define _UodMODE_UEN1_POSITION                   0x00000009 */
/* #define _UodMODE_UEN1_MASK                       0x00000200 */
/* #define _UodMODE_UEN1_LENGTH                     0x00000001 */

/* #define _UodMODE_USIDL_POSITION                  0x0000000D */
/* #define _UodMODE_USIDL_MASK                      0x00002000 */
/* #define _UodMODE_USIDL_LENGTH                    0x00000001 */

/* #define _UodMODE_UARTEN_POSITION                 0x0000000F */
/* #define _UodMODE_UARTEN_MASK                     0x00008000 */
/* #define _UodMODE_UARTEN_LENGTH                   0x00000001 */

/* #define _UodMODE_w_POSITION                      0x00000000 */
/* #define _UodMODE_w_MASK                          0xFFFFFFFF */
/* #define _UodMODE_w_LENGTH                        0x00000020 */

/* #define _U4STA_URXDA_POSITION                    0x00000000 */
/* #define _U4STA_URXDA_MASK                        0x00000001 */
/* #define _U4STA_URXDA_LENGTH                      0x00000001 */

/* #define _U4STA_OERR_POSITION                     0x00000001 */
/* #define _U4STA_OERR_MASK                         0x00000002 */
/* #define _U4STA_OERR_LENGTH                       0x00000001 */

/* #define _U4STA_FERR_POSITION                     0x00000002 */
/* #define _U4STA_FERR_MASK                         0x00000004 */
/* #define _U4STA_FERR_LENGTH                       0x00000001 */

/* #define _U4STA_PERR_POSITION                     0x00000003 */
/* #define _U4STA_PERR_MASK                         0x00000008 */
/* #define _U4STA_PERR_LENGTH                       0x00000001 */

/* #define _U4STA_RIDLE_POSITION                    0x00000004 */
/* #define _U4STA_RIDLE_MASK                        0x00000010 */
/* #define _U4STA_RIDLE_LENGTH                      0x00000001 */

/* #define _U4STA_ADDEN_POSITION                    0x00000005 */
/* #define _U4STA_ADDEN_MASK                        0x00000020 */
/* #define _U4STA_ADDEN_LENGTH                      0x00000001 */

/* #define _U4STA_URXISEL_POSITION                  0x00000006 */
/* #define _U4STA_URXISEL_MASK                      0x000000C0 */
/* #define _U4STA_URXISEL_LENGTH                    0x00000002 */

/* #define _U4STA_TRMT_POSITION                     0x00000008 */
/* #define _U4STA_TRMT_MASK                         0x00000100 */
/* #define _U4STA_TRMT_LENGTH                       0x00000001 */

/* #define _U4STA_UTXBF_POSITION                    0x00000009 */
/* #define _U4STA_UTXBF_MASK                        0x00000200 */
/* #define _U4STA_UTXBF_LENGTH                      0x00000001 */

/* #define _U4STA_UTXEN_POSITION                    0x0000000A */
/* #define _U4STA_UTXEN_MASK                        0x00000400 */
/* #define _U4STA_UTXEN_LENGTH                      0x00000001 */

/* #define _U4STA_UTXBRK_POSITION                   0x0000000B */
/* #define _U4STA_UTXBRK_MASK                       0x00000800 */
/* #define _U4STA_UTXBRK_LENGTH                     0x00000001 */

/* #define _U4STA_URXEN_POSITION                    0x0000000C */
/* #define _U4STA_URXEN_MASK                        0x00001000 */
/* #define _U4STA_URXEN_LENGTH                      0x00000001 */

/* #define _U4STA_UTXINV_POSITION                   0x0000000D */
/* #define _U4STA_UTXINV_MASK                       0x00002000 */
/* #define _U4STA_UTXINV_LENGTH                     0x00000001 */

/* #define _U4STA_UTXISEL_POSITION                  0x0000000E */
/* #define _U4STA_UTXISEL_MASK                      0x0000C000 */
/* #define _U4STA_UTXISEL_LENGTH                    0x00000002 */

/* #define _U4STA_ADDR_POSITION                     0x00000010 */
/* #define _U4STA_ADDR_MASK                         0x00FF0000 */
/* #define _U4STA_ADDR_LENGTH                       0x00000008 */

/* #define _U4STA_ADM_EN_POSITION                   0x00000018 */
/* #define _U4STA_ADM_EN_MASK                       0x01000000 */
/* #define _U4STA_ADM_EN_LENGTH                     0x00000001 */

/* #define _U4STA_URXISEL0_POSITION                 0x00000006 */
/* #define _U4STA_URXISEL0_MASK                     0x00000040 */
/* #define _U4STA_URXISEL0_LENGTH                   0x00000001 */

/* #define _U4STA_URXISEL1_POSITION                 0x00000007 */
/* #define _U4STA_URXISEL1_MASK                     0x00000080 */
/* #define _U4STA_URXISEL1_LENGTH                   0x00000001 */

/* #define _U4STA_UTXISEL0_POSITION                 0x0000000E */
/* #define _U4STA_UTXISEL0_MASK                     0x00004000 */
/* #define _U4STA_UTXISEL0_LENGTH                   0x00000001 */

/* #define _U4STA_UTXISEL1_POSITION                 0x0000000F */
/* #define _U4STA_UTXISEL1_MASK                     0x00008000 */
/* #define _U4STA_UTXISEL1_LENGTH                   0x00000001 */

/* #define _U4STA_UTXSEL_POSITION                   0x0000000E */
/* #define _U4STA_UTXSEL_MASK                       0x0000C000 */
/* #define _U4STA_UTXSEL_LENGTH                     0x00000002 */

/* #define _U4STA_w_POSITION                        0x00000000 */
/* #define _U4STA_w_MASK                            0xFFFFFFFF */
/* #define _U4STA_w_LENGTH                          0x00000020 */

/* #define _UodSTA_URXDA_POSITION                   0x00000000 */
/* #define _UodSTA_URXDA_MASK                       0x00000001 */
/* #define _UodSTA_URXDA_LENGTH                     0x00000001 */

/* #define _UodSTA_OERR_POSITION                    0x00000001 */
/* #define _UodSTA_OERR_MASK                        0x00000002 */
/* #define _UodSTA_OERR_LENGTH                      0x00000001 */

/* #define _UodSTA_FERR_POSITION                    0x00000002 */
/* #define _UodSTA_FERR_MASK                        0x00000004 */
/* #define _UodSTA_FERR_LENGTH                      0x00000001 */

/* #define _UodSTA_PERR_POSITION                    0x00000003 */
/* #define _UodSTA_PERR_MASK                        0x00000008 */
/* #define _UodSTA_PERR_LENGTH                      0x00000001 */

/* #define _UodSTA_RIDLE_POSITION                   0x00000004 */
/* #define _UodSTA_RIDLE_MASK                       0x00000010 */
/* #define _UodSTA_RIDLE_LENGTH                     0x00000001 */

/* #define _UodSTA_ADDEN_POSITION                   0x00000005 */
/* #define _UodSTA_ADDEN_MASK                       0x00000020 */
/* #define _UodSTA_ADDEN_LENGTH                     0x00000001 */

/* #define _UodSTA_URXISEL_POSITION                 0x00000006 */
/* #define _UodSTA_URXISEL_MASK                     0x000000C0 */
/* #define _UodSTA_URXISEL_LENGTH                   0x00000002 */

/* #define _UodSTA_TRMT_POSITION                    0x00000008 */
/* #define _UodSTA_TRMT_MASK                        0x00000100 */
/* #define _UodSTA_TRMT_LENGTH                      0x00000001 */

/* #define _UodSTA_UTXBF_POSITION                   0x00000009 */
/* #define _UodSTA_UTXBF_MASK                       0x00000200 */
/* #define _UodSTA_UTXBF_LENGTH                     0x00000001 */

/* #define _UodSTA_UTXEN_POSITION                   0x0000000A */
/* #define _UodSTA_UTXEN_MASK                       0x00000400 */
/* #define _UodSTA_UTXEN_LENGTH                     0x00000001 */

/* #define _UodSTA_UTXBRK_POSITION                  0x0000000B */
/* #define _UodSTA_UTXBRK_MASK                      0x00000800 */
/* #define _UodSTA_UTXBRK_LENGTH                    0x00000001 */

/* #define _UodSTA_URXEN_POSITION                   0x0000000C */
/* #define _UodSTA_URXEN_MASK                       0x00001000 */
/* #define _UodSTA_URXEN_LENGTH                     0x00000001 */

/* #define _UodSTA_UTXINV_POSITION                  0x0000000D */
/* #define _UodSTA_UTXINV_MASK                      0x00002000 */
/* #define _UodSTA_UTXINV_LENGTH                    0x00000001 */

/* #define _UodSTA_UTXISEL_POSITION                 0x0000000E */
/* #define _UodSTA_UTXISEL_MASK                     0x0000C000 */
/* #define _UodSTA_UTXISEL_LENGTH                   0x00000002 */

/* #define _UodSTA_ADDR_POSITION                    0x00000010 */
/* #define _UodSTA_ADDR_MASK                        0x00FF0000 */
/* #define _UodSTA_ADDR_LENGTH                      0x00000008 */

/* #define _UodSTA_ADM_EN_POSITION                  0x00000018 */
/* #define _UodSTA_ADM_EN_MASK                      0x01000000 */
/* #define _UodSTA_ADM_EN_LENGTH                    0x00000001 */

/* #define _UodSTA_URXISEL0_POSITION                0x00000006 */
/* #define _UodSTA_URXISEL0_MASK                    0x00000040 */
/* #define _UodSTA_URXISEL0_LENGTH                  0x00000001 */

/* #define _UodSTA_URXISEL1_POSITION                0x00000007 */
/* #define _UodSTA_URXISEL1_MASK                    0x00000080 */
/* #define _UodSTA_URXISEL1_LENGTH                  0x00000001 */

/* #define _UodSTA_UTXISEL0_POSITION                0x0000000E */
/* #define _UodSTA_UTXISEL0_MASK                    0x00004000 */
/* #define _UodSTA_UTXISEL0_LENGTH                  0x00000001 */

/* #define _UodSTA_UTXISEL1_POSITION                0x0000000F */
/* #define _UodSTA_UTXISEL1_MASK                    0x00008000 */
/* #define _UodSTA_UTXISEL1_LENGTH                  0x00000001 */

/* #define _UodSTA_UTXSEL_POSITION                  0x0000000E */
/* #define _UodSTA_UTXSEL_MASK                      0x0000C000 */
/* #define _UodSTA_UTXSEL_LENGTH                    0x00000002 */

/* #define _UodSTA_w_POSITION                       0x00000000 */
/* #define _UodSTA_w_MASK                           0xFFFFFFFF */
/* #define _UodSTA_w_LENGTH                         0x00000020 */

/* #define _PMCON_RDSP_POSITION                     0x00000000 */
/* #define _PMCON_RDSP_MASK                         0x00000001 */
/* #define _PMCON_RDSP_LENGTH                       0x00000001 */

/* #define _PMCON_WRSP_POSITION                     0x00000001 */
/* #define _PMCON_WRSP_MASK                         0x00000002 */
/* #define _PMCON_WRSP_LENGTH                       0x00000001 */

/* #define _PMCON_CS1P_POSITION                     0x00000003 */
/* #define _PMCON_CS1P_MASK                         0x00000008 */
/* #define _PMCON_CS1P_LENGTH                       0x00000001 */

/* #define _PMCON_CS2P_POSITION                     0x00000004 */
/* #define _PMCON_CS2P_MASK                         0x00000010 */
/* #define _PMCON_CS2P_LENGTH                       0x00000001 */

/* #define _PMCON_ALP_POSITION                      0x00000005 */
/* #define _PMCON_ALP_MASK                          0x00000020 */
/* #define _PMCON_ALP_LENGTH                        0x00000001 */

/* #define _PMCON_CSF_POSITION                      0x00000006 */
/* #define _PMCON_CSF_MASK                          0x000000C0 */
/* #define _PMCON_CSF_LENGTH                        0x00000002 */

/* #define _PMCON_PTRDEN_POSITION                   0x00000008 */
/* #define _PMCON_PTRDEN_MASK                       0x00000100 */
/* #define _PMCON_PTRDEN_LENGTH                     0x00000001 */

/* #define _PMCON_PTWREN_POSITION                   0x00000009 */
/* #define _PMCON_PTWREN_MASK                       0x00000200 */
/* #define _PMCON_PTWREN_LENGTH                     0x00000001 */

/* #define _PMCON_PMPTTL_POSITION                   0x0000000A */
/* #define _PMCON_PMPTTL_MASK                       0x00000400 */
/* #define _PMCON_PMPTTL_LENGTH                     0x00000001 */

/* #define _PMCON_ADRMUX_POSITION                   0x0000000B */
/* #define _PMCON_ADRMUX_MASK                       0x00001800 */
/* #define _PMCON_ADRMUX_LENGTH                     0x00000002 */

/* #define _PMCON_SIDL_POSITION                     0x0000000D */
/* #define _PMCON_SIDL_MASK                         0x00002000 */
/* #define _PMCON_SIDL_LENGTH                       0x00000001 */

/* #define _PMCON_ON_POSITION                       0x0000000F */
/* #define _PMCON_ON_MASK                           0x00008000 */
/* #define _PMCON_ON_LENGTH                         0x00000001 */

/* #define _PMCON_CSF0_POSITION                     0x00000006 */
/* #define _PMCON_CSF0_MASK                         0x00000040 */
/* #define _PMCON_CSF0_LENGTH                       0x00000001 */

/* #define _PMCON_CSF1_POSITION                     0x00000007 */
/* #define _PMCON_CSF1_MASK                         0x00000080 */
/* #define _PMCON_CSF1_LENGTH                       0x00000001 */

/* #define _PMCON_ADRMUX0_POSITION                  0x0000000B */
/* #define _PMCON_ADRMUX0_MASK                      0x00000800 */
/* #define _PMCON_ADRMUX0_LENGTH                    0x00000001 */

/* #define _PMCON_ADRMUX1_POSITION                  0x0000000C */
/* #define _PMCON_ADRMUX1_MASK                      0x00001000 */
/* #define _PMCON_ADRMUX1_LENGTH                    0x00000001 */

/* #define _PMCON_PSIDL_POSITION                    0x0000000D */
/* #define _PMCON_PSIDL_MASK                        0x00002000 */
/* #define _PMCON_PSIDL_LENGTH                      0x00000001 */

/* #define _PMCON_PMPEN_POSITION                    0x0000000F */
/* #define _PMCON_PMPEN_MASK                        0x00008000 */
/* #define _PMCON_PMPEN_LENGTH                      0x00000001 */

/* #define _PMCON_w_POSITION                        0x00000000 */
/* #define _PMCON_w_MASK                            0xFFFFFFFF */
/* #define _PMCON_w_LENGTH                          0x00000020 */

/* #define _PMMODE_WAITE_POSITION                   0x00000000 */
/* #define _PMMODE_WAITE_MASK                       0x00000003 */
/* #define _PMMODE_WAITE_LENGTH                     0x00000002 */

/* #define _PMMODE_WAITM_POSITION                   0x00000002 */
/* #define _PMMODE_WAITM_MASK                       0x0000003C */
/* #define _PMMODE_WAITM_LENGTH                     0x00000004 */

/* #define _PMMODE_WAITB_POSITION                   0x00000006 */
/* #define _PMMODE_WAITB_MASK                       0x000000C0 */
/* #define _PMMODE_WAITB_LENGTH                     0x00000002 */

/* #define _PMMODE_MODE_POSITION                    0x00000008 */
/* #define _PMMODE_MODE_MASK                        0x00000300 */
/* #define _PMMODE_MODE_LENGTH                      0x00000002 */

/* #define _PMMODE_MODE16_POSITION                  0x0000000A */
/* #define _PMMODE_MODE16_MASK                      0x00000400 */
/* #define _PMMODE_MODE16_LENGTH                    0x00000001 */

/* #define _PMMODE_INCM_POSITION                    0x0000000B */
/* #define _PMMODE_INCM_MASK                        0x00001800 */
/* #define _PMMODE_INCM_LENGTH                      0x00000002 */

/* #define _PMMODE_IRQM_POSITION                    0x0000000D */
/* #define _PMMODE_IRQM_MASK                        0x00006000 */
/* #define _PMMODE_IRQM_LENGTH                      0x00000002 */

/* #define _PMMODE_BUSY_POSITION                    0x0000000F */
/* #define _PMMODE_BUSY_MASK                        0x00008000 */
/* #define _PMMODE_BUSY_LENGTH                      0x00000001 */

/* #define _PMMODE_WAITE0_POSITION                  0x00000000 */
/* #define _PMMODE_WAITE0_MASK                      0x00000001 */
/* #define _PMMODE_WAITE0_LENGTH                    0x00000001 */

/* #define _PMMODE_WAITE1_POSITION                  0x00000001 */
/* #define _PMMODE_WAITE1_MASK                      0x00000002 */
/* #define _PMMODE_WAITE1_LENGTH                    0x00000001 */

/* #define _PMMODE_WAITM0_POSITION                  0x00000002 */
/* #define _PMMODE_WAITM0_MASK                      0x00000004 */
/* #define _PMMODE_WAITM0_LENGTH                    0x00000001 */

/* #define _PMMODE_WAITM1_POSITION                  0x00000003 */
/* #define _PMMODE_WAITM1_MASK                      0x00000008 */
/* #define _PMMODE_WAITM1_LENGTH                    0x00000001 */

/* #define _PMMODE_WAITM2_POSITION                  0x00000004 */
/* #define _PMMODE_WAITM2_MASK                      0x00000010 */
/* #define _PMMODE_WAITM2_LENGTH                    0x00000001 */

/* #define _PMMODE_WAITM3_POSITION                  0x00000005 */
/* #define _PMMODE_WAITM3_MASK                      0x00000020 */
/* #define _PMMODE_WAITM3_LENGTH                    0x00000001 */

/* #define _PMMODE_WAITB0_POSITION                  0x00000006 */
/* #define _PMMODE_WAITB0_MASK                      0x00000040 */
/* #define _PMMODE_WAITB0_LENGTH                    0x00000001 */

/* #define _PMMODE_WAITB1_POSITION                  0x00000007 */
/* #define _PMMODE_WAITB1_MASK                      0x00000080 */
/* #define _PMMODE_WAITB1_LENGTH                    0x00000001 */

/* #define _PMMODE_MODE0_POSITION                   0x00000008 */
/* #define _PMMODE_MODE0_MASK                       0x00000100 */
/* #define _PMMODE_MODE0_LENGTH                     0x00000001 */

/* #define _PMMODE_MODE1_POSITION                   0x00000009 */
/* #define _PMMODE_MODE1_MASK                       0x00000200 */
/* #define _PMMODE_MODE1_LENGTH                     0x00000001 */

/* #define _PMMODE_INCM0_POSITION                   0x0000000B */
/* #define _PMMODE_INCM0_MASK                       0x00000800 */
/* #define _PMMODE_INCM0_LENGTH                     0x00000001 */

/* #define _PMMODE_INCM1_POSITION                   0x0000000C */
/* #define _PMMODE_INCM1_MASK                       0x00001000 */
/* #define _PMMODE_INCM1_LENGTH                     0x00000001 */

/* #define _PMMODE_IRQM0_POSITION                   0x0000000D */
/* #define _PMMODE_IRQM0_MASK                       0x00002000 */
/* #define _PMMODE_IRQM0_LENGTH                     0x00000001 */

/* #define _PMMODE_IRQM1_POSITION                   0x0000000E */
/* #define _PMMODE_IRQM1_MASK                       0x00004000 */
/* #define _PMMODE_IRQM1_LENGTH                     0x00000001 */

/* #define _PMMODE_w_POSITION                       0x00000000 */
/* #define _PMMODE_w_MASK                           0xFFFFFFFF */
/* #define _PMMODE_w_LENGTH                         0x00000020 */

/* #define _PMADDR_ADDR_POSITION                    0x00000000 */
/* #define _PMADDR_ADDR_MASK                        0x00003FFF */
/* #define _PMADDR_ADDR_LENGTH                      0x0000000E */

/* #define _PMADDR_CS_POSITION                      0x0000000E */
/* #define _PMADDR_CS_MASK                          0x0000C000 */
/* #define _PMADDR_CS_LENGTH                        0x00000002 */

/* #define _PMADDR_PADDR_POSITION                   0x00000000 */
/* #define _PMADDR_PADDR_MASK                       0x00003FFF */
/* #define _PMADDR_PADDR_LENGTH                     0x0000000E */

/* #define _PMADDR_CS1_POSITION                     0x0000000E */
/* #define _PMADDR_CS1_MASK                         0x00004000 */
/* #define _PMADDR_CS1_LENGTH                       0x00000001 */

/* #define _PMADDR_CS2_POSITION                     0x0000000F */
/* #define _PMADDR_CS2_MASK                         0x00008000 */
/* #define _PMADDR_CS2_LENGTH                       0x00000001 */

/* #define _PMADDR_w_POSITION                       0x00000000 */
/* #define _PMADDR_w_MASK                           0xFFFFFFFF */
/* #define _PMADDR_w_LENGTH                         0x00000020 */

/* #define _PMDOUT_DATAOUT_POSITION                 0x00000000 */
/* #define _PMDOUT_DATAOUT_MASK                     0xFFFFFFFF */
/* #define _PMDOUT_DATAOUT_LENGTH                   0x00000020 */

/* #define _PMDOUT_w_POSITION                       0x00000000 */
/* #define _PMDOUT_w_MASK                           0xFFFFFFFF */
/* #define _PMDOUT_w_LENGTH                         0x00000020 */

/* #define _PMDIN_DATAIN_POSITION                   0x00000000 */
/* #define _PMDIN_DATAIN_MASK                       0xFFFFFFFF */
/* #define _PMDIN_DATAIN_LENGTH                     0x00000020 */

/* #define _PMDIN_w_POSITION                        0x00000000 */
/* #define _PMDIN_w_MASK                            0xFFFFFFFF */
/* #define _PMDIN_w_LENGTH                          0x00000020 */

/* #define _PMAEN_PTEN_POSITION                     0x00000000 */
/* #define _PMAEN_PTEN_MASK                         0x0000FFFF */
/* #define _PMAEN_PTEN_LENGTH                       0x00000010 */

/* #define _PMAEN_PTEN0_POSITION                    0x00000000 */
/* #define _PMAEN_PTEN0_MASK                        0x00000001 */
/* #define _PMAEN_PTEN0_LENGTH                      0x00000001 */

/* #define _PMAEN_PTEN1_POSITION                    0x00000001 */
/* #define _PMAEN_PTEN1_MASK                        0x00000002 */
/* #define _PMAEN_PTEN1_LENGTH                      0x00000001 */

/* #define _PMAEN_PTEN2_POSITION                    0x00000002 */
/* #define _PMAEN_PTEN2_MASK                        0x00000004 */
/* #define _PMAEN_PTEN2_LENGTH                      0x00000001 */

/* #define _PMAEN_PTEN3_POSITION                    0x00000003 */
/* #define _PMAEN_PTEN3_MASK                        0x00000008 */
/* #define _PMAEN_PTEN3_LENGTH                      0x00000001 */

/* #define _PMAEN_PTEN4_POSITION                    0x00000004 */
/* #define _PMAEN_PTEN4_MASK                        0x00000010 */
/* #define _PMAEN_PTEN4_LENGTH                      0x00000001 */

/* #define _PMAEN_PTEN5_POSITION                    0x00000005 */
/* #define _PMAEN_PTEN5_MASK                        0x00000020 */
/* #define _PMAEN_PTEN5_LENGTH                      0x00000001 */

/* #define _PMAEN_PTEN6_POSITION                    0x00000006 */
/* #define _PMAEN_PTEN6_MASK                        0x00000040 */
/* #define _PMAEN_PTEN6_LENGTH                      0x00000001 */

/* #define _PMAEN_PTEN7_POSITION                    0x00000007 */
/* #define _PMAEN_PTEN7_MASK                        0x00000080 */
/* #define _PMAEN_PTEN7_LENGTH                      0x00000001 */

/* #define _PMAEN_PTEN8_POSITION                    0x00000008 */
/* #define _PMAEN_PTEN8_MASK                        0x00000100 */
/* #define _PMAEN_PTEN8_LENGTH                      0x00000001 */

/* #define _PMAEN_PTEN9_POSITION                    0x00000009 */
/* #define _PMAEN_PTEN9_MASK                        0x00000200 */
/* #define _PMAEN_PTEN9_LENGTH                      0x00000001 */

/* #define _PMAEN_PTEN10_POSITION                   0x0000000A */
/* #define _PMAEN_PTEN10_MASK                       0x00000400 */
/* #define _PMAEN_PTEN10_LENGTH                     0x00000001 */

/* #define _PMAEN_PTEN11_POSITION                   0x0000000B */
/* #define _PMAEN_PTEN11_MASK                       0x00000800 */
/* #define _PMAEN_PTEN11_LENGTH                     0x00000001 */

/* #define _PMAEN_PTEN12_POSITION                   0x0000000C */
/* #define _PMAEN_PTEN12_MASK                       0x00001000 */
/* #define _PMAEN_PTEN12_LENGTH                     0x00000001 */

/* #define _PMAEN_PTEN13_POSITION                   0x0000000D */
/* #define _PMAEN_PTEN13_MASK                       0x00002000 */
/* #define _PMAEN_PTEN13_LENGTH                     0x00000001 */

/* #define _PMAEN_PTEN14_POSITION                   0x0000000E */
/* #define _PMAEN_PTEN14_MASK                       0x00004000 */
/* #define _PMAEN_PTEN14_LENGTH                     0x00000001 */

/* #define _PMAEN_PTEN15_POSITION                   0x0000000F */
/* #define _PMAEN_PTEN15_MASK                       0x00008000 */
/* #define _PMAEN_PTEN15_LENGTH                     0x00000001 */

/* #define _PMAEN_w_POSITION                        0x00000000 */
/* #define _PMAEN_w_MASK                            0xFFFFFFFF */
/* #define _PMAEN_w_LENGTH                          0x00000020 */

/* #define _PMSTAT_OB0E_POSITION                    0x00000000 */
/* #define _PMSTAT_OB0E_MASK                        0x00000001 */
/* #define _PMSTAT_OB0E_LENGTH                      0x00000001 */

/* #define _PMSTAT_OB1E_POSITION                    0x00000001 */
/* #define _PMSTAT_OB1E_MASK                        0x00000002 */
/* #define _PMSTAT_OB1E_LENGTH                      0x00000001 */

/* #define _PMSTAT_OB2E_POSITION                    0x00000002 */
/* #define _PMSTAT_OB2E_MASK                        0x00000004 */
/* #define _PMSTAT_OB2E_LENGTH                      0x00000001 */

/* #define _PMSTAT_OB3E_POSITION                    0x00000003 */
/* #define _PMSTAT_OB3E_MASK                        0x00000008 */
/* #define _PMSTAT_OB3E_LENGTH                      0x00000001 */

/* #define _PMSTAT_OBUF_POSITION                    0x00000006 */
/* #define _PMSTAT_OBUF_MASK                        0x00000040 */
/* #define _PMSTAT_OBUF_LENGTH                      0x00000001 */

/* #define _PMSTAT_OBE_POSITION                     0x00000007 */
/* #define _PMSTAT_OBE_MASK                         0x00000080 */
/* #define _PMSTAT_OBE_LENGTH                       0x00000001 */

/* #define _PMSTAT_IB0F_POSITION                    0x00000008 */
/* #define _PMSTAT_IB0F_MASK                        0x00000100 */
/* #define _PMSTAT_IB0F_LENGTH                      0x00000001 */

/* #define _PMSTAT_IB1F_POSITION                    0x00000009 */
/* #define _PMSTAT_IB1F_MASK                        0x00000200 */
/* #define _PMSTAT_IB1F_LENGTH                      0x00000001 */

/* #define _PMSTAT_IB2F_POSITION                    0x0000000A */
/* #define _PMSTAT_IB2F_MASK                        0x00000400 */
/* #define _PMSTAT_IB2F_LENGTH                      0x00000001 */

/* #define _PMSTAT_IB3F_POSITION                    0x0000000B */
/* #define _PMSTAT_IB3F_MASK                        0x00000800 */
/* #define _PMSTAT_IB3F_LENGTH                      0x00000001 */

/* #define _PMSTAT_IBOV_POSITION                    0x0000000E */
/* #define _PMSTAT_IBOV_MASK                        0x00004000 */
/* #define _PMSTAT_IBOV_LENGTH                      0x00000001 */

/* #define _PMSTAT_IBF_POSITION                     0x0000000F */
/* #define _PMSTAT_IBF_MASK                         0x00008000 */
/* #define _PMSTAT_IBF_LENGTH                       0x00000001 */

/* #define _PMSTAT_w_POSITION                       0x00000000 */
/* #define _PMSTAT_w_MASK                           0xFFFFFFFF */
/* #define _PMSTAT_w_LENGTH                         0x00000020 */

/* #define _AD1CON1_DONE_POSITION                   0x00000000 */
/* #define _AD1CON1_DONE_MASK                       0x00000001 */
/* #define _AD1CON1_DONE_LENGTH                     0x00000001 */

/* #define _AD1CON1_SAMP_POSITION                   0x00000001 */
/* #define _AD1CON1_SAMP_MASK                       0x00000002 */
/* #define _AD1CON1_SAMP_LENGTH                     0x00000001 */

/* #define _AD1CON1_ASAM_POSITION                   0x00000002 */
/* #define _AD1CON1_ASAM_MASK                       0x00000004 */
/* #define _AD1CON1_ASAM_LENGTH                     0x00000001 */

/* #define _AD1CON1_CLRASAM_POSITION                0x00000004 */
/* #define _AD1CON1_CLRASAM_MASK                    0x00000010 */
/* #define _AD1CON1_CLRASAM_LENGTH                  0x00000001 */

/* #define _AD1CON1_SSRC_POSITION                   0x00000005 */
/* #define _AD1CON1_SSRC_MASK                       0x000000E0 */
/* #define _AD1CON1_SSRC_LENGTH                     0x00000003 */

/* #define _AD1CON1_FORM_POSITION                   0x00000008 */
/* #define _AD1CON1_FORM_MASK                       0x00000700 */
/* #define _AD1CON1_FORM_LENGTH                     0x00000003 */

/* #define _AD1CON1_SIDL_POSITION                   0x0000000D */
/* #define _AD1CON1_SIDL_MASK                       0x00002000 */
/* #define _AD1CON1_SIDL_LENGTH                     0x00000001 */

/* #define _AD1CON1_ON_POSITION                     0x0000000F */
/* #define _AD1CON1_ON_MASK                         0x00008000 */
/* #define _AD1CON1_ON_LENGTH                       0x00000001 */

/* #define _AD1CON1_SSRC0_POSITION                  0x00000005 */
/* #define _AD1CON1_SSRC0_MASK                      0x00000020 */
/* #define _AD1CON1_SSRC0_LENGTH                    0x00000001 */

/* #define _AD1CON1_SSRC1_POSITION                  0x00000006 */
/* #define _AD1CON1_SSRC1_MASK                      0x00000040 */
/* #define _AD1CON1_SSRC1_LENGTH                    0x00000001 */

/* #define _AD1CON1_SSRC2_POSITION                  0x00000007 */
/* #define _AD1CON1_SSRC2_MASK                      0x00000080 */
/* #define _AD1CON1_SSRC2_LENGTH                    0x00000001 */

/* #define _AD1CON1_FORM0_POSITION                  0x00000008 */
/* #define _AD1CON1_FORM0_MASK                      0x00000100 */
/* #define _AD1CON1_FORM0_LENGTH                    0x00000001 */

/* #define _AD1CON1_FORM1_POSITION                  0x00000009 */
/* #define _AD1CON1_FORM1_MASK                      0x00000200 */
/* #define _AD1CON1_FORM1_LENGTH                    0x00000001 */

/* #define _AD1CON1_FORM2_POSITION                  0x0000000A */
/* #define _AD1CON1_FORM2_MASK                      0x00000400 */
/* #define _AD1CON1_FORM2_LENGTH                    0x00000001 */

/* #define _AD1CON1_ADSIDL_POSITION                 0x0000000D */
/* #define _AD1CON1_ADSIDL_MASK                     0x00002000 */
/* #define _AD1CON1_ADSIDL_LENGTH                   0x00000001 */

/* #define _AD1CON1_ADON_POSITION                   0x0000000F */
/* #define _AD1CON1_ADON_MASK                       0x00008000 */
/* #define _AD1CON1_ADON_LENGTH                     0x00000001 */

/* #define _AD1CON1_w_POSITION                      0x00000000 */
/* #define _AD1CON1_w_MASK                          0xFFFFFFFF */
/* #define _AD1CON1_w_LENGTH                        0x00000020 */

/* #define _AD1CON2_ALTS_POSITION                   0x00000000 */
/* #define _AD1CON2_ALTS_MASK                       0x00000001 */
/* #define _AD1CON2_ALTS_LENGTH                     0x00000001 */

/* #define _AD1CON2_BUFM_POSITION                   0x00000001 */
/* #define _AD1CON2_BUFM_MASK                       0x00000002 */
/* #define _AD1CON2_BUFM_LENGTH                     0x00000001 */

/* #define _AD1CON2_SMPI_POSITION                   0x00000002 */
/* #define _AD1CON2_SMPI_MASK                       0x0000003C */
/* #define _AD1CON2_SMPI_LENGTH                     0x00000004 */

/* #define _AD1CON2_BUFS_POSITION                   0x00000007 */
/* #define _AD1CON2_BUFS_MASK                       0x00000080 */
/* #define _AD1CON2_BUFS_LENGTH                     0x00000001 */

/* #define _AD1CON2_CSCNA_POSITION                  0x0000000A */
/* #define _AD1CON2_CSCNA_MASK                      0x00000400 */
/* #define _AD1CON2_CSCNA_LENGTH                    0x00000001 */

/* #define _AD1CON2_OFFCAL_POSITION                 0x0000000C */
/* #define _AD1CON2_OFFCAL_MASK                     0x00001000 */
/* #define _AD1CON2_OFFCAL_LENGTH                   0x00000001 */

/* #define _AD1CON2_VCFG_POSITION                   0x0000000D */
/* #define _AD1CON2_VCFG_MASK                       0x0000E000 */
/* #define _AD1CON2_VCFG_LENGTH                     0x00000003 */

/* #define _AD1CON2_SMPI0_POSITION                  0x00000002 */
/* #define _AD1CON2_SMPI0_MASK                      0x00000004 */
/* #define _AD1CON2_SMPI0_LENGTH                    0x00000001 */

/* #define _AD1CON2_SMPI1_POSITION                  0x00000003 */
/* #define _AD1CON2_SMPI1_MASK                      0x00000008 */
/* #define _AD1CON2_SMPI1_LENGTH                    0x00000001 */

/* #define _AD1CON2_SMPI2_POSITION                  0x00000004 */
/* #define _AD1CON2_SMPI2_MASK                      0x00000010 */
/* #define _AD1CON2_SMPI2_LENGTH                    0x00000001 */

/* #define _AD1CON2_SMPI3_POSITION                  0x00000005 */
/* #define _AD1CON2_SMPI3_MASK                      0x00000020 */
/* #define _AD1CON2_SMPI3_LENGTH                    0x00000001 */

/* #define _AD1CON2_VCFG0_POSITION                  0x0000000D */
/* #define _AD1CON2_VCFG0_MASK                      0x00002000 */
/* #define _AD1CON2_VCFG0_LENGTH                    0x00000001 */

/* #define _AD1CON2_VCFG1_POSITION                  0x0000000E */
/* #define _AD1CON2_VCFG1_MASK                      0x00004000 */
/* #define _AD1CON2_VCFG1_LENGTH                    0x00000001 */

/* #define _AD1CON2_VCFG2_POSITION                  0x0000000F */
/* #define _AD1CON2_VCFG2_MASK                      0x00008000 */
/* #define _AD1CON2_VCFG2_LENGTH                    0x00000001 */

/* #define _AD1CON2_w_POSITION                      0x00000000 */
/* #define _AD1CON2_w_MASK                          0xFFFFFFFF */
/* #define _AD1CON2_w_LENGTH                        0x00000020 */

/* #define _AD1CON3_ADCS_POSITION                   0x00000000 */
/* #define _AD1CON3_ADCS_MASK                       0x000000FF */
/* #define _AD1CON3_ADCS_LENGTH                     0x00000008 */

/* #define _AD1CON3_SAMC_POSITION                   0x00000008 */
/* #define _AD1CON3_SAMC_MASK                       0x00001F00 */
/* #define _AD1CON3_SAMC_LENGTH                     0x00000005 */

/* #define _AD1CON3_ADRC_POSITION                   0x0000000F */
/* #define _AD1CON3_ADRC_MASK                       0x00008000 */
/* #define _AD1CON3_ADRC_LENGTH                     0x00000001 */

/* #define _AD1CON3_ADCS0_POSITION                  0x00000000 */
/* #define _AD1CON3_ADCS0_MASK                      0x00000001 */
/* #define _AD1CON3_ADCS0_LENGTH                    0x00000001 */

/* #define _AD1CON3_ADCS1_POSITION                  0x00000001 */
/* #define _AD1CON3_ADCS1_MASK                      0x00000002 */
/* #define _AD1CON3_ADCS1_LENGTH                    0x00000001 */

/* #define _AD1CON3_ADCS2_POSITION                  0x00000002 */
/* #define _AD1CON3_ADCS2_MASK                      0x00000004 */
/* #define _AD1CON3_ADCS2_LENGTH                    0x00000001 */

/* #define _AD1CON3_ADCS3_POSITION                  0x00000003 */
/* #define _AD1CON3_ADCS3_MASK                      0x00000008 */
/* #define _AD1CON3_ADCS3_LENGTH                    0x00000001 */

/* #define _AD1CON3_ADCS4_POSITION                  0x00000004 */
/* #define _AD1CON3_ADCS4_MASK                      0x00000010 */
/* #define _AD1CON3_ADCS4_LENGTH                    0x00000001 */

/* #define _AD1CON3_ADCS5_POSITION                  0x00000005 */
/* #define _AD1CON3_ADCS5_MASK                      0x00000020 */
/* #define _AD1CON3_ADCS5_LENGTH                    0x00000001 */

/* #define _AD1CON3_ADCS6_POSITION                  0x00000006 */
/* #define _AD1CON3_ADCS6_MASK                      0x00000040 */
/* #define _AD1CON3_ADCS6_LENGTH                    0x00000001 */

/* #define _AD1CON3_ADCS7_POSITION                  0x00000007 */
/* #define _AD1CON3_ADCS7_MASK                      0x00000080 */
/* #define _AD1CON3_ADCS7_LENGTH                    0x00000001 */

/* #define _AD1CON3_SAMC0_POSITION                  0x00000008 */
/* #define _AD1CON3_SAMC0_MASK                      0x00000100 */
/* #define _AD1CON3_SAMC0_LENGTH                    0x00000001 */

/* #define _AD1CON3_SAMC1_POSITION                  0x00000009 */
/* #define _AD1CON3_SAMC1_MASK                      0x00000200 */
/* #define _AD1CON3_SAMC1_LENGTH                    0x00000001 */

/* #define _AD1CON3_SAMC2_POSITION                  0x0000000A */
/* #define _AD1CON3_SAMC2_MASK                      0x00000400 */
/* #define _AD1CON3_SAMC2_LENGTH                    0x00000001 */

/* #define _AD1CON3_SAMC3_POSITION                  0x0000000B */
/* #define _AD1CON3_SAMC3_MASK                      0x00000800 */
/* #define _AD1CON3_SAMC3_LENGTH                    0x00000001 */

/* #define _AD1CON3_SAMC4_POSITION                  0x0000000C */
/* #define _AD1CON3_SAMC4_MASK                      0x00001000 */
/* #define _AD1CON3_SAMC4_LENGTH                    0x00000001 */

/* #define _AD1CON3_w_POSITION                      0x00000000 */
/* #define _AD1CON3_w_MASK                          0xFFFFFFFF */
/* #define _AD1CON3_w_LENGTH                        0x00000020 */

/* #define _AD1CHS_CH0SA_POSITION                   0x00000010 */
/* #define _AD1CHS_CH0SA_MASK                       0x000F0000 */
/* #define _AD1CHS_CH0SA_LENGTH                     0x00000004 */

/* #define _AD1CHS_CH0NA_POSITION                   0x00000017 */
/* #define _AD1CHS_CH0NA_MASK                       0x00800000 */
/* #define _AD1CHS_CH0NA_LENGTH                     0x00000001 */

/* #define _AD1CHS_CH0SB_POSITION                   0x00000018 */
/* #define _AD1CHS_CH0SB_MASK                       0x0F000000 */
/* #define _AD1CHS_CH0SB_LENGTH                     0x00000004 */

/* #define _AD1CHS_CH0NB_POSITION                   0x0000001F */
/* #define _AD1CHS_CH0NB_MASK                       0x80000000 */
/* #define _AD1CHS_CH0NB_LENGTH                     0x00000001 */

/* #define _AD1CHS_CH0SA0_POSITION                  0x00000010 */
/* #define _AD1CHS_CH0SA0_MASK                      0x00010000 */
/* #define _AD1CHS_CH0SA0_LENGTH                    0x00000001 */

/* #define _AD1CHS_CH0SA1_POSITION                  0x00000011 */
/* #define _AD1CHS_CH0SA1_MASK                      0x00020000 */
/* #define _AD1CHS_CH0SA1_LENGTH                    0x00000001 */

/* #define _AD1CHS_CH0SA2_POSITION                  0x00000012 */
/* #define _AD1CHS_CH0SA2_MASK                      0x00040000 */
/* #define _AD1CHS_CH0SA2_LENGTH                    0x00000001 */

/* #define _AD1CHS_CH0SA3_POSITION                  0x00000013 */
/* #define _AD1CHS_CH0SA3_MASK                      0x00080000 */
/* #define _AD1CHS_CH0SA3_LENGTH                    0x00000001 */

/* #define _AD1CHS_CH0SB0_POSITION                  0x00000018 */
/* #define _AD1CHS_CH0SB0_MASK                      0x01000000 */
/* #define _AD1CHS_CH0SB0_LENGTH                    0x00000001 */

/* #define _AD1CHS_CH0SB1_POSITION                  0x00000019 */
/* #define _AD1CHS_CH0SB1_MASK                      0x02000000 */
/* #define _AD1CHS_CH0SB1_LENGTH                    0x00000001 */

/* #define _AD1CHS_CH0SB2_POSITION                  0x0000001A */
/* #define _AD1CHS_CH0SB2_MASK                      0x04000000 */
/* #define _AD1CHS_CH0SB2_LENGTH                    0x00000001 */

/* #define _AD1CHS_CH0SB3_POSITION                  0x0000001B */
/* #define _AD1CHS_CH0SB3_MASK                      0x08000000 */
/* #define _AD1CHS_CH0SB3_LENGTH                    0x00000001 */

/* #define _AD1CHS_w_POSITION                       0x00000000 */
/* #define _AD1CHS_w_MASK                           0xFFFFFFFF */
/* #define _AD1CHS_w_LENGTH                         0x00000020 */

/* #define _AD1CSSL_CSSL_POSITION                   0x00000000 */
/* #define _AD1CSSL_CSSL_MASK                       0x7FFFFFFF */
/* #define _AD1CSSL_CSSL_LENGTH                     0x0000001F */

/* #define _AD1CSSL_CSSL0_POSITION                  0x00000000 */
/* #define _AD1CSSL_CSSL0_MASK                      0x00000001 */
/* #define _AD1CSSL_CSSL0_LENGTH                    0x00000001 */

/* #define _AD1CSSL_CSSL1_POSITION                  0x00000001 */
/* #define _AD1CSSL_CSSL1_MASK                      0x00000002 */
/* #define _AD1CSSL_CSSL1_LENGTH                    0x00000001 */

/* #define _AD1CSSL_CSSL2_POSITION                  0x00000002 */
/* #define _AD1CSSL_CSSL2_MASK                      0x00000004 */
/* #define _AD1CSSL_CSSL2_LENGTH                    0x00000001 */

/* #define _AD1CSSL_CSSL3_POSITION                  0x00000003 */
/* #define _AD1CSSL_CSSL3_MASK                      0x00000008 */
/* #define _AD1CSSL_CSSL3_LENGTH                    0x00000001 */

/* #define _AD1CSSL_CSSL4_POSITION                  0x00000004 */
/* #define _AD1CSSL_CSSL4_MASK                      0x00000010 */
/* #define _AD1CSSL_CSSL4_LENGTH                    0x00000001 */

/* #define _AD1CSSL_CSSL5_POSITION                  0x00000005 */
/* #define _AD1CSSL_CSSL5_MASK                      0x00000020 */
/* #define _AD1CSSL_CSSL5_LENGTH                    0x00000001 */

/* #define _AD1CSSL_CSSL6_POSITION                  0x00000006 */
/* #define _AD1CSSL_CSSL6_MASK                      0x00000040 */
/* #define _AD1CSSL_CSSL6_LENGTH                    0x00000001 */

/* #define _AD1CSSL_CSSL7_POSITION                  0x00000007 */
/* #define _AD1CSSL_CSSL7_MASK                      0x00000080 */
/* #define _AD1CSSL_CSSL7_LENGTH                    0x00000001 */

/* #define _AD1CSSL_CSSL8_POSITION                  0x00000008 */
/* #define _AD1CSSL_CSSL8_MASK                      0x00000100 */
/* #define _AD1CSSL_CSSL8_LENGTH                    0x00000001 */

/* #define _AD1CSSL_CSSL9_POSITION                  0x00000009 */
/* #define _AD1CSSL_CSSL9_MASK                      0x00000200 */
/* #define _AD1CSSL_CSSL9_LENGTH                    0x00000001 */

/* #define _AD1CSSL_CSSL10_POSITION                 0x0000000A */
/* #define _AD1CSSL_CSSL10_MASK                     0x00000400 */
/* #define _AD1CSSL_CSSL10_LENGTH                   0x00000001 */

/* #define _AD1CSSL_CSSL11_POSITION                 0x0000000B */
/* #define _AD1CSSL_CSSL11_MASK                     0x00000800 */
/* #define _AD1CSSL_CSSL11_LENGTH                   0x00000001 */

/* #define _AD1CSSL_CSSL12_POSITION                 0x0000000C */
/* #define _AD1CSSL_CSSL12_MASK                     0x00001000 */
/* #define _AD1CSSL_CSSL12_LENGTH                   0x00000001 */

/* #define _AD1CSSL_CSSL13_POSITION                 0x0000000D */
/* #define _AD1CSSL_CSSL13_MASK                     0x00002000 */
/* #define _AD1CSSL_CSSL13_LENGTH                   0x00000001 */

/* #define _AD1CSSL_CSSL14_POSITION                 0x0000000E */
/* #define _AD1CSSL_CSSL14_MASK                     0x00004000 */
/* #define _AD1CSSL_CSSL14_LENGTH                   0x00000001 */

/* #define _AD1CSSL_CSSL15_POSITION                 0x0000000F */
/* #define _AD1CSSL_CSSL15_MASK                     0x00008000 */
/* #define _AD1CSSL_CSSL15_LENGTH                   0x00000001 */

/* #define _AD1CSSL_CSSL16_POSITION                 0x00000010 */
/* #define _AD1CSSL_CSSL16_MASK                     0x00010000 */
/* #define _AD1CSSL_CSSL16_LENGTH                   0x00000001 */

/* #define _AD1CSSL_CSSL17_POSITION                 0x00000011 */
/* #define _AD1CSSL_CSSL17_MASK                     0x00020000 */
/* #define _AD1CSSL_CSSL17_LENGTH                   0x00000001 */

/* #define _AD1CSSL_CSSL18_POSITION                 0x00000012 */
/* #define _AD1CSSL_CSSL18_MASK                     0x00040000 */
/* #define _AD1CSSL_CSSL18_LENGTH                   0x00000001 */

/* #define _AD1CSSL_CSSL19_POSITION                 0x00000013 */
/* #define _AD1CSSL_CSSL19_MASK                     0x00080000 */
/* #define _AD1CSSL_CSSL19_LENGTH                   0x00000001 */

/* #define _AD1CSSL_CSSL20_POSITION                 0x00000014 */
/* #define _AD1CSSL_CSSL20_MASK                     0x00100000 */
/* #define _AD1CSSL_CSSL20_LENGTH                   0x00000001 */

/* #define _AD1CSSL_CSSL21_POSITION                 0x00000015 */
/* #define _AD1CSSL_CSSL21_MASK                     0x00200000 */
/* #define _AD1CSSL_CSSL21_LENGTH                   0x00000001 */

/* #define _AD1CSSL_CSSL22_POSITION                 0x00000016 */
/* #define _AD1CSSL_CSSL22_MASK                     0x00400000 */
/* #define _AD1CSSL_CSSL22_LENGTH                   0x00000001 */

/* #define _AD1CSSL_CSSL23_POSITION                 0x00000017 */
/* #define _AD1CSSL_CSSL23_MASK                     0x00800000 */
/* #define _AD1CSSL_CSSL23_LENGTH                   0x00000001 */

/* #define _AD1CSSL_CSSL24_POSITION                 0x00000018 */
/* #define _AD1CSSL_CSSL24_MASK                     0x01000000 */
/* #define _AD1CSSL_CSSL24_LENGTH                   0x00000001 */

/* #define _AD1CSSL_CSSL25_POSITION                 0x00000019 */
/* #define _AD1CSSL_CSSL25_MASK                     0x02000000 */
/* #define _AD1CSSL_CSSL25_LENGTH                   0x00000001 */

/* #define _AD1CSSL_CSSL26_POSITION                 0x0000001A */
/* #define _AD1CSSL_CSSL26_MASK                     0x04000000 */
/* #define _AD1CSSL_CSSL26_LENGTH                   0x00000001 */

/* #define _AD1CSSL_CSSL27_POSITION                 0x0000001B */
/* #define _AD1CSSL_CSSL27_MASK                     0x08000000 */
/* #define _AD1CSSL_CSSL27_LENGTH                   0x00000001 */

/* #define _AD1CSSL_CSSL28_POSITION                 0x0000001C */
/* #define _AD1CSSL_CSSL28_MASK                     0x10000000 */
/* #define _AD1CSSL_CSSL28_LENGTH                   0x00000001 */

/* #define _AD1CSSL_CSSL29_POSITION                 0x0000001D */
/* #define _AD1CSSL_CSSL29_MASK                     0x20000000 */
/* #define _AD1CSSL_CSSL29_LENGTH                   0x00000001 */

/* #define _AD1CSSL_CSSL30_POSITION                 0x0000001E */
/* #define _AD1CSSL_CSSL30_MASK                     0x40000000 */
/* #define _AD1CSSL_CSSL30_LENGTH                   0x00000001 */

/* #define _AD1CSSL_w_POSITION                      0x00000000 */
/* #define _AD1CSSL_w_MASK                          0xFFFFFFFF */
/* #define _AD1CSSL_w_LENGTH                        0x00000020 */

/* #define _CVRCON_CVR_POSITION                     0x00000000 */
/* #define _CVRCON_CVR_MASK                         0x0000000F */
/* #define _CVRCON_CVR_LENGTH                       0x00000004 */

/* #define _CVRCON_CVRSS_POSITION                   0x00000004 */
/* #define _CVRCON_CVRSS_MASK                       0x00000010 */
/* #define _CVRCON_CVRSS_LENGTH                     0x00000001 */

/* #define _CVRCON_CVRR_POSITION                    0x00000005 */
/* #define _CVRCON_CVRR_MASK                        0x00000020 */
/* #define _CVRCON_CVRR_LENGTH                      0x00000001 */

/* #define _CVRCON_CVROE_POSITION                   0x00000006 */
/* #define _CVRCON_CVROE_MASK                       0x00000040 */
/* #define _CVRCON_CVROE_LENGTH                     0x00000001 */

/* #define _CVRCON_BGSEL_POSITION                   0x00000008 */
/* #define _CVRCON_BGSEL_MASK                       0x00000300 */
/* #define _CVRCON_BGSEL_LENGTH                     0x00000002 */

/* #define _CVRCON_VREFSEL_POSITION                 0x0000000A */
/* #define _CVRCON_VREFSEL_MASK                     0x00000400 */
/* #define _CVRCON_VREFSEL_LENGTH                   0x00000001 */

/* #define _CVRCON_ON_POSITION                      0x0000000F */
/* #define _CVRCON_ON_MASK                          0x00008000 */
/* #define _CVRCON_ON_LENGTH                        0x00000001 */

/* #define _CVRCON_CVR0_POSITION                    0x00000000 */
/* #define _CVRCON_CVR0_MASK                        0x00000001 */
/* #define _CVRCON_CVR0_LENGTH                      0x00000001 */

/* #define _CVRCON_CVR1_POSITION                    0x00000001 */
/* #define _CVRCON_CVR1_MASK                        0x00000002 */
/* #define _CVRCON_CVR1_LENGTH                      0x00000001 */

/* #define _CVRCON_CVR2_POSITION                    0x00000002 */
/* #define _CVRCON_CVR2_MASK                        0x00000004 */
/* #define _CVRCON_CVR2_LENGTH                      0x00000001 */

/* #define _CVRCON_CVR3_POSITION                    0x00000003 */
/* #define _CVRCON_CVR3_MASK                        0x00000008 */
/* #define _CVRCON_CVR3_LENGTH                      0x00000001 */

/* #define _CVRCON_BGSEL0_POSITION                  0x00000008 */
/* #define _CVRCON_BGSEL0_MASK                      0x00000100 */
/* #define _CVRCON_BGSEL0_LENGTH                    0x00000001 */

/* #define _CVRCON_BGSEL1_POSITION                  0x00000009 */
/* #define _CVRCON_BGSEL1_MASK                      0x00000200 */
/* #define _CVRCON_BGSEL1_LENGTH                    0x00000001 */

/* #define _CVRCON_w_POSITION                       0x00000000 */
/* #define _CVRCON_w_MASK                           0xFFFFFFFF */
/* #define _CVRCON_w_LENGTH                         0x00000020 */

/* #define _CM1CON_CCH_POSITION                     0x00000000 */
/* #define _CM1CON_CCH_MASK                         0x00000003 */
/* #define _CM1CON_CCH_LENGTH                       0x00000002 */

/* #define _CM1CON_CREF_POSITION                    0x00000004 */
/* #define _CM1CON_CREF_MASK                        0x00000010 */
/* #define _CM1CON_CREF_LENGTH                      0x00000001 */

/* #define _CM1CON_EVPOL_POSITION                   0x00000006 */
/* #define _CM1CON_EVPOL_MASK                       0x000000C0 */
/* #define _CM1CON_EVPOL_LENGTH                     0x00000002 */

/* #define _CM1CON_COUT_POSITION                    0x00000008 */
/* #define _CM1CON_COUT_MASK                        0x00000100 */
/* #define _CM1CON_COUT_LENGTH                      0x00000001 */

/* #define _CM1CON_CLPWR_POSITION                   0x0000000C */
/* #define _CM1CON_CLPWR_MASK                       0x00001000 */
/* #define _CM1CON_CLPWR_LENGTH                     0x00000001 */

/* #define _CM1CON_CPOL_POSITION                    0x0000000D */
/* #define _CM1CON_CPOL_MASK                        0x00002000 */
/* #define _CM1CON_CPOL_LENGTH                      0x00000001 */

/* #define _CM1CON_COE_POSITION                     0x0000000E */
/* #define _CM1CON_COE_MASK                         0x00004000 */
/* #define _CM1CON_COE_LENGTH                       0x00000001 */

/* #define _CM1CON_ON_POSITION                      0x0000000F */
/* #define _CM1CON_ON_MASK                          0x00008000 */
/* #define _CM1CON_ON_LENGTH                        0x00000001 */

/* #define _CM1CON_CCH0_POSITION                    0x00000000 */
/* #define _CM1CON_CCH0_MASK                        0x00000001 */
/* #define _CM1CON_CCH0_LENGTH                      0x00000001 */

/* #define _CM1CON_CCH1_POSITION                    0x00000001 */
/* #define _CM1CON_CCH1_MASK                        0x00000002 */
/* #define _CM1CON_CCH1_LENGTH                      0x00000001 */

/* #define _CM1CON_EVPOL0_POSITION                  0x00000006 */
/* #define _CM1CON_EVPOL0_MASK                      0x00000040 */
/* #define _CM1CON_EVPOL0_LENGTH                    0x00000001 */

/* #define _CM1CON_EVPOL1_POSITION                  0x00000007 */
/* #define _CM1CON_EVPOL1_MASK                      0x00000080 */
/* #define _CM1CON_EVPOL1_LENGTH                    0x00000001 */

/* #define _CM1CON_w_POSITION                       0x00000000 */
/* #define _CM1CON_w_MASK                           0xFFFFFFFF */
/* #define _CM1CON_w_LENGTH                         0x00000020 */

/* #define _CM2CON_CCH_POSITION                     0x00000000 */
/* #define _CM2CON_CCH_MASK                         0x00000003 */
/* #define _CM2CON_CCH_LENGTH                       0x00000002 */

/* #define _CM2CON_CREF_POSITION                    0x00000004 */
/* #define _CM2CON_CREF_MASK                        0x00000010 */
/* #define _CM2CON_CREF_LENGTH                      0x00000001 */

/* #define _CM2CON_EVPOL_POSITION                   0x00000006 */
/* #define _CM2CON_EVPOL_MASK                       0x000000C0 */
/* #define _CM2CON_EVPOL_LENGTH                     0x00000002 */

/* #define _CM2CON_COUT_POSITION                    0x00000008 */
/* #define _CM2CON_COUT_MASK                        0x00000100 */
/* #define _CM2CON_COUT_LENGTH                      0x00000001 */

/* #define _CM2CON_CLPWR_POSITION                   0x0000000C */
/* #define _CM2CON_CLPWR_MASK                       0x00001000 */
/* #define _CM2CON_CLPWR_LENGTH                     0x00000001 */

/* #define _CM2CON_CPOL_POSITION                    0x0000000D */
/* #define _CM2CON_CPOL_MASK                        0x00002000 */
/* #define _CM2CON_CPOL_LENGTH                      0x00000001 */

/* #define _CM2CON_COE_POSITION                     0x0000000E */
/* #define _CM2CON_COE_MASK                         0x00004000 */
/* #define _CM2CON_COE_LENGTH                       0x00000001 */

/* #define _CM2CON_ON_POSITION                      0x0000000F */
/* #define _CM2CON_ON_MASK                          0x00008000 */
/* #define _CM2CON_ON_LENGTH                        0x00000001 */

/* #define _CM2CON_CCH0_POSITION                    0x00000000 */
/* #define _CM2CON_CCH0_MASK                        0x00000001 */
/* #define _CM2CON_CCH0_LENGTH                      0x00000001 */

/* #define _CM2CON_CCH1_POSITION                    0x00000001 */
/* #define _CM2CON_CCH1_MASK                        0x00000002 */
/* #define _CM2CON_CCH1_LENGTH                      0x00000001 */

/* #define _CM2CON_EVPOL0_POSITION                  0x00000006 */
/* #define _CM2CON_EVPOL0_MASK                      0x00000040 */
/* #define _CM2CON_EVPOL0_LENGTH                    0x00000001 */

/* #define _CM2CON_EVPOL1_POSITION                  0x00000007 */
/* #define _CM2CON_EVPOL1_MASK                      0x00000080 */
/* #define _CM2CON_EVPOL1_LENGTH                    0x00000001 */

/* #define _CM2CON_w_POSITION                       0x00000000 */
/* #define _CM2CON_w_MASK                           0xFFFFFFFF */
/* #define _CM2CON_w_LENGTH                         0x00000020 */

/* #define _CMSTAT_C1OUT_POSITION                   0x00000000 */
/* #define _CMSTAT_C1OUT_MASK                       0x00000001 */
/* #define _CMSTAT_C1OUT_LENGTH                     0x00000001 */

/* #define _CMSTAT_C2OUT_POSITION                   0x00000001 */
/* #define _CMSTAT_C2OUT_MASK                       0x00000002 */
/* #define _CMSTAT_C2OUT_LENGTH                     0x00000001 */

/* #define _CMSTAT_C3OUT_POSITION                   0x00000002 */
/* #define _CMSTAT_C3OUT_MASK                       0x00000004 */
/* #define _CMSTAT_C3OUT_LENGTH                     0x00000001 */

/* #define _CMSTAT_C4OUT_POSITION                   0x00000003 */
/* #define _CMSTAT_C4OUT_MASK                       0x00000008 */
/* #define _CMSTAT_C4OUT_LENGTH                     0x00000001 */

/* #define _CMSTAT_C5OUT_POSITION                   0x00000004 */
/* #define _CMSTAT_C5OUT_MASK                       0x00000010 */
/* #define _CMSTAT_C5OUT_LENGTH                     0x00000001 */

/* #define _CMSTAT_C6OUT_POSITION                   0x00000005 */
/* #define _CMSTAT_C6OUT_MASK                       0x00000020 */
/* #define _CMSTAT_C6OUT_LENGTH                     0x00000001 */

/* #define _CMSTAT_SIDL_POSITION                    0x0000000D */
/* #define _CMSTAT_SIDL_MASK                        0x00002000 */
/* #define _CMSTAT_SIDL_LENGTH                      0x00000001 */

/* #define _CMSTAT_w_POSITION                       0x00000000 */
/* #define _CMSTAT_w_MASK                           0xFFFFFFFF */
/* #define _CMSTAT_w_LENGTH                         0x00000020 */

/* #define _CTMUCON_IRNG_POSITION                   0x00000000 */
/* #define _CTMUCON_IRNG_MASK                       0x00000003 */
/* #define _CTMUCON_IRNG_LENGTH                     0x00000002 */

/* #define _CTMUCON_ITRIM_POSITION                  0x00000002 */
/* #define _CTMUCON_ITRIM_MASK                      0x000000FC */
/* #define _CTMUCON_ITRIM_LENGTH                    0x00000006 */

/* #define _CTMUCON_CTTRIG_POSITION                 0x00000008 */
/* #define _CTMUCON_CTTRIG_MASK                     0x00000100 */
/* #define _CTMUCON_CTTRIG_LENGTH                   0x00000001 */

/* #define _CTMUCON_IDISSEN_POSITION                0x00000009 */
/* #define _CTMUCON_IDISSEN_MASK                    0x00000200 */
/* #define _CTMUCON_IDISSEN_LENGTH                  0x00000001 */

/* #define _CTMUCON_EDGSEQEN_POSITION               0x0000000A */
/* #define _CTMUCON_EDGSEQEN_MASK                   0x00000400 */
/* #define _CTMUCON_EDGSEQEN_LENGTH                 0x00000001 */

/* #define _CTMUCON_EDGEN_POSITION                  0x0000000B */
/* #define _CTMUCON_EDGEN_MASK                      0x00000800 */
/* #define _CTMUCON_EDGEN_LENGTH                    0x00000001 */

/* #define _CTMUCON_TGEN_POSITION                   0x0000000C */
/* #define _CTMUCON_TGEN_MASK                       0x00001000 */
/* #define _CTMUCON_TGEN_LENGTH                     0x00000001 */

/* #define _CTMUCON_CTMUSIDL_POSITION               0x0000000D */
/* #define _CTMUCON_CTMUSIDL_MASK                   0x00002000 */
/* #define _CTMUCON_CTMUSIDL_LENGTH                 0x00000001 */

/* #define _CTMUCON_ON_POSITION                     0x0000000F */
/* #define _CTMUCON_ON_MASK                         0x00008000 */
/* #define _CTMUCON_ON_LENGTH                       0x00000001 */

/* #define _CTMUCON_EDG2SEL_POSITION                0x00000012 */
/* #define _CTMUCON_EDG2SEL_MASK                    0x003C0000 */
/* #define _CTMUCON_EDG2SEL_LENGTH                  0x00000004 */

/* #define _CTMUCON_EDG2POL_POSITION                0x00000016 */
/* #define _CTMUCON_EDG2POL_MASK                    0x00400000 */
/* #define _CTMUCON_EDG2POL_LENGTH                  0x00000001 */

/* #define _CTMUCON_EDG2MOD_POSITION                0x00000017 */
/* #define _CTMUCON_EDG2MOD_MASK                    0x00800000 */
/* #define _CTMUCON_EDG2MOD_LENGTH                  0x00000001 */

/* #define _CTMUCON_EDG1STAT_POSITION               0x00000018 */
/* #define _CTMUCON_EDG1STAT_MASK                   0x01000000 */
/* #define _CTMUCON_EDG1STAT_LENGTH                 0x00000001 */

/* #define _CTMUCON_EDG2STAT_POSITION               0x00000019 */
/* #define _CTMUCON_EDG2STAT_MASK                   0x02000000 */
/* #define _CTMUCON_EDG2STAT_LENGTH                 0x00000001 */

/* #define _CTMUCON_EDG1SEL_POSITION                0x0000001A */
/* #define _CTMUCON_EDG1SEL_MASK                    0x3C000000 */
/* #define _CTMUCON_EDG1SEL_LENGTH                  0x00000004 */

/* #define _CTMUCON_EDG1POL_POSITION                0x0000001E */
/* #define _CTMUCON_EDG1POL_MASK                    0x40000000 */
/* #define _CTMUCON_EDG1POL_LENGTH                  0x00000001 */

/* #define _CTMUCON_EDG1MOD_POSITION                0x0000001F */
/* #define _CTMUCON_EDG1MOD_MASK                    0x80000000 */
/* #define _CTMUCON_EDG1MOD_LENGTH                  0x00000001 */

/* #define _CTMUCON_w_POSITION                      0x00000000 */
/* #define _CTMUCON_w_MASK                          0xFFFFFFFF */
/* #define _CTMUCON_w_LENGTH                        0x00000020 */

/* #define _OSCCON_OSWEN_POSITION                   0x00000000 */
/* #define _OSCCON_OSWEN_MASK                       0x00000001 */
/* #define _OSCCON_OSWEN_LENGTH                     0x00000001 */

/* #define _OSCCON_SOSCEN_POSITION                  0x00000001 */
/* #define _OSCCON_SOSCEN_MASK                      0x00000002 */
/* #define _OSCCON_SOSCEN_LENGTH                    0x00000001 */

/* #define _OSCCON_UFRCEN_POSITION                  0x00000002 */
/* #define _OSCCON_UFRCEN_MASK                      0x00000004 */
/* #define _OSCCON_UFRCEN_LENGTH                    0x00000001 */

/* #define _OSCCON_CF_POSITION                      0x00000003 */
/* #define _OSCCON_CF_MASK                          0x00000008 */
/* #define _OSCCON_CF_LENGTH                        0x00000001 */

/* #define _OSCCON_SLPEN_POSITION                   0x00000004 */
/* #define _OSCCON_SLPEN_MASK                       0x00000010 */
/* #define _OSCCON_SLPEN_LENGTH                     0x00000001 */

/* #define _OSCCON_SLOCK_POSITION                   0x00000005 */
/* #define _OSCCON_SLOCK_MASK                       0x00000020 */
/* #define _OSCCON_SLOCK_LENGTH                     0x00000001 */

/* #define _OSCCON_ULOCK_POSITION                   0x00000006 */
/* #define _OSCCON_ULOCK_MASK                       0x00000040 */
/* #define _OSCCON_ULOCK_LENGTH                     0x00000001 */

/* #define _OSCCON_CLKLOCK_POSITION                 0x00000007 */
/* #define _OSCCON_CLKLOCK_MASK                     0x00000080 */
/* #define _OSCCON_CLKLOCK_LENGTH                   0x00000001 */

/* #define _OSCCON_NOSC_POSITION                    0x00000008 */
/* #define _OSCCON_NOSC_MASK                        0x00000700 */
/* #define _OSCCON_NOSC_LENGTH                      0x00000003 */

/* #define _OSCCON_COSC_POSITION                    0x0000000C */
/* #define _OSCCON_COSC_MASK                        0x00007000 */
/* #define _OSCCON_COSC_LENGTH                      0x00000003 */

/* #define _OSCCON_PLLMULT_POSITION                 0x00000010 */
/* #define _OSCCON_PLLMULT_MASK                     0x00070000 */
/* #define _OSCCON_PLLMULT_LENGTH                   0x00000003 */

/* #define _OSCCON_PBDIV_POSITION                   0x00000013 */
/* #define _OSCCON_PBDIV_MASK                       0x00180000 */
/* #define _OSCCON_PBDIV_LENGTH                     0x00000002 */

/* #define _OSCCON_PBDIVRDY_POSITION                0x00000015 */
/* #define _OSCCON_PBDIVRDY_MASK                    0x00200000 */
/* #define _OSCCON_PBDIVRDY_LENGTH                  0x00000001 */

/* #define _OSCCON_SOSCRDY_POSITION                 0x00000016 */
/* #define _OSCCON_SOSCRDY_MASK                     0x00400000 */
/* #define _OSCCON_SOSCRDY_LENGTH                   0x00000001 */

/* #define _OSCCON_FRCDIV_POSITION                  0x00000018 */
/* #define _OSCCON_FRCDIV_MASK                      0x07000000 */
/* #define _OSCCON_FRCDIV_LENGTH                    0x00000003 */

/* #define _OSCCON_PLLODIV_POSITION                 0x0000001B */
/* #define _OSCCON_PLLODIV_MASK                     0x38000000 */
/* #define _OSCCON_PLLODIV_LENGTH                   0x00000003 */

/* #define _OSCCON_NOSC0_POSITION                   0x00000008 */
/* #define _OSCCON_NOSC0_MASK                       0x00000100 */
/* #define _OSCCON_NOSC0_LENGTH                     0x00000001 */

/* #define _OSCCON_NOSC1_POSITION                   0x00000009 */
/* #define _OSCCON_NOSC1_MASK                       0x00000200 */
/* #define _OSCCON_NOSC1_LENGTH                     0x00000001 */

/* #define _OSCCON_NOSC2_POSITION                   0x0000000A */
/* #define _OSCCON_NOSC2_MASK                       0x00000400 */
/* #define _OSCCON_NOSC2_LENGTH                     0x00000001 */

/* #define _OSCCON_COSC0_POSITION                   0x0000000C */
/* #define _OSCCON_COSC0_MASK                       0x00001000 */
/* #define _OSCCON_COSC0_LENGTH                     0x00000001 */

/* #define _OSCCON_COSC1_POSITION                   0x0000000D */
/* #define _OSCCON_COSC1_MASK                       0x00002000 */
/* #define _OSCCON_COSC1_LENGTH                     0x00000001 */

/* #define _OSCCON_COSC2_POSITION                   0x0000000E */
/* #define _OSCCON_COSC2_MASK                       0x00004000 */
/* #define _OSCCON_COSC2_LENGTH                     0x00000001 */

/* #define _OSCCON_PLLMULT0_POSITION                0x00000010 */
/* #define _OSCCON_PLLMULT0_MASK                    0x00010000 */
/* #define _OSCCON_PLLMULT0_LENGTH                  0x00000001 */

/* #define _OSCCON_PLLMULT1_POSITION                0x00000011 */
/* #define _OSCCON_PLLMULT1_MASK                    0x00020000 */
/* #define _OSCCON_PLLMULT1_LENGTH                  0x00000001 */

/* #define _OSCCON_PLLMULT2_POSITION                0x00000012 */
/* #define _OSCCON_PLLMULT2_MASK                    0x00040000 */
/* #define _OSCCON_PLLMULT2_LENGTH                  0x00000001 */

/* #define _OSCCON_PBDIV0_POSITION                  0x00000013 */
/* #define _OSCCON_PBDIV0_MASK                      0x00080000 */
/* #define _OSCCON_PBDIV0_LENGTH                    0x00000001 */

/* #define _OSCCON_PBDIV1_POSITION                  0x00000014 */
/* #define _OSCCON_PBDIV1_MASK                      0x00100000 */
/* #define _OSCCON_PBDIV1_LENGTH                    0x00000001 */

/* #define _OSCCON_FRCDIV0_POSITION                 0x00000018 */
/* #define _OSCCON_FRCDIV0_MASK                     0x01000000 */
/* #define _OSCCON_FRCDIV0_LENGTH                   0x00000001 */

/* #define _OSCCON_FRCDIV1_POSITION                 0x00000019 */
/* #define _OSCCON_FRCDIV1_MASK                     0x02000000 */
/* #define _OSCCON_FRCDIV1_LENGTH                   0x00000001 */

/* #define _OSCCON_FRCDIV2_POSITION                 0x0000001A */
/* #define _OSCCON_FRCDIV2_MASK                     0x04000000 */
/* #define _OSCCON_FRCDIV2_LENGTH                   0x00000001 */

/* #define _OSCCON_PLLODIV0_POSITION                0x0000001B */
/* #define _OSCCON_PLLODIV0_MASK                    0x08000000 */
/* #define _OSCCON_PLLODIV0_LENGTH                  0x00000001 */

/* #define _OSCCON_PLLODIV1_POSITION                0x0000001C */
/* #define _OSCCON_PLLODIV1_MASK                    0x10000000 */
/* #define _OSCCON_PLLODIV1_LENGTH                  0x00000001 */

/* #define _OSCCON_PLLODIV2_POSITION                0x0000001D */
/* #define _OSCCON_PLLODIV2_MASK                    0x20000000 */
/* #define _OSCCON_PLLODIV2_LENGTH                  0x00000001 */

/* #define _OSCCON_w_POSITION                       0x00000000 */
/* #define _OSCCON_w_MASK                           0xFFFFFFFF */
/* #define _OSCCON_w_LENGTH                         0x00000020 */

/* #define _OSCTUN_TUN_POSITION                     0x00000000 */
/* #define _OSCTUN_TUN_MASK                         0x0000003F */
/* #define _OSCTUN_TUN_LENGTH                       0x00000006 */

/* #define _OSCTUN_TUN0_POSITION                    0x00000000 */
/* #define _OSCTUN_TUN0_MASK                        0x00000001 */
/* #define _OSCTUN_TUN0_LENGTH                      0x00000001 */

/* #define _OSCTUN_TUN1_POSITION                    0x00000001 */
/* #define _OSCTUN_TUN1_MASK                        0x00000002 */
/* #define _OSCTUN_TUN1_LENGTH                      0x00000001 */

/* #define _OSCTUN_TUN2_POSITION                    0x00000002 */
/* #define _OSCTUN_TUN2_MASK                        0x00000004 */
/* #define _OSCTUN_TUN2_LENGTH                      0x00000001 */

/* #define _OSCTUN_TUN3_POSITION                    0x00000003 */
/* #define _OSCTUN_TUN3_MASK                        0x00000008 */
/* #define _OSCTUN_TUN3_LENGTH                      0x00000001 */

/* #define _OSCTUN_TUN4_POSITION                    0x00000004 */
/* #define _OSCTUN_TUN4_MASK                        0x00000010 */
/* #define _OSCTUN_TUN4_LENGTH                      0x00000001 */

/* #define _OSCTUN_TUN5_POSITION                    0x00000005 */
/* #define _OSCTUN_TUN5_MASK                        0x00000020 */
/* #define _OSCTUN_TUN5_LENGTH                      0x00000001 */

/* #define _OSCTUN_w_POSITION                       0x00000000 */
/* #define _OSCTUN_w_MASK                           0xFFFFFFFF */
/* #define _OSCTUN_w_LENGTH                         0x00000020 */

/* #define _REFOCON_ROSEL_POSITION                  0x00000000 */
/* #define _REFOCON_ROSEL_MASK                      0x0000000F */
/* #define _REFOCON_ROSEL_LENGTH                    0x00000004 */

/* #define _REFOCON_ACTIVE_POSITION                 0x00000008 */
/* #define _REFOCON_ACTIVE_MASK                     0x00000100 */
/* #define _REFOCON_ACTIVE_LENGTH                   0x00000001 */

/* #define _REFOCON_DIVSWEN_POSITION                0x00000009 */
/* #define _REFOCON_DIVSWEN_MASK                    0x00000200 */
/* #define _REFOCON_DIVSWEN_LENGTH                  0x00000001 */

/* #define _REFOCON_RSLP_POSITION                   0x0000000B */
/* #define _REFOCON_RSLP_MASK                       0x00000800 */
/* #define _REFOCON_RSLP_LENGTH                     0x00000001 */

/* #define _REFOCON_OE_POSITION                     0x0000000C */
/* #define _REFOCON_OE_MASK                         0x00001000 */
/* #define _REFOCON_OE_LENGTH                       0x00000001 */

/* #define _REFOCON_SIDL_POSITION                   0x0000000D */
/* #define _REFOCON_SIDL_MASK                       0x00002000 */
/* #define _REFOCON_SIDL_LENGTH                     0x00000001 */

/* #define _REFOCON_ON_POSITION                     0x0000000F */
/* #define _REFOCON_ON_MASK                         0x00008000 */
/* #define _REFOCON_ON_LENGTH                       0x00000001 */

/* #define _REFOCON_RODIV_POSITION                  0x00000010 */
/* #define _REFOCON_RODIV_MASK                      0x7FFF0000 */
/* #define _REFOCON_RODIV_LENGTH                    0x0000000F */

/* #define _REFOCON_w_POSITION                      0x00000000 */
/* #define _REFOCON_w_MASK                          0xFFFFFFFF */
/* #define _REFOCON_w_LENGTH                        0x00000020 */

/* #define _REFOTRIM_ROTRIM_POSITION                0x00000017 */
/* #define _REFOTRIM_ROTRIM_MASK                    0xFF800000 */
/* #define _REFOTRIM_ROTRIM_LENGTH                  0x00000009 */

/* #define _REFOTRIM_w_POSITION                     0x00000000 */
/* #define _REFOTRIM_w_MASK                         0xFFFFFFFF */
/* #define _REFOTRIM_w_LENGTH                       0x00000020 */

/* #define _CFGCON_TDOEN_POSITION                   0x00000000 */
/* #define _CFGCON_TDOEN_MASK                       0x00000001 */
/* #define _CFGCON_TDOEN_LENGTH                     0x00000001 */

/* #define _CFGCON_TROEN_POSITION                   0x00000002 */
/* #define _CFGCON_TROEN_MASK                       0x00000004 */
/* #define _CFGCON_TROEN_LENGTH                     0x00000001 */

/* #define _CFGCON_JTAGEN_POSITION                  0x00000003 */
/* #define _CFGCON_JTAGEN_MASK                      0x00000008 */
/* #define _CFGCON_JTAGEN_LENGTH                    0x00000001 */

/* #define _CFGCON_PMDLOCK_POSITION                 0x0000000C */
/* #define _CFGCON_PMDLOCK_MASK                     0x00001000 */
/* #define _CFGCON_PMDLOCK_LENGTH                   0x00000001 */

/* #define _CFGCON_IOLOCK_POSITION                  0x0000000D */
/* #define _CFGCON_IOLOCK_MASK                      0x00002000 */
/* #define _CFGCON_IOLOCK_LENGTH                    0x00000001 */

/* #define _DDPCON_TDOEN_POSITION                   0x00000000 */
/* #define _DDPCON_TDOEN_MASK                       0x00000001 */
/* #define _DDPCON_TDOEN_LENGTH                     0x00000001 */

/* #define _DDPCON_TROEN_POSITION                   0x00000002 */
/* #define _DDPCON_TROEN_MASK                       0x00000004 */
/* #define _DDPCON_TROEN_LENGTH                     0x00000001 */

/* #define _DDPCON_JTAGEN_POSITION                  0x00000003 */
/* #define _DDPCON_JTAGEN_MASK                      0x00000008 */
/* #define _DDPCON_JTAGEN_LENGTH                    0x00000001 */

/* #define _DDPCON_PMDLOCK_POSITION                 0x0000000C */
/* #define _DDPCON_PMDLOCK_MASK                     0x00001000 */
/* #define _DDPCON_PMDLOCK_LENGTH                   0x00000001 */

/* #define _DDPCON_IOLOCK_POSITION                  0x0000000D */
/* #define _DDPCON_IOLOCK_MASK                      0x00002000 */
/* #define _DDPCON_IOLOCK_LENGTH                    0x00000001 */

/* #define _DEVID_DEVID_POSITION                    0x00000000 */
/* #define _DEVID_DEVID_MASK                        0x0FFFFFFF */
/* #define _DEVID_DEVID_LENGTH                      0x0000001C */

/* #define _DEVID_VER_POSITION                      0x0000001C */
/* #define _DEVID_VER_MASK                          0xF0000000 */
/* #define _DEVID_VER_LENGTH                        0x00000004 */

/* #define _PMD1_AD1MD_POSITION                     0x00000000 */
/* #define _PMD1_AD1MD_MASK                         0x00000001 */
/* #define _PMD1_AD1MD_LENGTH                       0x00000001 */

/* #define _PMD1_CTMUMD_POSITION                    0x00000008 */
/* #define _PMD1_CTMUMD_MASK                        0x00000100 */
/* #define _PMD1_CTMUMD_LENGTH                      0x00000001 */

/* #define _PMD1_CVRMD_POSITION                     0x0000000C */
/* #define _PMD1_CVRMD_MASK                         0x00001000 */
/* #define _PMD1_CVRMD_LENGTH                       0x00000001 */

/* #define _PMD2_CMP1MD_POSITION                    0x00000000 */
/* #define _PMD2_CMP1MD_MASK                        0x00000001 */
/* #define _PMD2_CMP1MD_LENGTH                      0x00000001 */

/* #define _PMD2_CMP2MD_POSITION                    0x00000001 */
/* #define _PMD2_CMP2MD_MASK                        0x00000002 */
/* #define _PMD2_CMP2MD_LENGTH                      0x00000001 */

/* #define _PMD3_IC1MD_POSITION                     0x00000000 */
/* #define _PMD3_IC1MD_MASK                         0x00000001 */
/* #define _PMD3_IC1MD_LENGTH                       0x00000001 */

/* #define _PMD3_IC2MD_POSITION                     0x00000001 */
/* #define _PMD3_IC2MD_MASK                         0x00000002 */
/* #define _PMD3_IC2MD_LENGTH                       0x00000001 */

/* #define _PMD3_IC3MD_POSITION                     0x00000002 */
/* #define _PMD3_IC3MD_MASK                         0x00000004 */
/* #define _PMD3_IC3MD_LENGTH                       0x00000001 */

/* #define _PMD3_IC4MD_POSITION                     0x00000003 */
/* #define _PMD3_IC4MD_MASK                         0x00000008 */
/* #define _PMD3_IC4MD_LENGTH                       0x00000001 */

/* #define _PMD3_IC5MD_POSITION                     0x00000004 */
/* #define _PMD3_IC5MD_MASK                         0x00000010 */
/* #define _PMD3_IC5MD_LENGTH                       0x00000001 */

/* #define _PMD3_OC1MD_POSITION                     0x00000010 */
/* #define _PMD3_OC1MD_MASK                         0x00010000 */
/* #define _PMD3_OC1MD_LENGTH                       0x00000001 */

/* #define _PMD3_OC2MD_POSITION                     0x00000011 */
/* #define _PMD3_OC2MD_MASK                         0x00020000 */
/* #define _PMD3_OC2MD_LENGTH                       0x00000001 */

/* #define _PMD3_OC3MD_POSITION                     0x00000012 */
/* #define _PMD3_OC3MD_MASK                         0x00040000 */
/* #define _PMD3_OC3MD_LENGTH                       0x00000001 */

/* #define _PMD3_OC4MD_POSITION                     0x00000013 */
/* #define _PMD3_OC4MD_MASK                         0x00080000 */
/* #define _PMD3_OC4MD_LENGTH                       0x00000001 */

/* #define _PMD3_OC5MD_POSITION                     0x00000014 */
/* #define _PMD3_OC5MD_MASK                         0x00100000 */
/* #define _PMD3_OC5MD_LENGTH                       0x00000001 */

/* #define _PMD4_T1MD_POSITION                      0x00000000 */
/* #define _PMD4_T1MD_MASK                          0x00000001 */
/* #define _PMD4_T1MD_LENGTH                        0x00000001 */

/* #define _PMD4_T2MD_POSITION                      0x00000001 */
/* #define _PMD4_T2MD_MASK                          0x00000002 */
/* #define _PMD4_T2MD_LENGTH                        0x00000001 */

/* #define _PMD4_T3MD_POSITION                      0x00000002 */
/* #define _PMD4_T3MD_MASK                          0x00000004 */
/* #define _PMD4_T3MD_LENGTH                        0x00000001 */

/* #define _PMD4_T4MD_POSITION                      0x00000003 */
/* #define _PMD4_T4MD_MASK                          0x00000008 */
/* #define _PMD4_T4MD_LENGTH                        0x00000001 */

/* #define _PMD4_T5MD_POSITION                      0x00000004 */
/* #define _PMD4_T5MD_MASK                          0x00000010 */
/* #define _PMD4_T5MD_LENGTH                        0x00000001 */

/* #define _PMD5_U1MD_POSITION                      0x00000000 */
/* #define _PMD5_U1MD_MASK                          0x00000001 */
/* #define _PMD5_U1MD_LENGTH                        0x00000001 */

/* #define _PMD5_U2MD_POSITION                      0x00000001 */
/* #define _PMD5_U2MD_MASK                          0x00000002 */
/* #define _PMD5_U2MD_LENGTH                        0x00000001 */

/* #define _PMD5_U3MD_POSITION                      0x00000002 */
/* #define _PMD5_U3MD_MASK                          0x00000004 */
/* #define _PMD5_U3MD_LENGTH                        0x00000001 */

/* #define _PMD5_U4MD_POSITION                      0x00000003 */
/* #define _PMD5_U4MD_MASK                          0x00000008 */
/* #define _PMD5_U4MD_LENGTH                        0x00000001 */

/* #define _PMD5_SPI1MD_POSITION                    0x00000008 */
/* #define _PMD5_SPI1MD_MASK                        0x00000100 */
/* #define _PMD5_SPI1MD_LENGTH                      0x00000001 */

/* #define _PMD5_SPI2MD_POSITION                    0x00000009 */
/* #define _PMD5_SPI2MD_MASK                        0x00000200 */
/* #define _PMD5_SPI2MD_LENGTH                      0x00000001 */

/* #define _PMD5_I2C1MD_POSITION                    0x00000010 */
/* #define _PMD5_I2C1MD_MASK                        0x00010000 */
/* #define _PMD5_I2C1MD_LENGTH                      0x00000001 */

/* #define _PMD5_I2C2MD_POSITION                    0x00000011 */
/* #define _PMD5_I2C2MD_MASK                        0x00020000 */
/* #define _PMD5_I2C2MD_LENGTH                      0x00000001 */

/* #define _PMD5_USB1MD_POSITION                    0x00000018 */
/* #define _PMD5_USB1MD_MASK                        0x01000000 */
/* #define _PMD5_USB1MD_LENGTH                      0x00000001 */

/* #define _PMD6_RTCCMD_POSITION                    0x00000000 */
/* #define _PMD6_RTCCMD_MASK                        0x00000001 */
/* #define _PMD6_RTCCMD_LENGTH                      0x00000001 */

/* #define _PMD6_REFOMD_POSITION                    0x00000001 */
/* #define _PMD6_REFOMD_MASK                        0x00000002 */
/* #define _PMD6_REFOMD_LENGTH                      0x00000001 */

/* #define _PMD6_PMPMD_POSITION                     0x00000010 */
/* #define _PMD6_PMPMD_MASK                         0x00010000 */
/* #define _PMD6_PMPMD_LENGTH                       0x00000001 */

/* #define _NVMCON_NVMOP_POSITION                   0x00000000 */
/* #define _NVMCON_NVMOP_MASK                       0x0000000F */
/* #define _NVMCON_NVMOP_LENGTH                     0x00000004 */

/* #define _NVMCON_LVDSTAT_POSITION                 0x0000000B */
/* #define _NVMCON_LVDSTAT_MASK                     0x00000800 */
/* #define _NVMCON_LVDSTAT_LENGTH                   0x00000001 */

/* #define _NVMCON_LVDERR_POSITION                  0x0000000C */
/* #define _NVMCON_LVDERR_MASK                      0x00001000 */
/* #define _NVMCON_LVDERR_LENGTH                    0x00000001 */

/* #define _NVMCON_WRERR_POSITION                   0x0000000D */
/* #define _NVMCON_WRERR_MASK                       0x00002000 */
/* #define _NVMCON_WRERR_LENGTH                     0x00000001 */

/* #define _NVMCON_WREN_POSITION                    0x0000000E */
/* #define _NVMCON_WREN_MASK                        0x00004000 */
/* #define _NVMCON_WREN_LENGTH                      0x00000001 */

/* #define _NVMCON_WR_POSITION                      0x0000000F */
/* #define _NVMCON_WR_MASK                          0x00008000 */
/* #define _NVMCON_WR_LENGTH                        0x00000001 */

/* #define _NVMCON_NVMOP0_POSITION                  0x00000000 */
/* #define _NVMCON_NVMOP0_MASK                      0x00000001 */
/* #define _NVMCON_NVMOP0_LENGTH                    0x00000001 */

/* #define _NVMCON_NVMOP1_POSITION                  0x00000001 */
/* #define _NVMCON_NVMOP1_MASK                      0x00000002 */
/* #define _NVMCON_NVMOP1_LENGTH                    0x00000001 */

/* #define _NVMCON_NVMOP2_POSITION                  0x00000002 */
/* #define _NVMCON_NVMOP2_MASK                      0x00000004 */
/* #define _NVMCON_NVMOP2_LENGTH                    0x00000001 */

/* #define _NVMCON_NVMOP3_POSITION                  0x00000003 */
/* #define _NVMCON_NVMOP3_MASK                      0x00000008 */
/* #define _NVMCON_NVMOP3_LENGTH                    0x00000001 */

/* #define _NVMCON_PROGOP_POSITION                  0x00000000 */
/* #define _NVMCON_PROGOP_MASK                      0x0000000F */
/* #define _NVMCON_PROGOP_LENGTH                    0x00000004 */

/* #define _NVMCON_PROGOP0_POSITION                 0x00000000 */
/* #define _NVMCON_PROGOP0_MASK                     0x00000001 */
/* #define _NVMCON_PROGOP0_LENGTH                   0x00000001 */

/* #define _NVMCON_PROGOP1_POSITION                 0x00000001 */
/* #define _NVMCON_PROGOP1_MASK                     0x00000002 */
/* #define _NVMCON_PROGOP1_LENGTH                   0x00000001 */

/* #define _NVMCON_PROGOP2_POSITION                 0x00000002 */
/* #define _NVMCON_PROGOP2_MASK                     0x00000004 */
/* #define _NVMCON_PROGOP2_LENGTH                   0x00000001 */

/* #define _NVMCON_PROGOP3_POSITION                 0x00000003 */
/* #define _NVMCON_PROGOP3_MASK                     0x00000008 */
/* #define _NVMCON_PROGOP3_LENGTH                   0x00000001 */

/* #define _NVMCON_w_POSITION                       0x00000000 */
/* #define _NVMCON_w_MASK                           0xFFFFFFFF */
/* #define _NVMCON_w_LENGTH                         0x00000020 */

/* #define _RCON_POR_POSITION                       0x00000000 */
/* #define _RCON_POR_MASK                           0x00000001 */
/* #define _RCON_POR_LENGTH                         0x00000001 */

/* #define _RCON_BOR_POSITION                       0x00000001 */
/* #define _RCON_BOR_MASK                           0x00000002 */
/* #define _RCON_BOR_LENGTH                         0x00000001 */

/* #define _RCON_IDLE_POSITION                      0x00000002 */
/* #define _RCON_IDLE_MASK                          0x00000004 */
/* #define _RCON_IDLE_LENGTH                        0x00000001 */

/* #define _RCON_SLEEP_POSITION                     0x00000003 */
/* #define _RCON_SLEEP_MASK                         0x00000008 */
/* #define _RCON_SLEEP_LENGTH                       0x00000001 */

/* #define _RCON_WDTO_POSITION                      0x00000004 */
/* #define _RCON_WDTO_MASK                          0x00000010 */
/* #define _RCON_WDTO_LENGTH                        0x00000001 */

/* #define _RCON_SWR_POSITION                       0x00000006 */
/* #define _RCON_SWR_MASK                           0x00000040 */
/* #define _RCON_SWR_LENGTH                         0x00000001 */

/* #define _RCON_EXTR_POSITION                      0x00000007 */
/* #define _RCON_EXTR_MASK                          0x00000080 */
/* #define _RCON_EXTR_LENGTH                        0x00000001 */

/* #define _RCON_VREGS_POSITION                     0x00000008 */
/* #define _RCON_VREGS_MASK                         0x00000100 */
/* #define _RCON_VREGS_LENGTH                       0x00000001 */

/* #define _RCON_CMR_POSITION                       0x00000009 */
/* #define _RCON_CMR_MASK                           0x00000200 */
/* #define _RCON_CMR_LENGTH                         0x00000001 */

/* #define _RCON_HVDR_POSITION                      0x0000001D */
/* #define _RCON_HVDR_MASK                          0x20000000 */
/* #define _RCON_HVDR_LENGTH                        0x00000001 */

/* #define _RCON_w_POSITION                         0x00000000 */
/* #define _RCON_w_MASK                             0xFFFFFFFF */
/* #define _RCON_w_LENGTH                           0x00000020 */

/* #define _RSWRST_SWRST_POSITION                   0x00000000 */
/* #define _RSWRST_SWRST_MASK                       0x00000001 */
/* #define _RSWRST_SWRST_LENGTH                     0x00000001 */

/* #define _RSWRST_w_POSITION                       0x00000000 */
/* #define _RSWRST_w_MASK                           0xFFFFFFFF */
/* #define _RSWRST_w_LENGTH                         0x00000020 */

/* #define _INT1R_INT1R_POSITION                    0x00000000 */
/* #define _INT1R_INT1R_MASK                        0x0000000F */
/* #define _INT1R_INT1R_LENGTH                      0x00000004 */

/* #define _INT2R_INT2R_POSITION                    0x00000000 */
/* #define _INT2R_INT2R_MASK                        0x0000000F */
/* #define _INT2R_INT2R_LENGTH                      0x00000004 */

/* #define _INT3R_INT3R_POSITION                    0x00000000 */
/* #define _INT3R_INT3R_MASK                        0x0000000F */
/* #define _INT3R_INT3R_LENGTH                      0x00000004 */

/* #define _INT4R_INT4R_POSITION                    0x00000000 */
/* #define _INT4R_INT4R_MASK                        0x0000000F */
/* #define _INT4R_INT4R_LENGTH                      0x00000004 */

/* #define _T2CKR_T2CKR_POSITION                    0x00000000 */
/* #define _T2CKR_T2CKR_MASK                        0x0000000F */
/* #define _T2CKR_T2CKR_LENGTH                      0x00000004 */

/* #define _T3CKR_T3CKR_POSITION                    0x00000000 */
/* #define _T3CKR_T3CKR_MASK                        0x0000000F */
/* #define _T3CKR_T3CKR_LENGTH                      0x00000004 */

/* #define _T4CKR_T4CKR_POSITION                    0x00000000 */
/* #define _T4CKR_T4CKR_MASK                        0x0000000F */
/* #define _T4CKR_T4CKR_LENGTH                      0x00000004 */

/* #define _T5CKR_T5CKR_POSITION                    0x00000000 */
/* #define _T5CKR_T5CKR_MASK                        0x0000000F */
/* #define _T5CKR_T5CKR_LENGTH                      0x00000004 */

/* #define _IC1R_IC1R_POSITION                      0x00000000 */
/* #define _IC1R_IC1R_MASK                          0x0000000F */
/* #define _IC1R_IC1R_LENGTH                        0x00000004 */

/* #define _IC2R_IC2R_POSITION                      0x00000000 */
/* #define _IC2R_IC2R_MASK                          0x0000000F */
/* #define _IC2R_IC2R_LENGTH                        0x00000004 */

/* #define _IC3R_IC3R_POSITION                      0x00000000 */
/* #define _IC3R_IC3R_MASK                          0x0000000F */
/* #define _IC3R_IC3R_LENGTH                        0x00000004 */

/* #define _IC4R_IC4R_POSITION                      0x00000000 */
/* #define _IC4R_IC4R_MASK                          0x0000000F */
/* #define _IC4R_IC4R_LENGTH                        0x00000004 */

/* #define _IC5R_IC5R_POSITION                      0x00000000 */
/* #define _IC5R_IC5R_MASK                          0x0000000F */
/* #define _IC5R_IC5R_LENGTH                        0x00000004 */

/* #define _OCFAR_OCFAR_POSITION                    0x00000000 */
/* #define _OCFAR_OCFAR_MASK                        0x0000000F */
/* #define _OCFAR_OCFAR_LENGTH                      0x00000004 */

/* #define _OCFBR_OCFBR_POSITION                    0x00000000 */
/* #define _OCFBR_OCFBR_MASK                        0x0000000F */
/* #define _OCFBR_OCFBR_LENGTH                      0x00000004 */

/* #define _U1RXR_U1RXR_POSITION                    0x00000000 */
/* #define _U1RXR_U1RXR_MASK                        0x0000000F */
/* #define _U1RXR_U1RXR_LENGTH                      0x00000004 */

/* #define _U1CTSR_U1CTSR_POSITION                  0x00000000 */
/* #define _U1CTSR_U1CTSR_MASK                      0x0000000F */
/* #define _U1CTSR_U1CTSR_LENGTH                    0x00000004 */

/* #define _U2RXR_U2RXR_POSITION                    0x00000000 */
/* #define _U2RXR_U2RXR_MASK                        0x0000000F */
/* #define _U2RXR_U2RXR_LENGTH                      0x00000004 */

/* #define _U2CTSR_U2CTSR_POSITION                  0x00000000 */
/* #define _U2CTSR_U2CTSR_MASK                      0x0000000F */
/* #define _U2CTSR_U2CTSR_LENGTH                    0x00000004 */

/* #define _U3RXR_U3RXR_POSITION                    0x00000000 */
/* #define _U3RXR_U3RXR_MASK                        0x0000000F */
/* #define _U3RXR_U3RXR_LENGTH                      0x00000004 */

/* #define _U3CTSR_U3CTSR_POSITION                  0x00000000 */
/* #define _U3CTSR_U3CTSR_MASK                      0x0000000F */
/* #define _U3CTSR_U3CTSR_LENGTH                    0x00000004 */

/* #define _U4RXR_U4RXR_POSITION                    0x00000000 */
/* #define _U4RXR_U4RXR_MASK                        0x0000000F */
/* #define _U4RXR_U4RXR_LENGTH                      0x00000004 */

/* #define _U4CTSR_U4CTSR_POSITION                  0x00000000 */
/* #define _U4CTSR_U4CTSR_MASK                      0x0000000F */
/* #define _U4CTSR_U4CTSR_LENGTH                    0x00000004 */

/* #define _U5RXR_U5RXR_POSITION                    0x00000000 */
/* #define _U5RXR_U5RXR_MASK                        0x0000000F */
/* #define _U5RXR_U5RXR_LENGTH                      0x00000004 */

/* #define _U5CTSR_U5CTSR_POSITION                  0x00000000 */
/* #define _U5CTSR_U5CTSR_MASK                      0x0000000F */
/* #define _U5CTSR_U5CTSR_LENGTH                    0x00000004 */

/* #define _SDI1R_SDI1R_POSITION                    0x00000000 */
/* #define _SDI1R_SDI1R_MASK                        0x0000000F */
/* #define _SDI1R_SDI1R_LENGTH                      0x00000004 */

/* #define _SS1R_SS1R_POSITION                      0x00000000 */
/* #define _SS1R_SS1R_MASK                          0x0000000F */
/* #define _SS1R_SS1R_LENGTH                        0x00000004 */

/* #define _SDI2R_SDI2R_POSITION                    0x00000000 */
/* #define _SDI2R_SDI2R_MASK                        0x0000000F */
/* #define _SDI2R_SDI2R_LENGTH                      0x00000004 */

/* #define _SS2R_SS2R_POSITION                      0x00000000 */
/* #define _SS2R_SS2R_MASK                          0x0000000F */
/* #define _SS2R_SS2R_LENGTH                        0x00000004 */

/* #define _REFCLKIR_REFCLKIR_POSITION              0x00000000 */
/* #define _REFCLKIR_REFCLKIR_MASK                  0x0000000F */
/* #define _REFCLKIR_REFCLKIR_LENGTH                0x00000004 */

/* #define _RPB0R_RPB0R_POSITION                    0x00000000 */
/* #define _RPB0R_RPB0R_MASK                        0x0000000F */
/* #define _RPB0R_RPB0R_LENGTH                      0x00000004 */

/* #define _RPB1R_RPB1R_POSITION                    0x00000000 */
/* #define _RPB1R_RPB1R_MASK                        0x0000000F */
/* #define _RPB1R_RPB1R_LENGTH                      0x00000004 */

/* #define _RPB2R_RPB2R_POSITION                    0x00000000 */
/* #define _RPB2R_RPB2R_MASK                        0x0000000F */
/* #define _RPB2R_RPB2R_LENGTH                      0x00000004 */

/* #define _RPB3R_RPB3R_POSITION                    0x00000000 */
/* #define _RPB3R_RPB3R_MASK                        0x0000000F */
/* #define _RPB3R_RPB3R_LENGTH                      0x00000004 */

/* #define _RPB5R_RPB5R_POSITION                    0x00000000 */
/* #define _RPB5R_RPB5R_MASK                        0x0000000F */
/* #define _RPB5R_RPB5R_LENGTH                      0x00000004 */

/* #define _RPB6R_RPB6R_POSITION                    0x00000000 */
/* #define _RPB6R_RPB6R_MASK                        0x0000000F */
/* #define _RPB6R_RPB6R_LENGTH                      0x00000004 */

/* #define _RPB7R_RPB7R_POSITION                    0x00000000 */
/* #define _RPB7R_RPB7R_MASK                        0x0000000F */
/* #define _RPB7R_RPB7R_LENGTH                      0x00000004 */

/* #define _RPB8R_RPB8R_POSITION                    0x00000000 */
/* #define _RPB8R_RPB8R_MASK                        0x0000000F */
/* #define _RPB8R_RPB8R_LENGTH                      0x00000004 */

/* #define _RPB9R_RPB9R_POSITION                    0x00000000 */
/* #define _RPB9R_RPB9R_MASK                        0x0000000F */
/* #define _RPB9R_RPB9R_LENGTH                      0x00000004 */

/* #define _RPB10R_RPB10R_POSITION                  0x00000000 */
/* #define _RPB10R_RPB10R_MASK                      0x0000000F */
/* #define _RPB10R_RPB10R_LENGTH                    0x00000004 */

/* #define _RPB14R_RPB14R_POSITION                  0x00000000 */
/* #define _RPB14R_RPB14R_MASK                      0x0000000F */
/* #define _RPB14R_RPB14R_LENGTH                    0x00000004 */

/* #define _RPB15R_RPB15R_POSITION                  0x00000000 */
/* #define _RPB15R_RPB15R_MASK                      0x0000000F */
/* #define _RPB15R_RPB15R_LENGTH                    0x00000004 */

/* #define _RPD0R_RPD0R_POSITION                    0x00000000 */
/* #define _RPD0R_RPD0R_MASK                        0x0000000F */
/* #define _RPD0R_RPD0R_LENGTH                      0x00000004 */

/* #define _RPD1R_RPD1R_POSITION                    0x00000000 */
/* #define _RPD1R_RPD1R_MASK                        0x0000000F */
/* #define _RPD1R_RPD1R_LENGTH                      0x00000004 */

/* #define _RPD2R_RPD2R_POSITION                    0x00000000 */
/* #define _RPD2R_RPD2R_MASK                        0x0000000F */
/* #define _RPD2R_RPD2R_LENGTH                      0x00000004 */

/* #define _RPD3R_RPD3R_POSITION                    0x00000000 */
/* #define _RPD3R_RPD3R_MASK                        0x0000000F */
/* #define _RPD3R_RPD3R_LENGTH                      0x00000004 */

/* #define _RPD4R_RPD4R_POSITION                    0x00000000 */
/* #define _RPD4R_RPD4R_MASK                        0x0000000F */
/* #define _RPD4R_RPD4R_LENGTH                      0x00000004 */

/* #define _RPD5R_RPD5R_POSITION                    0x00000000 */
/* #define _RPD5R_RPD5R_MASK                        0x0000000F */
/* #define _RPD5R_RPD5R_LENGTH                      0x00000004 */

/* #define _RPD8R_RPD8R_POSITION                    0x00000000 */
/* #define _RPD8R_RPD8R_MASK                        0x0000000F */
/* #define _RPD8R_RPD8R_LENGTH                      0x00000004 */

/* #define _RPD9R_RPD9R_POSITION                    0x00000000 */
/* #define _RPD9R_RPD9R_MASK                        0x0000000F */
/* #define _RPD9R_RPD9R_LENGTH                      0x00000004 */

/* #define _RPD10R_RPD10R_POSITION                  0x00000000 */
/* #define _RPD10R_RPD10R_MASK                      0x0000000F */
/* #define _RPD10R_RPD10R_LENGTH                    0x00000004 */

/* #define _RPD11R_RPD11R_POSITION                  0x00000000 */
/* #define _RPD11R_RPD11R_MASK                      0x0000000F */
/* #define _RPD11R_RPD11R_LENGTH                    0x00000004 */

/* #define _RPD12R_RPD12R_POSITION                  0x00000000 */
/* #define _RPD12R_RPD12R_MASK                      0x0000000F */
/* #define _RPD12R_RPD12R_LENGTH                    0x00000004 */

/* #define _RPD14R_RPD14R_POSITION                  0x00000000 */
/* #define _RPD14R_RPD14R_MASK                      0x0000000F */
/* #define _RPD14R_RPD14R_LENGTH                    0x00000004 */

/* #define _RPD15R_RPD15R_POSITION                  0x00000000 */
/* #define _RPD15R_RPD15R_MASK                      0x0000000F */
/* #define _RPD15R_RPD15R_LENGTH                    0x00000004 */

/* #define _RPE3R_RPE3R_POSITION                    0x00000000 */
/* #define _RPE3R_RPE3R_MASK                        0x0000000F */
/* #define _RPE3R_RPE3R_LENGTH                      0x00000004 */

/* #define _RPE5R_RPE5R_POSITION                    0x00000000 */
/* #define _RPE5R_RPE5R_MASK                        0x0000000F */
/* #define _RPE5R_RPE5R_LENGTH                      0x00000004 */

/* #define _RPE8R_RPE8R_POSITION                    0x00000000 */
/* #define _RPE8R_RPE8R_MASK                        0x0000000F */
/* #define _RPE8R_RPE8R_LENGTH                      0x00000004 */

/* #define _RPE9R_RPE9R_POSITION                    0x00000000 */
/* #define _RPE9R_RPE9R_MASK                        0x0000000F */
/* #define _RPE9R_RPE9R_LENGTH                      0x00000004 */

/* #define _RPF0R_RPF0R_POSITION                    0x00000000 */
/* #define _RPF0R_RPF0R_MASK                        0x0000000F */
/* #define _RPF0R_RPF0R_LENGTH                      0x00000004 */

/* #define _RPF1R_RPF1R_POSITION                    0x00000000 */
/* #define _RPF1R_RPF1R_MASK                        0x0000000F */
/* #define _RPF1R_RPF1R_LENGTH                      0x00000004 */

/* #define _RPF2R_RPF2R_POSITION                    0x00000000 */
/* #define _RPF2R_RPF2R_MASK                        0x0000000F */
/* #define _RPF2R_RPF2R_LENGTH                      0x00000004 */

/* #define _RPF3R_RPF3R_POSITION                    0x00000000 */
/* #define _RPF3R_RPF3R_MASK                        0x0000000F */
/* #define _RPF3R_RPF3R_LENGTH                      0x00000004 */

/* #define _RPF4R_RPF4R_POSITION                    0x00000000 */
/* #define _RPF4R_RPF4R_MASK                        0x0000000F */
/* #define _RPF4R_RPF4R_LENGTH                      0x00000004 */

/* #define _RPF5R_RPF5R_POSITION                    0x00000000 */
/* #define _RPF5R_RPF5R_MASK                        0x0000000F */
/* #define _RPF5R_RPF5R_LENGTH                      0x00000004 */

/* #define _RPF6R_RPF6R_POSITION                    0x00000000 */
/* #define _RPF6R_RPF6R_MASK                        0x0000000F */
/* #define _RPF6R_RPF6R_LENGTH                      0x00000004 */

/* #define _RPG6R_RPG6R_POSITION                    0x00000000 */
/* #define _RPG6R_RPG6R_MASK                        0x0000000F */
/* #define _RPG6R_RPG6R_LENGTH                      0x00000004 */

/* #define _RPG7R_RPG7R_POSITION                    0x00000000 */
/* #define _RPG7R_RPG7R_MASK                        0x0000000F */
/* #define _RPG7R_RPG7R_LENGTH                      0x00000004 */

/* #define _RPG8R_RPG8R_POSITION                    0x00000000 */
/* #define _RPG8R_RPG8R_MASK                        0x0000000F */
/* #define _RPG8R_RPG8R_LENGTH                      0x00000004 */

/* #define _RPG9R_RPG9R_POSITION                    0x00000000 */
/* #define _RPG9R_RPG9R_MASK                        0x0000000F */
/* #define _RPG9R_RPG9R_LENGTH                      0x00000004 */

/* #define _INTCON_INT0EP_POSITION                  0x00000000 */
/* #define _INTCON_INT0EP_MASK                      0x00000001 */
/* #define _INTCON_INT0EP_LENGTH                    0x00000001 */

/* #define _INTCON_INT1EP_POSITION                  0x00000001 */
/* #define _INTCON_INT1EP_MASK                      0x00000002 */
/* #define _INTCON_INT1EP_LENGTH                    0x00000001 */

/* #define _INTCON_INT2EP_POSITION                  0x00000002 */
/* #define _INTCON_INT2EP_MASK                      0x00000004 */
/* #define _INTCON_INT2EP_LENGTH                    0x00000001 */

/* #define _INTCON_INT3EP_POSITION                  0x00000003 */
/* #define _INTCON_INT3EP_MASK                      0x00000008 */
/* #define _INTCON_INT3EP_LENGTH                    0x00000001 */

/* #define _INTCON_INT4EP_POSITION                  0x00000004 */
/* #define _INTCON_INT4EP_MASK                      0x00000010 */
/* #define _INTCON_INT4EP_LENGTH                    0x00000001 */

/* #define _INTCON_TPC_POSITION                     0x00000008 */
/* #define _INTCON_TPC_MASK                         0x00000700 */
/* #define _INTCON_TPC_LENGTH                       0x00000003 */

/* #define _INTCON_MVEC_POSITION                    0x0000000C */
/* #define _INTCON_MVEC_MASK                        0x00001000 */
/* #define _INTCON_MVEC_LENGTH                      0x00000001 */

/* #define _INTCON_SS0_POSITION                     0x00000010 */
/* #define _INTCON_SS0_MASK                         0x00010000 */
/* #define _INTCON_SS0_LENGTH                       0x00000001 */

/* #define _INTCON_w_POSITION                       0x00000000 */
/* #define _INTCON_w_MASK                           0xFFFFFFFF */
/* #define _INTCON_w_LENGTH                         0x00000020 */

/* #define _INTSTAT_VEC_POSITION                    0x00000000 */
/* #define _INTSTAT_VEC_MASK                        0x0000003F */
/* #define _INTSTAT_VEC_LENGTH                      0x00000006 */

/* #define _INTSTAT_SRIPL_POSITION                  0x00000008 */
/* #define _INTSTAT_SRIPL_MASK                      0x00000700 */
/* #define _INTSTAT_SRIPL_LENGTH                    0x00000003 */

/* #define _IFS0_CTIF_POSITION                      0x00000000 */
/* #define _IFS0_CTIF_MASK                          0x00000001 */
/* #define _IFS0_CTIF_LENGTH                        0x00000001 */

/* #define _IFS0_CS0IF_POSITION                     0x00000001 */
/* #define _IFS0_CS0IF_MASK                         0x00000002 */
/* #define _IFS0_CS0IF_LENGTH                       0x00000001 */

/* #define _IFS0_CS1IF_POSITION                     0x00000002 */
/* #define _IFS0_CS1IF_MASK                         0x00000004 */
/* #define _IFS0_CS1IF_LENGTH                       0x00000001 */

#define _IFS0_INT0IF_POSITION                    0x00000003
#define _IFS0_INT0IF_MASK                        0x00000008
#define _IFS0_INT0IF_LENGTH                      0x00000001

/* #define _IFS0_T1IF_POSITION                      0x00000004 */
/* #define _IFS0_T1IF_MASK                          0x00000010 */
/* #define _IFS0_T1IF_LENGTH                        0x00000001 */

/* #define _IFS0_IC1EIF_POSITION                    0x00000005 */
/* #define _IFS0_IC1EIF_MASK                        0x00000020 */
/* #define _IFS0_IC1EIF_LENGTH                      0x00000001 */

/* #define _IFS0_IC1IF_POSITION                     0x00000006 */
/* #define _IFS0_IC1IF_MASK                         0x00000040 */
/* #define _IFS0_IC1IF_LENGTH                       0x00000001 */

/* #define _IFS0_OC1IF_POSITION                     0x00000007 */
/* #define _IFS0_OC1IF_MASK                         0x00000080 */
/* #define _IFS0_OC1IF_LENGTH                       0x00000001 */

/* #define _IFS0_INT1IF_POSITION                    0x00000008 */
/* #define _IFS0_INT1IF_MASK                        0x00000100 */
/* #define _IFS0_INT1IF_LENGTH                      0x00000001 */

/* #define _IFS0_T2IF_POSITION                      0x00000009 */
/* #define _IFS0_T2IF_MASK                          0x00000200 */
/* #define _IFS0_T2IF_LENGTH                        0x00000001 */

/* #define _IFS0_IC2EIF_POSITION                    0x0000000A */
/* #define _IFS0_IC2EIF_MASK                        0x00000400 */
/* #define _IFS0_IC2EIF_LENGTH                      0x00000001 */

/* #define _IFS0_IC2IF_POSITION                     0x0000000B */
/* #define _IFS0_IC2IF_MASK                         0x00000800 */
/* #define _IFS0_IC2IF_LENGTH                       0x00000001 */

/* #define _IFS0_OC2IF_POSITION                     0x0000000C */
/* #define _IFS0_OC2IF_MASK                         0x00001000 */
/* #define _IFS0_OC2IF_LENGTH                       0x00000001 */

/* #define _IFS0_INT2IF_POSITION                    0x0000000D */
/* #define _IFS0_INT2IF_MASK                        0x00002000 */
/* #define _IFS0_INT2IF_LENGTH                      0x00000001 */

/* #define _IFS0_T3IF_POSITION                      0x0000000E */
/* #define _IFS0_T3IF_MASK                          0x00004000 */
/* #define _IFS0_T3IF_LENGTH                        0x00000001 */

/* #define _IFS0_IC3EIF_POSITION                    0x0000000F */
/* #define _IFS0_IC3EIF_MASK                        0x00008000 */
/* #define _IFS0_IC3EIF_LENGTH                      0x00000001 */

/* #define _IFS0_IC3IF_POSITION                     0x00000010 */
/* #define _IFS0_IC3IF_MASK                         0x00010000 */
/* #define _IFS0_IC3IF_LENGTH                       0x00000001 */

/* #define _IFS0_OC3IF_POSITION                     0x00000011 */
/* #define _IFS0_OC3IF_MASK                         0x00020000 */
/* #define _IFS0_OC3IF_LENGTH                       0x00000001 */

/* #define _IFS0_INT3IF_POSITION                    0x00000012 */
/* #define _IFS0_INT3IF_MASK                        0x00040000 */
/* #define _IFS0_INT3IF_LENGTH                      0x00000001 */

/* #define _IFS0_T4IF_POSITION                      0x00000013 */
/* #define _IFS0_T4IF_MASK                          0x00080000 */
/* #define _IFS0_T4IF_LENGTH                        0x00000001 */

#define _IFS0_IC4EIF_POSITION                    0x00000014
#define _IFS0_IC4EIF_MASK                        0x00100000
#define _IFS0_IC4EIF_LENGTH                      0x00000001

#define _IFS0_IC4IF_POSITION                     0x00000015
#define _IFS0_IC4IF_MASK                         0x00200000
#define _IFS0_IC4IF_LENGTH                       0x00000001

#define _IFS0_OC4IF_POSITION                     0x00000016
#define _IFS0_OC4IF_MASK                         0x00400000
#define _IFS0_OC4IF_LENGTH                       0x00000001

#define _IFS0_INT4IF_POSITION                    0x00000017
#define _IFS0_INT4IF_MASK                        0x00800000
#define _IFS0_INT4IF_LENGTH                      0x00000001

/* #define _IFS0_T5IF_POSITION                      0x00000018 */
/* #define _IFS0_T5IF_MASK                          0x01000000 */
/* #define _IFS0_T5IF_LENGTH                        0x00000001 */

/* #define _IFS0_IC5EIF_POSITION                    0x00000019 */
/* #define _IFS0_IC5EIF_MASK                        0x02000000 */
/* #define _IFS0_IC5EIF_LENGTH                      0x00000001 */

/* #define _IFS0_IC5IF_POSITION                     0x0000001A */
/* #define _IFS0_IC5IF_MASK                         0x04000000 */
/* #define _IFS0_IC5IF_LENGTH                       0x00000001 */

/* #define _IFS0_OC5IF_POSITION                     0x0000001B */
/* #define _IFS0_OC5IF_MASK                         0x08000000 */
/* #define _IFS0_OC5IF_LENGTH                       0x00000001 */

/* #define _IFS0_AD1IF_POSITION                     0x0000001C */
/* #define _IFS0_AD1IF_MASK                         0x10000000 */
/* #define _IFS0_AD1IF_LENGTH                       0x00000001 */

/* #define _IFS0_FSCMIF_POSITION                    0x0000001D */
/* #define _IFS0_FSCMIF_MASK                        0x20000000 */
/* #define _IFS0_FSCMIF_LENGTH                      0x00000001 */

/* #define _IFS0_RTCCIF_POSITION                    0x0000001E */
/* #define _IFS0_RTCCIF_MASK                        0x40000000 */
/* #define _IFS0_RTCCIF_LENGTH                      0x00000001 */

/* #define _IFS0_FCEIF_POSITION                     0x0000001F */
/* #define _IFS0_FCEIF_MASK                         0x80000000 */
/* #define _IFS0_FCEIF_LENGTH                       0x00000001 */

/* #define _IFS0_w_POSITION                         0x00000000 */
/* #define _IFS0_w_MASK                             0xFFFFFFFF */
/* #define _IFS0_w_LENGTH                           0x00000020 */

/* #define _IFS1_CMP1IF_POSITION                    0x00000000 */
/* #define _IFS1_CMP1IF_MASK                        0x00000001 */
/* #define _IFS1_CMP1IF_LENGTH                      0x00000001 */

/* #define _IFS1_CMP2IF_POSITION                    0x00000001 */
/* #define _IFS1_CMP2IF_MASK                        0x00000002 */
/* #define _IFS1_CMP2IF_LENGTH                      0x00000001 */

/* #define _IFS1_USBIF_POSITION                     0x00000002 */
/* #define _IFS1_USBIF_MASK                         0x00000004 */
/* #define _IFS1_USBIF_LENGTH                       0x00000001 */

/* #define _IFS1_SPI1EIF_POSITION                   0x00000003 */
/* #define _IFS1_SPI1EIF_MASK                       0x00000008 */
/* #define _IFS1_SPI1EIF_LENGTH                     0x00000001 */

/* #define _IFS1_SPI1RXIF_POSITION                  0x00000004 */
/* #define _IFS1_SPI1RXIF_MASK                      0x00000010 */
/* #define _IFS1_SPI1RXIF_LENGTH                    0x00000001 */

/* #define _IFS1_SPI1TXIF_POSITION                  0x00000005 */
/* #define _IFS1_SPI1TXIF_MASK                      0x00000020 */
/* #define _IFS1_SPI1TXIF_LENGTH                    0x00000001 */

/* #define _IFS1_U1EIF_POSITION                     0x00000006 */
/* #define _IFS1_U1EIF_MASK                         0x00000040 */
/* #define _IFS1_U1EIF_LENGTH                       0x00000001 */

/* #define _IFS1_U1RXIF_POSITION                    0x00000007 */
/* #define _IFS1_U1RXIF_MASK                        0x00000080 */
/* #define _IFS1_U1RXIF_LENGTH                      0x00000001 */

/* #define _IFS1_U1TXIF_POSITION                    0x00000008 */
/* #define _IFS1_U1TXIF_MASK                        0x00000100 */
/* #define _IFS1_U1TXIF_LENGTH                      0x00000001 */

/* #define _IFS1_I2C1BIF_POSITION                   0x00000009 */
/* #define _IFS1_I2C1BIF_MASK                       0x00000200 */
/* #define _IFS1_I2C1BIF_LENGTH                     0x00000001 */

/* #define _IFS1_I2C1SIF_POSITION                   0x0000000A */
/* #define _IFS1_I2C1SIF_MASK                       0x00000400 */
/* #define _IFS1_I2C1SIF_LENGTH                     0x00000001 */

/* #define _IFS1_I2C1MIF_POSITION                   0x0000000B */
/* #define _IFS1_I2C1MIF_MASK                       0x00000800 */
/* #define _IFS1_I2C1MIF_LENGTH                     0x00000001 */

/* #define _IFS1_CNAIF_POSITION                     0x0000000C */
/* #define _IFS1_CNAIF_MASK                         0x00001000 */
/* #define _IFS1_CNAIF_LENGTH                       0x00000001 */

/* #define _IFS1_CNBIF_POSITION                     0x0000000D */
/* #define _IFS1_CNBIF_MASK                         0x00002000 */
/* #define _IFS1_CNBIF_LENGTH                       0x00000001 */

/* #define _IFS1_CNCIF_POSITION                     0x0000000E */
/* #define _IFS1_CNCIF_MASK                         0x00004000 */
/* #define _IFS1_CNCIF_LENGTH                       0x00000001 */

/* #define _IFS1_CNDIF_POSITION                     0x0000000F */
/* #define _IFS1_CNDIF_MASK                         0x00008000 */
/* #define _IFS1_CNDIF_LENGTH                       0x00000001 */

/* #define _IFS1_CNEIF_POSITION                     0x00000010 */
/* #define _IFS1_CNEIF_MASK                         0x00010000 */
/* #define _IFS1_CNEIF_LENGTH                       0x00000001 */

/* #define _IFS1_CNFIF_POSITION                     0x00000011 */
/* #define _IFS1_CNFIF_MASK                         0x00020000 */
/* #define _IFS1_CNFIF_LENGTH                       0x00000001 */

/* #define _IFS1_CNGIF_POSITION                     0x00000012 */
/* #define _IFS1_CNGIF_MASK                         0x00040000 */
/* #define _IFS1_CNGIF_LENGTH                       0x00000001 */

/* #define _IFS1_PMPIF_POSITION                     0x00000013 */
/* #define _IFS1_PMPIF_MASK                         0x00080000 */
/* #define _IFS1_PMPIF_LENGTH                       0x00000001 */

/* #define _IFS1_PMPEIF_POSITION                    0x00000014 */
/* #define _IFS1_PMPEIF_MASK                        0x00100000 */
/* #define _IFS1_PMPEIF_LENGTH                      0x00000001 */

/* #define _IFS1_SPI2EIF_POSITION                   0x00000015 */
/* #define _IFS1_SPI2EIF_MASK                       0x00200000 */
/* #define _IFS1_SPI2EIF_LENGTH                     0x00000001 */

/* #define _IFS1_SPI2RXIF_POSITION                  0x00000016 */
/* #define _IFS1_SPI2RXIF_MASK                      0x00400000 */
/* #define _IFS1_SPI2RXIF_LENGTH                    0x00000001 */

/* #define _IFS1_SPI2TXIF_POSITION                  0x00000017 */
/* #define _IFS1_SPI2TXIF_MASK                      0x00800000 */
/* #define _IFS1_SPI2TXIF_LENGTH                    0x00000001 */

/* #define _IFS1_U2EIF_POSITION                     0x00000018 */
/* #define _IFS1_U2EIF_MASK                         0x01000000 */
/* #define _IFS1_U2EIF_LENGTH                       0x00000001 */

/* #define _IFS1_U2RXIF_POSITION                    0x00000019 */
/* #define _IFS1_U2RXIF_MASK                        0x02000000 */
/* #define _IFS1_U2RXIF_LENGTH                      0x00000001 */

/* #define _IFS1_U2TXIF_POSITION                    0x0000001A */
/* #define _IFS1_U2TXIF_MASK                        0x04000000 */
/* #define _IFS1_U2TXIF_LENGTH                      0x00000001 */

/* #define _IFS1_I2C2BIF_POSITION                   0x0000001B */
/* #define _IFS1_I2C2BIF_MASK                       0x08000000 */
/* #define _IFS1_I2C2BIF_LENGTH                     0x00000001 */

/* #define _IFS1_I2C2SIF_POSITION                   0x0000001C */
/* #define _IFS1_I2C2SIF_MASK                       0x10000000 */
/* #define _IFS1_I2C2SIF_LENGTH                     0x00000001 */

/* #define _IFS1_I2C2MIF_POSITION                   0x0000001D */
/* #define _IFS1_I2C2MIF_MASK                       0x20000000 */
/* #define _IFS1_I2C2MIF_LENGTH                     0x00000001 */

/* #define _IFS1_U3EIF_POSITION                     0x0000001E */
/* #define _IFS1_U3EIF_MASK                         0x40000000 */
/* #define _IFS1_U3EIF_LENGTH                       0x00000001 */

/* #define _IFS1_U3RXIF_POSITION                    0x0000001F */
/* #define _IFS1_U3RXIF_MASK                        0x80000000 */
/* #define _IFS1_U3RXIF_LENGTH                      0x00000001 */

/* #define _IFS1_w_POSITION                         0x00000000 */
/* #define _IFS1_w_MASK                             0xFFFFFFFF */
/* #define _IFS1_w_LENGTH                           0x00000020 */

/* #define _IFS2_U3TXIF_POSITION                    0x00000000 */
/* #define _IFS2_U3TXIF_MASK                        0x00000001 */
/* #define _IFS2_U3TXIF_LENGTH                      0x00000001 */

/* #define _IFS2_U4EIF_POSITION                     0x00000001 */
/* #define _IFS2_U4EIF_MASK                         0x00000002 */
/* #define _IFS2_U4EIF_LENGTH                       0x00000001 */

/* #define _IFS2_U4RXIF_POSITION                    0x00000002 */
/* #define _IFS2_U4RXIF_MASK                        0x00000004 */
/* #define _IFS2_U4RXIF_LENGTH                      0x00000001 */

/* #define _IFS2_U4TXIF_POSITION                    0x00000003 */
/* #define _IFS2_U4TXIF_MASK                        0x00000008 */
/* #define _IFS2_U4TXIF_LENGTH                      0x00000001 */

/* #define _IFS2_CTMUIF_POSITION                    0x00000007 */
/* #define _IFS2_CTMUIF_MASK                        0x00000080 */
/* #define _IFS2_CTMUIF_LENGTH                      0x00000001 */

/* #define _IFS2_DMA0IF_POSITION                    0x00000008 */
/* #define _IFS2_DMA0IF_MASK                        0x00000100 */
/* #define _IFS2_DMA0IF_LENGTH                      0x00000001 */

/* #define _IFS2_DMA1IF_POSITION                    0x00000009 */
/* #define _IFS2_DMA1IF_MASK                        0x00000200 */
/* #define _IFS2_DMA1IF_LENGTH                      0x00000001 */

/* #define _IFS2_DMA2IF_POSITION                    0x0000000A */
/* #define _IFS2_DMA2IF_MASK                        0x00000400 */
/* #define _IFS2_DMA2IF_LENGTH                      0x00000001 */

/* #define _IFS2_DMA3IF_POSITION                    0x0000000B */
/* #define _IFS2_DMA3IF_MASK                        0x00000800 */
/* #define _IFS2_DMA3IF_LENGTH                      0x00000001 */

/* #define _IEC0_CTIE_POSITION                      0x00000000 */
/* #define _IEC0_CTIE_MASK                          0x00000001 */
/* #define _IEC0_CTIE_LENGTH                        0x00000001 */

/* #define _IEC0_CS0IE_POSITION                     0x00000001 */
/* #define _IEC0_CS0IE_MASK                         0x00000002 */
/* #define _IEC0_CS0IE_LENGTH                       0x00000001 */

/* #define _IEC0_CS1IE_POSITION                     0x00000002 */
/* #define _IEC0_CS1IE_MASK                         0x00000004 */
/* #define _IEC0_CS1IE_LENGTH                       0x00000001 */

#define _IEC0_INT0IE_POSITION                    0x00000003
#define _IEC0_INT0IE_MASK                        0x00000008
#define _IEC0_INT0IE_LENGTH                      0x00000001

#define _IEC0_T1IE_POSITION                      0x00000004
#define _IEC0_T1IE_MASK                          0x00000010
#define _IEC0_T1IE_LENGTH                        0x00000001

#define _IEC0_IC1EIE_POSITION                    0x00000005
#define _IEC0_IC1EIE_MASK                        0x00000020
#define _IEC0_IC1EIE_LENGTH                      0x00000001

/* #define _IEC0_IC1IE_POSITION                     0x00000006 */
/* #define _IEC0_IC1IE_MASK                         0x00000040 */
/* #define _IEC0_IC1IE_LENGTH                       0x00000001 */

/* #define _IEC0_OC1IE_POSITION                     0x00000007 */
/* #define _IEC0_OC1IE_MASK                         0x00000080 */
/* #define _IEC0_OC1IE_LENGTH                       0x00000001 */

/* #define _IEC0_INT1IE_POSITION                    0x00000008 */
/* #define _IEC0_INT1IE_MASK                        0x00000100 */
/* #define _IEC0_INT1IE_LENGTH                      0x00000001 */

/* #define _IEC0_T2IE_POSITION                      0x00000009 */
/* #define _IEC0_T2IE_MASK                          0x00000200 */
/* #define _IEC0_T2IE_LENGTH                        0x00000001 */

/* #define _IEC0_IC2EIE_POSITION                    0x0000000A */
/* #define _IEC0_IC2EIE_MASK                        0x00000400 */
/* #define _IEC0_IC2EIE_LENGTH                      0x00000001 */

/* #define _IEC0_IC2IE_POSITION                     0x0000000B */
/* #define _IEC0_IC2IE_MASK                         0x00000800 */
/* #define _IEC0_IC2IE_LENGTH                       0x00000001 */

/* #define _IEC0_OC2IE_POSITION                     0x0000000C */
/* #define _IEC0_OC2IE_MASK                         0x00001000 */
/* #define _IEC0_OC2IE_LENGTH                       0x00000001 */

/* #define _IEC0_INT2IE_POSITION                    0x0000000D */
/* #define _IEC0_INT2IE_MASK                        0x00002000 */
/* #define _IEC0_INT2IE_LENGTH                      0x00000001 */

/* #define _IEC0_T3IE_POSITION                      0x0000000E */
/* #define _IEC0_T3IE_MASK                          0x00004000 */
/* #define _IEC0_T3IE_LENGTH                        0x00000001 */

/* #define _IEC0_IC3EIE_POSITION                    0x0000000F */
/* #define _IEC0_IC3EIE_MASK                        0x00008000 */
/* #define _IEC0_IC3EIE_LENGTH                      0x00000001 */

/* #define _IEC0_IC3IE_POSITION                     0x00000010 */
/* #define _IEC0_IC3IE_MASK                         0x00010000 */
/* #define _IEC0_IC3IE_LENGTH                       0x00000001 */

/* #define _IEC0_OC3IE_POSITION                     0x00000011 */
/* #define _IEC0_OC3IE_MASK                         0x00020000 */
/* #define _IEC0_OC3IE_LENGTH                       0x00000001 */

/* #define _IEC0_INT3IE_POSITION                    0x00000012 */
/* #define _IEC0_INT3IE_MASK                        0x00040000 */
/* #define _IEC0_INT3IE_LENGTH                      0x00000001 */

/* #define _IEC0_T4IE_POSITION                      0x00000013 */
/* #define _IEC0_T4IE_MASK                          0x00080000 */
/* #define _IEC0_T4IE_LENGTH                        0x00000001 */

#define _IEC0_IC4EIE_POSITION                    0x00000014
#define _IEC0_IC4EIE_MASK                        0x00100000
#define _IEC0_IC4EIE_LENGTH                      0x00000001

#define _IEC0_IC4IE_POSITION                     0x00000015
#define _IEC0_IC4IE_MASK                         0x00200000
#define _IEC0_IC4IE_LENGTH                       0x00000001

#define _IEC0_OC4IE_POSITION                     0x00000016
#define _IEC0_OC4IE_MASK                         0x00400000
#define _IEC0_OC4IE_LENGTH                       0x00000001

/* #define _IEC0_INT4IE_POSITION                    0x00000017 */
/* #define _IEC0_INT4IE_MASK                        0x00800000 */
/* #define _IEC0_INT4IE_LENGTH                      0x00000001 */

/* #define _IEC0_T5IE_POSITION                      0x00000018 */
/* #define _IEC0_T5IE_MASK                          0x01000000 */
/* #define _IEC0_T5IE_LENGTH                        0x00000001 */

/* #define _IEC0_IC5EIE_POSITION                    0x00000019 */
/* #define _IEC0_IC5EIE_MASK                        0x02000000 */
/* #define _IEC0_IC5EIE_LENGTH                      0x00000001 */

/* #define _IEC0_IC5IE_POSITION                     0x0000001A */
/* #define _IEC0_IC5IE_MASK                         0x04000000 */
/* #define _IEC0_IC5IE_LENGTH                       0x00000001 */

/* #define _IEC0_OC5IE_POSITION                     0x0000001B */
/* #define _IEC0_OC5IE_MASK                         0x08000000 */
/* #define _IEC0_OC5IE_LENGTH                       0x00000001 */

/* #define _IEC0_AD1IE_POSITION                     0x0000001C */
/* #define _IEC0_AD1IE_MASK                         0x10000000 */
/* #define _IEC0_AD1IE_LENGTH                       0x00000001 */

/* #define _IEC0_FSCMIE_POSITION                    0x0000001D */
/* #define _IEC0_FSCMIE_MASK                        0x20000000 */
/* #define _IEC0_FSCMIE_LENGTH                      0x00000001 */

/* #define _IEC0_RTCCIE_POSITION                    0x0000001E */
/* #define _IEC0_RTCCIE_MASK                        0x40000000 */
/* #define _IEC0_RTCCIE_LENGTH                      0x00000001 */

/* #define _IEC0_FCEIE_POSITION                     0x0000001F */
/* #define _IEC0_FCEIE_MASK                         0x80000000 */
/* #define _IEC0_FCEIE_LENGTH                       0x00000001 */

/* #define _IEC0_w_POSITION                         0x00000000 */
/* #define _IEC0_w_MASK                             0xFFFFFFFF */
/* #define _IEC0_w_LENGTH                           0x00000020 */

/* #define _IEC1_CMP1IE_POSITION                    0x00000000 */
/* #define _IEC1_CMP1IE_MASK                        0x00000001 */
/* #define _IEC1_CMP1IE_LENGTH                      0x00000001 */

/* #define _IEC1_CMP2IE_POSITION                    0x00000001 */
/* #define _IEC1_CMP2IE_MASK                        0x00000002 */
/* #define _IEC1_CMP2IE_LENGTH                      0x00000001 */

/* #define _IEC1_USBIE_POSITION                     0x00000002 */
/* #define _IEC1_USBIE_MASK                         0x00000004 */
/* #define _IEC1_USBIE_LENGTH                       0x00000001 */

/* #define _IEC1_SPI1EIE_POSITION                   0x00000003 */
/* #define _IEC1_SPI1EIE_MASK                       0x00000008 */
/* #define _IEC1_SPI1EIE_LENGTH                     0x00000001 */

/* #define _IEC1_SPI1RXIE_POSITION                  0x00000004 */
/* #define _IEC1_SPI1RXIE_MASK                      0x00000010 */
/* #define _IEC1_SPI1RXIE_LENGTH                    0x00000001 */

/* #define _IEC1_SPI1TXIE_POSITION                  0x00000005 */
/* #define _IEC1_SPI1TXIE_MASK                      0x00000020 */
/* #define _IEC1_SPI1TXIE_LENGTH                    0x00000001 */

/* #define _IEC1_U1EIE_POSITION                     0x00000006 */
/* #define _IEC1_U1EIE_MASK                         0x00000040 */
/* #define _IEC1_U1EIE_LENGTH                       0x00000001 */

/* #define _IEC1_U1RXIE_POSITION                    0x00000007 */
/* #define _IEC1_U1RXIE_MASK                        0x00000080 */
/* #define _IEC1_U1RXIE_LENGTH                      0x00000001 */

/* #define _IEC1_U1TXIE_POSITION                    0x00000008 */
/* #define _IEC1_U1TXIE_MASK                        0x00000100 */
/* #define _IEC1_U1TXIE_LENGTH                      0x00000001 */

/* #define _IEC1_I2C1BIE_POSITION                   0x00000009 */
/* #define _IEC1_I2C1BIE_MASK                       0x00000200 */
/* #define _IEC1_I2C1BIE_LENGTH                     0x00000001 */

/* #define _IEC1_I2C1SIE_POSITION                   0x0000000A */
/* #define _IEC1_I2C1SIE_MASK                       0x00000400 */
/* #define _IEC1_I2C1SIE_LENGTH                     0x00000001 */

/* #define _IEC1_I2C1MIE_POSITION                   0x0000000B */
/* #define _IEC1_I2C1MIE_MASK                       0x00000800 */
/* #define _IEC1_I2C1MIE_LENGTH                     0x00000001 */

/* #define _IEC1_CNAIE_POSITION                     0x0000000C */
/* #define _IEC1_CNAIE_MASK                         0x00001000 */
/* #define _IEC1_CNAIE_LENGTH                       0x00000001 */

/* #define _IEC1_CNBIE_POSITION                     0x0000000D */
/* #define _IEC1_CNBIE_MASK                         0x00002000 */
/* #define _IEC1_CNBIE_LENGTH                       0x00000001 */

/* #define _IEC1_CNCIE_POSITION                     0x0000000E */
/* #define _IEC1_CNCIE_MASK                         0x00004000 */
/* #define _IEC1_CNCIE_LENGTH                       0x00000001 */

/* #define _IEC1_CNDIE_POSITION                     0x0000000F */
/* #define _IEC1_CNDIE_MASK                         0x00008000 */
/* #define _IEC1_CNDIE_LENGTH                       0x00000001 */

/* #define _IEC1_CNEIE_POSITION                     0x00000010 */
/* #define _IEC1_CNEIE_MASK                         0x00010000 */
/* #define _IEC1_CNEIE_LENGTH                       0x00000001 */

/* #define _IEC1_CNFIE_POSITION                     0x00000011 */
/* #define _IEC1_CNFIE_MASK                         0x00020000 */
/* #define _IEC1_CNFIE_LENGTH                       0x00000001 */

/* #define _IEC1_CNGIE_POSITION                     0x00000012 */
/* #define _IEC1_CNGIE_MASK                         0x00040000 */
/* #define _IEC1_CNGIE_LENGTH                       0x00000001 */

/* #define _IEC1_PMPIE_POSITION                     0x00000013 */
/* #define _IEC1_PMPIE_MASK                         0x00080000 */
/* #define _IEC1_PMPIE_LENGTH                       0x00000001 */

/* #define _IEC1_PMPEIE_POSITION                    0x00000014 */
/* #define _IEC1_PMPEIE_MASK                        0x00100000 */
/* #define _IEC1_PMPEIE_LENGTH                      0x00000001 */

/* #define _IEC1_SPI2EIE_POSITION                   0x00000015 */
/* #define _IEC1_SPI2EIE_MASK                       0x00200000 */
/* #define _IEC1_SPI2EIE_LENGTH                     0x00000001 */

/* #define _IEC1_SPI2RXIE_POSITION                  0x00000016 */
/* #define _IEC1_SPI2RXIE_MASK                      0x00400000 */
/* #define _IEC1_SPI2RXIE_LENGTH                    0x00000001 */

/* #define _IEC1_SPI2TXIE_POSITION                  0x00000017 */
/* #define _IEC1_SPI2TXIE_MASK                      0x00800000 */
/* #define _IEC1_SPI2TXIE_LENGTH                    0x00000001 */

/* #define _IEC1_U2EIE_POSITION                     0x00000018 */
/* #define _IEC1_U2EIE_MASK                         0x01000000 */
/* #define _IEC1_U2EIE_LENGTH                       0x00000001 */

/* #define _IEC1_U2RXIE_POSITION                    0x00000019 */
/* #define _IEC1_U2RXIE_MASK                        0x02000000 */
/* #define _IEC1_U2RXIE_LENGTH                      0x00000001 */

/* #define _IEC1_U2TXIE_POSITION                    0x0000001A */
/* #define _IEC1_U2TXIE_MASK                        0x04000000 */
/* #define _IEC1_U2TXIE_LENGTH                      0x00000001 */

/* #define _IEC1_I2C2BIE_POSITION                   0x0000001B */
/* #define _IEC1_I2C2BIE_MASK                       0x08000000 */
/* #define _IEC1_I2C2BIE_LENGTH                     0x00000001 */

/* #define _IEC1_I2C2SIE_POSITION                   0x0000001C */
/* #define _IEC1_I2C2SIE_MASK                       0x10000000 */
/* #define _IEC1_I2C2SIE_LENGTH                     0x00000001 */

/* #define _IEC1_I2CMIE_POSITION                    0x0000001D */
/* #define _IEC1_I2CMIE_MASK                        0x20000000 */
/* #define _IEC1_I2CMIE_LENGTH                      0x00000001 */

/* #define _IEC1_U3EIE_POSITION                     0x0000001E */
/* #define _IEC1_U3EIE_MASK                         0x40000000 */
/* #define _IEC1_U3EIE_LENGTH                       0x00000001 */

/* #define _IEC1_U3RXIE_POSITION                    0x0000001F */
/* #define _IEC1_U3RXIE_MASK                        0x80000000 */
/* #define _IEC1_U3RXIE_LENGTH                      0x00000001 */

/* #define _IEC1_w_POSITION                         0x00000000 */
/* #define _IEC1_w_MASK                             0xFFFFFFFF */
/* #define _IEC1_w_LENGTH                           0x00000020 */

/* #define _IEC2_U3TXIE_POSITION                    0x00000000 */
/* #define _IEC2_U3TXIE_MASK                        0x00000001 */
/* #define _IEC2_U3TXIE_LENGTH                      0x00000001 */

/* #define _IEC2_U4EIE_POSITION                     0x00000001 */
/* #define _IEC2_U4EIE_MASK                         0x00000002 */
/* #define _IEC2_U4EIE_LENGTH                       0x00000001 */

/* #define _IEC2_U4RXIE_POSITION                    0x00000002 */
/* #define _IEC2_U4RXIE_MASK                        0x00000004 */
/* #define _IEC2_U4RXIE_LENGTH                      0x00000001 */

/* #define _IEC2_U4TXIE_POSITION                    0x00000003 */
/* #define _IEC2_U4TXIE_MASK                        0x00000008 */
/* #define _IEC2_U4TXIE_LENGTH                      0x00000001 */

/* #define _IEC2_CTMUIE_POSITION                    0x00000007 */
/* #define _IEC2_CTMUIE_MASK                        0x00000080 */
/* #define _IEC2_CTMUIE_LENGTH                      0x00000001 */

/* #define _IEC2_DMA0IE_POSITION                    0x00000008 */
/* #define _IEC2_DMA0IE_MASK                        0x00000100 */
/* #define _IEC2_DMA0IE_LENGTH                      0x00000001 */

/* #define _IEC2_DMA1IE_POSITION                    0x00000009 */
/* #define _IEC2_DMA1IE_MASK                        0x00000200 */
/* #define _IEC2_DMA1IE_LENGTH                      0x00000001 */

/* #define _IEC2_DMA2IE_POSITION                    0x0000000A */
/* #define _IEC2_DMA2IE_MASK                        0x00000400 */
/* #define _IEC2_DMA2IE_LENGTH                      0x00000001 */

/* #define _IEC2_DMA3IE_POSITION                    0x0000000B */
/* #define _IEC2_DMA3IE_MASK                        0x00000800 */
/* #define _IEC2_DMA3IE_LENGTH                      0x00000001 */

/* #define _IPC0_CTIS_POSITION                      0x00000000 */
/* #define _IPC0_CTIS_MASK                          0x00000003 */
/* #define _IPC0_CTIS_LENGTH                        0x00000002 */

/* #define _IPC0_CTIP_POSITION                      0x00000002 */
/* #define _IPC0_CTIP_MASK                          0x0000001C */
/* #define _IPC0_CTIP_LENGTH                        0x00000003 */

/* #define _IPC0_CS0IS_POSITION                     0x00000008 */
/* #define _IPC0_CS0IS_MASK                         0x00000300 */
/* #define _IPC0_CS0IS_LENGTH                       0x00000002 */

/* #define _IPC0_CS0IP_POSITION                     0x0000000A */
/* #define _IPC0_CS0IP_MASK                         0x00001C00 */
/* #define _IPC0_CS0IP_LENGTH                       0x00000003 */

/* #define _IPC0_CS1IS_POSITION                     0x00000010 */
/* #define _IPC0_CS1IS_MASK                         0x00030000 */
/* #define _IPC0_CS1IS_LENGTH                       0x00000002 */

/* #define _IPC0_CS1IP_POSITION                     0x00000012 */
/* #define _IPC0_CS1IP_MASK                         0x001C0000 */
/* #define _IPC0_CS1IP_LENGTH                       0x00000003 */

#define _IPC0_INT0IS_POSITION                    0x00000018
#define _IPC0_INT0IS_MASK                        0x03000000
#define _IPC0_INT0IS_LENGTH                      0x00000002

#define _IPC0_INT0IP_POSITION                    0x0000001A
#define _IPC0_INT0IP_MASK                        0x1C000000
#define _IPC0_INT0IP_LENGTH                      0x00000003

/* #define _IPC0_w_POSITION                         0x00000000 */
/* #define _IPC0_w_MASK                             0xFFFFFFFF */
/* #define _IPC0_w_LENGTH                           0x00000020 */

/* #define _IPC1_T1IS_POSITION                      0x00000000 */
/* #define _IPC1_T1IS_MASK                          0x00000003 */
/* #define _IPC1_T1IS_LENGTH                        0x00000002 */

/* #define _IPC1_T1IP_POSITION                      0x00000002 */
/* #define _IPC1_T1IP_MASK                          0x0000001C */
/* #define _IPC1_T1IP_LENGTH                        0x00000003 */

/* #define _IPC1_IC1IS_POSITION                     0x00000008 */
/* #define _IPC1_IC1IS_MASK                         0x00000300 */
/* #define _IPC1_IC1IS_LENGTH                       0x00000002 */

/* #define _IPC1_IC1IP_POSITION                     0x0000000A */
/* #define _IPC1_IC1IP_MASK                         0x00001C00 */
/* #define _IPC1_IC1IP_LENGTH                       0x00000003 */

/* #define _IPC1_OC1IS_POSITION                     0x00000010 */
/* #define _IPC1_OC1IS_MASK                         0x00030000 */
/* #define _IPC1_OC1IS_LENGTH                       0x00000002 */

/* #define _IPC1_OC1IP_POSITION                     0x00000012 */
/* #define _IPC1_OC1IP_MASK                         0x001C0000 */
/* #define _IPC1_OC1IP_LENGTH                       0x00000003 */

/* #define _IPC1_INT1IS_POSITION                    0x00000018 */
/* #define _IPC1_INT1IS_MASK                        0x03000000 */
/* #define _IPC1_INT1IS_LENGTH                      0x00000002 */

/* #define _IPC1_INT1IP_POSITION                    0x0000001A */
/* #define _IPC1_INT1IP_MASK                        0x1C000000 */
/* #define _IPC1_INT1IP_LENGTH                      0x00000003 */

/* #define _IPC1_w_POSITION                         0x00000000 */
/* #define _IPC1_w_MASK                             0xFFFFFFFF */
/* #define _IPC1_w_LENGTH                           0x00000020 */

/* #define _IPC2_T2IS_POSITION                      0x00000000 */
/* #define _IPC2_T2IS_MASK                          0x00000003 */
/* #define _IPC2_T2IS_LENGTH                        0x00000002 */

/* #define _IPC2_T2IP_POSITION                      0x00000002 */
/* #define _IPC2_T2IP_MASK                          0x0000001C */
/* #define _IPC2_T2IP_LENGTH                        0x00000003 */

/* #define _IPC2_IC2IS_POSITION                     0x00000008 */
/* #define _IPC2_IC2IS_MASK                         0x00000300 */
/* #define _IPC2_IC2IS_LENGTH                       0x00000002 */

/* #define _IPC2_IC2IP_POSITION                     0x0000000A */
/* #define _IPC2_IC2IP_MASK                         0x00001C00 */
/* #define _IPC2_IC2IP_LENGTH                       0x00000003 */

/* #define _IPC2_OC2IS_POSITION                     0x00000010 */
/* #define _IPC2_OC2IS_MASK                         0x00030000 */
/* #define _IPC2_OC2IS_LENGTH                       0x00000002 */

/* #define _IPC2_OC2IP_POSITION                     0x00000012 */
/* #define _IPC2_OC2IP_MASK                         0x001C0000 */
/* #define _IPC2_OC2IP_LENGTH                       0x00000003 */

/* #define _IPC2_INT2IS_POSITION                    0x00000018 */
/* #define _IPC2_INT2IS_MASK                        0x03000000 */
/* #define _IPC2_INT2IS_LENGTH                      0x00000002 */

/* #define _IPC2_INT2IP_POSITION                    0x0000001A */
/* #define _IPC2_INT2IP_MASK                        0x1C000000 */
/* #define _IPC2_INT2IP_LENGTH                      0x00000003 */

/* #define _IPC2_w_POSITION                         0x00000000 */
/* #define _IPC2_w_MASK                             0xFFFFFFFF */
/* #define _IPC2_w_LENGTH                           0x00000020 */

/* #define _IPC3_T3IS_POSITION                      0x00000000 */
/* #define _IPC3_T3IS_MASK                          0x00000003 */
/* #define _IPC3_T3IS_LENGTH                        0x00000002 */

/* #define _IPC3_T3IP_POSITION                      0x00000002 */
/* #define _IPC3_T3IP_MASK                          0x0000001C */
/* #define _IPC3_T3IP_LENGTH                        0x00000003 */

/* #define _IPC3_IC3IS_POSITION                     0x00000008 */
/* #define _IPC3_IC3IS_MASK                         0x00000300 */
/* #define _IPC3_IC3IS_LENGTH                       0x00000002 */

/* #define _IPC3_IC3IP_POSITION                     0x0000000A */
/* #define _IPC3_IC3IP_MASK                         0x00001C00 */
/* #define _IPC3_IC3IP_LENGTH                       0x00000003 */

/* #define _IPC3_OC3IS_POSITION                     0x00000010 */
/* #define _IPC3_OC3IS_MASK                         0x00030000 */
/* #define _IPC3_OC3IS_LENGTH                       0x00000002 */

/* #define _IPC3_OC3IP_POSITION                     0x00000012 */
/* #define _IPC3_OC3IP_MASK                         0x001C0000 */
/* #define _IPC3_OC3IP_LENGTH                       0x00000003 */

/* #define _IPC3_INT3IS_POSITION                    0x00000018 */
/* #define _IPC3_INT3IS_MASK                        0x03000000 */
/* #define _IPC3_INT3IS_LENGTH                      0x00000002 */

/* #define _IPC3_INT3IP_POSITION                    0x0000001A */
/* #define _IPC3_INT3IP_MASK                        0x1C000000 */
/* #define _IPC3_INT3IP_LENGTH                      0x00000003 */

/* #define _IPC3_w_POSITION                         0x00000000 */
/* #define _IPC3_w_MASK                             0xFFFFFFFF */
/* #define _IPC3_w_LENGTH                           0x00000020 */

/* #define _IPC4_T4IS_POSITION                      0x00000000 */
/* #define _IPC4_T4IS_MASK                          0x00000003 */
/* #define _IPC4_T4IS_LENGTH                        0x00000002 */

/* #define _IPC4_T4IP_POSITION                      0x00000002 */
/* #define _IPC4_T4IP_MASK                          0x0000001C */
/* #define _IPC4_T4IP_LENGTH                        0x00000003 */

/* #define _IPC4_IC4IS_POSITION                     0x00000008 */
/* #define _IPC4_IC4IS_MASK                         0x00000300 */
/* #define _IPC4_IC4IS_LENGTH                       0x00000002 */

/* #define _IPC4_IC4IP_POSITION                     0x0000000A */
/* #define _IPC4_IC4IP_MASK                         0x00001C00 */
/* #define _IPC4_IC4IP_LENGTH                       0x00000003 */

/* #define _IPC4_OC4IS_POSITION                     0x00000010 */
/* #define _IPC4_OC4IS_MASK                         0x00030000 */
/* #define _IPC4_OC4IS_LENGTH                       0x00000002 */

/* #define _IPC4_OC4IP_POSITION                     0x00000012 */
/* #define _IPC4_OC4IP_MASK                         0x001C0000 */
/* #define _IPC4_OC4IP_LENGTH                       0x00000003 */

/* #define _IPC4_INT4IS_POSITION                    0x00000018 */
/* #define _IPC4_INT4IS_MASK                        0x03000000 */
/* #define _IPC4_INT4IS_LENGTH                      0x00000002 */

/* #define _IPC4_INT4IP_POSITION                    0x0000001A */
/* #define _IPC4_INT4IP_MASK                        0x1C000000 */
/* #define _IPC4_INT4IP_LENGTH                      0x00000003 */

/* #define _IPC4_w_POSITION                         0x00000000 */
/* #define _IPC4_w_MASK                             0xFFFFFFFF */
/* #define _IPC4_w_LENGTH                           0x00000020 */

/* #define _IPC5_T5IS_POSITION                      0x00000000 */
/* #define _IPC5_T5IS_MASK                          0x00000003 */
/* #define _IPC5_T5IS_LENGTH                        0x00000002 */

/* #define _IPC5_T5IP_POSITION                      0x00000002 */
/* #define _IPC5_T5IP_MASK                          0x0000001C */
/* #define _IPC5_T5IP_LENGTH                        0x00000003 */

/* #define _IPC5_IC5IS_POSITION                     0x00000008 */
/* #define _IPC5_IC5IS_MASK                         0x00000300 */
/* #define _IPC5_IC5IS_LENGTH                       0x00000002 */

/* #define _IPC5_IC5IP_POSITION                     0x0000000A */
/* #define _IPC5_IC5IP_MASK                         0x00001C00 */
/* #define _IPC5_IC5IP_LENGTH                       0x00000003 */

/* #define _IPC5_OC5IS_POSITION                     0x00000010 */
/* #define _IPC5_OC5IS_MASK                         0x00030000 */
/* #define _IPC5_OC5IS_LENGTH                       0x00000002 */

/* #define _IPC5_OC5IP_POSITION                     0x00000012 */
/* #define _IPC5_OC5IP_MASK                         0x001C0000 */
/* #define _IPC5_OC5IP_LENGTH                       0x00000003 */

/* #define _IPC5_AD1IS_POSITION                     0x00000018 */
/* #define _IPC5_AD1IS_MASK                         0x03000000 */
/* #define _IPC5_AD1IS_LENGTH                       0x00000002 */

/* #define _IPC5_AD1IP_POSITION                     0x0000001A */
/* #define _IPC5_AD1IP_MASK                         0x1C000000 */
/* #define _IPC5_AD1IP_LENGTH                       0x00000003 */

/* #define _IPC5_w_POSITION                         0x00000000 */
/* #define _IPC5_w_MASK                             0xFFFFFFFF */
/* #define _IPC5_w_LENGTH                           0x00000020 */

/* #define _IPC6_FSCMIS_POSITION                    0x00000000 */
/* #define _IPC6_FSCMIS_MASK                        0x00000003 */
/* #define _IPC6_FSCMIS_LENGTH                      0x00000002 */

/* #define _IPC6_FSCMIP_POSITION                    0x00000002 */
/* #define _IPC6_FSCMIP_MASK                        0x0000001C */
/* #define _IPC6_FSCMIP_LENGTH                      0x00000003 */

/* #define _IPC6_RTCCIS_POSITION                    0x00000008 */
/* #define _IPC6_RTCCIS_MASK                        0x00000300 */
/* #define _IPC6_RTCCIS_LENGTH                      0x00000002 */

/* #define _IPC6_RTCCIP_POSITION                    0x0000000A */
/* #define _IPC6_RTCCIP_MASK                        0x00001C00 */
/* #define _IPC6_RTCCIP_LENGTH                      0x00000003 */

/* #define _IPC6_FCEIS_POSITION                     0x00000010 */
/* #define _IPC6_FCEIS_MASK                         0x00030000 */
/* #define _IPC6_FCEIS_LENGTH                       0x00000002 */

/* #define _IPC6_FCEIP_POSITION                     0x00000012 */
/* #define _IPC6_FCEIP_MASK                         0x001C0000 */
/* #define _IPC6_FCEIP_LENGTH                       0x00000003 */

/* #define _IPC6_CMP1IS_POSITION                    0x00000018 */
/* #define _IPC6_CMP1IS_MASK                        0x03000000 */
/* #define _IPC6_CMP1IS_LENGTH                      0x00000002 */

/* #define _IPC6_CMP1IP_POSITION                    0x0000001A */
/* #define _IPC6_CMP1IP_MASK                        0x1C000000 */
/* #define _IPC6_CMP1IP_LENGTH                      0x00000003 */

/* #define _IPC6_w_POSITION                         0x00000000 */
/* #define _IPC6_w_MASK                             0xFFFFFFFF */
/* #define _IPC6_w_LENGTH                           0x00000020 */

/* #define _IPC7_CMP2IS_POSITION                    0x00000000 */
/* #define _IPC7_CMP2IS_MASK                        0x00000003 */
/* #define _IPC7_CMP2IS_LENGTH                      0x00000002 */

/* #define _IPC7_CMP2IP_POSITION                    0x00000002 */
/* #define _IPC7_CMP2IP_MASK                        0x0000001C */
/* #define _IPC7_CMP2IP_LENGTH                      0x00000003 */

/* #define _IPC7_USBIS_POSITION                     0x00000008 */
/* #define _IPC7_USBIS_MASK                         0x00000300 */
/* #define _IPC7_USBIS_LENGTH                       0x00000002 */

/* #define _IPC7_USBIP_POSITION                     0x0000000A */
/* #define _IPC7_USBIP_MASK                         0x00001C00 */
/* #define _IPC7_USBIP_LENGTH                       0x00000003 */

/* #define _IPC7_SPI1IS_POSITION                    0x00000010 */
/* #define _IPC7_SPI1IS_MASK                        0x00030000 */
/* #define _IPC7_SPI1IS_LENGTH                      0x00000002 */

/* #define _IPC7_SPI1IP_POSITION                    0x00000012 */
/* #define _IPC7_SPI1IP_MASK                        0x001C0000 */
/* #define _IPC7_SPI1IP_LENGTH                      0x00000003 */

/* #define _IPC7_U1IS_POSITION                      0x00000018 */
/* #define _IPC7_U1IS_MASK                          0x03000000 */
/* #define _IPC7_U1IS_LENGTH                        0x00000002 */

/* #define _IPC7_U1IP_POSITION                      0x0000001A */
/* #define _IPC7_U1IP_MASK                          0x1C000000 */
/* #define _IPC7_U1IP_LENGTH                        0x00000003 */

/* #define _IPC7_w_POSITION                         0x00000000 */
/* #define _IPC7_w_MASK                             0xFFFFFFFF */
/* #define _IPC7_w_LENGTH                           0x00000020 */

/* #define _IPC8_I2C1IS_POSITION                    0x00000000 */
/* #define _IPC8_I2C1IS_MASK                        0x00000003 */
/* #define _IPC8_I2C1IS_LENGTH                      0x00000002 */

/* #define _IPC8_I2C1IP_POSITION                    0x00000002 */
/* #define _IPC8_I2C1IP_MASK                        0x0000001C */
/* #define _IPC8_I2C1IP_LENGTH                      0x00000003 */

/* #define _IPC8_CNIS_POSITION                      0x00000008 */
/* #define _IPC8_CNIS_MASK                          0x00000300 */
/* #define _IPC8_CNIS_LENGTH                        0x00000002 */

/* #define _IPC8_CNIP_POSITION                      0x0000000A */
/* #define _IPC8_CNIP_MASK                          0x00001C00 */
/* #define _IPC8_CNIP_LENGTH                        0x00000003 */

/* #define _IPC8_PMPIS_POSITION                     0x00000010 */
/* #define _IPC8_PMPIS_MASK                         0x00030000 */
/* #define _IPC8_PMPIS_LENGTH                       0x00000002 */

/* #define _IPC8_PMPIP_POSITION                     0x00000012 */
/* #define _IPC8_PMPIP_MASK                         0x001C0000 */
/* #define _IPC8_PMPIP_LENGTH                       0x00000003 */

/* #define _IPC8_SPI2IS_POSITION                    0x00000018 */
/* #define _IPC8_SPI2IS_MASK                        0x03000000 */
/* #define _IPC8_SPI2IS_LENGTH                      0x00000002 */

/* #define _IPC8_SPI2IP_POSITION                    0x0000001A */
/* #define _IPC8_SPI2IP_MASK                        0x1C000000 */
/* #define _IPC8_SPI2IP_LENGTH                      0x00000003 */

/* #define _IPC8_w_POSITION                         0x00000000 */
/* #define _IPC8_w_MASK                             0xFFFFFFFF */
/* #define _IPC8_w_LENGTH                           0x00000020 */

/* #define _IPC9_U2IS_POSITION                      0x00000000 */
/* #define _IPC9_U2IS_MASK                          0x00000003 */
/* #define _IPC9_U2IS_LENGTH                        0x00000002 */

/* #define _IPC9_U2IP_POSITION                      0x00000002 */
/* #define _IPC9_U2IP_MASK                          0x0000001C */
/* #define _IPC9_U2IP_LENGTH                        0x00000003 */

/* #define _IPC9_I2C2IS_POSITION                    0x00000008 */
/* #define _IPC9_I2C2IS_MASK                        0x00000300 */
/* #define _IPC9_I2C2IS_LENGTH                      0x00000002 */

/* #define _IPC9_I2C2IP_POSITION                    0x0000000A */
/* #define _IPC9_I2C2IP_MASK                        0x00001C00 */
/* #define _IPC9_I2C2IP_LENGTH                      0x00000003 */

/* #define _IPC9_U3IS_POSITION                      0x00000010 */
/* #define _IPC9_U3IS_MASK                          0x00030000 */
/* #define _IPC9_U3IS_LENGTH                        0x00000002 */

/* #define _IPC9_U3IP_POSITION                      0x00000012 */
/* #define _IPC9_U3IP_MASK                          0x001C0000 */
/* #define _IPC9_U3IP_LENGTH                        0x00000003 */

/* #define _IPC9_U4IS_POSITION                      0x00000018 */
/* #define _IPC9_U4IS_MASK                          0x03000000 */
/* #define _IPC9_U4IS_LENGTH                        0x00000002 */

/* #define _IPC9_U4IP_POSITION                      0x0000001A */
/* #define _IPC9_U4IP_MASK                          0x1C000000 */
/* #define _IPC9_U4IP_LENGTH                        0x00000003 */

/* #define _IPC9_w_POSITION                         0x00000000 */
/* #define _IPC9_w_MASK                             0xFFFFFFFF */
/* #define _IPC9_w_LENGTH                           0x00000020 */

/* #define _IPC10_CTMUIP_POSITION                   0x00000008 */
/* #define _IPC10_CTMUIP_MASK                       0x00000300 */
/* #define _IPC10_CTMUIP_LENGTH                     0x00000002 */

/* #define _IPC10_CTMUIS_POSITION                   0x0000000A */
/* #define _IPC10_CTMUIS_MASK                       0x00001C00 */
/* #define _IPC10_CTMUIS_LENGTH                     0x00000003 */

/* #define _IPC10_DMA0IS_POSITION                   0x00000010 */
/* #define _IPC10_DMA0IS_MASK                       0x00030000 */
/* #define _IPC10_DMA0IS_LENGTH                     0x00000002 */

/* #define _IPC10_DMA0IP_POSITION                   0x00000012 */
/* #define _IPC10_DMA0IP_MASK                       0x001C0000 */
/* #define _IPC10_DMA0IP_LENGTH                     0x00000003 */

/* #define _IPC10_DMA1IS_POSITION                   0x00000018 */
/* #define _IPC10_DMA1IS_MASK                       0x03000000 */
/* #define _IPC10_DMA1IS_LENGTH                     0x00000002 */

/* #define _IPC10_DMA1IP_POSITION                   0x0000001A */
/* #define _IPC10_DMA1IP_MASK                       0x1C000000 */
/* #define _IPC10_DMA1IP_LENGTH                     0x00000003 */

/* #define _IPC10_w_POSITION                        0x00000000 */
/* #define _IPC10_w_MASK                            0xFFFFFFFF */
/* #define _IPC10_w_LENGTH                          0x00000020 */

/* #define _IPC11_DMA2IS_POSITION                   0x00000000 */
/* #define _IPC11_DMA2IS_MASK                       0x00000003 */
/* #define _IPC11_DMA2IS_LENGTH                     0x00000002 */

/* #define _IPC11_DMA2IP_POSITION                   0x00000002 */
/* #define _IPC11_DMA2IP_MASK                       0x0000001C */
/* #define _IPC11_DMA2IP_LENGTH                     0x00000003 */

/* #define _IPC11_DMA3IS_POSITION                   0x00000008 */
/* #define _IPC11_DMA3IS_MASK                       0x00000300 */
/* #define _IPC11_DMA3IS_LENGTH                     0x00000002 */

/* #define _IPC11_DMA3IP_POSITION                   0x0000000A */
/* #define _IPC11_DMA3IP_MASK                       0x00001C00 */
/* #define _IPC11_DMA3IP_LENGTH                     0x00000003 */

/* #define _IPC11_w_POSITION                        0x00000000 */
/* #define _IPC11_w_MASK                            0xFFFFFFFF */
/* #define _IPC11_w_LENGTH                          0x00000020 */

/* #define _BMXCON_BMXARB_POSITION                  0x00000000 */
/* #define _BMXCON_BMXARB_MASK                      0x00000007 */
/* #define _BMXCON_BMXARB_LENGTH                    0x00000003 */

/* #define _BMXCON_BMXWSDRM_POSITION                0x00000006 */
/* #define _BMXCON_BMXWSDRM_MASK                    0x00000040 */
/* #define _BMXCON_BMXWSDRM_LENGTH                  0x00000001 */

/* #define _BMXCON_BMXERRIS_POSITION                0x00000010 */
/* #define _BMXCON_BMXERRIS_MASK                    0x00010000 */
/* #define _BMXCON_BMXERRIS_LENGTH                  0x00000001 */

/* #define _BMXCON_BMXERRDS_POSITION                0x00000011 */
/* #define _BMXCON_BMXERRDS_MASK                    0x00020000 */
/* #define _BMXCON_BMXERRDS_LENGTH                  0x00000001 */

/* #define _BMXCON_BMXERRDMA_POSITION               0x00000012 */
/* #define _BMXCON_BMXERRDMA_MASK                   0x00040000 */
/* #define _BMXCON_BMXERRDMA_LENGTH                 0x00000001 */

/* #define _BMXCON_BMXERRICD_POSITION               0x00000013 */
/* #define _BMXCON_BMXERRICD_MASK                   0x00080000 */
/* #define _BMXCON_BMXERRICD_LENGTH                 0x00000001 */

/* #define _BMXCON_BMXERRIXI_POSITION               0x00000014 */
/* #define _BMXCON_BMXERRIXI_MASK                   0x00100000 */
/* #define _BMXCON_BMXERRIXI_LENGTH                 0x00000001 */

/* #define _BMXCON_BMXCHEDMA_POSITION               0x0000001A */
/* #define _BMXCON_BMXCHEDMA_MASK                   0x04000000 */
/* #define _BMXCON_BMXCHEDMA_LENGTH                 0x00000001 */

/* #define _BMXCON_w_POSITION                       0x00000000 */
/* #define _BMXCON_w_MASK                           0xFFFFFFFF */
/* #define _BMXCON_w_LENGTH                         0x00000020 */

/* #define _DMACON_DMABUSY_POSITION                 0x0000000B */
/* #define _DMACON_DMABUSY_MASK                     0x00000800 */
/* #define _DMACON_DMABUSY_LENGTH                   0x00000001 */

/* #define _DMACON_SUSPEND_POSITION                 0x0000000C */
/* #define _DMACON_SUSPEND_MASK                     0x00001000 */
/* #define _DMACON_SUSPEND_LENGTH                   0x00000001 */

/* #define _DMACON_ON_POSITION                      0x0000000F */
/* #define _DMACON_ON_MASK                          0x00008000 */
/* #define _DMACON_ON_LENGTH                        0x00000001 */

/* #define _DMACON_w_POSITION                       0x00000000 */
/* #define _DMACON_w_MASK                           0xFFFFFFFF */
/* #define _DMACON_w_LENGTH                         0x00000020 */

/* #define _DMASTAT_DMACH_POSITION                  0x00000000 */
/* #define _DMASTAT_DMACH_MASK                      0x00000007 */
/* #define _DMASTAT_DMACH_LENGTH                    0x00000003 */

/* #define _DMASTAT_RDWR_POSITION                   0x00000003 */
/* #define _DMASTAT_RDWR_MASK                       0x00000008 */
/* #define _DMASTAT_RDWR_LENGTH                     0x00000001 */

/* #define _DMASTAT_w_POSITION                      0x00000000 */
/* #define _DMASTAT_w_MASK                          0xFFFFFFFF */
/* #define _DMASTAT_w_LENGTH                        0x00000020 */

/* #define _DCRCCON_CRCCH_POSITION                  0x00000000 */
/* #define _DCRCCON_CRCCH_MASK                      0x00000007 */
/* #define _DCRCCON_CRCCH_LENGTH                    0x00000003 */

/* #define _DCRCCON_CRCTYP_POSITION                 0x00000005 */
/* #define _DCRCCON_CRCTYP_MASK                     0x00000020 */
/* #define _DCRCCON_CRCTYP_LENGTH                   0x00000001 */

/* #define _DCRCCON_CRCAPP_POSITION                 0x00000006 */
/* #define _DCRCCON_CRCAPP_MASK                     0x00000040 */
/* #define _DCRCCON_CRCAPP_LENGTH                   0x00000001 */

/* #define _DCRCCON_CRCEN_POSITION                  0x00000007 */
/* #define _DCRCCON_CRCEN_MASK                      0x00000080 */
/* #define _DCRCCON_CRCEN_LENGTH                    0x00000001 */

/* #define _DCRCCON_PLEN_POSITION                   0x00000008 */
/* #define _DCRCCON_PLEN_MASK                       0x00001F00 */
/* #define _DCRCCON_PLEN_LENGTH                     0x00000005 */

/* #define _DCRCCON_BITO_POSITION                   0x00000018 */
/* #define _DCRCCON_BITO_MASK                       0x01000000 */
/* #define _DCRCCON_BITO_LENGTH                     0x00000001 */

/* #define _DCRCCON_WBO_POSITION                    0x0000001B */
/* #define _DCRCCON_WBO_MASK                        0x08000000 */
/* #define _DCRCCON_WBO_LENGTH                      0x00000001 */

/* #define _DCRCCON_BYTO_POSITION                   0x0000001C */
/* #define _DCRCCON_BYTO_MASK                       0x30000000 */
/* #define _DCRCCON_BYTO_LENGTH                     0x00000002 */

/* #define _DCRCCON_w_POSITION                      0x00000000 */
/* #define _DCRCCON_w_MASK                          0xFFFFFFFF */
/* #define _DCRCCON_w_LENGTH                        0x00000020 */

/* #define _DCH0CON_CHPRI_POSITION                  0x00000000 */
/* #define _DCH0CON_CHPRI_MASK                      0x00000003 */
/* #define _DCH0CON_CHPRI_LENGTH                    0x00000002 */

/* #define _DCH0CON_CHEDET_POSITION                 0x00000002 */
/* #define _DCH0CON_CHEDET_MASK                     0x00000004 */
/* #define _DCH0CON_CHEDET_LENGTH                   0x00000001 */

/* #define _DCH0CON_CHAEN_POSITION                  0x00000004 */
/* #define _DCH0CON_CHAEN_MASK                      0x00000010 */
/* #define _DCH0CON_CHAEN_LENGTH                    0x00000001 */

/* #define _DCH0CON_CHCHN_POSITION                  0x00000005 */
/* #define _DCH0CON_CHCHN_MASK                      0x00000020 */
/* #define _DCH0CON_CHCHN_LENGTH                    0x00000001 */

/* #define _DCH0CON_CHAED_POSITION                  0x00000006 */
/* #define _DCH0CON_CHAED_MASK                      0x00000040 */
/* #define _DCH0CON_CHAED_LENGTH                    0x00000001 */

/* #define _DCH0CON_CHEN_POSITION                   0x00000007 */
/* #define _DCH0CON_CHEN_MASK                       0x00000080 */
/* #define _DCH0CON_CHEN_LENGTH                     0x00000001 */

/* #define _DCH0CON_CHCHNS_POSITION                 0x00000008 */
/* #define _DCH0CON_CHCHNS_MASK                     0x00000100 */
/* #define _DCH0CON_CHCHNS_LENGTH                   0x00000001 */

/* #define _DCH0CON_CHBUSY_POSITION                 0x0000000F */
/* #define _DCH0CON_CHBUSY_MASK                     0x00008000 */
/* #define _DCH0CON_CHBUSY_LENGTH                   0x00000001 */

/* #define _DCH0CON_w_POSITION                      0x00000000 */
/* #define _DCH0CON_w_MASK                          0xFFFFFFFF */
/* #define _DCH0CON_w_LENGTH                        0x00000020 */

/* #define _DCH0ECON_AIRQEN_POSITION                0x00000003 */
/* #define _DCH0ECON_AIRQEN_MASK                    0x00000008 */
/* #define _DCH0ECON_AIRQEN_LENGTH                  0x00000001 */

/* #define _DCH0ECON_SIRQEN_POSITION                0x00000004 */
/* #define _DCH0ECON_SIRQEN_MASK                    0x00000010 */
/* #define _DCH0ECON_SIRQEN_LENGTH                  0x00000001 */

/* #define _DCH0ECON_PATEN_POSITION                 0x00000005 */
/* #define _DCH0ECON_PATEN_MASK                     0x00000020 */
/* #define _DCH0ECON_PATEN_LENGTH                   0x00000001 */

/* #define _DCH0ECON_CABORT_POSITION                0x00000006 */
/* #define _DCH0ECON_CABORT_MASK                    0x00000040 */
/* #define _DCH0ECON_CABORT_LENGTH                  0x00000001 */

/* #define _DCH0ECON_CFORCE_POSITION                0x00000007 */
/* #define _DCH0ECON_CFORCE_MASK                    0x00000080 */
/* #define _DCH0ECON_CFORCE_LENGTH                  0x00000001 */

/* #define _DCH0ECON_CHSIRQ_POSITION                0x00000008 */
/* #define _DCH0ECON_CHSIRQ_MASK                    0x0000FF00 */
/* #define _DCH0ECON_CHSIRQ_LENGTH                  0x00000008 */

/* #define _DCH0ECON_CHAIRQ_POSITION                0x00000010 */
/* #define _DCH0ECON_CHAIRQ_MASK                    0x00FF0000 */
/* #define _DCH0ECON_CHAIRQ_LENGTH                  0x00000008 */

/* #define _DCH0ECON_w_POSITION                     0x00000000 */
/* #define _DCH0ECON_w_MASK                         0xFFFFFFFF */
/* #define _DCH0ECON_w_LENGTH                       0x00000020 */

/* #define _DCH0INT_CHERIF_POSITION                 0x00000000 */
/* #define _DCH0INT_CHERIF_MASK                     0x00000001 */
/* #define _DCH0INT_CHERIF_LENGTH                   0x00000001 */

/* #define _DCH0INT_CHTAIF_POSITION                 0x00000001 */
/* #define _DCH0INT_CHTAIF_MASK                     0x00000002 */
/* #define _DCH0INT_CHTAIF_LENGTH                   0x00000001 */

/* #define _DCH0INT_CHCCIF_POSITION                 0x00000002 */
/* #define _DCH0INT_CHCCIF_MASK                     0x00000004 */
/* #define _DCH0INT_CHCCIF_LENGTH                   0x00000001 */

/* #define _DCH0INT_CHBCIF_POSITION                 0x00000003 */
/* #define _DCH0INT_CHBCIF_MASK                     0x00000008 */
/* #define _DCH0INT_CHBCIF_LENGTH                   0x00000001 */

/* #define _DCH0INT_CHDHIF_POSITION                 0x00000004 */
/* #define _DCH0INT_CHDHIF_MASK                     0x00000010 */
/* #define _DCH0INT_CHDHIF_LENGTH                   0x00000001 */

/* #define _DCH0INT_CHDDIF_POSITION                 0x00000005 */
/* #define _DCH0INT_CHDDIF_MASK                     0x00000020 */
/* #define _DCH0INT_CHDDIF_LENGTH                   0x00000001 */

/* #define _DCH0INT_CHSHIF_POSITION                 0x00000006 */
/* #define _DCH0INT_CHSHIF_MASK                     0x00000040 */
/* #define _DCH0INT_CHSHIF_LENGTH                   0x00000001 */

/* #define _DCH0INT_CHSDIF_POSITION                 0x00000007 */
/* #define _DCH0INT_CHSDIF_MASK                     0x00000080 */
/* #define _DCH0INT_CHSDIF_LENGTH                   0x00000001 */

/* #define _DCH0INT_CHERIE_POSITION                 0x00000010 */
/* #define _DCH0INT_CHERIE_MASK                     0x00010000 */
/* #define _DCH0INT_CHERIE_LENGTH                   0x00000001 */

/* #define _DCH0INT_CHTAIE_POSITION                 0x00000011 */
/* #define _DCH0INT_CHTAIE_MASK                     0x00020000 */
/* #define _DCH0INT_CHTAIE_LENGTH                   0x00000001 */

/* #define _DCH0INT_CHCCIE_POSITION                 0x00000012 */
/* #define _DCH0INT_CHCCIE_MASK                     0x00040000 */
/* #define _DCH0INT_CHCCIE_LENGTH                   0x00000001 */

/* #define _DCH0INT_CHBCIE_POSITION                 0x00000013 */
/* #define _DCH0INT_CHBCIE_MASK                     0x00080000 */
/* #define _DCH0INT_CHBCIE_LENGTH                   0x00000001 */

/* #define _DCH0INT_CHDHIE_POSITION                 0x00000014 */
/* #define _DCH0INT_CHDHIE_MASK                     0x00100000 */
/* #define _DCH0INT_CHDHIE_LENGTH                   0x00000001 */

/* #define _DCH0INT_CHDDIE_POSITION                 0x00000015 */
/* #define _DCH0INT_CHDDIE_MASK                     0x00200000 */
/* #define _DCH0INT_CHDDIE_LENGTH                   0x00000001 */

/* #define _DCH0INT_CHSHIE_POSITION                 0x00000016 */
/* #define _DCH0INT_CHSHIE_MASK                     0x00400000 */
/* #define _DCH0INT_CHSHIE_LENGTH                   0x00000001 */

/* #define _DCH0INT_CHSDIE_POSITION                 0x00000017 */
/* #define _DCH0INT_CHSDIE_MASK                     0x00800000 */
/* #define _DCH0INT_CHSDIE_LENGTH                   0x00000001 */

/* #define _DCH0INT_w_POSITION                      0x00000000 */
/* #define _DCH0INT_w_MASK                          0xFFFFFFFF */
/* #define _DCH0INT_w_LENGTH                        0x00000020 */

/* #define _DCH1CON_CHPRI_POSITION                  0x00000000 */
/* #define _DCH1CON_CHPRI_MASK                      0x00000003 */
/* #define _DCH1CON_CHPRI_LENGTH                    0x00000002 */

/* #define _DCH1CON_CHEDET_POSITION                 0x00000002 */
/* #define _DCH1CON_CHEDET_MASK                     0x00000004 */
/* #define _DCH1CON_CHEDET_LENGTH                   0x00000001 */

/* #define _DCH1CON_CHAEN_POSITION                  0x00000004 */
/* #define _DCH1CON_CHAEN_MASK                      0x00000010 */
/* #define _DCH1CON_CHAEN_LENGTH                    0x00000001 */

/* #define _DCH1CON_CHCHN_POSITION                  0x00000005 */
/* #define _DCH1CON_CHCHN_MASK                      0x00000020 */
/* #define _DCH1CON_CHCHN_LENGTH                    0x00000001 */

/* #define _DCH1CON_CHAED_POSITION                  0x00000006 */
/* #define _DCH1CON_CHAED_MASK                      0x00000040 */
/* #define _DCH1CON_CHAED_LENGTH                    0x00000001 */

/* #define _DCH1CON_CHEN_POSITION                   0x00000007 */
/* #define _DCH1CON_CHEN_MASK                       0x00000080 */
/* #define _DCH1CON_CHEN_LENGTH                     0x00000001 */

/* #define _DCH1CON_CHCHNS_POSITION                 0x00000008 */
/* #define _DCH1CON_CHCHNS_MASK                     0x00000100 */
/* #define _DCH1CON_CHCHNS_LENGTH                   0x00000001 */

/* #define _DCH1CON_CHBUSY_POSITION                 0x0000000F */
/* #define _DCH1CON_CHBUSY_MASK                     0x00008000 */
/* #define _DCH1CON_CHBUSY_LENGTH                   0x00000001 */

/* #define _DCH1CON_w_POSITION                      0x00000000 */
/* #define _DCH1CON_w_MASK                          0xFFFFFFFF */
/* #define _DCH1CON_w_LENGTH                        0x00000020 */

/* #define _DCH1ECON_AIRQEN_POSITION                0x00000003 */
/* #define _DCH1ECON_AIRQEN_MASK                    0x00000008 */
/* #define _DCH1ECON_AIRQEN_LENGTH                  0x00000001 */

/* #define _DCH1ECON_SIRQEN_POSITION                0x00000004 */
/* #define _DCH1ECON_SIRQEN_MASK                    0x00000010 */
/* #define _DCH1ECON_SIRQEN_LENGTH                  0x00000001 */

/* #define _DCH1ECON_PATEN_POSITION                 0x00000005 */
/* #define _DCH1ECON_PATEN_MASK                     0x00000020 */
/* #define _DCH1ECON_PATEN_LENGTH                   0x00000001 */

/* #define _DCH1ECON_CABORT_POSITION                0x00000006 */
/* #define _DCH1ECON_CABORT_MASK                    0x00000040 */
/* #define _DCH1ECON_CABORT_LENGTH                  0x00000001 */

/* #define _DCH1ECON_CFORCE_POSITION                0x00000007 */
/* #define _DCH1ECON_CFORCE_MASK                    0x00000080 */
/* #define _DCH1ECON_CFORCE_LENGTH                  0x00000001 */

/* #define _DCH1ECON_CHSIRQ_POSITION                0x00000008 */
/* #define _DCH1ECON_CHSIRQ_MASK                    0x0000FF00 */
/* #define _DCH1ECON_CHSIRQ_LENGTH                  0x00000008 */

/* #define _DCH1ECON_CHAIRQ_POSITION                0x00000010 */
/* #define _DCH1ECON_CHAIRQ_MASK                    0x00FF0000 */
/* #define _DCH1ECON_CHAIRQ_LENGTH                  0x00000008 */

/* #define _DCH1ECON_w_POSITION                     0x00000000 */
/* #define _DCH1ECON_w_MASK                         0xFFFFFFFF */
/* #define _DCH1ECON_w_LENGTH                       0x00000020 */

/* #define _DCH1INT_CHERIF_POSITION                 0x00000000 */
/* #define _DCH1INT_CHERIF_MASK                     0x00000001 */
/* #define _DCH1INT_CHERIF_LENGTH                   0x00000001 */

/* #define _DCH1INT_CHTAIF_POSITION                 0x00000001 */
/* #define _DCH1INT_CHTAIF_MASK                     0x00000002 */
/* #define _DCH1INT_CHTAIF_LENGTH                   0x00000001 */

/* #define _DCH1INT_CHCCIF_POSITION                 0x00000002 */
/* #define _DCH1INT_CHCCIF_MASK                     0x00000004 */
/* #define _DCH1INT_CHCCIF_LENGTH                   0x00000001 */

/* #define _DCH1INT_CHBCIF_POSITION                 0x00000003 */
/* #define _DCH1INT_CHBCIF_MASK                     0x00000008 */
/* #define _DCH1INT_CHBCIF_LENGTH                   0x00000001 */

/* #define _DCH1INT_CHDHIF_POSITION                 0x00000004 */
/* #define _DCH1INT_CHDHIF_MASK                     0x00000010 */
/* #define _DCH1INT_CHDHIF_LENGTH                   0x00000001 */

/* #define _DCH1INT_CHDDIF_POSITION                 0x00000005 */
/* #define _DCH1INT_CHDDIF_MASK                     0x00000020 */
/* #define _DCH1INT_CHDDIF_LENGTH                   0x00000001 */

/* #define _DCH1INT_CHSHIF_POSITION                 0x00000006 */
/* #define _DCH1INT_CHSHIF_MASK                     0x00000040 */
/* #define _DCH1INT_CHSHIF_LENGTH                   0x00000001 */

/* #define _DCH1INT_CHSDIF_POSITION                 0x00000007 */
/* #define _DCH1INT_CHSDIF_MASK                     0x00000080 */
/* #define _DCH1INT_CHSDIF_LENGTH                   0x00000001 */

/* #define _DCH1INT_CHERIE_POSITION                 0x00000010 */
/* #define _DCH1INT_CHERIE_MASK                     0x00010000 */
/* #define _DCH1INT_CHERIE_LENGTH                   0x00000001 */

/* #define _DCH1INT_CHTAIE_POSITION                 0x00000011 */
/* #define _DCH1INT_CHTAIE_MASK                     0x00020000 */
/* #define _DCH1INT_CHTAIE_LENGTH                   0x00000001 */

/* #define _DCH1INT_CHCCIE_POSITION                 0x00000012 */
/* #define _DCH1INT_CHCCIE_MASK                     0x00040000 */
/* #define _DCH1INT_CHCCIE_LENGTH                   0x00000001 */

/* #define _DCH1INT_CHBCIE_POSITION                 0x00000013 */
/* #define _DCH1INT_CHBCIE_MASK                     0x00080000 */
/* #define _DCH1INT_CHBCIE_LENGTH                   0x00000001 */

/* #define _DCH1INT_CHDHIE_POSITION                 0x00000014 */
/* #define _DCH1INT_CHDHIE_MASK                     0x00100000 */
/* #define _DCH1INT_CHDHIE_LENGTH                   0x00000001 */

/* #define _DCH1INT_CHDDIE_POSITION                 0x00000015 */
/* #define _DCH1INT_CHDDIE_MASK                     0x00200000 */
/* #define _DCH1INT_CHDDIE_LENGTH                   0x00000001 */

/* #define _DCH1INT_CHSHIE_POSITION                 0x00000016 */
/* #define _DCH1INT_CHSHIE_MASK                     0x00400000 */
/* #define _DCH1INT_CHSHIE_LENGTH                   0x00000001 */

/* #define _DCH1INT_CHSDIE_POSITION                 0x00000017 */
/* #define _DCH1INT_CHSDIE_MASK                     0x00800000 */
/* #define _DCH1INT_CHSDIE_LENGTH                   0x00000001 */

/* #define _DCH1INT_w_POSITION                      0x00000000 */
/* #define _DCH1INT_w_MASK                          0xFFFFFFFF */
/* #define _DCH1INT_w_LENGTH                        0x00000020 */

/* #define _DCH2CON_CHPRI_POSITION                  0x00000000 */
/* #define _DCH2CON_CHPRI_MASK                      0x00000003 */
/* #define _DCH2CON_CHPRI_LENGTH                    0x00000002 */

/* #define _DCH2CON_CHEDET_POSITION                 0x00000002 */
/* #define _DCH2CON_CHEDET_MASK                     0x00000004 */
/* #define _DCH2CON_CHEDET_LENGTH                   0x00000001 */

/* #define _DCH2CON_CHAEN_POSITION                  0x00000004 */
/* #define _DCH2CON_CHAEN_MASK                      0x00000010 */
/* #define _DCH2CON_CHAEN_LENGTH                    0x00000001 */

/* #define _DCH2CON_CHCHN_POSITION                  0x00000005 */
/* #define _DCH2CON_CHCHN_MASK                      0x00000020 */
/* #define _DCH2CON_CHCHN_LENGTH                    0x00000001 */

/* #define _DCH2CON_CHAED_POSITION                  0x00000006 */
/* #define _DCH2CON_CHAED_MASK                      0x00000040 */
/* #define _DCH2CON_CHAED_LENGTH                    0x00000001 */

/* #define _DCH2CON_CHEN_POSITION                   0x00000007 */
/* #define _DCH2CON_CHEN_MASK                       0x00000080 */
/* #define _DCH2CON_CHEN_LENGTH                     0x00000001 */

/* #define _DCH2CON_CHCHNS_POSITION                 0x00000008 */
/* #define _DCH2CON_CHCHNS_MASK                     0x00000100 */
/* #define _DCH2CON_CHCHNS_LENGTH                   0x00000001 */

/* #define _DCH2CON_CHBUSY_POSITION                 0x0000000F */
/* #define _DCH2CON_CHBUSY_MASK                     0x00008000 */
/* #define _DCH2CON_CHBUSY_LENGTH                   0x00000001 */

/* #define _DCH2CON_w_POSITION                      0x00000000 */
/* #define _DCH2CON_w_MASK                          0xFFFFFFFF */
/* #define _DCH2CON_w_LENGTH                        0x00000020 */

/* #define _DCH2ECON_AIRQEN_POSITION                0x00000003 */
/* #define _DCH2ECON_AIRQEN_MASK                    0x00000008 */
/* #define _DCH2ECON_AIRQEN_LENGTH                  0x00000001 */

/* #define _DCH2ECON_SIRQEN_POSITION                0x00000004 */
/* #define _DCH2ECON_SIRQEN_MASK                    0x00000010 */
/* #define _DCH2ECON_SIRQEN_LENGTH                  0x00000001 */

/* #define _DCH2ECON_PATEN_POSITION                 0x00000005 */
/* #define _DCH2ECON_PATEN_MASK                     0x00000020 */
/* #define _DCH2ECON_PATEN_LENGTH                   0x00000001 */

/* #define _DCH2ECON_CABORT_POSITION                0x00000006 */
/* #define _DCH2ECON_CABORT_MASK                    0x00000040 */
/* #define _DCH2ECON_CABORT_LENGTH                  0x00000001 */

/* #define _DCH2ECON_CFORCE_POSITION                0x00000007 */
/* #define _DCH2ECON_CFORCE_MASK                    0x00000080 */
/* #define _DCH2ECON_CFORCE_LENGTH                  0x00000001 */

/* #define _DCH2ECON_CHSIRQ_POSITION                0x00000008 */
/* #define _DCH2ECON_CHSIRQ_MASK                    0x0000FF00 */
/* #define _DCH2ECON_CHSIRQ_LENGTH                  0x00000008 */

/* #define _DCH2ECON_CHAIRQ_POSITION                0x00000010 */
/* #define _DCH2ECON_CHAIRQ_MASK                    0x00FF0000 */
/* #define _DCH2ECON_CHAIRQ_LENGTH                  0x00000008 */

/* #define _DCH2ECON_w_POSITION                     0x00000000 */
/* #define _DCH2ECON_w_MASK                         0xFFFFFFFF */
/* #define _DCH2ECON_w_LENGTH                       0x00000020 */

/* #define _DCH2INT_CHERIF_POSITION                 0x00000000 */
/* #define _DCH2INT_CHERIF_MASK                     0x00000001 */
/* #define _DCH2INT_CHERIF_LENGTH                   0x00000001 */

/* #define _DCH2INT_CHTAIF_POSITION                 0x00000001 */
/* #define _DCH2INT_CHTAIF_MASK                     0x00000002 */
/* #define _DCH2INT_CHTAIF_LENGTH                   0x00000001 */

/* #define _DCH2INT_CHCCIF_POSITION                 0x00000002 */
/* #define _DCH2INT_CHCCIF_MASK                     0x00000004 */
/* #define _DCH2INT_CHCCIF_LENGTH                   0x00000001 */

/* #define _DCH2INT_CHBCIF_POSITION                 0x00000003 */
/* #define _DCH2INT_CHBCIF_MASK                     0x00000008 */
/* #define _DCH2INT_CHBCIF_LENGTH                   0x00000001 */

/* #define _DCH2INT_CHDHIF_POSITION                 0x00000004 */
/* #define _DCH2INT_CHDHIF_MASK                     0x00000010 */
/* #define _DCH2INT_CHDHIF_LENGTH                   0x00000001 */

/* #define _DCH2INT_CHDDIF_POSITION                 0x00000005 */
/* #define _DCH2INT_CHDDIF_MASK                     0x00000020 */
/* #define _DCH2INT_CHDDIF_LENGTH                   0x00000001 */

/* #define _DCH2INT_CHSHIF_POSITION                 0x00000006 */
/* #define _DCH2INT_CHSHIF_MASK                     0x00000040 */
/* #define _DCH2INT_CHSHIF_LENGTH                   0x00000001 */

/* #define _DCH2INT_CHSDIF_POSITION                 0x00000007 */
/* #define _DCH2INT_CHSDIF_MASK                     0x00000080 */
/* #define _DCH2INT_CHSDIF_LENGTH                   0x00000001 */

/* #define _DCH2INT_CHERIE_POSITION                 0x00000010 */
/* #define _DCH2INT_CHERIE_MASK                     0x00010000 */
/* #define _DCH2INT_CHERIE_LENGTH                   0x00000001 */

/* #define _DCH2INT_CHTAIE_POSITION                 0x00000011 */
/* #define _DCH2INT_CHTAIE_MASK                     0x00020000 */
/* #define _DCH2INT_CHTAIE_LENGTH                   0x00000001 */

/* #define _DCH2INT_CHCCIE_POSITION                 0x00000012 */
/* #define _DCH2INT_CHCCIE_MASK                     0x00040000 */
/* #define _DCH2INT_CHCCIE_LENGTH                   0x00000001 */

/* #define _DCH2INT_CHBCIE_POSITION                 0x00000013 */
/* #define _DCH2INT_CHBCIE_MASK                     0x00080000 */
/* #define _DCH2INT_CHBCIE_LENGTH                   0x00000001 */

/* #define _DCH2INT_CHDHIE_POSITION                 0x00000014 */
/* #define _DCH2INT_CHDHIE_MASK                     0x00100000 */
/* #define _DCH2INT_CHDHIE_LENGTH                   0x00000001 */

/* #define _DCH2INT_CHDDIE_POSITION                 0x00000015 */
/* #define _DCH2INT_CHDDIE_MASK                     0x00200000 */
/* #define _DCH2INT_CHDDIE_LENGTH                   0x00000001 */

/* #define _DCH2INT_CHSHIE_POSITION                 0x00000016 */
/* #define _DCH2INT_CHSHIE_MASK                     0x00400000 */
/* #define _DCH2INT_CHSHIE_LENGTH                   0x00000001 */

/* #define _DCH2INT_CHSDIE_POSITION                 0x00000017 */
/* #define _DCH2INT_CHSDIE_MASK                     0x00800000 */
/* #define _DCH2INT_CHSDIE_LENGTH                   0x00000001 */

/* #define _DCH2INT_w_POSITION                      0x00000000 */
/* #define _DCH2INT_w_MASK                          0xFFFFFFFF */
/* #define _DCH2INT_w_LENGTH                        0x00000020 */

/* #define _DCH3CON_CHPRI_POSITION                  0x00000000 */
/* #define _DCH3CON_CHPRI_MASK                      0x00000003 */
/* #define _DCH3CON_CHPRI_LENGTH                    0x00000002 */

/* #define _DCH3CON_CHEDET_POSITION                 0x00000002 */
/* #define _DCH3CON_CHEDET_MASK                     0x00000004 */
/* #define _DCH3CON_CHEDET_LENGTH                   0x00000001 */

/* #define _DCH3CON_CHAEN_POSITION                  0x00000004 */
/* #define _DCH3CON_CHAEN_MASK                      0x00000010 */
/* #define _DCH3CON_CHAEN_LENGTH                    0x00000001 */

/* #define _DCH3CON_CHCHN_POSITION                  0x00000005 */
/* #define _DCH3CON_CHCHN_MASK                      0x00000020 */
/* #define _DCH3CON_CHCHN_LENGTH                    0x00000001 */

/* #define _DCH3CON_CHAED_POSITION                  0x00000006 */
/* #define _DCH3CON_CHAED_MASK                      0x00000040 */
/* #define _DCH3CON_CHAED_LENGTH                    0x00000001 */

/* #define _DCH3CON_CHEN_POSITION                   0x00000007 */
/* #define _DCH3CON_CHEN_MASK                       0x00000080 */
/* #define _DCH3CON_CHEN_LENGTH                     0x00000001 */

/* #define _DCH3CON_CHCHNS_POSITION                 0x00000008 */
/* #define _DCH3CON_CHCHNS_MASK                     0x00000100 */
/* #define _DCH3CON_CHCHNS_LENGTH                   0x00000001 */

/* #define _DCH3CON_CHBUSY_POSITION                 0x0000000F */
/* #define _DCH3CON_CHBUSY_MASK                     0x00008000 */
/* #define _DCH3CON_CHBUSY_LENGTH                   0x00000001 */

/* #define _DCH3CON_w_POSITION                      0x00000000 */
/* #define _DCH3CON_w_MASK                          0xFFFFFFFF */
/* #define _DCH3CON_w_LENGTH                        0x00000020 */

/* #define _DCH3ECON_AIRQEN_POSITION                0x00000003 */
/* #define _DCH3ECON_AIRQEN_MASK                    0x00000008 */
/* #define _DCH3ECON_AIRQEN_LENGTH                  0x00000001 */

/* #define _DCH3ECON_SIRQEN_POSITION                0x00000004 */
/* #define _DCH3ECON_SIRQEN_MASK                    0x00000010 */
/* #define _DCH3ECON_SIRQEN_LENGTH                  0x00000001 */

/* #define _DCH3ECON_PATEN_POSITION                 0x00000005 */
/* #define _DCH3ECON_PATEN_MASK                     0x00000020 */
/* #define _DCH3ECON_PATEN_LENGTH                   0x00000001 */

/* #define _DCH3ECON_CABORT_POSITION                0x00000006 */
/* #define _DCH3ECON_CABORT_MASK                    0x00000040 */
/* #define _DCH3ECON_CABORT_LENGTH                  0x00000001 */

/* #define _DCH3ECON_CFORCE_POSITION                0x00000007 */
/* #define _DCH3ECON_CFORCE_MASK                    0x00000080 */
/* #define _DCH3ECON_CFORCE_LENGTH                  0x00000001 */

/* #define _DCH3ECON_CHSIRQ_POSITION                0x00000008 */
/* #define _DCH3ECON_CHSIRQ_MASK                    0x0000FF00 */
/* #define _DCH3ECON_CHSIRQ_LENGTH                  0x00000008 */

/* #define _DCH3ECON_CHAIRQ_POSITION                0x00000010 */
/* #define _DCH3ECON_CHAIRQ_MASK                    0x00FF0000 */
/* #define _DCH3ECON_CHAIRQ_LENGTH                  0x00000008 */

/* #define _DCH3ECON_w_POSITION                     0x00000000 */
/* #define _DCH3ECON_w_MASK                         0xFFFFFFFF */
/* #define _DCH3ECON_w_LENGTH                       0x00000020 */

/* #define _DCH3INT_CHERIF_POSITION                 0x00000000 */
/* #define _DCH3INT_CHERIF_MASK                     0x00000001 */
/* #define _DCH3INT_CHERIF_LENGTH                   0x00000001 */

/* #define _DCH3INT_CHTAIF_POSITION                 0x00000001 */
/* #define _DCH3INT_CHTAIF_MASK                     0x00000002 */
/* #define _DCH3INT_CHTAIF_LENGTH                   0x00000001 */

/* #define _DCH3INT_CHCCIF_POSITION                 0x00000002 */
/* #define _DCH3INT_CHCCIF_MASK                     0x00000004 */
/* #define _DCH3INT_CHCCIF_LENGTH                   0x00000001 */

/* #define _DCH3INT_CHBCIF_POSITION                 0x00000003 */
/* #define _DCH3INT_CHBCIF_MASK                     0x00000008 */
/* #define _DCH3INT_CHBCIF_LENGTH                   0x00000001 */

/* #define _DCH3INT_CHDHIF_POSITION                 0x00000004 */
/* #define _DCH3INT_CHDHIF_MASK                     0x00000010 */
/* #define _DCH3INT_CHDHIF_LENGTH                   0x00000001 */

/* #define _DCH3INT_CHDDIF_POSITION                 0x00000005 */
/* #define _DCH3INT_CHDDIF_MASK                     0x00000020 */
/* #define _DCH3INT_CHDDIF_LENGTH                   0x00000001 */

/* #define _DCH3INT_CHSHIF_POSITION                 0x00000006 */
/* #define _DCH3INT_CHSHIF_MASK                     0x00000040 */
/* #define _DCH3INT_CHSHIF_LENGTH                   0x00000001 */

/* #define _DCH3INT_CHSDIF_POSITION                 0x00000007 */
/* #define _DCH3INT_CHSDIF_MASK                     0x00000080 */
/* #define _DCH3INT_CHSDIF_LENGTH                   0x00000001 */

/* #define _DCH3INT_CHERIE_POSITION                 0x00000010 */
/* #define _DCH3INT_CHERIE_MASK                     0x00010000 */
/* #define _DCH3INT_CHERIE_LENGTH                   0x00000001 */

/* #define _DCH3INT_CHTAIE_POSITION                 0x00000011 */
/* #define _DCH3INT_CHTAIE_MASK                     0x00020000 */
/* #define _DCH3INT_CHTAIE_LENGTH                   0x00000001 */

/* #define _DCH3INT_CHCCIE_POSITION                 0x00000012 */
/* #define _DCH3INT_CHCCIE_MASK                     0x00040000 */
/* #define _DCH3INT_CHCCIE_LENGTH                   0x00000001 */

/* #define _DCH3INT_CHBCIE_POSITION                 0x00000013 */
/* #define _DCH3INT_CHBCIE_MASK                     0x00080000 */
/* #define _DCH3INT_CHBCIE_LENGTH                   0x00000001 */

/* #define _DCH3INT_CHDHIE_POSITION                 0x00000014 */
/* #define _DCH3INT_CHDHIE_MASK                     0x00100000 */
/* #define _DCH3INT_CHDHIE_LENGTH                   0x00000001 */

/* #define _DCH3INT_CHDDIE_POSITION                 0x00000015 */
/* #define _DCH3INT_CHDDIE_MASK                     0x00200000 */
/* #define _DCH3INT_CHDDIE_LENGTH                   0x00000001 */

/* #define _DCH3INT_CHSHIE_POSITION                 0x00000016 */
/* #define _DCH3INT_CHSHIE_MASK                     0x00400000 */
/* #define _DCH3INT_CHSHIE_LENGTH                   0x00000001 */

/* #define _DCH3INT_CHSDIE_POSITION                 0x00000017 */
/* #define _DCH3INT_CHSDIE_MASK                     0x00800000 */
/* #define _DCH3INT_CHSDIE_LENGTH                   0x00000001 */

/* #define _DCH3INT_w_POSITION                      0x00000000 */
/* #define _DCH3INT_w_MASK                          0xFFFFFFFF */
/* #define _DCH3INT_w_LENGTH                        0x00000020 */

/* #define _CHECON_PFMWS_POSITION                   0x00000000 */
/* #define _CHECON_PFMWS_MASK                       0x00000007 */
/* #define _CHECON_PFMWS_LENGTH                     0x00000003 */

/* #define _CHECON_PREFEN_POSITION                  0x00000004 */
/* #define _CHECON_PREFEN_MASK                      0x00000030 */
/* #define _CHECON_PREFEN_LENGTH                    0x00000002 */

/* #define _CHECON_DCSZ_POSITION                    0x00000008 */
/* #define _CHECON_DCSZ_MASK                        0x00000300 */
/* #define _CHECON_DCSZ_LENGTH                      0x00000002 */

/* #define _CHECON_CHECOH_POSITION                  0x00000010 */
/* #define _CHECON_CHECOH_MASK                      0x00010000 */
/* #define _CHECON_CHECOH_LENGTH                    0x00000001 */

/* #define _CHECON_w_POSITION                       0x00000000 */
/* #define _CHECON_w_MASK                           0xFFFFFFFF */
/* #define _CHECON_w_LENGTH                         0x00000020 */

/* #define _CHEACC_CHEIDX_POSITION                  0x00000000 */
/* #define _CHEACC_CHEIDX_MASK                      0x0000000F */
/* #define _CHEACC_CHEIDX_LENGTH                    0x00000004 */

/* #define _CHEACC_CHEWEN_POSITION                  0x0000001F */
/* #define _CHEACC_CHEWEN_MASK                      0x80000000 */
/* #define _CHEACC_CHEWEN_LENGTH                    0x00000001 */

/* #define _CHETAG_LTYPE_POSITION                   0x00000001 */
/* #define _CHETAG_LTYPE_MASK                       0x00000002 */
/* #define _CHETAG_LTYPE_LENGTH                     0x00000001 */

/* #define _CHETAG_LLOCK_POSITION                   0x00000002 */
/* #define _CHETAG_LLOCK_MASK                       0x00000004 */
/* #define _CHETAG_LLOCK_LENGTH                     0x00000001 */

/* #define _CHETAG_LVALID_POSITION                  0x00000003 */
/* #define _CHETAG_LVALID_MASK                      0x00000008 */
/* #define _CHETAG_LVALID_LENGTH                    0x00000001 */

/* #define _CHETAG_LTAG_POSITION                    0x00000004 */
/* #define _CHETAG_LTAG_MASK                        0x00FFFFF0 */
/* #define _CHETAG_LTAG_LENGTH                      0x00000014 */

/* #define _CHETAG_LTAGBOOT_POSITION                0x0000001F */
/* #define _CHETAG_LTAGBOOT_MASK                    0x80000000 */
/* #define _CHETAG_LTAGBOOT_LENGTH                  0x00000001 */

/* #define _CHETAG_w_POSITION                       0x00000000 */
/* #define _CHETAG_w_MASK                           0xFFFFFFFF */
/* #define _CHETAG_w_LENGTH                         0x00000020 */

/* #define _CHEMSK_LMASK_POSITION                   0x00000005 */
/* #define _CHEMSK_LMASK_MASK                       0x0000FFE0 */
/* #define _CHEMSK_LMASK_LENGTH                     0x0000000B */

/* #define _CHEW0_CHEW0_POSITION                    0x00000000 */
/* #define _CHEW0_CHEW0_MASK                        0xFFFFFFFF */
/* #define _CHEW0_CHEW0_LENGTH                      0x00000020 */

/* #define _CHEW1_CHEW1_POSITION                    0x00000000 */
/* #define _CHEW1_CHEW1_MASK                        0xFFFFFFFF */
/* #define _CHEW1_CHEW1_LENGTH                      0x00000020 */

/* #define _CHEW2_CHEW2_POSITION                    0x00000000 */
/* #define _CHEW2_CHEW2_MASK                        0xFFFFFFFF */
/* #define _CHEW2_CHEW2_LENGTH                      0x00000020 */

/* #define _CHEW3_CHEW3_POSITION                    0x00000000 */
/* #define _CHEW3_CHEW3_MASK                        0xFFFFFFFF */
/* #define _CHEW3_CHEW3_LENGTH                      0x00000020 */

/* #define _CHELRU_CHELRU_POSITION                  0x00000000 */
/* #define _CHELRU_CHELRU_MASK                      0x01FFFFFF */
/* #define _CHELRU_CHELRU_LENGTH                    0x00000019 */

/* #define _CHEHIT_CHEHIT_POSITION                  0x00000000 */
/* #define _CHEHIT_CHEHIT_MASK                      0xFFFFFFFF */
/* #define _CHEHIT_CHEHIT_LENGTH                    0x00000020 */

/* #define _CHEMIS_CHEMIS_POSITION                  0x00000000 */
/* #define _CHEMIS_CHEMIS_MASK                      0xFFFFFFFF */
/* #define _CHEMIS_CHEMIS_LENGTH                    0x00000020 */

/* #define _CHEPFABT_CHEPFABT_POSITION              0x00000000 */
/* #define _CHEPFABT_CHEPFABT_MASK                  0xFFFFFFFF */
/* #define _CHEPFABT_CHEPFABT_LENGTH                0x00000020 */

/* #define _U1OTGIR_VBUSVDIF_POSITION               0x00000000 */
/* #define _U1OTGIR_VBUSVDIF_MASK                   0x00000001 */
/* #define _U1OTGIR_VBUSVDIF_LENGTH                 0x00000001 */

/* #define _U1OTGIR_SESENDIF_POSITION               0x00000002 */
/* #define _U1OTGIR_SESENDIF_MASK                   0x00000004 */
/* #define _U1OTGIR_SESENDIF_LENGTH                 0x00000001 */

/* #define _U1OTGIR_SESVDIF_POSITION                0x00000003 */
/* #define _U1OTGIR_SESVDIF_MASK                    0x00000008 */
/* #define _U1OTGIR_SESVDIF_LENGTH                  0x00000001 */

/* #define _U1OTGIR_ACTVIF_POSITION                 0x00000004 */
/* #define _U1OTGIR_ACTVIF_MASK                     0x00000010 */
/* #define _U1OTGIR_ACTVIF_LENGTH                   0x00000001 */

/* #define _U1OTGIR_LSTATEIF_POSITION               0x00000005 */
/* #define _U1OTGIR_LSTATEIF_MASK                   0x00000020 */
/* #define _U1OTGIR_LSTATEIF_LENGTH                 0x00000001 */

/* #define _U1OTGIR_T1MSECIF_POSITION               0x00000006 */
/* #define _U1OTGIR_T1MSECIF_MASK                   0x00000040 */
/* #define _U1OTGIR_T1MSECIF_LENGTH                 0x00000001 */

/* #define _U1OTGIR_IDIF_POSITION                   0x00000007 */
/* #define _U1OTGIR_IDIF_MASK                       0x00000080 */
/* #define _U1OTGIR_IDIF_LENGTH                     0x00000001 */

/* #define _U1OTGIE_VBUSVDIE_POSITION               0x00000000 */
/* #define _U1OTGIE_VBUSVDIE_MASK                   0x00000001 */
/* #define _U1OTGIE_VBUSVDIE_LENGTH                 0x00000001 */

/* #define _U1OTGIE_SESENDIE_POSITION               0x00000002 */
/* #define _U1OTGIE_SESENDIE_MASK                   0x00000004 */
/* #define _U1OTGIE_SESENDIE_LENGTH                 0x00000001 */

/* #define _U1OTGIE_SESVDIE_POSITION                0x00000003 */
/* #define _U1OTGIE_SESVDIE_MASK                    0x00000008 */
/* #define _U1OTGIE_SESVDIE_LENGTH                  0x00000001 */

/* #define _U1OTGIE_ACTVIE_POSITION                 0x00000004 */
/* #define _U1OTGIE_ACTVIE_MASK                     0x00000010 */
/* #define _U1OTGIE_ACTVIE_LENGTH                   0x00000001 */

/* #define _U1OTGIE_LSTATEIE_POSITION               0x00000005 */
/* #define _U1OTGIE_LSTATEIE_MASK                   0x00000020 */
/* #define _U1OTGIE_LSTATEIE_LENGTH                 0x00000001 */

/* #define _U1OTGIE_T1MSECIE_POSITION               0x00000006 */
/* #define _U1OTGIE_T1MSECIE_MASK                   0x00000040 */
/* #define _U1OTGIE_T1MSECIE_LENGTH                 0x00000001 */

/* #define _U1OTGIE_IDIE_POSITION                   0x00000007 */
/* #define _U1OTGIE_IDIE_MASK                       0x00000080 */
/* #define _U1OTGIE_IDIE_LENGTH                     0x00000001 */

/* #define _U1OTGSTAT_VBUSVD_POSITION               0x00000000 */
/* #define _U1OTGSTAT_VBUSVD_MASK                   0x00000001 */
/* #define _U1OTGSTAT_VBUSVD_LENGTH                 0x00000001 */

/* #define _U1OTGSTAT_SESEND_POSITION               0x00000002 */
/* #define _U1OTGSTAT_SESEND_MASK                   0x00000004 */
/* #define _U1OTGSTAT_SESEND_LENGTH                 0x00000001 */

/* #define _U1OTGSTAT_SESVD_POSITION                0x00000003 */
/* #define _U1OTGSTAT_SESVD_MASK                    0x00000008 */
/* #define _U1OTGSTAT_SESVD_LENGTH                  0x00000001 */

/* #define _U1OTGSTAT_LSTATE_POSITION               0x00000005 */
/* #define _U1OTGSTAT_LSTATE_MASK                   0x00000020 */
/* #define _U1OTGSTAT_LSTATE_LENGTH                 0x00000001 */

/* #define _U1OTGSTAT_ID_POSITION                   0x00000007 */
/* #define _U1OTGSTAT_ID_MASK                       0x00000080 */
/* #define _U1OTGSTAT_ID_LENGTH                     0x00000001 */

/* #define _U1OTGCON_VBUSDIS_POSITION               0x00000000 */
/* #define _U1OTGCON_VBUSDIS_MASK                   0x00000001 */
/* #define _U1OTGCON_VBUSDIS_LENGTH                 0x00000001 */

/* #define _U1OTGCON_VBUSCHG_POSITION               0x00000001 */
/* #define _U1OTGCON_VBUSCHG_MASK                   0x00000002 */
/* #define _U1OTGCON_VBUSCHG_LENGTH                 0x00000001 */

/* #define _U1OTGCON_OTGEN_POSITION                 0x00000002 */
/* #define _U1OTGCON_OTGEN_MASK                     0x00000004 */
/* #define _U1OTGCON_OTGEN_LENGTH                   0x00000001 */

/* #define _U1OTGCON_VBUSON_POSITION                0x00000003 */
/* #define _U1OTGCON_VBUSON_MASK                    0x00000008 */
/* #define _U1OTGCON_VBUSON_LENGTH                  0x00000001 */

/* #define _U1OTGCON_DMPULDWN_POSITION              0x00000004 */
/* #define _U1OTGCON_DMPULDWN_MASK                  0x00000010 */
/* #define _U1OTGCON_DMPULDWN_LENGTH                0x00000001 */

/* #define _U1OTGCON_DPPULDWN_POSITION              0x00000005 */
/* #define _U1OTGCON_DPPULDWN_MASK                  0x00000020 */
/* #define _U1OTGCON_DPPULDWN_LENGTH                0x00000001 */

/* #define _U1OTGCON_DMPULUP_POSITION               0x00000006 */
/* #define _U1OTGCON_DMPULUP_MASK                   0x00000040 */
/* #define _U1OTGCON_DMPULUP_LENGTH                 0x00000001 */

/* #define _U1OTGCON_DPPULUP_POSITION               0x00000007 */
/* #define _U1OTGCON_DPPULUP_MASK                   0x00000080 */
/* #define _U1OTGCON_DPPULUP_LENGTH                 0x00000001 */

/* #define _U1PWRC_USBPWR_POSITION                  0x00000000 */
/* #define _U1PWRC_USBPWR_MASK                      0x00000001 */
/* #define _U1PWRC_USBPWR_LENGTH                    0x00000001 */

/* #define _U1PWRC_USUSPEND_POSITION                0x00000001 */
/* #define _U1PWRC_USUSPEND_MASK                    0x00000002 */
/* #define _U1PWRC_USUSPEND_LENGTH                  0x00000001 */

/* #define _U1PWRC_USBBUSY_POSITION                 0x00000003 */
/* #define _U1PWRC_USBBUSY_MASK                     0x00000008 */
/* #define _U1PWRC_USBBUSY_LENGTH                   0x00000001 */

/* #define _U1PWRC_USLPGRD_POSITION                 0x00000004 */
/* #define _U1PWRC_USLPGRD_MASK                     0x00000010 */
/* #define _U1PWRC_USLPGRD_LENGTH                   0x00000001 */

/* #define _U1PWRC_UACTPND_POSITION                 0x00000007 */
/* #define _U1PWRC_UACTPND_MASK                     0x00000080 */
/* #define _U1PWRC_UACTPND_LENGTH                   0x00000001 */

/* #define _U1IR_URSTIF_DETACHIF_POSITION           0x00000000 */
/* #define _U1IR_URSTIF_DETACHIF_MASK               0x00000001 */
/* #define _U1IR_URSTIF_DETACHIF_LENGTH             0x00000001 */

/* #define _U1IR_UERRIF_POSITION                    0x00000001 */
/* #define _U1IR_UERRIF_MASK                        0x00000002 */
/* #define _U1IR_UERRIF_LENGTH                      0x00000001 */

/* #define _U1IR_SOFIF_POSITION                     0x00000002 */
/* #define _U1IR_SOFIF_MASK                         0x00000004 */
/* #define _U1IR_SOFIF_LENGTH                       0x00000001 */

/* #define _U1IR_TRNIF_POSITION                     0x00000003 */
/* #define _U1IR_TRNIF_MASK                         0x00000008 */
/* #define _U1IR_TRNIF_LENGTH                       0x00000001 */

/* #define _U1IR_IDLEIF_POSITION                    0x00000004 */
/* #define _U1IR_IDLEIF_MASK                        0x00000010 */
/* #define _U1IR_IDLEIF_LENGTH                      0x00000001 */

/* #define _U1IR_RESUMEIF_POSITION                  0x00000005 */
/* #define _U1IR_RESUMEIF_MASK                      0x00000020 */
/* #define _U1IR_RESUMEIF_LENGTH                    0x00000001 */

/* #define _U1IR_ATTACHIF_POSITION                  0x00000006 */
/* #define _U1IR_ATTACHIF_MASK                      0x00000040 */
/* #define _U1IR_ATTACHIF_LENGTH                    0x00000001 */

/* #define _U1IR_STALLIF_POSITION                   0x00000007 */
/* #define _U1IR_STALLIF_MASK                       0x00000080 */
/* #define _U1IR_STALLIF_LENGTH                     0x00000001 */

/* #define _U1IR_DETACHIF_POSITION                  0x00000000 */
/* #define _U1IR_DETACHIF_MASK                      0x00000001 */
/* #define _U1IR_DETACHIF_LENGTH                    0x00000001 */

/* #define _U1IR_URSTIF_POSITION                    0x00000000 */
/* #define _U1IR_URSTIF_MASK                        0x00000001 */
/* #define _U1IR_URSTIF_LENGTH                      0x00000001 */

/* #define _U1IE_URSTIE_DETACHIE_POSITION           0x00000000 */
/* #define _U1IE_URSTIE_DETACHIE_MASK               0x00000001 */
/* #define _U1IE_URSTIE_DETACHIE_LENGTH             0x00000001 */

/* #define _U1IE_UERRIE_POSITION                    0x00000001 */
/* #define _U1IE_UERRIE_MASK                        0x00000002 */
/* #define _U1IE_UERRIE_LENGTH                      0x00000001 */

/* #define _U1IE_SOFIE_POSITION                     0x00000002 */
/* #define _U1IE_SOFIE_MASK                         0x00000004 */
/* #define _U1IE_SOFIE_LENGTH                       0x00000001 */

/* #define _U1IE_TRNIE_POSITION                     0x00000003 */
/* #define _U1IE_TRNIE_MASK                         0x00000008 */
/* #define _U1IE_TRNIE_LENGTH                       0x00000001 */

/* #define _U1IE_IDLEIE_POSITION                    0x00000004 */
/* #define _U1IE_IDLEIE_MASK                        0x00000010 */
/* #define _U1IE_IDLEIE_LENGTH                      0x00000001 */

/* #define _U1IE_RESUMEIE_POSITION                  0x00000005 */
/* #define _U1IE_RESUMEIE_MASK                      0x00000020 */
/* #define _U1IE_RESUMEIE_LENGTH                    0x00000001 */

/* #define _U1IE_ATTACHIE_POSITION                  0x00000006 */
/* #define _U1IE_ATTACHIE_MASK                      0x00000040 */
/* #define _U1IE_ATTACHIE_LENGTH                    0x00000001 */

/* #define _U1IE_STALLIE_POSITION                   0x00000007 */
/* #define _U1IE_STALLIE_MASK                       0x00000080 */
/* #define _U1IE_STALLIE_LENGTH                     0x00000001 */

/* #define _U1IE_DETACHIE_POSITION                  0x00000000 */
/* #define _U1IE_DETACHIE_MASK                      0x00000001 */
/* #define _U1IE_DETACHIE_LENGTH                    0x00000001 */

/* #define _U1IE_URSTIE_POSITION                    0x00000000 */
/* #define _U1IE_URSTIE_MASK                        0x00000001 */
/* #define _U1IE_URSTIE_LENGTH                      0x00000001 */

/* #define _U1EIR_PIDEF_POSITION                    0x00000000 */
/* #define _U1EIR_PIDEF_MASK                        0x00000001 */
/* #define _U1EIR_PIDEF_LENGTH                      0x00000001 */

/* #define _U1EIR_CRC5EF_EOFEF_POSITION             0x00000001 */
/* #define _U1EIR_CRC5EF_EOFEF_MASK                 0x00000002 */
/* #define _U1EIR_CRC5EF_EOFEF_LENGTH               0x00000001 */

/* #define _U1EIR_CRC16EF_POSITION                  0x00000002 */
/* #define _U1EIR_CRC16EF_MASK                      0x00000004 */
/* #define _U1EIR_CRC16EF_LENGTH                    0x00000001 */

/* #define _U1EIR_DFN8EF_POSITION                   0x00000003 */
/* #define _U1EIR_DFN8EF_MASK                       0x00000008 */
/* #define _U1EIR_DFN8EF_LENGTH                     0x00000001 */

/* #define _U1EIR_BTOEF_POSITION                    0x00000004 */
/* #define _U1EIR_BTOEF_MASK                        0x00000010 */
/* #define _U1EIR_BTOEF_LENGTH                      0x00000001 */

/* #define _U1EIR_DMAEF_POSITION                    0x00000005 */
/* #define _U1EIR_DMAEF_MASK                        0x00000020 */
/* #define _U1EIR_DMAEF_LENGTH                      0x00000001 */

/* #define _U1EIR_BMXEF_POSITION                    0x00000006 */
/* #define _U1EIR_BMXEF_MASK                        0x00000040 */
/* #define _U1EIR_BMXEF_LENGTH                      0x00000001 */

/* #define _U1EIR_BTSEF_POSITION                    0x00000007 */
/* #define _U1EIR_BTSEF_MASK                        0x00000080 */
/* #define _U1EIR_BTSEF_LENGTH                      0x00000001 */

/* #define _U1EIR_CRC5EF_POSITION                   0x00000001 */
/* #define _U1EIR_CRC5EF_MASK                       0x00000002 */
/* #define _U1EIR_CRC5EF_LENGTH                     0x00000001 */

/* #define _U1EIR_EOFEF_POSITION                    0x00000001 */
/* #define _U1EIR_EOFEF_MASK                        0x00000002 */
/* #define _U1EIR_EOFEF_LENGTH                      0x00000001 */

/* #define _U1EIE_PIDEE_POSITION                    0x00000000 */
/* #define _U1EIE_PIDEE_MASK                        0x00000001 */
/* #define _U1EIE_PIDEE_LENGTH                      0x00000001 */

/* #define _U1EIE_CRC5EE_EOFEE_POSITION             0x00000001 */
/* #define _U1EIE_CRC5EE_EOFEE_MASK                 0x00000002 */
/* #define _U1EIE_CRC5EE_EOFEE_LENGTH               0x00000001 */

/* #define _U1EIE_CRC16EE_POSITION                  0x00000002 */
/* #define _U1EIE_CRC16EE_MASK                      0x00000004 */
/* #define _U1EIE_CRC16EE_LENGTH                    0x00000001 */

/* #define _U1EIE_DFN8EE_POSITION                   0x00000003 */
/* #define _U1EIE_DFN8EE_MASK                       0x00000008 */
/* #define _U1EIE_DFN8EE_LENGTH                     0x00000001 */

/* #define _U1EIE_BTOEE_POSITION                    0x00000004 */
/* #define _U1EIE_BTOEE_MASK                        0x00000010 */
/* #define _U1EIE_BTOEE_LENGTH                      0x00000001 */

/* #define _U1EIE_DMAEE_POSITION                    0x00000005 */
/* #define _U1EIE_DMAEE_MASK                        0x00000020 */
/* #define _U1EIE_DMAEE_LENGTH                      0x00000001 */

/* #define _U1EIE_BMXEE_POSITION                    0x00000006 */
/* #define _U1EIE_BMXEE_MASK                        0x00000040 */
/* #define _U1EIE_BMXEE_LENGTH                      0x00000001 */

/* #define _U1EIE_BTSEE_POSITION                    0x00000007 */
/* #define _U1EIE_BTSEE_MASK                        0x00000080 */
/* #define _U1EIE_BTSEE_LENGTH                      0x00000001 */

/* #define _U1EIE_CRC5EE_POSITION                   0x00000001 */
/* #define _U1EIE_CRC5EE_MASK                       0x00000002 */
/* #define _U1EIE_CRC5EE_LENGTH                     0x00000001 */

/* #define _U1EIE_EOFEE_POSITION                    0x00000001 */
/* #define _U1EIE_EOFEE_MASK                        0x00000002 */
/* #define _U1EIE_EOFEE_LENGTH                      0x00000001 */

/* #define _U1STAT_PPBI_POSITION                    0x00000002 */
/* #define _U1STAT_PPBI_MASK                        0x00000004 */
/* #define _U1STAT_PPBI_LENGTH                      0x00000001 */

/* #define _U1STAT_DIR_POSITION                     0x00000003 */
/* #define _U1STAT_DIR_MASK                         0x00000008 */
/* #define _U1STAT_DIR_LENGTH                       0x00000001 */

/* #define _U1STAT_ENDPT_POSITION                   0x00000004 */
/* #define _U1STAT_ENDPT_MASK                       0x000000F0 */
/* #define _U1STAT_ENDPT_LENGTH                     0x00000004 */

/* #define _U1STAT_ENDPT0_POSITION                  0x00000004 */
/* #define _U1STAT_ENDPT0_MASK                      0x00000010 */
/* #define _U1STAT_ENDPT0_LENGTH                    0x00000001 */

/* #define _U1STAT_ENDPT1_POSITION                  0x00000005 */
/* #define _U1STAT_ENDPT1_MASK                      0x00000020 */
/* #define _U1STAT_ENDPT1_LENGTH                    0x00000001 */

/* #define _U1STAT_ENDPT2_POSITION                  0x00000006 */
/* #define _U1STAT_ENDPT2_MASK                      0x00000040 */
/* #define _U1STAT_ENDPT2_LENGTH                    0x00000001 */

/* #define _U1STAT_ENDPT3_POSITION                  0x00000007 */
/* #define _U1STAT_ENDPT3_MASK                      0x00000080 */
/* #define _U1STAT_ENDPT3_LENGTH                    0x00000001 */

/* #define _U1CON_USBEN_SOFEN_POSITION              0x00000000 */
/* #define _U1CON_USBEN_SOFEN_MASK                  0x00000001 */
/* #define _U1CON_USBEN_SOFEN_LENGTH                0x00000001 */

/* #define _U1CON_PPBRST_POSITION                   0x00000001 */
/* #define _U1CON_PPBRST_MASK                       0x00000002 */
/* #define _U1CON_PPBRST_LENGTH                     0x00000001 */

/* #define _U1CON_RESUME_POSITION                   0x00000002 */
/* #define _U1CON_RESUME_MASK                       0x00000004 */
/* #define _U1CON_RESUME_LENGTH                     0x00000001 */

/* #define _U1CON_HOSTEN_POSITION                   0x00000003 */
/* #define _U1CON_HOSTEN_MASK                       0x00000008 */
/* #define _U1CON_HOSTEN_LENGTH                     0x00000001 */

/* #define _U1CON_USBRST_POSITION                   0x00000004 */
/* #define _U1CON_USBRST_MASK                       0x00000010 */
/* #define _U1CON_USBRST_LENGTH                     0x00000001 */

/* #define _U1CON_PKTDIS_TOKBUSY_POSITION           0x00000005 */
/* #define _U1CON_PKTDIS_TOKBUSY_MASK               0x00000020 */
/* #define _U1CON_PKTDIS_TOKBUSY_LENGTH             0x00000001 */

/* #define _U1CON_SE0_POSITION                      0x00000006 */
/* #define _U1CON_SE0_MASK                          0x00000040 */
/* #define _U1CON_SE0_LENGTH                        0x00000001 */

/* #define _U1CON_JSTATE_POSITION                   0x00000007 */
/* #define _U1CON_JSTATE_MASK                       0x00000080 */
/* #define _U1CON_JSTATE_LENGTH                     0x00000001 */

/* #define _U1CON_USBEN_POSITION                    0x00000000 */
/* #define _U1CON_USBEN_MASK                        0x00000001 */
/* #define _U1CON_USBEN_LENGTH                      0x00000001 */

/* #define _U1CON_SOFEN_POSITION                    0x00000000 */
/* #define _U1CON_SOFEN_MASK                        0x00000001 */
/* #define _U1CON_SOFEN_LENGTH                      0x00000001 */

/* #define _U1CON_PKTDIS_POSITION                   0x00000005 */
/* #define _U1CON_PKTDIS_MASK                       0x00000020 */
/* #define _U1CON_PKTDIS_LENGTH                     0x00000001 */

/* #define _U1CON_TOKBUSY_POSITION                  0x00000005 */
/* #define _U1CON_TOKBUSY_MASK                      0x00000020 */
/* #define _U1CON_TOKBUSY_LENGTH                    0x00000001 */

/* #define _U1ADDR_DEVADDR_POSITION                 0x00000000 */
/* #define _U1ADDR_DEVADDR_MASK                     0x0000007F */
/* #define _U1ADDR_DEVADDR_LENGTH                   0x00000007 */

/* #define _U1ADDR_LSPDEN_POSITION                  0x00000007 */
/* #define _U1ADDR_LSPDEN_MASK                      0x00000080 */
/* #define _U1ADDR_LSPDEN_LENGTH                    0x00000001 */

/* #define _U1ADDR_DEVADDR0_POSITION                0x00000000 */
/* #define _U1ADDR_DEVADDR0_MASK                    0x00000001 */
/* #define _U1ADDR_DEVADDR0_LENGTH                  0x00000001 */

/* #define _U1ADDR_DEVADDR1_POSITION                0x00000001 */
/* #define _U1ADDR_DEVADDR1_MASK                    0x00000002 */
/* #define _U1ADDR_DEVADDR1_LENGTH                  0x00000001 */

/* #define _U1ADDR_DEVADDR2_POSITION                0x00000002 */
/* #define _U1ADDR_DEVADDR2_MASK                    0x00000004 */
/* #define _U1ADDR_DEVADDR2_LENGTH                  0x00000001 */

/* #define _U1ADDR_DEVADDR3_POSITION                0x00000003 */
/* #define _U1ADDR_DEVADDR3_MASK                    0x00000008 */
/* #define _U1ADDR_DEVADDR3_LENGTH                  0x00000001 */

/* #define _U1ADDR_DEVADDR4_POSITION                0x00000004 */
/* #define _U1ADDR_DEVADDR4_MASK                    0x00000010 */
/* #define _U1ADDR_DEVADDR4_LENGTH                  0x00000001 */

/* #define _U1ADDR_DEVADDR5_POSITION                0x00000005 */
/* #define _U1ADDR_DEVADDR5_MASK                    0x00000020 */
/* #define _U1ADDR_DEVADDR5_LENGTH                  0x00000001 */

/* #define _U1ADDR_DEVADDR6_POSITION                0x00000006 */
/* #define _U1ADDR_DEVADDR6_MASK                    0x00000040 */
/* #define _U1ADDR_DEVADDR6_LENGTH                  0x00000001 */

/* #define _U1BDTP1_BDTPTRL_POSITION                0x00000001 */
/* #define _U1BDTP1_BDTPTRL_MASK                    0x000000FE */
/* #define _U1BDTP1_BDTPTRL_LENGTH                  0x00000007 */

/* #define _U1FRML_FRML_POSITION                    0x00000000 */
/* #define _U1FRML_FRML_MASK                        0x000000FF */
/* #define _U1FRML_FRML_LENGTH                      0x00000008 */

/* #define _U1FRML_FRM0_POSITION                    0x00000000 */
/* #define _U1FRML_FRM0_MASK                        0x00000001 */
/* #define _U1FRML_FRM0_LENGTH                      0x00000001 */

/* #define _U1FRML_FRM1_POSITION                    0x00000001 */
/* #define _U1FRML_FRM1_MASK                        0x00000002 */
/* #define _U1FRML_FRM1_LENGTH                      0x00000001 */

/* #define _U1FRML_FRM2_POSITION                    0x00000002 */
/* #define _U1FRML_FRM2_MASK                        0x00000004 */
/* #define _U1FRML_FRM2_LENGTH                      0x00000001 */

/* #define _U1FRML_FRM3_POSITION                    0x00000003 */
/* #define _U1FRML_FRM3_MASK                        0x00000008 */
/* #define _U1FRML_FRM3_LENGTH                      0x00000001 */

/* #define _U1FRML_FRM4_POSITION                    0x00000004 */
/* #define _U1FRML_FRM4_MASK                        0x00000010 */
/* #define _U1FRML_FRM4_LENGTH                      0x00000001 */

/* #define _U1FRML_FRM5_POSITION                    0x00000005 */
/* #define _U1FRML_FRM5_MASK                        0x00000020 */
/* #define _U1FRML_FRM5_LENGTH                      0x00000001 */

/* #define _U1FRML_FRM6_POSITION                    0x00000006 */
/* #define _U1FRML_FRM6_MASK                        0x00000040 */
/* #define _U1FRML_FRM6_LENGTH                      0x00000001 */

/* #define _U1FRML_FRM7_POSITION                    0x00000007 */
/* #define _U1FRML_FRM7_MASK                        0x00000080 */
/* #define _U1FRML_FRM7_LENGTH                      0x00000001 */

/* #define _U1FRMH_FRMH_POSITION                    0x00000000 */
/* #define _U1FRMH_FRMH_MASK                        0x00000007 */
/* #define _U1FRMH_FRMH_LENGTH                      0x00000003 */

/* #define _U1FRMH_FRM8_POSITION                    0x00000000 */
/* #define _U1FRMH_FRM8_MASK                        0x00000001 */
/* #define _U1FRMH_FRM8_LENGTH                      0x00000001 */

/* #define _U1FRMH_FRM9_POSITION                    0x00000001 */
/* #define _U1FRMH_FRM9_MASK                        0x00000002 */
/* #define _U1FRMH_FRM9_LENGTH                      0x00000001 */

/* #define _U1FRMH_FRM10_POSITION                   0x00000002 */
/* #define _U1FRMH_FRM10_MASK                       0x00000004 */
/* #define _U1FRMH_FRM10_LENGTH                     0x00000001 */

/* #define _U1TOK_EP_POSITION                       0x00000000 */
/* #define _U1TOK_EP_MASK                           0x0000000F */
/* #define _U1TOK_EP_LENGTH                         0x00000004 */

/* #define _U1TOK_PID_POSITION                      0x00000004 */
/* #define _U1TOK_PID_MASK                          0x000000F0 */
/* #define _U1TOK_PID_LENGTH                        0x00000004 */

/* #define _U1TOK_EP0_POSITION                      0x00000000 */
/* #define _U1TOK_EP0_MASK                          0x00000001 */
/* #define _U1TOK_EP0_LENGTH                        0x00000001 */

/* #define _U1TOK_EP1_POSITION                      0x00000001 */
/* #define _U1TOK_EP1_MASK                          0x00000002 */
/* #define _U1TOK_EP1_LENGTH                        0x00000001 */

/* #define _U1TOK_EP2_POSITION                      0x00000002 */
/* #define _U1TOK_EP2_MASK                          0x00000004 */
/* #define _U1TOK_EP2_LENGTH                        0x00000001 */

/* #define _U1TOK_EP3_POSITION                      0x00000003 */
/* #define _U1TOK_EP3_MASK                          0x00000008 */
/* #define _U1TOK_EP3_LENGTH                        0x00000001 */

/* #define _U1TOK_PID0_POSITION                     0x00000004 */
/* #define _U1TOK_PID0_MASK                         0x00000010 */
/* #define _U1TOK_PID0_LENGTH                       0x00000001 */

/* #define _U1TOK_PID1_POSITION                     0x00000005 */
/* #define _U1TOK_PID1_MASK                         0x00000020 */
/* #define _U1TOK_PID1_LENGTH                       0x00000001 */

/* #define _U1TOK_PID2_POSITION                     0x00000006 */
/* #define _U1TOK_PID2_MASK                         0x00000040 */
/* #define _U1TOK_PID2_LENGTH                       0x00000001 */

/* #define _U1TOK_PID3_POSITION                     0x00000007 */
/* #define _U1TOK_PID3_MASK                         0x00000080 */
/* #define _U1TOK_PID3_LENGTH                       0x00000001 */

/* #define _U1SOF_CNT_POSITION                      0x00000000 */
/* #define _U1SOF_CNT_MASK                          0x000000FF */
/* #define _U1SOF_CNT_LENGTH                        0x00000008 */

/* #define _U1BDTP2_BDTPTRH_POSITION                0x00000000 */
/* #define _U1BDTP2_BDTPTRH_MASK                    0x000000FF */
/* #define _U1BDTP2_BDTPTRH_LENGTH                  0x00000008 */

/* #define _U1BDTP3_BDTPTRU_POSITION                0x00000000 */
/* #define _U1BDTP3_BDTPTRU_MASK                    0x000000FF */
/* #define _U1BDTP3_BDTPTRU_LENGTH                  0x00000008 */

/* #define _U1CNFG1_UASUSPND_POSITION               0x00000000 */
/* #define _U1CNFG1_UASUSPND_MASK                   0x00000001 */
/* #define _U1CNFG1_UASUSPND_LENGTH                 0x00000001 */

/* #define _U1CNFG1_USBSIDL_POSITION                0x00000004 */
/* #define _U1CNFG1_USBSIDL_MASK                    0x00000010 */
/* #define _U1CNFG1_USBSIDL_LENGTH                  0x00000001 */

/* #define _U1CNFG1_UOEMON_POSITION                 0x00000006 */
/* #define _U1CNFG1_UOEMON_MASK                     0x00000040 */
/* #define _U1CNFG1_UOEMON_LENGTH                   0x00000001 */

/* #define _U1CNFG1_UTEYE_POSITION                  0x00000007 */
/* #define _U1CNFG1_UTEYE_MASK                      0x00000080 */
/* #define _U1CNFG1_UTEYE_LENGTH                    0x00000001 */

/* #define _U1EP0_EPHSHK_POSITION                   0x00000000 */
/* #define _U1EP0_EPHSHK_MASK                       0x00000001 */
/* #define _U1EP0_EPHSHK_LENGTH                     0x00000001 */

/* #define _U1EP0_EPSTALL_POSITION                  0x00000001 */
/* #define _U1EP0_EPSTALL_MASK                      0x00000002 */
/* #define _U1EP0_EPSTALL_LENGTH                    0x00000001 */

/* #define _U1EP0_EPTXEN_POSITION                   0x00000002 */
/* #define _U1EP0_EPTXEN_MASK                       0x00000004 */
/* #define _U1EP0_EPTXEN_LENGTH                     0x00000001 */

/* #define _U1EP0_EPRXEN_POSITION                   0x00000003 */
/* #define _U1EP0_EPRXEN_MASK                       0x00000008 */
/* #define _U1EP0_EPRXEN_LENGTH                     0x00000001 */

/* #define _U1EP0_EPCONDIS_POSITION                 0x00000004 */
/* #define _U1EP0_EPCONDIS_MASK                     0x00000010 */
/* #define _U1EP0_EPCONDIS_LENGTH                   0x00000001 */

/* #define _U1EP0_RETRYDIS_POSITION                 0x00000006 */
/* #define _U1EP0_RETRYDIS_MASK                     0x00000040 */
/* #define _U1EP0_RETRYDIS_LENGTH                   0x00000001 */

/* #define _U1EP0_LSPD_POSITION                     0x00000007 */
/* #define _U1EP0_LSPD_MASK                         0x00000080 */
/* #define _U1EP0_LSPD_LENGTH                       0x00000001 */

/* #define _U1EP1_EPHSHK_POSITION                   0x00000000 */
/* #define _U1EP1_EPHSHK_MASK                       0x00000001 */
/* #define _U1EP1_EPHSHK_LENGTH                     0x00000001 */

/* #define _U1EP1_EPSTALL_POSITION                  0x00000001 */
/* #define _U1EP1_EPSTALL_MASK                      0x00000002 */
/* #define _U1EP1_EPSTALL_LENGTH                    0x00000001 */

/* #define _U1EP1_EPTXEN_POSITION                   0x00000002 */
/* #define _U1EP1_EPTXEN_MASK                       0x00000004 */
/* #define _U1EP1_EPTXEN_LENGTH                     0x00000001 */

/* #define _U1EP1_EPRXEN_POSITION                   0x00000003 */
/* #define _U1EP1_EPRXEN_MASK                       0x00000008 */
/* #define _U1EP1_EPRXEN_LENGTH                     0x00000001 */

/* #define _U1EP1_EPCONDIS_POSITION                 0x00000004 */
/* #define _U1EP1_EPCONDIS_MASK                     0x00000010 */
/* #define _U1EP1_EPCONDIS_LENGTH                   0x00000001 */

/* #define _U1EP2_EPHSHK_POSITION                   0x00000000 */
/* #define _U1EP2_EPHSHK_MASK                       0x00000001 */
/* #define _U1EP2_EPHSHK_LENGTH                     0x00000001 */

/* #define _U1EP2_EPSTALL_POSITION                  0x00000001 */
/* #define _U1EP2_EPSTALL_MASK                      0x00000002 */
/* #define _U1EP2_EPSTALL_LENGTH                    0x00000001 */

/* #define _U1EP2_EPTXEN_POSITION                   0x00000002 */
/* #define _U1EP2_EPTXEN_MASK                       0x00000004 */
/* #define _U1EP2_EPTXEN_LENGTH                     0x00000001 */

/* #define _U1EP2_EPRXEN_POSITION                   0x00000003 */
/* #define _U1EP2_EPRXEN_MASK                       0x00000008 */
/* #define _U1EP2_EPRXEN_LENGTH                     0x00000001 */

/* #define _U1EP2_EPCONDIS_POSITION                 0x00000004 */
/* #define _U1EP2_EPCONDIS_MASK                     0x00000010 */
/* #define _U1EP2_EPCONDIS_LENGTH                   0x00000001 */

/* #define _U1EP3_EPHSHK_POSITION                   0x00000000 */
/* #define _U1EP3_EPHSHK_MASK                       0x00000001 */
/* #define _U1EP3_EPHSHK_LENGTH                     0x00000001 */

/* #define _U1EP3_EPSTALL_POSITION                  0x00000001 */
/* #define _U1EP3_EPSTALL_MASK                      0x00000002 */
/* #define _U1EP3_EPSTALL_LENGTH                    0x00000001 */

/* #define _U1EP3_EPTXEN_POSITION                   0x00000002 */
/* #define _U1EP3_EPTXEN_MASK                       0x00000004 */
/* #define _U1EP3_EPTXEN_LENGTH                     0x00000001 */

/* #define _U1EP3_EPRXEN_POSITION                   0x00000003 */
/* #define _U1EP3_EPRXEN_MASK                       0x00000008 */
/* #define _U1EP3_EPRXEN_LENGTH                     0x00000001 */

/* #define _U1EP3_EPCONDIS_POSITION                 0x00000004 */
/* #define _U1EP3_EPCONDIS_MASK                     0x00000010 */
/* #define _U1EP3_EPCONDIS_LENGTH                   0x00000001 */

/* #define _U1EP4_EPHSHK_POSITION                   0x00000000 */
/* #define _U1EP4_EPHSHK_MASK                       0x00000001 */
/* #define _U1EP4_EPHSHK_LENGTH                     0x00000001 */

/* #define _U1EP4_EPSTALL_POSITION                  0x00000001 */
/* #define _U1EP4_EPSTALL_MASK                      0x00000002 */
/* #define _U1EP4_EPSTALL_LENGTH                    0x00000001 */

/* #define _U1EP4_EPTXEN_POSITION                   0x00000002 */
/* #define _U1EP4_EPTXEN_MASK                       0x00000004 */
/* #define _U1EP4_EPTXEN_LENGTH                     0x00000001 */

/* #define _U1EP4_EPRXEN_POSITION                   0x00000003 */
/* #define _U1EP4_EPRXEN_MASK                       0x00000008 */
/* #define _U1EP4_EPRXEN_LENGTH                     0x00000001 */

/* #define _U1EP4_EPCONDIS_POSITION                 0x00000004 */
/* #define _U1EP4_EPCONDIS_MASK                     0x00000010 */
/* #define _U1EP4_EPCONDIS_LENGTH                   0x00000001 */

/* #define _U1EP5_EPHSHK_POSITION                   0x00000000 */
/* #define _U1EP5_EPHSHK_MASK                       0x00000001 */
/* #define _U1EP5_EPHSHK_LENGTH                     0x00000001 */

/* #define _U1EP5_EPSTALL_POSITION                  0x00000001 */
/* #define _U1EP5_EPSTALL_MASK                      0x00000002 */
/* #define _U1EP5_EPSTALL_LENGTH                    0x00000001 */

/* #define _U1EP5_EPTXEN_POSITION                   0x00000002 */
/* #define _U1EP5_EPTXEN_MASK                       0x00000004 */
/* #define _U1EP5_EPTXEN_LENGTH                     0x00000001 */

/* #define _U1EP5_EPRXEN_POSITION                   0x00000003 */
/* #define _U1EP5_EPRXEN_MASK                       0x00000008 */
/* #define _U1EP5_EPRXEN_LENGTH                     0x00000001 */

/* #define _U1EP5_EPCONDIS_POSITION                 0x00000004 */
/* #define _U1EP5_EPCONDIS_MASK                     0x00000010 */
/* #define _U1EP5_EPCONDIS_LENGTH                   0x00000001 */

/* #define _U1EP6_EPHSHK_POSITION                   0x00000000 */
/* #define _U1EP6_EPHSHK_MASK                       0x00000001 */
/* #define _U1EP6_EPHSHK_LENGTH                     0x00000001 */

/* #define _U1EP6_EPSTALL_POSITION                  0x00000001 */
/* #define _U1EP6_EPSTALL_MASK                      0x00000002 */
/* #define _U1EP6_EPSTALL_LENGTH                    0x00000001 */

/* #define _U1EP6_EPTXEN_POSITION                   0x00000002 */
/* #define _U1EP6_EPTXEN_MASK                       0x00000004 */
/* #define _U1EP6_EPTXEN_LENGTH                     0x00000001 */

/* #define _U1EP6_EPRXEN_POSITION                   0x00000003 */
/* #define _U1EP6_EPRXEN_MASK                       0x00000008 */
/* #define _U1EP6_EPRXEN_LENGTH                     0x00000001 */

/* #define _U1EP6_EPCONDIS_POSITION                 0x00000004 */
/* #define _U1EP6_EPCONDIS_MASK                     0x00000010 */
/* #define _U1EP6_EPCONDIS_LENGTH                   0x00000001 */

/* #define _U1EP7_EPHSHK_POSITION                   0x00000000 */
/* #define _U1EP7_EPHSHK_MASK                       0x00000001 */
/* #define _U1EP7_EPHSHK_LENGTH                     0x00000001 */

/* #define _U1EP7_EPSTALL_POSITION                  0x00000001 */
/* #define _U1EP7_EPSTALL_MASK                      0x00000002 */
/* #define _U1EP7_EPSTALL_LENGTH                    0x00000001 */

/* #define _U1EP7_EPTXEN_POSITION                   0x00000002 */
/* #define _U1EP7_EPTXEN_MASK                       0x00000004 */
/* #define _U1EP7_EPTXEN_LENGTH                     0x00000001 */

/* #define _U1EP7_EPRXEN_POSITION                   0x00000003 */
/* #define _U1EP7_EPRXEN_MASK                       0x00000008 */
/* #define _U1EP7_EPRXEN_LENGTH                     0x00000001 */

/* #define _U1EP7_EPCONDIS_POSITION                 0x00000004 */
/* #define _U1EP7_EPCONDIS_MASK                     0x00000010 */
/* #define _U1EP7_EPCONDIS_LENGTH                   0x00000001 */

/* #define _U1EP8_EPHSHK_POSITION                   0x00000000 */
/* #define _U1EP8_EPHSHK_MASK                       0x00000001 */
/* #define _U1EP8_EPHSHK_LENGTH                     0x00000001 */

/* #define _U1EP8_EPSTALL_POSITION                  0x00000001 */
/* #define _U1EP8_EPSTALL_MASK                      0x00000002 */
/* #define _U1EP8_EPSTALL_LENGTH                    0x00000001 */

/* #define _U1EP8_EPTXEN_POSITION                   0x00000002 */
/* #define _U1EP8_EPTXEN_MASK                       0x00000004 */
/* #define _U1EP8_EPTXEN_LENGTH                     0x00000001 */

/* #define _U1EP8_EPRXEN_POSITION                   0x00000003 */
/* #define _U1EP8_EPRXEN_MASK                       0x00000008 */
/* #define _U1EP8_EPRXEN_LENGTH                     0x00000001 */

/* #define _U1EP8_EPCONDIS_POSITION                 0x00000004 */
/* #define _U1EP8_EPCONDIS_MASK                     0x00000010 */
/* #define _U1EP8_EPCONDIS_LENGTH                   0x00000001 */

/* #define _U1EP9_EPHSHK_POSITION                   0x00000000 */
/* #define _U1EP9_EPHSHK_MASK                       0x00000001 */
/* #define _U1EP9_EPHSHK_LENGTH                     0x00000001 */

/* #define _U1EP9_EPSTALL_POSITION                  0x00000001 */
/* #define _U1EP9_EPSTALL_MASK                      0x00000002 */
/* #define _U1EP9_EPSTALL_LENGTH                    0x00000001 */

/* #define _U1EP9_EPTXEN_POSITION                   0x00000002 */
/* #define _U1EP9_EPTXEN_MASK                       0x00000004 */
/* #define _U1EP9_EPTXEN_LENGTH                     0x00000001 */

/* #define _U1EP9_EPRXEN_POSITION                   0x00000003 */
/* #define _U1EP9_EPRXEN_MASK                       0x00000008 */
/* #define _U1EP9_EPRXEN_LENGTH                     0x00000001 */

/* #define _U1EP9_EPCONDIS_POSITION                 0x00000004 */
/* #define _U1EP9_EPCONDIS_MASK                     0x00000010 */
/* #define _U1EP9_EPCONDIS_LENGTH                   0x00000001 */

/* #define _U1EP10_EPHSHK_POSITION                  0x00000000 */
/* #define _U1EP10_EPHSHK_MASK                      0x00000001 */
/* #define _U1EP10_EPHSHK_LENGTH                    0x00000001 */

/* #define _U1EP10_EPSTALL_POSITION                 0x00000001 */
/* #define _U1EP10_EPSTALL_MASK                     0x00000002 */
/* #define _U1EP10_EPSTALL_LENGTH                   0x00000001 */

/* #define _U1EP10_EPTXEN_POSITION                  0x00000002 */
/* #define _U1EP10_EPTXEN_MASK                      0x00000004 */
/* #define _U1EP10_EPTXEN_LENGTH                    0x00000001 */

/* #define _U1EP10_EPRXEN_POSITION                  0x00000003 */
/* #define _U1EP10_EPRXEN_MASK                      0x00000008 */
/* #define _U1EP10_EPRXEN_LENGTH                    0x00000001 */

/* #define _U1EP10_EPCONDIS_POSITION                0x00000004 */
/* #define _U1EP10_EPCONDIS_MASK                    0x00000010 */
/* #define _U1EP10_EPCONDIS_LENGTH                  0x00000001 */

/* #define _U1EP11_EPHSHK_POSITION                  0x00000000 */
/* #define _U1EP11_EPHSHK_MASK                      0x00000001 */
/* #define _U1EP11_EPHSHK_LENGTH                    0x00000001 */

/* #define _U1EP11_EPSTALL_POSITION                 0x00000001 */
/* #define _U1EP11_EPSTALL_MASK                     0x00000002 */
/* #define _U1EP11_EPSTALL_LENGTH                   0x00000001 */

/* #define _U1EP11_EPTXEN_POSITION                  0x00000002 */
/* #define _U1EP11_EPTXEN_MASK                      0x00000004 */
/* #define _U1EP11_EPTXEN_LENGTH                    0x00000001 */

/* #define _U1EP11_EPRXEN_POSITION                  0x00000003 */
/* #define _U1EP11_EPRXEN_MASK                      0x00000008 */
/* #define _U1EP11_EPRXEN_LENGTH                    0x00000001 */

/* #define _U1EP11_EPCONDIS_POSITION                0x00000004 */
/* #define _U1EP11_EPCONDIS_MASK                    0x00000010 */
/* #define _U1EP11_EPCONDIS_LENGTH                  0x00000001 */

/* #define _U1EP12_EPHSHK_POSITION                  0x00000000 */
/* #define _U1EP12_EPHSHK_MASK                      0x00000001 */
/* #define _U1EP12_EPHSHK_LENGTH                    0x00000001 */

/* #define _U1EP12_EPSTALL_POSITION                 0x00000001 */
/* #define _U1EP12_EPSTALL_MASK                     0x00000002 */
/* #define _U1EP12_EPSTALL_LENGTH                   0x00000001 */

/* #define _U1EP12_EPTXEN_POSITION                  0x00000002 */
/* #define _U1EP12_EPTXEN_MASK                      0x00000004 */
/* #define _U1EP12_EPTXEN_LENGTH                    0x00000001 */

/* #define _U1EP12_EPRXEN_POSITION                  0x00000003 */
/* #define _U1EP12_EPRXEN_MASK                      0x00000008 */
/* #define _U1EP12_EPRXEN_LENGTH                    0x00000001 */

/* #define _U1EP12_EPCONDIS_POSITION                0x00000004 */
/* #define _U1EP12_EPCONDIS_MASK                    0x00000010 */
/* #define _U1EP12_EPCONDIS_LENGTH                  0x00000001 */

/* #define _U1EP13_EPHSHK_POSITION                  0x00000000 */
/* #define _U1EP13_EPHSHK_MASK                      0x00000001 */
/* #define _U1EP13_EPHSHK_LENGTH                    0x00000001 */

/* #define _U1EP13_EPSTALL_POSITION                 0x00000001 */
/* #define _U1EP13_EPSTALL_MASK                     0x00000002 */
/* #define _U1EP13_EPSTALL_LENGTH                   0x00000001 */

/* #define _U1EP13_EPTXEN_POSITION                  0x00000002 */
/* #define _U1EP13_EPTXEN_MASK                      0x00000004 */
/* #define _U1EP13_EPTXEN_LENGTH                    0x00000001 */

/* #define _U1EP13_EPRXEN_POSITION                  0x00000003 */
/* #define _U1EP13_EPRXEN_MASK                      0x00000008 */
/* #define _U1EP13_EPRXEN_LENGTH                    0x00000001 */

/* #define _U1EP13_EPCONDIS_POSITION                0x00000004 */
/* #define _U1EP13_EPCONDIS_MASK                    0x00000010 */
/* #define _U1EP13_EPCONDIS_LENGTH                  0x00000001 */

/* #define _U1EP14_EPHSHK_POSITION                  0x00000000 */
/* #define _U1EP14_EPHSHK_MASK                      0x00000001 */
/* #define _U1EP14_EPHSHK_LENGTH                    0x00000001 */

/* #define _U1EP14_EPSTALL_POSITION                 0x00000001 */
/* #define _U1EP14_EPSTALL_MASK                     0x00000002 */
/* #define _U1EP14_EPSTALL_LENGTH                   0x00000001 */

/* #define _U1EP14_EPTXEN_POSITION                  0x00000002 */
/* #define _U1EP14_EPTXEN_MASK                      0x00000004 */
/* #define _U1EP14_EPTXEN_LENGTH                    0x00000001 */

/* #define _U1EP14_EPRXEN_POSITION                  0x00000003 */
/* #define _U1EP14_EPRXEN_MASK                      0x00000008 */
/* #define _U1EP14_EPRXEN_LENGTH                    0x00000001 */

/* #define _U1EP14_EPCONDIS_POSITION                0x00000004 */
/* #define _U1EP14_EPCONDIS_MASK                    0x00000010 */
/* #define _U1EP14_EPCONDIS_LENGTH                  0x00000001 */

/* #define _U1EP15_EPHSHK_POSITION                  0x00000000 */
/* #define _U1EP15_EPHSHK_MASK                      0x00000001 */
/* #define _U1EP15_EPHSHK_LENGTH                    0x00000001 */

/* #define _U1EP15_EPSTALL_POSITION                 0x00000001 */
/* #define _U1EP15_EPSTALL_MASK                     0x00000002 */
/* #define _U1EP15_EPSTALL_LENGTH                   0x00000001 */

/* #define _U1EP15_EPTXEN_POSITION                  0x00000002 */
/* #define _U1EP15_EPTXEN_MASK                      0x00000004 */
/* #define _U1EP15_EPTXEN_LENGTH                    0x00000001 */

/* #define _U1EP15_EPRXEN_POSITION                  0x00000003 */
/* #define _U1EP15_EPRXEN_MASK                      0x00000008 */
/* #define _U1EP15_EPRXEN_LENGTH                    0x00000001 */

/* #define _U1EP15_EPCONDIS_POSITION                0x00000004 */
/* #define _U1EP15_EPCONDIS_MASK                    0x00000010 */
/* #define _U1EP15_EPCONDIS_LENGTH                  0x00000001 */

/* #define _ANSELB_ANSB0_POSITION                   0x00000000 */
/* #define _ANSELB_ANSB0_MASK                       0x00000001 */
/* #define _ANSELB_ANSB0_LENGTH                     0x00000001 */

/* #define _ANSELB_ANSB1_POSITION                   0x00000001 */
/* #define _ANSELB_ANSB1_MASK                       0x00000002 */
/* #define _ANSELB_ANSB1_LENGTH                     0x00000001 */

/* #define _ANSELB_ANSB2_POSITION                   0x00000002 */
/* #define _ANSELB_ANSB2_MASK                       0x00000004 */
/* #define _ANSELB_ANSB2_LENGTH                     0x00000001 */

/* #define _ANSELB_ANSB3_POSITION                   0x00000003 */
/* #define _ANSELB_ANSB3_MASK                       0x00000008 */
/* #define _ANSELB_ANSB3_LENGTH                     0x00000001 */

/* #define _ANSELB_ANSB4_POSITION                   0x00000004 */
/* #define _ANSELB_ANSB4_MASK                       0x00000010 */
/* #define _ANSELB_ANSB4_LENGTH                     0x00000001 */

/* #define _ANSELB_ANSB5_POSITION                   0x00000005 */
/* #define _ANSELB_ANSB5_MASK                       0x00000020 */
/* #define _ANSELB_ANSB5_LENGTH                     0x00000001 */

/* #define _ANSELB_ANSB6_POSITION                   0x00000006 */
/* #define _ANSELB_ANSB6_MASK                       0x00000040 */
/* #define _ANSELB_ANSB6_LENGTH                     0x00000001 */

/* #define _ANSELB_ANSB7_POSITION                   0x00000007 */
/* #define _ANSELB_ANSB7_MASK                       0x00000080 */
/* #define _ANSELB_ANSB7_LENGTH                     0x00000001 */

/* #define _ANSELB_ANSB8_POSITION                   0x00000008 */
/* #define _ANSELB_ANSB8_MASK                       0x00000100 */
/* #define _ANSELB_ANSB8_LENGTH                     0x00000001 */

/* #define _ANSELB_ANSB9_POSITION                   0x00000009 */
/* #define _ANSELB_ANSB9_MASK                       0x00000200 */
/* #define _ANSELB_ANSB9_LENGTH                     0x00000001 */

/* #define _ANSELB_ANSB10_POSITION                  0x0000000A */
/* #define _ANSELB_ANSB10_MASK                      0x00000400 */
/* #define _ANSELB_ANSB10_LENGTH                    0x00000001 */

/* #define _ANSELB_ANSB11_POSITION                  0x0000000B */
/* #define _ANSELB_ANSB11_MASK                      0x00000800 */
/* #define _ANSELB_ANSB11_LENGTH                    0x00000001 */

/* #define _ANSELB_ANSB12_POSITION                  0x0000000C */
/* #define _ANSELB_ANSB12_MASK                      0x00001000 */
/* #define _ANSELB_ANSB12_LENGTH                    0x00000001 */

/* #define _ANSELB_ANSB13_POSITION                  0x0000000D */
/* #define _ANSELB_ANSB13_MASK                      0x00002000 */
/* #define _ANSELB_ANSB13_LENGTH                    0x00000001 */

/* #define _ANSELB_ANSB14_POSITION                  0x0000000E */
/* #define _ANSELB_ANSB14_MASK                      0x00004000 */
/* #define _ANSELB_ANSB14_LENGTH                    0x00000001 */

/* #define _ANSELB_ANSB15_POSITION                  0x0000000F */
/* #define _ANSELB_ANSB15_MASK                      0x00008000 */
/* #define _ANSELB_ANSB15_LENGTH                    0x00000001 */

/* #define _ANSELB_w_POSITION                       0x00000000 */
/* #define _ANSELB_w_MASK                           0xFFFFFFFF */
/* #define _ANSELB_w_LENGTH                         0x00000020 */

/* #define _TRISB_TRISB0_POSITION                   0x00000000 */
/* #define _TRISB_TRISB0_MASK                       0x00000001 */
/* #define _TRISB_TRISB0_LENGTH                     0x00000001 */

/* #define _TRISB_TRISB1_POSITION                   0x00000001 */
/* #define _TRISB_TRISB1_MASK                       0x00000002 */
/* #define _TRISB_TRISB1_LENGTH                     0x00000001 */

/* #define _TRISB_TRISB2_POSITION                   0x00000002 */
/* #define _TRISB_TRISB2_MASK                       0x00000004 */
/* #define _TRISB_TRISB2_LENGTH                     0x00000001 */

/* #define _TRISB_TRISB3_POSITION                   0x00000003 */
/* #define _TRISB_TRISB3_MASK                       0x00000008 */
/* #define _TRISB_TRISB3_LENGTH                     0x00000001 */

/* #define _TRISB_TRISB4_POSITION                   0x00000004 */
/* #define _TRISB_TRISB4_MASK                       0x00000010 */
/* #define _TRISB_TRISB4_LENGTH                     0x00000001 */

/* #define _TRISB_TRISB5_POSITION                   0x00000005 */
/* #define _TRISB_TRISB5_MASK                       0x00000020 */
/* #define _TRISB_TRISB5_LENGTH                     0x00000001 */

/* #define _TRISB_TRISB6_POSITION                   0x00000006 */
/* #define _TRISB_TRISB6_MASK                       0x00000040 */
/* #define _TRISB_TRISB6_LENGTH                     0x00000001 */

/* #define _TRISB_TRISB7_POSITION                   0x00000007 */
/* #define _TRISB_TRISB7_MASK                       0x00000080 */
/* #define _TRISB_TRISB7_LENGTH                     0x00000001 */

/* #define _TRISB_TRISB8_POSITION                   0x00000008 */
/* #define _TRISB_TRISB8_MASK                       0x00000100 */
/* #define _TRISB_TRISB8_LENGTH                     0x00000001 */

/* #define _TRISB_TRISB9_POSITION                   0x00000009 */
/* #define _TRISB_TRISB9_MASK                       0x00000200 */
/* #define _TRISB_TRISB9_LENGTH                     0x00000001 */

/* #define _TRISB_TRISB10_POSITION                  0x0000000A */
/* #define _TRISB_TRISB10_MASK                      0x00000400 */
/* #define _TRISB_TRISB10_LENGTH                    0x00000001 */

/* #define _TRISB_TRISB11_POSITION                  0x0000000B */
/* #define _TRISB_TRISB11_MASK                      0x00000800 */
/* #define _TRISB_TRISB11_LENGTH                    0x00000001 */

/* #define _TRISB_TRISB12_POSITION                  0x0000000C */
/* #define _TRISB_TRISB12_MASK                      0x00001000 */
/* #define _TRISB_TRISB12_LENGTH                    0x00000001 */

/* #define _TRISB_TRISB13_POSITION                  0x0000000D */
/* #define _TRISB_TRISB13_MASK                      0x00002000 */
/* #define _TRISB_TRISB13_LENGTH                    0x00000001 */

/* #define _TRISB_TRISB14_POSITION                  0x0000000E */
/* #define _TRISB_TRISB14_MASK                      0x00004000 */
/* #define _TRISB_TRISB14_LENGTH                    0x00000001 */

/* #define _TRISB_TRISB15_POSITION                  0x0000000F */
/* #define _TRISB_TRISB15_MASK                      0x00008000 */
/* #define _TRISB_TRISB15_LENGTH                    0x00000001 */

/* #define _TRISB_w_POSITION                        0x00000000 */
/* #define _TRISB_w_MASK                            0xFFFFFFFF */
/* #define _TRISB_w_LENGTH                          0x00000020 */

/* #define _PORTB_RB0_POSITION                      0x00000000 */
/* #define _PORTB_RB0_MASK                          0x00000001 */
/* #define _PORTB_RB0_LENGTH                        0x00000001 */

/* #define _PORTB_RB1_POSITION                      0x00000001 */
/* #define _PORTB_RB1_MASK                          0x00000002 */
/* #define _PORTB_RB1_LENGTH                        0x00000001 */

/* #define _PORTB_RB2_POSITION                      0x00000002 */
/* #define _PORTB_RB2_MASK                          0x00000004 */
/* #define _PORTB_RB2_LENGTH                        0x00000001 */

/* #define _PORTB_RB3_POSITION                      0x00000003 */
/* #define _PORTB_RB3_MASK                          0x00000008 */
/* #define _PORTB_RB3_LENGTH                        0x00000001 */

/* #define _PORTB_RB4_POSITION                      0x00000004 */
/* #define _PORTB_RB4_MASK                          0x00000010 */
/* #define _PORTB_RB4_LENGTH                        0x00000001 */

/* #define _PORTB_RB5_POSITION                      0x00000005 */
/* #define _PORTB_RB5_MASK                          0x00000020 */
/* #define _PORTB_RB5_LENGTH                        0x00000001 */

/* #define _PORTB_RB6_POSITION                      0x00000006 */
/* #define _PORTB_RB6_MASK                          0x00000040 */
/* #define _PORTB_RB6_LENGTH                        0x00000001 */

/* #define _PORTB_RB7_POSITION                      0x00000007 */
/* #define _PORTB_RB7_MASK                          0x00000080 */
/* #define _PORTB_RB7_LENGTH                        0x00000001 */

/* #define _PORTB_RB8_POSITION                      0x00000008 */
/* #define _PORTB_RB8_MASK                          0x00000100 */
/* #define _PORTB_RB8_LENGTH                        0x00000001 */

/* #define _PORTB_RB9_POSITION                      0x00000009 */
/* #define _PORTB_RB9_MASK                          0x00000200 */
/* #define _PORTB_RB9_LENGTH                        0x00000001 */

/* #define _PORTB_RB10_POSITION                     0x0000000A */
/* #define _PORTB_RB10_MASK                         0x00000400 */
/* #define _PORTB_RB10_LENGTH                       0x00000001 */

/* #define _PORTB_RB11_POSITION                     0x0000000B */
/* #define _PORTB_RB11_MASK                         0x00000800 */
/* #define _PORTB_RB11_LENGTH                       0x00000001 */

/* #define _PORTB_RB12_POSITION                     0x0000000C */
/* #define _PORTB_RB12_MASK                         0x00001000 */
/* #define _PORTB_RB12_LENGTH                       0x00000001 */

/* #define _PORTB_RB13_POSITION                     0x0000000D */
/* #define _PORTB_RB13_MASK                         0x00002000 */
/* #define _PORTB_RB13_LENGTH                       0x00000001 */

/* #define _PORTB_RB14_POSITION                     0x0000000E */
/* #define _PORTB_RB14_MASK                         0x00004000 */
/* #define _PORTB_RB14_LENGTH                       0x00000001 */

/* #define _PORTB_RB15_POSITION                     0x0000000F */
/* #define _PORTB_RB15_MASK                         0x00008000 */
/* #define _PORTB_RB15_LENGTH                       0x00000001 */

/* #define _PORTB_w_POSITION                        0x00000000 */
/* #define _PORTB_w_MASK                            0xFFFFFFFF */
/* #define _PORTB_w_LENGTH                          0x00000020 */

/* #define _LATB_LATB0_POSITION                     0x00000000 */
/* #define _LATB_LATB0_MASK                         0x00000001 */
/* #define _LATB_LATB0_LENGTH                       0x00000001 */

/* #define _LATB_LATB1_POSITION                     0x00000001 */
/* #define _LATB_LATB1_MASK                         0x00000002 */
/* #define _LATB_LATB1_LENGTH                       0x00000001 */

/* #define _LATB_LATB2_POSITION                     0x00000002 */
/* #define _LATB_LATB2_MASK                         0x00000004 */
/* #define _LATB_LATB2_LENGTH                       0x00000001 */

/* #define _LATB_LATB3_POSITION                     0x00000003 */
/* #define _LATB_LATB3_MASK                         0x00000008 */
/* #define _LATB_LATB3_LENGTH                       0x00000001 */

/* #define _LATB_LATB4_POSITION                     0x00000004 */
/* #define _LATB_LATB4_MASK                         0x00000010 */
/* #define _LATB_LATB4_LENGTH                       0x00000001 */

/* #define _LATB_LATB5_POSITION                     0x00000005 */
/* #define _LATB_LATB5_MASK                         0x00000020 */
/* #define _LATB_LATB5_LENGTH                       0x00000001 */

/* #define _LATB_LATB6_POSITION                     0x00000006 */
/* #define _LATB_LATB6_MASK                         0x00000040 */
/* #define _LATB_LATB6_LENGTH                       0x00000001 */

/* #define _LATB_LATB7_POSITION                     0x00000007 */
/* #define _LATB_LATB7_MASK                         0x00000080 */
/* #define _LATB_LATB7_LENGTH                       0x00000001 */

/* #define _LATB_LATB8_POSITION                     0x00000008 */
/* #define _LATB_LATB8_MASK                         0x00000100 */
/* #define _LATB_LATB8_LENGTH                       0x00000001 */

/* #define _LATB_LATB9_POSITION                     0x00000009 */
/* #define _LATB_LATB9_MASK                         0x00000200 */
/* #define _LATB_LATB9_LENGTH                       0x00000001 */

/* #define _LATB_LATB10_POSITION                    0x0000000A */
/* #define _LATB_LATB10_MASK                        0x00000400 */
/* #define _LATB_LATB10_LENGTH                      0x00000001 */

/* #define _LATB_LATB11_POSITION                    0x0000000B */
/* #define _LATB_LATB11_MASK                        0x00000800 */
/* #define _LATB_LATB11_LENGTH                      0x00000001 */

/* #define _LATB_LATB12_POSITION                    0x0000000C */
/* #define _LATB_LATB12_MASK                        0x00001000 */
/* #define _LATB_LATB12_LENGTH                      0x00000001 */

/* #define _LATB_LATB13_POSITION                    0x0000000D */
/* #define _LATB_LATB13_MASK                        0x00002000 */
/* #define _LATB_LATB13_LENGTH                      0x00000001 */

/* #define _LATB_LATB14_POSITION                    0x0000000E */
/* #define _LATB_LATB14_MASK                        0x00004000 */
/* #define _LATB_LATB14_LENGTH                      0x00000001 */

/* #define _LATB_LATB15_POSITION                    0x0000000F */
/* #define _LATB_LATB15_MASK                        0x00008000 */
/* #define _LATB_LATB15_LENGTH                      0x00000001 */

/* #define _LATB_w_POSITION                         0x00000000 */
/* #define _LATB_w_MASK                             0xFFFFFFFF */
/* #define _LATB_w_LENGTH                           0x00000020 */

/* #define _ODCB_ODCB0_POSITION                     0x00000000 */
/* #define _ODCB_ODCB0_MASK                         0x00000001 */
/* #define _ODCB_ODCB0_LENGTH                       0x00000001 */

/* #define _ODCB_ODCB1_POSITION                     0x00000001 */
/* #define _ODCB_ODCB1_MASK                         0x00000002 */
/* #define _ODCB_ODCB1_LENGTH                       0x00000001 */

/* #define _ODCB_ODCB2_POSITION                     0x00000002 */
/* #define _ODCB_ODCB2_MASK                         0x00000004 */
/* #define _ODCB_ODCB2_LENGTH                       0x00000001 */

/* #define _ODCB_ODCB3_POSITION                     0x00000003 */
/* #define _ODCB_ODCB3_MASK                         0x00000008 */
/* #define _ODCB_ODCB3_LENGTH                       0x00000001 */

/* #define _ODCB_ODCB4_POSITION                     0x00000004 */
/* #define _ODCB_ODCB4_MASK                         0x00000010 */
/* #define _ODCB_ODCB4_LENGTH                       0x00000001 */

/* #define _ODCB_ODCB5_POSITION                     0x00000005 */
/* #define _ODCB_ODCB5_MASK                         0x00000020 */
/* #define _ODCB_ODCB5_LENGTH                       0x00000001 */

/* #define _ODCB_ODCB6_POSITION                     0x00000006 */
/* #define _ODCB_ODCB6_MASK                         0x00000040 */
/* #define _ODCB_ODCB6_LENGTH                       0x00000001 */

/* #define _ODCB_ODCB7_POSITION                     0x00000007 */
/* #define _ODCB_ODCB7_MASK                         0x00000080 */
/* #define _ODCB_ODCB7_LENGTH                       0x00000001 */

/* #define _ODCB_ODCB8_POSITION                     0x00000008 */
/* #define _ODCB_ODCB8_MASK                         0x00000100 */
/* #define _ODCB_ODCB8_LENGTH                       0x00000001 */

/* #define _ODCB_ODCB9_POSITION                     0x00000009 */
/* #define _ODCB_ODCB9_MASK                         0x00000200 */
/* #define _ODCB_ODCB9_LENGTH                       0x00000001 */

/* #define _ODCB_ODCB10_POSITION                    0x0000000A */
/* #define _ODCB_ODCB10_MASK                        0x00000400 */
/* #define _ODCB_ODCB10_LENGTH                      0x00000001 */

/* #define _ODCB_ODCB11_POSITION                    0x0000000B */
/* #define _ODCB_ODCB11_MASK                        0x00000800 */
/* #define _ODCB_ODCB11_LENGTH                      0x00000001 */

/* #define _ODCB_ODCB12_POSITION                    0x0000000C */
/* #define _ODCB_ODCB12_MASK                        0x00001000 */
/* #define _ODCB_ODCB12_LENGTH                      0x00000001 */

/* #define _ODCB_ODCB13_POSITION                    0x0000000D */
/* #define _ODCB_ODCB13_MASK                        0x00002000 */
/* #define _ODCB_ODCB13_LENGTH                      0x00000001 */

/* #define _ODCB_ODCB14_POSITION                    0x0000000E */
/* #define _ODCB_ODCB14_MASK                        0x00004000 */
/* #define _ODCB_ODCB14_LENGTH                      0x00000001 */

/* #define _ODCB_ODCB15_POSITION                    0x0000000F */
/* #define _ODCB_ODCB15_MASK                        0x00008000 */
/* #define _ODCB_ODCB15_LENGTH                      0x00000001 */

/* #define _ODCB_w_POSITION                         0x00000000 */
/* #define _ODCB_w_MASK                             0xFFFFFFFF */
/* #define _ODCB_w_LENGTH                           0x00000020 */

/* #define _CNPUB_CNPUB0_POSITION                   0x00000000 */
/* #define _CNPUB_CNPUB0_MASK                       0x00000001 */
/* #define _CNPUB_CNPUB0_LENGTH                     0x00000001 */

/* #define _CNPUB_CNPUB1_POSITION                   0x00000001 */
/* #define _CNPUB_CNPUB1_MASK                       0x00000002 */
/* #define _CNPUB_CNPUB1_LENGTH                     0x00000001 */

/* #define _CNPUB_CNPUB2_POSITION                   0x00000002 */
/* #define _CNPUB_CNPUB2_MASK                       0x00000004 */
/* #define _CNPUB_CNPUB2_LENGTH                     0x00000001 */

/* #define _CNPUB_CNPUB3_POSITION                   0x00000003 */
/* #define _CNPUB_CNPUB3_MASK                       0x00000008 */
/* #define _CNPUB_CNPUB3_LENGTH                     0x00000001 */

/* #define _CNPUB_CNPUB4_POSITION                   0x00000004 */
/* #define _CNPUB_CNPUB4_MASK                       0x00000010 */
/* #define _CNPUB_CNPUB4_LENGTH                     0x00000001 */

/* #define _CNPUB_CNPUB5_POSITION                   0x00000005 */
/* #define _CNPUB_CNPUB5_MASK                       0x00000020 */
/* #define _CNPUB_CNPUB5_LENGTH                     0x00000001 */

/* #define _CNPUB_CNPUB6_POSITION                   0x00000006 */
/* #define _CNPUB_CNPUB6_MASK                       0x00000040 */
/* #define _CNPUB_CNPUB6_LENGTH                     0x00000001 */

/* #define _CNPUB_CNPUB7_POSITION                   0x00000007 */
/* #define _CNPUB_CNPUB7_MASK                       0x00000080 */
/* #define _CNPUB_CNPUB7_LENGTH                     0x00000001 */

/* #define _CNPUB_CNPUB8_POSITION                   0x00000008 */
/* #define _CNPUB_CNPUB8_MASK                       0x00000100 */
/* #define _CNPUB_CNPUB8_LENGTH                     0x00000001 */

/* #define _CNPUB_CNPUB9_POSITION                   0x00000009 */
/* #define _CNPUB_CNPUB9_MASK                       0x00000200 */
/* #define _CNPUB_CNPUB9_LENGTH                     0x00000001 */

/* #define _CNPUB_CNPUB10_POSITION                  0x0000000A */
/* #define _CNPUB_CNPUB10_MASK                      0x00000400 */
/* #define _CNPUB_CNPUB10_LENGTH                    0x00000001 */

/* #define _CNPUB_CNPUB11_POSITION                  0x0000000B */
/* #define _CNPUB_CNPUB11_MASK                      0x00000800 */
/* #define _CNPUB_CNPUB11_LENGTH                    0x00000001 */

/* #define _CNPUB_CNPUB12_POSITION                  0x0000000C */
/* #define _CNPUB_CNPUB12_MASK                      0x00001000 */
/* #define _CNPUB_CNPUB12_LENGTH                    0x00000001 */

/* #define _CNPUB_CNPUB13_POSITION                  0x0000000D */
/* #define _CNPUB_CNPUB13_MASK                      0x00002000 */
/* #define _CNPUB_CNPUB13_LENGTH                    0x00000001 */

/* #define _CNPUB_CNPUB14_POSITION                  0x0000000E */
/* #define _CNPUB_CNPUB14_MASK                      0x00004000 */
/* #define _CNPUB_CNPUB14_LENGTH                    0x00000001 */

/* #define _CNPUB_CNPUB15_POSITION                  0x0000000F */
/* #define _CNPUB_CNPUB15_MASK                      0x00008000 */
/* #define _CNPUB_CNPUB15_LENGTH                    0x00000001 */

/* #define _CNPUB_w_POSITION                        0x00000000 */
/* #define _CNPUB_w_MASK                            0xFFFFFFFF */
/* #define _CNPUB_w_LENGTH                          0x00000020 */

/* #define _CNPDB_CNPDB0_POSITION                   0x00000000 */
/* #define _CNPDB_CNPDB0_MASK                       0x00000001 */
/* #define _CNPDB_CNPDB0_LENGTH                     0x00000001 */

/* #define _CNPDB_CNPDB1_POSITION                   0x00000001 */
/* #define _CNPDB_CNPDB1_MASK                       0x00000002 */
/* #define _CNPDB_CNPDB1_LENGTH                     0x00000001 */

/* #define _CNPDB_CNPDB2_POSITION                   0x00000002 */
/* #define _CNPDB_CNPDB2_MASK                       0x00000004 */
/* #define _CNPDB_CNPDB2_LENGTH                     0x00000001 */

/* #define _CNPDB_CNPDB3_POSITION                   0x00000003 */
/* #define _CNPDB_CNPDB3_MASK                       0x00000008 */
/* #define _CNPDB_CNPDB3_LENGTH                     0x00000001 */

/* #define _CNPDB_CNPDB4_POSITION                   0x00000004 */
/* #define _CNPDB_CNPDB4_MASK                       0x00000010 */
/* #define _CNPDB_CNPDB4_LENGTH                     0x00000001 */

/* #define _CNPDB_CNPDB5_POSITION                   0x00000005 */
/* #define _CNPDB_CNPDB5_MASK                       0x00000020 */
/* #define _CNPDB_CNPDB5_LENGTH                     0x00000001 */

/* #define _CNPDB_CNPDB6_POSITION                   0x00000006 */
/* #define _CNPDB_CNPDB6_MASK                       0x00000040 */
/* #define _CNPDB_CNPDB6_LENGTH                     0x00000001 */

/* #define _CNPDB_CNPDB7_POSITION                   0x00000007 */
/* #define _CNPDB_CNPDB7_MASK                       0x00000080 */
/* #define _CNPDB_CNPDB7_LENGTH                     0x00000001 */

/* #define _CNPDB_CNPDB8_POSITION                   0x00000008 */
/* #define _CNPDB_CNPDB8_MASK                       0x00000100 */
/* #define _CNPDB_CNPDB8_LENGTH                     0x00000001 */

/* #define _CNPDB_CNPDB9_POSITION                   0x00000009 */
/* #define _CNPDB_CNPDB9_MASK                       0x00000200 */
/* #define _CNPDB_CNPDB9_LENGTH                     0x00000001 */

/* #define _CNPDB_CNPDB10_POSITION                  0x0000000A */
/* #define _CNPDB_CNPDB10_MASK                      0x00000400 */
/* #define _CNPDB_CNPDB10_LENGTH                    0x00000001 */

/* #define _CNPDB_CNPDB11_POSITION                  0x0000000B */
/* #define _CNPDB_CNPDB11_MASK                      0x00000800 */
/* #define _CNPDB_CNPDB11_LENGTH                    0x00000001 */

/* #define _CNPDB_CNPDB12_POSITION                  0x0000000C */
/* #define _CNPDB_CNPDB12_MASK                      0x00001000 */
/* #define _CNPDB_CNPDB12_LENGTH                    0x00000001 */

/* #define _CNPDB_CNPDB13_POSITION                  0x0000000D */
/* #define _CNPDB_CNPDB13_MASK                      0x00002000 */
/* #define _CNPDB_CNPDB13_LENGTH                    0x00000001 */

/* #define _CNPDB_CNPDB14_POSITION                  0x0000000E */
/* #define _CNPDB_CNPDB14_MASK                      0x00004000 */
/* #define _CNPDB_CNPDB14_LENGTH                    0x00000001 */

/* #define _CNPDB_CNPDB15_POSITION                  0x0000000F */
/* #define _CNPDB_CNPDB15_MASK                      0x00008000 */
/* #define _CNPDB_CNPDB15_LENGTH                    0x00000001 */

/* #define _CNPDB_w_POSITION                        0x00000000 */
/* #define _CNPDB_w_MASK                            0xFFFFFFFF */
/* #define _CNPDB_w_LENGTH                          0x00000020 */

/* #define _CNCONB_SIDL_POSITION                    0x0000000D */
/* #define _CNCONB_SIDL_MASK                        0x00002000 */
/* #define _CNCONB_SIDL_LENGTH                      0x00000001 */

/* #define _CNCONB_ON_POSITION                      0x0000000F */
/* #define _CNCONB_ON_MASK                          0x00008000 */
/* #define _CNCONB_ON_LENGTH                        0x00000001 */

/* #define _CNCONB_w_POSITION                       0x00000000 */
/* #define _CNCONB_w_MASK                           0xFFFFFFFF */
/* #define _CNCONB_w_LENGTH                         0x00000020 */

/* #define _CNENB_CNIEB0_POSITION                   0x00000000 */
/* #define _CNENB_CNIEB0_MASK                       0x00000001 */
/* #define _CNENB_CNIEB0_LENGTH                     0x00000001 */

/* #define _CNENB_CNIEB1_POSITION                   0x00000001 */
/* #define _CNENB_CNIEB1_MASK                       0x00000002 */
/* #define _CNENB_CNIEB1_LENGTH                     0x00000001 */

/* #define _CNENB_CNIEB2_POSITION                   0x00000002 */
/* #define _CNENB_CNIEB2_MASK                       0x00000004 */
/* #define _CNENB_CNIEB2_LENGTH                     0x00000001 */

/* #define _CNENB_CNIEB3_POSITION                   0x00000003 */
/* #define _CNENB_CNIEB3_MASK                       0x00000008 */
/* #define _CNENB_CNIEB3_LENGTH                     0x00000001 */

/* #define _CNENB_CNIEB4_POSITION                   0x00000004 */
/* #define _CNENB_CNIEB4_MASK                       0x00000010 */
/* #define _CNENB_CNIEB4_LENGTH                     0x00000001 */

/* #define _CNENB_CNIEB5_POSITION                   0x00000005 */
/* #define _CNENB_CNIEB5_MASK                       0x00000020 */
/* #define _CNENB_CNIEB5_LENGTH                     0x00000001 */

/* #define _CNENB_CNIEB6_POSITION                   0x00000006 */
/* #define _CNENB_CNIEB6_MASK                       0x00000040 */
/* #define _CNENB_CNIEB6_LENGTH                     0x00000001 */

/* #define _CNENB_CNIEB7_POSITION                   0x00000007 */
/* #define _CNENB_CNIEB7_MASK                       0x00000080 */
/* #define _CNENB_CNIEB7_LENGTH                     0x00000001 */

/* #define _CNENB_CNIEB8_POSITION                   0x00000008 */
/* #define _CNENB_CNIEB8_MASK                       0x00000100 */
/* #define _CNENB_CNIEB8_LENGTH                     0x00000001 */

/* #define _CNENB_CNIEB9_POSITION                   0x00000009 */
/* #define _CNENB_CNIEB9_MASK                       0x00000200 */
/* #define _CNENB_CNIEB9_LENGTH                     0x00000001 */

/* #define _CNENB_CNIEB10_POSITION                  0x0000000A */
/* #define _CNENB_CNIEB10_MASK                      0x00000400 */
/* #define _CNENB_CNIEB10_LENGTH                    0x00000001 */

/* #define _CNENB_CNIEB11_POSITION                  0x0000000B */
/* #define _CNENB_CNIEB11_MASK                      0x00000800 */
/* #define _CNENB_CNIEB11_LENGTH                    0x00000001 */

/* #define _CNENB_CNIEB12_POSITION                  0x0000000C */
/* #define _CNENB_CNIEB12_MASK                      0x00001000 */
/* #define _CNENB_CNIEB12_LENGTH                    0x00000001 */

/* #define _CNENB_CNIEB13_POSITION                  0x0000000D */
/* #define _CNENB_CNIEB13_MASK                      0x00002000 */
/* #define _CNENB_CNIEB13_LENGTH                    0x00000001 */

/* #define _CNENB_CNIEB14_POSITION                  0x0000000E */
/* #define _CNENB_CNIEB14_MASK                      0x00004000 */
/* #define _CNENB_CNIEB14_LENGTH                    0x00000001 */

/* #define _CNENB_CNIEB15_POSITION                  0x0000000F */
/* #define _CNENB_CNIEB15_MASK                      0x00008000 */
/* #define _CNENB_CNIEB15_LENGTH                    0x00000001 */

/* #define _CNENB_w_POSITION                        0x00000000 */
/* #define _CNENB_w_MASK                            0xFFFFFFFF */
/* #define _CNENB_w_LENGTH                          0x00000020 */

/* #define _CNSTATB_CNSTATB0_POSITION               0x00000000 */
/* #define _CNSTATB_CNSTATB0_MASK                   0x00000001 */
/* #define _CNSTATB_CNSTATB0_LENGTH                 0x00000001 */

/* #define _CNSTATB_CNSTATB1_POSITION               0x00000001 */
/* #define _CNSTATB_CNSTATB1_MASK                   0x00000002 */
/* #define _CNSTATB_CNSTATB1_LENGTH                 0x00000001 */

/* #define _CNSTATB_CNSTATB2_POSITION               0x00000002 */
/* #define _CNSTATB_CNSTATB2_MASK                   0x00000004 */
/* #define _CNSTATB_CNSTATB2_LENGTH                 0x00000001 */

/* #define _CNSTATB_CNSTATB3_POSITION               0x00000003 */
/* #define _CNSTATB_CNSTATB3_MASK                   0x00000008 */
/* #define _CNSTATB_CNSTATB3_LENGTH                 0x00000001 */

/* #define _CNSTATB_CNSTATB4_POSITION               0x00000004 */
/* #define _CNSTATB_CNSTATB4_MASK                   0x00000010 */
/* #define _CNSTATB_CNSTATB4_LENGTH                 0x00000001 */

/* #define _CNSTATB_CNSTATB5_POSITION               0x00000005 */
/* #define _CNSTATB_CNSTATB5_MASK                   0x00000020 */
/* #define _CNSTATB_CNSTATB5_LENGTH                 0x00000001 */

/* #define _CNSTATB_CNSTATB6_POSITION               0x00000006 */
/* #define _CNSTATB_CNSTATB6_MASK                   0x00000040 */
/* #define _CNSTATB_CNSTATB6_LENGTH                 0x00000001 */

/* #define _CNSTATB_CNSTATB7_POSITION               0x00000007 */
/* #define _CNSTATB_CNSTATB7_MASK                   0x00000080 */
/* #define _CNSTATB_CNSTATB7_LENGTH                 0x00000001 */

/* #define _CNSTATB_CNSTATB8_POSITION               0x00000008 */
/* #define _CNSTATB_CNSTATB8_MASK                   0x00000100 */
/* #define _CNSTATB_CNSTATB8_LENGTH                 0x00000001 */

/* #define _CNSTATB_CNSTATB9_POSITION               0x00000009 */
/* #define _CNSTATB_CNSTATB9_MASK                   0x00000200 */
/* #define _CNSTATB_CNSTATB9_LENGTH                 0x00000001 */

/* #define _CNSTATB_CNSTATB10_POSITION              0x0000000A */
/* #define _CNSTATB_CNSTATB10_MASK                  0x00000400 */
/* #define _CNSTATB_CNSTATB10_LENGTH                0x00000001 */

/* #define _CNSTATB_CNSTATB11_POSITION              0x0000000B */
/* #define _CNSTATB_CNSTATB11_MASK                  0x00000800 */
/* #define _CNSTATB_CNSTATB11_LENGTH                0x00000001 */

/* #define _CNSTATB_CNSTATB12_POSITION              0x0000000C */
/* #define _CNSTATB_CNSTATB12_MASK                  0x00001000 */
/* #define _CNSTATB_CNSTATB12_LENGTH                0x00000001 */

/* #define _CNSTATB_CNSTATB13_POSITION              0x0000000D */
/* #define _CNSTATB_CNSTATB13_MASK                  0x00002000 */
/* #define _CNSTATB_CNSTATB13_LENGTH                0x00000001 */

/* #define _CNSTATB_CNSTATB14_POSITION              0x0000000E */
/* #define _CNSTATB_CNSTATB14_MASK                  0x00004000 */
/* #define _CNSTATB_CNSTATB14_LENGTH                0x00000001 */

/* #define _CNSTATB_CNSTATB15_POSITION              0x0000000F */
/* #define _CNSTATB_CNSTATB15_MASK                  0x00008000 */
/* #define _CNSTATB_CNSTATB15_LENGTH                0x00000001 */

/* #define _CNSTATB_w_POSITION                      0x00000000 */
/* #define _CNSTATB_w_MASK                          0xFFFFFFFF */
/* #define _CNSTATB_w_LENGTH                        0x00000020 */

/* #define _ANSELC_ANSC12_POSITION                  0x0000000C */
/* #define _ANSELC_ANSC12_MASK                      0x00001000 */
/* #define _ANSELC_ANSC12_LENGTH                    0x00000001 */

/* #define _ANSELC_ANSC13_POSITION                  0x0000000D */
/* #define _ANSELC_ANSC13_MASK                      0x00002000 */
/* #define _ANSELC_ANSC13_LENGTH                    0x00000001 */

/* #define _ANSELC_ANSC14_POSITION                  0x0000000E */
/* #define _ANSELC_ANSC14_MASK                      0x00004000 */
/* #define _ANSELC_ANSC14_LENGTH                    0x00000001 */

/* #define _ANSELC_ANSC15_POSITION                  0x0000000F */
/* #define _ANSELC_ANSC15_MASK                      0x00008000 */
/* #define _ANSELC_ANSC15_LENGTH                    0x00000001 */

/* #define _ANSELC_w_POSITION                       0x00000000 */
/* #define _ANSELC_w_MASK                           0xFFFFFFFF */
/* #define _ANSELC_w_LENGTH                         0x00000020 */

/* #define _TRISC_TRISC12_POSITION                  0x0000000C */
/* #define _TRISC_TRISC12_MASK                      0x00001000 */
/* #define _TRISC_TRISC12_LENGTH                    0x00000001 */

/* #define _TRISC_TRISC13_POSITION                  0x0000000D */
/* #define _TRISC_TRISC13_MASK                      0x00002000 */
/* #define _TRISC_TRISC13_LENGTH                    0x00000001 */

/* #define _TRISC_TRISC14_POSITION                  0x0000000E */
/* #define _TRISC_TRISC14_MASK                      0x00004000 */
/* #define _TRISC_TRISC14_LENGTH                    0x00000001 */

/* #define _TRISC_TRISC15_POSITION                  0x0000000F */
/* #define _TRISC_TRISC15_MASK                      0x00008000 */
/* #define _TRISC_TRISC15_LENGTH                    0x00000001 */

/* #define _TRISC_w_POSITION                        0x00000000 */
/* #define _TRISC_w_MASK                            0xFFFFFFFF */
/* #define _TRISC_w_LENGTH                          0x00000020 */

/* #define _PORTC_RC12_POSITION                     0x0000000C */
/* #define _PORTC_RC12_MASK                         0x00001000 */
/* #define _PORTC_RC12_LENGTH                       0x00000001 */

/* #define _PORTC_RC13_POSITION                     0x0000000D */
/* #define _PORTC_RC13_MASK                         0x00002000 */
/* #define _PORTC_RC13_LENGTH                       0x00000001 */

/* #define _PORTC_RC14_POSITION                     0x0000000E */
/* #define _PORTC_RC14_MASK                         0x00004000 */
/* #define _PORTC_RC14_LENGTH                       0x00000001 */

/* #define _PORTC_RC15_POSITION                     0x0000000F */
/* #define _PORTC_RC15_MASK                         0x00008000 */
/* #define _PORTC_RC15_LENGTH                       0x00000001 */

/* #define _PORTC_w_POSITION                        0x00000000 */
/* #define _PORTC_w_MASK                            0xFFFFFFFF */
/* #define _PORTC_w_LENGTH                          0x00000020 */

/* #define _LATC_LATC12_POSITION                    0x0000000C */
/* #define _LATC_LATC12_MASK                        0x00001000 */
/* #define _LATC_LATC12_LENGTH                      0x00000001 */

/* #define _LATC_LATC13_POSITION                    0x0000000D */
/* #define _LATC_LATC13_MASK                        0x00002000 */
/* #define _LATC_LATC13_LENGTH                      0x00000001 */

/* #define _LATC_LATC14_POSITION                    0x0000000E */
/* #define _LATC_LATC14_MASK                        0x00004000 */
/* #define _LATC_LATC14_LENGTH                      0x00000001 */

/* #define _LATC_LATC15_POSITION                    0x0000000F */
/* #define _LATC_LATC15_MASK                        0x00008000 */
/* #define _LATC_LATC15_LENGTH                      0x00000001 */

/* #define _LATC_w_POSITION                         0x00000000 */
/* #define _LATC_w_MASK                             0xFFFFFFFF */
/* #define _LATC_w_LENGTH                           0x00000020 */

/* #define _ODCC_ODCC12_POSITION                    0x0000000C */
/* #define _ODCC_ODCC12_MASK                        0x00001000 */
/* #define _ODCC_ODCC12_LENGTH                      0x00000001 */

/* #define _ODCC_ODCC13_POSITION                    0x0000000D */
/* #define _ODCC_ODCC13_MASK                        0x00002000 */
/* #define _ODCC_ODCC13_LENGTH                      0x00000001 */

/* #define _ODCC_ODCC14_POSITION                    0x0000000E */
/* #define _ODCC_ODCC14_MASK                        0x00004000 */
/* #define _ODCC_ODCC14_LENGTH                      0x00000001 */

/* #define _ODCC_ODCC15_POSITION                    0x0000000F */
/* #define _ODCC_ODCC15_MASK                        0x00008000 */
/* #define _ODCC_ODCC15_LENGTH                      0x00000001 */

/* #define _ODCC_w_POSITION                         0x00000000 */
/* #define _ODCC_w_MASK                             0xFFFFFFFF */
/* #define _ODCC_w_LENGTH                           0x00000020 */

/* #define _CNPUC_CNPUC12_POSITION                  0x0000000C */
/* #define _CNPUC_CNPUC12_MASK                      0x00001000 */
/* #define _CNPUC_CNPUC12_LENGTH                    0x00000001 */

/* #define _CNPUC_CNPUC13_POSITION                  0x0000000D */
/* #define _CNPUC_CNPUC13_MASK                      0x00002000 */
/* #define _CNPUC_CNPUC13_LENGTH                    0x00000001 */

/* #define _CNPUC_CNPUC14_POSITION                  0x0000000E */
/* #define _CNPUC_CNPUC14_MASK                      0x00004000 */
/* #define _CNPUC_CNPUC14_LENGTH                    0x00000001 */

/* #define _CNPUC_CNPUC15_POSITION                  0x0000000F */
/* #define _CNPUC_CNPUC15_MASK                      0x00008000 */
/* #define _CNPUC_CNPUC15_LENGTH                    0x00000001 */

/* #define _CNPUC_w_POSITION                        0x00000000 */
/* #define _CNPUC_w_MASK                            0xFFFFFFFF */
/* #define _CNPUC_w_LENGTH                          0x00000020 */

/* #define _CNPDC_CNPDC12_POSITION                  0x0000000C */
/* #define _CNPDC_CNPDC12_MASK                      0x00001000 */
/* #define _CNPDC_CNPDC12_LENGTH                    0x00000001 */

/* #define _CNPDC_CNPDC13_POSITION                  0x0000000D */
/* #define _CNPDC_CNPDC13_MASK                      0x00002000 */
/* #define _CNPDC_CNPDC13_LENGTH                    0x00000001 */

/* #define _CNPDC_CNPDC14_POSITION                  0x0000000E */
/* #define _CNPDC_CNPDC14_MASK                      0x00004000 */
/* #define _CNPDC_CNPDC14_LENGTH                    0x00000001 */

/* #define _CNPDC_CNPDC15_POSITION                  0x0000000F */
/* #define _CNPDC_CNPDC15_MASK                      0x00008000 */
/* #define _CNPDC_CNPDC15_LENGTH                    0x00000001 */

/* #define _CNPDC_w_POSITION                        0x00000000 */
/* #define _CNPDC_w_MASK                            0xFFFFFFFF */
/* #define _CNPDC_w_LENGTH                          0x00000020 */

/* #define _CNCONC_SIDL_POSITION                    0x0000000D */
/* #define _CNCONC_SIDL_MASK                        0x00002000 */
/* #define _CNCONC_SIDL_LENGTH                      0x00000001 */

/* #define _CNCONC_ON_POSITION                      0x0000000F */
/* #define _CNCONC_ON_MASK                          0x00008000 */
/* #define _CNCONC_ON_LENGTH                        0x00000001 */

/* #define _CNCONC_w_POSITION                       0x00000000 */
/* #define _CNCONC_w_MASK                           0xFFFFFFFF */
/* #define _CNCONC_w_LENGTH                         0x00000020 */

/* #define _CNENC_CNIEC12_POSITION                  0x0000000C */
/* #define _CNENC_CNIEC12_MASK                      0x00001000 */
/* #define _CNENC_CNIEC12_LENGTH                    0x00000001 */

/* #define _CNENC_CNIEC13_POSITION                  0x0000000D */
/* #define _CNENC_CNIEC13_MASK                      0x00002000 */
/* #define _CNENC_CNIEC13_LENGTH                    0x00000001 */

/* #define _CNENC_CNIEC14_POSITION                  0x0000000E */
/* #define _CNENC_CNIEC14_MASK                      0x00004000 */
/* #define _CNENC_CNIEC14_LENGTH                    0x00000001 */

/* #define _CNENC_CNIEC15_POSITION                  0x0000000F */
/* #define _CNENC_CNIEC15_MASK                      0x00008000 */
/* #define _CNENC_CNIEC15_LENGTH                    0x00000001 */

/* #define _CNENC_w_POSITION                        0x00000000 */
/* #define _CNENC_w_MASK                            0xFFFFFFFF */
/* #define _CNENC_w_LENGTH                          0x00000020 */

/* #define _CNSTATC_CNSTATC12_POSITION              0x0000000C */
/* #define _CNSTATC_CNSTATC12_MASK                  0x00001000 */
/* #define _CNSTATC_CNSTATC12_LENGTH                0x00000001 */

/* #define _CNSTATC_CNSTATC13_POSITION              0x0000000D */
/* #define _CNSTATC_CNSTATC13_MASK                  0x00002000 */
/* #define _CNSTATC_CNSTATC13_LENGTH                0x00000001 */

/* #define _CNSTATC_CNSTATC14_POSITION              0x0000000E */
/* #define _CNSTATC_CNSTATC14_MASK                  0x00004000 */
/* #define _CNSTATC_CNSTATC14_LENGTH                0x00000001 */

/* #define _CNSTATC_CNSTATC15_POSITION              0x0000000F */
/* #define _CNSTATC_CNSTATC15_MASK                  0x00008000 */
/* #define _CNSTATC_CNSTATC15_LENGTH                0x00000001 */

/* #define _CNSTATC_w_POSITION                      0x00000000 */
/* #define _CNSTATC_w_MASK                          0xFFFFFFFF */
/* #define _CNSTATC_w_LENGTH                        0x00000020 */

/* #define _ANSELD_ANSD1_POSITION                   0x00000001 */
/* #define _ANSELD_ANSD1_MASK                       0x00000002 */
/* #define _ANSELD_ANSD1_LENGTH                     0x00000001 */

/* #define _ANSELD_ANSD2_POSITION                   0x00000002 */
/* #define _ANSELD_ANSD2_MASK                       0x00000004 */
/* #define _ANSELD_ANSD2_LENGTH                     0x00000001 */

/* #define _ANSELD_ANSD3_POSITION                   0x00000003 */
/* #define _ANSELD_ANSD3_MASK                       0x00000008 */
/* #define _ANSELD_ANSD3_LENGTH                     0x00000001 */

/* #define _ANSELD_w_POSITION                       0x00000000 */
/* #define _ANSELD_w_MASK                           0xFFFFFFFF */
/* #define _ANSELD_w_LENGTH                         0x00000020 */

/* #define _TRISD_TRISD0_POSITION                   0x00000000 */
/* #define _TRISD_TRISD0_MASK                       0x00000001 */
/* #define _TRISD_TRISD0_LENGTH                     0x00000001 */

/* #define _TRISD_TRISD1_POSITION                   0x00000001 */
/* #define _TRISD_TRISD1_MASK                       0x00000002 */
/* #define _TRISD_TRISD1_LENGTH                     0x00000001 */

/* #define _TRISD_TRISD2_POSITION                   0x00000002 */
/* #define _TRISD_TRISD2_MASK                       0x00000004 */
/* #define _TRISD_TRISD2_LENGTH                     0x00000001 */

/* #define _TRISD_TRISD3_POSITION                   0x00000003 */
/* #define _TRISD_TRISD3_MASK                       0x00000008 */
/* #define _TRISD_TRISD3_LENGTH                     0x00000001 */

/* #define _TRISD_TRISD4_POSITION                   0x00000004 */
/* #define _TRISD_TRISD4_MASK                       0x00000010 */
/* #define _TRISD_TRISD4_LENGTH                     0x00000001 */

/* #define _TRISD_TRISD5_POSITION                   0x00000005 */
/* #define _TRISD_TRISD5_MASK                       0x00000020 */
/* #define _TRISD_TRISD5_LENGTH                     0x00000001 */

/* #define _TRISD_TRISD6_POSITION                   0x00000006 */
/* #define _TRISD_TRISD6_MASK                       0x00000040 */
/* #define _TRISD_TRISD6_LENGTH                     0x00000001 */

/* #define _TRISD_TRISD7_POSITION                   0x00000007 */
/* #define _TRISD_TRISD7_MASK                       0x00000080 */
/* #define _TRISD_TRISD7_LENGTH                     0x00000001 */

/* #define _TRISD_TRISD8_POSITION                   0x00000008 */
/* #define _TRISD_TRISD8_MASK                       0x00000100 */
/* #define _TRISD_TRISD8_LENGTH                     0x00000001 */

/* #define _TRISD_TRISD9_POSITION                   0x00000009 */
/* #define _TRISD_TRISD9_MASK                       0x00000200 */
/* #define _TRISD_TRISD9_LENGTH                     0x00000001 */

/* #define _TRISD_TRISD10_POSITION                  0x0000000A */
/* #define _TRISD_TRISD10_MASK                      0x00000400 */
/* #define _TRISD_TRISD10_LENGTH                    0x00000001 */

/* #define _TRISD_TRISD11_POSITION                  0x0000000B */
/* #define _TRISD_TRISD11_MASK                      0x00000800 */
/* #define _TRISD_TRISD11_LENGTH                    0x00000001 */

/* #define _TRISD_w_POSITION                        0x00000000 */
/* #define _TRISD_w_MASK                            0xFFFFFFFF */
/* #define _TRISD_w_LENGTH                          0x00000020 */

/* #define _PORTD_RD0_POSITION                      0x00000000 */
/* #define _PORTD_RD0_MASK                          0x00000001 */
/* #define _PORTD_RD0_LENGTH                        0x00000001 */

/* #define _PORTD_RD1_POSITION                      0x00000001 */
/* #define _PORTD_RD1_MASK                          0x00000002 */
/* #define _PORTD_RD1_LENGTH                        0x00000001 */

/* #define _PORTD_RD2_POSITION                      0x00000002 */
/* #define _PORTD_RD2_MASK                          0x00000004 */
/* #define _PORTD_RD2_LENGTH                        0x00000001 */

/* #define _PORTD_RD3_POSITION                      0x00000003 */
/* #define _PORTD_RD3_MASK                          0x00000008 */
/* #define _PORTD_RD3_LENGTH                        0x00000001 */

/* #define _PORTD_RD4_POSITION                      0x00000004 */
/* #define _PORTD_RD4_MASK                          0x00000010 */
/* #define _PORTD_RD4_LENGTH                        0x00000001 */

/* #define _PORTD_RD5_POSITION                      0x00000005 */
/* #define _PORTD_RD5_MASK                          0x00000020 */
/* #define _PORTD_RD5_LENGTH                        0x00000001 */

/* #define _PORTD_RD6_POSITION                      0x00000006 */
/* #define _PORTD_RD6_MASK                          0x00000040 */
/* #define _PORTD_RD6_LENGTH                        0x00000001 */

/* #define _PORTD_RD7_POSITION                      0x00000007 */
/* #define _PORTD_RD7_MASK                          0x00000080 */
/* #define _PORTD_RD7_LENGTH                        0x00000001 */

/* #define _PORTD_RD8_POSITION                      0x00000008 */
/* #define _PORTD_RD8_MASK                          0x00000100 */
/* #define _PORTD_RD8_LENGTH                        0x00000001 */

/* #define _PORTD_RD9_POSITION                      0x00000009 */
/* #define _PORTD_RD9_MASK                          0x00000200 */
/* #define _PORTD_RD9_LENGTH                        0x00000001 */

/* #define _PORTD_RD10_POSITION                     0x0000000A */
/* #define _PORTD_RD10_MASK                         0x00000400 */
/* #define _PORTD_RD10_LENGTH                       0x00000001 */

/* #define _PORTD_RD11_POSITION                     0x0000000B */
/* #define _PORTD_RD11_MASK                         0x00000800 */
/* #define _PORTD_RD11_LENGTH                       0x00000001 */

/* #define _PORTD_w_POSITION                        0x00000000 */
/* #define _PORTD_w_MASK                            0xFFFFFFFF */
/* #define _PORTD_w_LENGTH                          0x00000020 */

/* #define _LATD_LATD0_POSITION                     0x00000000 */
/* #define _LATD_LATD0_MASK                         0x00000001 */
/* #define _LATD_LATD0_LENGTH                       0x00000001 */

/* #define _LATD_LATD1_POSITION                     0x00000001 */
/* #define _LATD_LATD1_MASK                         0x00000002 */
/* #define _LATD_LATD1_LENGTH                       0x00000001 */

/* #define _LATD_LATD2_POSITION                     0x00000002 */
/* #define _LATD_LATD2_MASK                         0x00000004 */
/* #define _LATD_LATD2_LENGTH                       0x00000001 */

/* #define _LATD_LATD3_POSITION                     0x00000003 */
/* #define _LATD_LATD3_MASK                         0x00000008 */
/* #define _LATD_LATD3_LENGTH                       0x00000001 */

/* #define _LATD_LATD4_POSITION                     0x00000004 */
/* #define _LATD_LATD4_MASK                         0x00000010 */
/* #define _LATD_LATD4_LENGTH                       0x00000001 */

/* #define _LATD_LATD5_POSITION                     0x00000005 */
/* #define _LATD_LATD5_MASK                         0x00000020 */
/* #define _LATD_LATD5_LENGTH                       0x00000001 */

/* #define _LATD_LATD6_POSITION                     0x00000006 */
/* #define _LATD_LATD6_MASK                         0x00000040 */
/* #define _LATD_LATD6_LENGTH                       0x00000001 */

/* #define _LATD_LATD7_POSITION                     0x00000007 */
/* #define _LATD_LATD7_MASK                         0x00000080 */
/* #define _LATD_LATD7_LENGTH                       0x00000001 */

/* #define _LATD_LATD8_POSITION                     0x00000008 */
/* #define _LATD_LATD8_MASK                         0x00000100 */
/* #define _LATD_LATD8_LENGTH                       0x00000001 */

/* #define _LATD_LATD9_POSITION                     0x00000009 */
/* #define _LATD_LATD9_MASK                         0x00000200 */
/* #define _LATD_LATD9_LENGTH                       0x00000001 */

/* #define _LATD_LATD10_POSITION                    0x0000000A */
/* #define _LATD_LATD10_MASK                        0x00000400 */
/* #define _LATD_LATD10_LENGTH                      0x00000001 */

/* #define _LATD_LATD11_POSITION                    0x0000000B */
/* #define _LATD_LATD11_MASK                        0x00000800 */
/* #define _LATD_LATD11_LENGTH                      0x00000001 */

/* #define _LATD_w_POSITION                         0x00000000 */
/* #define _LATD_w_MASK                             0xFFFFFFFF */
/* #define _LATD_w_LENGTH                           0x00000020 */

/* #define _ODCD_ODCD0_POSITION                     0x00000000 */
/* #define _ODCD_ODCD0_MASK                         0x00000001 */
/* #define _ODCD_ODCD0_LENGTH                       0x00000001 */

/* #define _ODCD_ODCD1_POSITION                     0x00000001 */
/* #define _ODCD_ODCD1_MASK                         0x00000002 */
/* #define _ODCD_ODCD1_LENGTH                       0x00000001 */

/* #define _ODCD_ODCD2_POSITION                     0x00000002 */
/* #define _ODCD_ODCD2_MASK                         0x00000004 */
/* #define _ODCD_ODCD2_LENGTH                       0x00000001 */

/* #define _ODCD_ODCD3_POSITION                     0x00000003 */
/* #define _ODCD_ODCD3_MASK                         0x00000008 */
/* #define _ODCD_ODCD3_LENGTH                       0x00000001 */

/* #define _ODCD_ODCD4_POSITION                     0x00000004 */
/* #define _ODCD_ODCD4_MASK                         0x00000010 */
/* #define _ODCD_ODCD4_LENGTH                       0x00000001 */

/* #define _ODCD_ODCD5_POSITION                     0x00000005 */
/* #define _ODCD_ODCD5_MASK                         0x00000020 */
/* #define _ODCD_ODCD5_LENGTH                       0x00000001 */

/* #define _ODCD_ODCD6_POSITION                     0x00000006 */
/* #define _ODCD_ODCD6_MASK                         0x00000040 */
/* #define _ODCD_ODCD6_LENGTH                       0x00000001 */

/* #define _ODCD_ODCD7_POSITION                     0x00000007 */
/* #define _ODCD_ODCD7_MASK                         0x00000080 */
/* #define _ODCD_ODCD7_LENGTH                       0x00000001 */

/* #define _ODCD_ODCD8_POSITION                     0x00000008 */
/* #define _ODCD_ODCD8_MASK                         0x00000100 */
/* #define _ODCD_ODCD8_LENGTH                       0x00000001 */

/* #define _ODCD_ODCD9_POSITION                     0x00000009 */
/* #define _ODCD_ODCD9_MASK                         0x00000200 */
/* #define _ODCD_ODCD9_LENGTH                       0x00000001 */

/* #define _ODCD_ODCD10_POSITION                    0x0000000A */
/* #define _ODCD_ODCD10_MASK                        0x00000400 */
/* #define _ODCD_ODCD10_LENGTH                      0x00000001 */

/* #define _ODCD_ODCD11_POSITION                    0x0000000B */
/* #define _ODCD_ODCD11_MASK                        0x00000800 */
/* #define _ODCD_ODCD11_LENGTH                      0x00000001 */

/* #define _ODCD_w_POSITION                         0x00000000 */
/* #define _ODCD_w_MASK                             0xFFFFFFFF */
/* #define _ODCD_w_LENGTH                           0x00000020 */

/* #define _CNPUD_CNPUD0_POSITION                   0x00000000 */
/* #define _CNPUD_CNPUD0_MASK                       0x00000001 */
/* #define _CNPUD_CNPUD0_LENGTH                     0x00000001 */

/* #define _CNPUD_CNPUD1_POSITION                   0x00000001 */
/* #define _CNPUD_CNPUD1_MASK                       0x00000002 */
/* #define _CNPUD_CNPUD1_LENGTH                     0x00000001 */

/* #define _CNPUD_CNPUD2_POSITION                   0x00000002 */
/* #define _CNPUD_CNPUD2_MASK                       0x00000004 */
/* #define _CNPUD_CNPUD2_LENGTH                     0x00000001 */

/* #define _CNPUD_CNPUD3_POSITION                   0x00000003 */
/* #define _CNPUD_CNPUD3_MASK                       0x00000008 */
/* #define _CNPUD_CNPUD3_LENGTH                     0x00000001 */

/* #define _CNPUD_CNPUD4_POSITION                   0x00000004 */
/* #define _CNPUD_CNPUD4_MASK                       0x00000010 */
/* #define _CNPUD_CNPUD4_LENGTH                     0x00000001 */

/* #define _CNPUD_CNPUD5_POSITION                   0x00000005 */
/* #define _CNPUD_CNPUD5_MASK                       0x00000020 */
/* #define _CNPUD_CNPUD5_LENGTH                     0x00000001 */

/* #define _CNPUD_CNPUD6_POSITION                   0x00000006 */
/* #define _CNPUD_CNPUD6_MASK                       0x00000040 */
/* #define _CNPUD_CNPUD6_LENGTH                     0x00000001 */

/* #define _CNPUD_CNPUD7_POSITION                   0x00000007 */
/* #define _CNPUD_CNPUD7_MASK                       0x00000080 */
/* #define _CNPUD_CNPUD7_LENGTH                     0x00000001 */

/* #define _CNPUD_CNPUD8_POSITION                   0x00000008 */
/* #define _CNPUD_CNPUD8_MASK                       0x00000100 */
/* #define _CNPUD_CNPUD8_LENGTH                     0x00000001 */

/* #define _CNPUD_CNPUD9_POSITION                   0x00000009 */
/* #define _CNPUD_CNPUD9_MASK                       0x00000200 */
/* #define _CNPUD_CNPUD9_LENGTH                     0x00000001 */

/* #define _CNPUD_CNPUD10_POSITION                  0x0000000A */
/* #define _CNPUD_CNPUD10_MASK                      0x00000400 */
/* #define _CNPUD_CNPUD10_LENGTH                    0x00000001 */

/* #define _CNPUD_CNPUD11_POSITION                  0x0000000B */
/* #define _CNPUD_CNPUD11_MASK                      0x00000800 */
/* #define _CNPUD_CNPUD11_LENGTH                    0x00000001 */

/* #define _CNPUD_w_POSITION                        0x00000000 */
/* #define _CNPUD_w_MASK                            0xFFFFFFFF */
/* #define _CNPUD_w_LENGTH                          0x00000020 */

/* #define _CNPDD_CNPDD0_POSITION                   0x00000000 */
/* #define _CNPDD_CNPDD0_MASK                       0x00000001 */
/* #define _CNPDD_CNPDD0_LENGTH                     0x00000001 */

/* #define _CNPDD_CNPDD1_POSITION                   0x00000001 */
/* #define _CNPDD_CNPDD1_MASK                       0x00000002 */
/* #define _CNPDD_CNPDD1_LENGTH                     0x00000001 */

/* #define _CNPDD_CNPDD2_POSITION                   0x00000002 */
/* #define _CNPDD_CNPDD2_MASK                       0x00000004 */
/* #define _CNPDD_CNPDD2_LENGTH                     0x00000001 */

/* #define _CNPDD_CNPDD3_POSITION                   0x00000003 */
/* #define _CNPDD_CNPDD3_MASK                       0x00000008 */
/* #define _CNPDD_CNPDD3_LENGTH                     0x00000001 */

/* #define _CNPDD_CNPDD4_POSITION                   0x00000004 */
/* #define _CNPDD_CNPDD4_MASK                       0x00000010 */
/* #define _CNPDD_CNPDD4_LENGTH                     0x00000001 */

/* #define _CNPDD_CNPDD5_POSITION                   0x00000005 */
/* #define _CNPDD_CNPDD5_MASK                       0x00000020 */
/* #define _CNPDD_CNPDD5_LENGTH                     0x00000001 */

/* #define _CNPDD_CNPDD6_POSITION                   0x00000006 */
/* #define _CNPDD_CNPDD6_MASK                       0x00000040 */
/* #define _CNPDD_CNPDD6_LENGTH                     0x00000001 */

/* #define _CNPDD_CNPDD7_POSITION                   0x00000007 */
/* #define _CNPDD_CNPDD7_MASK                       0x00000080 */
/* #define _CNPDD_CNPDD7_LENGTH                     0x00000001 */

/* #define _CNPDD_CNPDD8_POSITION                   0x00000008 */
/* #define _CNPDD_CNPDD8_MASK                       0x00000100 */
/* #define _CNPDD_CNPDD8_LENGTH                     0x00000001 */

/* #define _CNPDD_CNPDD9_POSITION                   0x00000009 */
/* #define _CNPDD_CNPDD9_MASK                       0x00000200 */
/* #define _CNPDD_CNPDD9_LENGTH                     0x00000001 */

/* #define _CNPDD_CNPDD10_POSITION                  0x0000000A */
/* #define _CNPDD_CNPDD10_MASK                      0x00000400 */
/* #define _CNPDD_CNPDD10_LENGTH                    0x00000001 */

/* #define _CNPDD_CNPDD11_POSITION                  0x0000000B */
/* #define _CNPDD_CNPDD11_MASK                      0x00000800 */
/* #define _CNPDD_CNPDD11_LENGTH                    0x00000001 */

/* #define _CNPDD_w_POSITION                        0x00000000 */
/* #define _CNPDD_w_MASK                            0xFFFFFFFF */
/* #define _CNPDD_w_LENGTH                          0x00000020 */

/* #define _CNCOND_SIDL_POSITION                    0x0000000D */
/* #define _CNCOND_SIDL_MASK                        0x00002000 */
/* #define _CNCOND_SIDL_LENGTH                      0x00000001 */

/* #define _CNCOND_ON_POSITION                      0x0000000F */
/* #define _CNCOND_ON_MASK                          0x00008000 */
/* #define _CNCOND_ON_LENGTH                        0x00000001 */

/* #define _CNCOND_w_POSITION                       0x00000000 */
/* #define _CNCOND_w_MASK                           0xFFFFFFFF */
/* #define _CNCOND_w_LENGTH                         0x00000020 */

/* #define _CNEND_CNIED0_POSITION                   0x00000000 */
/* #define _CNEND_CNIED0_MASK                       0x00000001 */
/* #define _CNEND_CNIED0_LENGTH                     0x00000001 */

/* #define _CNEND_CNIED1_POSITION                   0x00000001 */
/* #define _CNEND_CNIED1_MASK                       0x00000002 */
/* #define _CNEND_CNIED1_LENGTH                     0x00000001 */

/* #define _CNEND_CNIED2_POSITION                   0x00000002 */
/* #define _CNEND_CNIED2_MASK                       0x00000004 */
/* #define _CNEND_CNIED2_LENGTH                     0x00000001 */

/* #define _CNEND_CNIED3_POSITION                   0x00000003 */
/* #define _CNEND_CNIED3_MASK                       0x00000008 */
/* #define _CNEND_CNIED3_LENGTH                     0x00000001 */

/* #define _CNEND_CNIED4_POSITION                   0x00000004 */
/* #define _CNEND_CNIED4_MASK                       0x00000010 */
/* #define _CNEND_CNIED4_LENGTH                     0x00000001 */

/* #define _CNEND_CNIED5_POSITION                   0x00000005 */
/* #define _CNEND_CNIED5_MASK                       0x00000020 */
/* #define _CNEND_CNIED5_LENGTH                     0x00000001 */

/* #define _CNEND_CNIED6_POSITION                   0x00000006 */
/* #define _CNEND_CNIED6_MASK                       0x00000040 */
/* #define _CNEND_CNIED6_LENGTH                     0x00000001 */

/* #define _CNEND_CNIED7_POSITION                   0x00000007 */
/* #define _CNEND_CNIED7_MASK                       0x00000080 */
/* #define _CNEND_CNIED7_LENGTH                     0x00000001 */

/* #define _CNEND_CNIED8_POSITION                   0x00000008 */
/* #define _CNEND_CNIED8_MASK                       0x00000100 */
/* #define _CNEND_CNIED8_LENGTH                     0x00000001 */

/* #define _CNEND_CNIED9_POSITION                   0x00000009 */
/* #define _CNEND_CNIED9_MASK                       0x00000200 */
/* #define _CNEND_CNIED9_LENGTH                     0x00000001 */

/* #define _CNEND_CNIED10_POSITION                  0x0000000A */
/* #define _CNEND_CNIED10_MASK                      0x00000400 */
/* #define _CNEND_CNIED10_LENGTH                    0x00000001 */

/* #define _CNEND_CNIED11_POSITION                  0x0000000B */
/* #define _CNEND_CNIED11_MASK                      0x00000800 */
/* #define _CNEND_CNIED11_LENGTH                    0x00000001 */

/* #define _CNEND_w_POSITION                        0x00000000 */
/* #define _CNEND_w_MASK                            0xFFFFFFFF */
/* #define _CNEND_w_LENGTH                          0x00000020 */

/* #define _CNSTATD_CNSTATD0_POSITION               0x00000000 */
/* #define _CNSTATD_CNSTATD0_MASK                   0x00000001 */
/* #define _CNSTATD_CNSTATD0_LENGTH                 0x00000001 */

/* #define _CNSTATD_CNSTATD1_POSITION               0x00000001 */
/* #define _CNSTATD_CNSTATD1_MASK                   0x00000002 */
/* #define _CNSTATD_CNSTATD1_LENGTH                 0x00000001 */

/* #define _CNSTATD_CNSTATD2_POSITION               0x00000002 */
/* #define _CNSTATD_CNSTATD2_MASK                   0x00000004 */
/* #define _CNSTATD_CNSTATD2_LENGTH                 0x00000001 */

/* #define _CNSTATD_CNSTATD3_POSITION               0x00000003 */
/* #define _CNSTATD_CNSTATD3_MASK                   0x00000008 */
/* #define _CNSTATD_CNSTATD3_LENGTH                 0x00000001 */

/* #define _CNSTATD_CNSTATD4_POSITION               0x00000004 */
/* #define _CNSTATD_CNSTATD4_MASK                   0x00000010 */
/* #define _CNSTATD_CNSTATD4_LENGTH                 0x00000001 */

/* #define _CNSTATD_CNSTATD5_POSITION               0x00000005 */
/* #define _CNSTATD_CNSTATD5_MASK                   0x00000020 */
/* #define _CNSTATD_CNSTATD5_LENGTH                 0x00000001 */

/* #define _CNSTATD_CNSTATD6_POSITION               0x00000006 */
/* #define _CNSTATD_CNSTATD6_MASK                   0x00000040 */
/* #define _CNSTATD_CNSTATD6_LENGTH                 0x00000001 */

/* #define _CNSTATD_CNSTATD7_POSITION               0x00000007 */
/* #define _CNSTATD_CNSTATD7_MASK                   0x00000080 */
/* #define _CNSTATD_CNSTATD7_LENGTH                 0x00000001 */

/* #define _CNSTATD_CNSTATD8_POSITION               0x00000008 */
/* #define _CNSTATD_CNSTATD8_MASK                   0x00000100 */
/* #define _CNSTATD_CNSTATD8_LENGTH                 0x00000001 */

/* #define _CNSTATD_CNSTATD9_POSITION               0x00000009 */
/* #define _CNSTATD_CNSTATD9_MASK                   0x00000200 */
/* #define _CNSTATD_CNSTATD9_LENGTH                 0x00000001 */

/* #define _CNSTATD_CNSTATD10_POSITION              0x0000000A */
/* #define _CNSTATD_CNSTATD10_MASK                  0x00000400 */
/* #define _CNSTATD_CNSTATD10_LENGTH                0x00000001 */

/* #define _CNSTATD_CNSTATD11_POSITION              0x0000000B */
/* #define _CNSTATD_CNSTATD11_MASK                  0x00000800 */
/* #define _CNSTATD_CNSTATD11_LENGTH                0x00000001 */

/* #define _CNSTATD_w_POSITION                      0x00000000 */
/* #define _CNSTATD_w_MASK                          0xFFFFFFFF */
/* #define _CNSTATD_w_LENGTH                        0x00000020 */

/* #define _ANSELE_ANSE2_POSITION                   0x00000002 */
/* #define _ANSELE_ANSE2_MASK                       0x00000004 */
/* #define _ANSELE_ANSE2_LENGTH                     0x00000001 */

/* #define _ANSELE_ANSE4_POSITION                   0x00000004 */
/* #define _ANSELE_ANSE4_MASK                       0x00000010 */
/* #define _ANSELE_ANSE4_LENGTH                     0x00000001 */

/* #define _ANSELE_ANSE5_POSITION                   0x00000005 */
/* #define _ANSELE_ANSE5_MASK                       0x00000020 */
/* #define _ANSELE_ANSE5_LENGTH                     0x00000001 */

/* #define _ANSELE_ANSE6_POSITION                   0x00000006 */
/* #define _ANSELE_ANSE6_MASK                       0x00000040 */
/* #define _ANSELE_ANSE6_LENGTH                     0x00000001 */

/* #define _ANSELE_ANSE7_POSITION                   0x00000007 */
/* #define _ANSELE_ANSE7_MASK                       0x00000080 */
/* #define _ANSELE_ANSE7_LENGTH                     0x00000001 */

/* #define _ANSELE_w_POSITION                       0x00000000 */
/* #define _ANSELE_w_MASK                           0xFFFFFFFF */
/* #define _ANSELE_w_LENGTH                         0x00000020 */

/* #define _TRISE_TRISE0_POSITION                   0x00000000 */
/* #define _TRISE_TRISE0_MASK                       0x00000001 */
/* #define _TRISE_TRISE0_LENGTH                     0x00000001 */

/* #define _TRISE_TRISE1_POSITION                   0x00000001 */
/* #define _TRISE_TRISE1_MASK                       0x00000002 */
/* #define _TRISE_TRISE1_LENGTH                     0x00000001 */

/* #define _TRISE_TRISE2_POSITION                   0x00000002 */
/* #define _TRISE_TRISE2_MASK                       0x00000004 */
/* #define _TRISE_TRISE2_LENGTH                     0x00000001 */

/* #define _TRISE_TRISE3_POSITION                   0x00000003 */
/* #define _TRISE_TRISE3_MASK                       0x00000008 */
/* #define _TRISE_TRISE3_LENGTH                     0x00000001 */

/* #define _TRISE_TRISE4_POSITION                   0x00000004 */
/* #define _TRISE_TRISE4_MASK                       0x00000010 */
/* #define _TRISE_TRISE4_LENGTH                     0x00000001 */

/* #define _TRISE_TRISE5_POSITION                   0x00000005 */
/* #define _TRISE_TRISE5_MASK                       0x00000020 */
/* #define _TRISE_TRISE5_LENGTH                     0x00000001 */

/* #define _TRISE_TRISE6_POSITION                   0x00000006 */
/* #define _TRISE_TRISE6_MASK                       0x00000040 */
/* #define _TRISE_TRISE6_LENGTH                     0x00000001 */

/* #define _TRISE_TRISE7_POSITION                   0x00000007 */
/* #define _TRISE_TRISE7_MASK                       0x00000080 */
/* #define _TRISE_TRISE7_LENGTH                     0x00000001 */

/* #define _TRISE_w_POSITION                        0x00000000 */
/* #define _TRISE_w_MASK                            0xFFFFFFFF */
/* #define _TRISE_w_LENGTH                          0x00000020 */

/* #define _PORTE_RE0_POSITION                      0x00000000 */
/* #define _PORTE_RE0_MASK                          0x00000001 */
/* #define _PORTE_RE0_LENGTH                        0x00000001 */

/* #define _PORTE_RE1_POSITION                      0x00000001 */
/* #define _PORTE_RE1_MASK                          0x00000002 */
/* #define _PORTE_RE1_LENGTH                        0x00000001 */

/* #define _PORTE_RE2_POSITION                      0x00000002 */
/* #define _PORTE_RE2_MASK                          0x00000004 */
/* #define _PORTE_RE2_LENGTH                        0x00000001 */

/* #define _PORTE_RE3_POSITION                      0x00000003 */
/* #define _PORTE_RE3_MASK                          0x00000008 */
/* #define _PORTE_RE3_LENGTH                        0x00000001 */

/* #define _PORTE_RE4_POSITION                      0x00000004 */
/* #define _PORTE_RE4_MASK                          0x00000010 */
/* #define _PORTE_RE4_LENGTH                        0x00000001 */

/* #define _PORTE_RE5_POSITION                      0x00000005 */
/* #define _PORTE_RE5_MASK                          0x00000020 */
/* #define _PORTE_RE5_LENGTH                        0x00000001 */

/* #define _PORTE_RE6_POSITION                      0x00000006 */
/* #define _PORTE_RE6_MASK                          0x00000040 */
/* #define _PORTE_RE6_LENGTH                        0x00000001 */

/* #define _PORTE_RE7_POSITION                      0x00000007 */
/* #define _PORTE_RE7_MASK                          0x00000080 */
/* #define _PORTE_RE7_LENGTH                        0x00000001 */

/* #define _PORTE_w_POSITION                        0x00000000 */
/* #define _PORTE_w_MASK                            0xFFFFFFFF */
/* #define _PORTE_w_LENGTH                          0x00000020 */

/* #define _LATE_LATE0_POSITION                     0x00000000 */
/* #define _LATE_LATE0_MASK                         0x00000001 */
/* #define _LATE_LATE0_LENGTH                       0x00000001 */

/* #define _LATE_LATE1_POSITION                     0x00000001 */
/* #define _LATE_LATE1_MASK                         0x00000002 */
/* #define _LATE_LATE1_LENGTH                       0x00000001 */

/* #define _LATE_LATE2_POSITION                     0x00000002 */
/* #define _LATE_LATE2_MASK                         0x00000004 */
/* #define _LATE_LATE2_LENGTH                       0x00000001 */

/* #define _LATE_LATE3_POSITION                     0x00000003 */
/* #define _LATE_LATE3_MASK                         0x00000008 */
/* #define _LATE_LATE3_LENGTH                       0x00000001 */

/* #define _LATE_LATE4_POSITION                     0x00000004 */
/* #define _LATE_LATE4_MASK                         0x00000010 */
/* #define _LATE_LATE4_LENGTH                       0x00000001 */

/* #define _LATE_LATE5_POSITION                     0x00000005 */
/* #define _LATE_LATE5_MASK                         0x00000020 */
/* #define _LATE_LATE5_LENGTH                       0x00000001 */

/* #define _LATE_LATE6_POSITION                     0x00000006 */
/* #define _LATE_LATE6_MASK                         0x00000040 */
/* #define _LATE_LATE6_LENGTH                       0x00000001 */

/* #define _LATE_LATE7_POSITION                     0x00000007 */
/* #define _LATE_LATE7_MASK                         0x00000080 */
/* #define _LATE_LATE7_LENGTH                       0x00000001 */

/* #define _LATE_w_POSITION                         0x00000000 */
/* #define _LATE_w_MASK                             0xFFFFFFFF */
/* #define _LATE_w_LENGTH                           0x00000020 */

/* #define _ODCE_ODCE0_POSITION                     0x00000000 */
/* #define _ODCE_ODCE0_MASK                         0x00000001 */
/* #define _ODCE_ODCE0_LENGTH                       0x00000001 */

/* #define _ODCE_ODCE1_POSITION                     0x00000001 */
/* #define _ODCE_ODCE1_MASK                         0x00000002 */
/* #define _ODCE_ODCE1_LENGTH                       0x00000001 */

/* #define _ODCE_ODCE2_POSITION                     0x00000002 */
/* #define _ODCE_ODCE2_MASK                         0x00000004 */
/* #define _ODCE_ODCE2_LENGTH                       0x00000001 */

/* #define _ODCE_ODCE3_POSITION                     0x00000003 */
/* #define _ODCE_ODCE3_MASK                         0x00000008 */
/* #define _ODCE_ODCE3_LENGTH                       0x00000001 */

/* #define _ODCE_ODCE4_POSITION                     0x00000004 */
/* #define _ODCE_ODCE4_MASK                         0x00000010 */
/* #define _ODCE_ODCE4_LENGTH                       0x00000001 */

/* #define _ODCE_ODCE5_POSITION                     0x00000005 */
/* #define _ODCE_ODCE5_MASK                         0x00000020 */
/* #define _ODCE_ODCE5_LENGTH                       0x00000001 */

/* #define _ODCE_ODCE6_POSITION                     0x00000006 */
/* #define _ODCE_ODCE6_MASK                         0x00000040 */
/* #define _ODCE_ODCE6_LENGTH                       0x00000001 */

/* #define _ODCE_ODCE7_POSITION                     0x00000007 */
/* #define _ODCE_ODCE7_MASK                         0x00000080 */
/* #define _ODCE_ODCE7_LENGTH                       0x00000001 */

/* #define _ODCE_w_POSITION                         0x00000000 */
/* #define _ODCE_w_MASK                             0xFFFFFFFF */
/* #define _ODCE_w_LENGTH                           0x00000020 */

/* #define _CNPUE_CNPUE0_POSITION                   0x00000000 */
/* #define _CNPUE_CNPUE0_MASK                       0x00000001 */
/* #define _CNPUE_CNPUE0_LENGTH                     0x00000001 */

/* #define _CNPUE_CNPUE1_POSITION                   0x00000001 */
/* #define _CNPUE_CNPUE1_MASK                       0x00000002 */
/* #define _CNPUE_CNPUE1_LENGTH                     0x00000001 */

/* #define _CNPUE_CNPUE2_POSITION                   0x00000002 */
/* #define _CNPUE_CNPUE2_MASK                       0x00000004 */
/* #define _CNPUE_CNPUE2_LENGTH                     0x00000001 */

/* #define _CNPUE_CNPUE3_POSITION                   0x00000003 */
/* #define _CNPUE_CNPUE3_MASK                       0x00000008 */
/* #define _CNPUE_CNPUE3_LENGTH                     0x00000001 */

/* #define _CNPUE_CNPUE4_POSITION                   0x00000004 */
/* #define _CNPUE_CNPUE4_MASK                       0x00000010 */
/* #define _CNPUE_CNPUE4_LENGTH                     0x00000001 */

/* #define _CNPUE_CNPUE5_POSITION                   0x00000005 */
/* #define _CNPUE_CNPUE5_MASK                       0x00000020 */
/* #define _CNPUE_CNPUE5_LENGTH                     0x00000001 */

/* #define _CNPUE_CNPUE6_POSITION                   0x00000006 */
/* #define _CNPUE_CNPUE6_MASK                       0x00000040 */
/* #define _CNPUE_CNPUE6_LENGTH                     0x00000001 */

/* #define _CNPUE_CNPUE7_POSITION                   0x00000007 */
/* #define _CNPUE_CNPUE7_MASK                       0x00000080 */
/* #define _CNPUE_CNPUE7_LENGTH                     0x00000001 */

/* #define _CNPUE_w_POSITION                        0x00000000 */
/* #define _CNPUE_w_MASK                            0xFFFFFFFF */
/* #define _CNPUE_w_LENGTH                          0x00000020 */

/* #define _CNPDE_CNPDE0_POSITION                   0x00000000 */
/* #define _CNPDE_CNPDE0_MASK                       0x00000001 */
/* #define _CNPDE_CNPDE0_LENGTH                     0x00000001 */

/* #define _CNPDE_CNPDE1_POSITION                   0x00000001 */
/* #define _CNPDE_CNPDE1_MASK                       0x00000002 */
/* #define _CNPDE_CNPDE1_LENGTH                     0x00000001 */

/* #define _CNPDE_CNPDE2_POSITION                   0x00000002 */
/* #define _CNPDE_CNPDE2_MASK                       0x00000004 */
/* #define _CNPDE_CNPDE2_LENGTH                     0x00000001 */

/* #define _CNPDE_CNPDE3_POSITION                   0x00000003 */
/* #define _CNPDE_CNPDE3_MASK                       0x00000008 */
/* #define _CNPDE_CNPDE3_LENGTH                     0x00000001 */

/* #define _CNPDE_CNPDE4_POSITION                   0x00000004 */
/* #define _CNPDE_CNPDE4_MASK                       0x00000010 */
/* #define _CNPDE_CNPDE4_LENGTH                     0x00000001 */

/* #define _CNPDE_CNPDE5_POSITION                   0x00000005 */
/* #define _CNPDE_CNPDE5_MASK                       0x00000020 */
/* #define _CNPDE_CNPDE5_LENGTH                     0x00000001 */

/* #define _CNPDE_CNPDE6_POSITION                   0x00000006 */
/* #define _CNPDE_CNPDE6_MASK                       0x00000040 */
/* #define _CNPDE_CNPDE6_LENGTH                     0x00000001 */

/* #define _CNPDE_CNPDE7_POSITION                   0x00000007 */
/* #define _CNPDE_CNPDE7_MASK                       0x00000080 */
/* #define _CNPDE_CNPDE7_LENGTH                     0x00000001 */

/* #define _CNPDE_w_POSITION                        0x00000000 */
/* #define _CNPDE_w_MASK                            0xFFFFFFFF */
/* #define _CNPDE_w_LENGTH                          0x00000020 */

/* #define _CNCONE_SIDL_POSITION                    0x0000000D */
/* #define _CNCONE_SIDL_MASK                        0x00002000 */
/* #define _CNCONE_SIDL_LENGTH                      0x00000001 */

/* #define _CNCONE_ON_POSITION                      0x0000000F */
/* #define _CNCONE_ON_MASK                          0x00008000 */
/* #define _CNCONE_ON_LENGTH                        0x00000001 */

/* #define _CNCONE_w_POSITION                       0x00000000 */
/* #define _CNCONE_w_MASK                           0xFFFFFFFF */
/* #define _CNCONE_w_LENGTH                         0x00000020 */

/* #define _CNENE_CNIEE0_POSITION                   0x00000000 */
/* #define _CNENE_CNIEE0_MASK                       0x00000001 */
/* #define _CNENE_CNIEE0_LENGTH                     0x00000001 */

/* #define _CNENE_CNIEE1_POSITION                   0x00000001 */
/* #define _CNENE_CNIEE1_MASK                       0x00000002 */
/* #define _CNENE_CNIEE1_LENGTH                     0x00000001 */

/* #define _CNENE_CNIEE2_POSITION                   0x00000002 */
/* #define _CNENE_CNIEE2_MASK                       0x00000004 */
/* #define _CNENE_CNIEE2_LENGTH                     0x00000001 */

/* #define _CNENE_CNIEE3_POSITION                   0x00000003 */
/* #define _CNENE_CNIEE3_MASK                       0x00000008 */
/* #define _CNENE_CNIEE3_LENGTH                     0x00000001 */

/* #define _CNENE_CNIEE4_POSITION                   0x00000004 */
/* #define _CNENE_CNIEE4_MASK                       0x00000010 */
/* #define _CNENE_CNIEE4_LENGTH                     0x00000001 */

/* #define _CNENE_CNIEE5_POSITION                   0x00000005 */
/* #define _CNENE_CNIEE5_MASK                       0x00000020 */
/* #define _CNENE_CNIEE5_LENGTH                     0x00000001 */

/* #define _CNENE_CNIEE6_POSITION                   0x00000006 */
/* #define _CNENE_CNIEE6_MASK                       0x00000040 */
/* #define _CNENE_CNIEE6_LENGTH                     0x00000001 */

/* #define _CNENE_CNIEE7_POSITION                   0x00000007 */
/* #define _CNENE_CNIEE7_MASK                       0x00000080 */
/* #define _CNENE_CNIEE7_LENGTH                     0x00000001 */

/* #define _CNENE_w_POSITION                        0x00000000 */
/* #define _CNENE_w_MASK                            0xFFFFFFFF */
/* #define _CNENE_w_LENGTH                          0x00000020 */

/* #define _CNSTATE_CNSTATE0_POSITION               0x00000000 */
/* #define _CNSTATE_CNSTATE0_MASK                   0x00000001 */
/* #define _CNSTATE_CNSTATE0_LENGTH                 0x00000001 */

/* #define _CNSTATE_CNSTATE1_POSITION               0x00000001 */
/* #define _CNSTATE_CNSTATE1_MASK                   0x00000002 */
/* #define _CNSTATE_CNSTATE1_LENGTH                 0x00000001 */

/* #define _CNSTATE_CNSTATE2_POSITION               0x00000002 */
/* #define _CNSTATE_CNSTATE2_MASK                   0x00000004 */
/* #define _CNSTATE_CNSTATE2_LENGTH                 0x00000001 */

/* #define _CNSTATE_CNSTATE3_POSITION               0x00000003 */
/* #define _CNSTATE_CNSTATE3_MASK                   0x00000008 */
/* #define _CNSTATE_CNSTATE3_LENGTH                 0x00000001 */

/* #define _CNSTATE_CNSTATE4_POSITION               0x00000004 */
/* #define _CNSTATE_CNSTATE4_MASK                   0x00000010 */
/* #define _CNSTATE_CNSTATE4_LENGTH                 0x00000001 */

/* #define _CNSTATE_CNSTATE5_POSITION               0x00000005 */
/* #define _CNSTATE_CNSTATE5_MASK                   0x00000020 */
/* #define _CNSTATE_CNSTATE5_LENGTH                 0x00000001 */

/* #define _CNSTATE_CNSTATE6_POSITION               0x00000006 */
/* #define _CNSTATE_CNSTATE6_MASK                   0x00000040 */
/* #define _CNSTATE_CNSTATE6_LENGTH                 0x00000001 */

/* #define _CNSTATE_CNSTATE7_POSITION               0x00000007 */
/* #define _CNSTATE_CNSTATE7_MASK                   0x00000080 */
/* #define _CNSTATE_CNSTATE7_LENGTH                 0x00000001 */

/* #define _CNSTATE_w_POSITION                      0x00000000 */
/* #define _CNSTATE_w_MASK                          0xFFFFFFFF */
/* #define _CNSTATE_w_LENGTH                        0x00000020 */

/* #define _ANSELF_w_POSITION                       0x00000000 */
/* #define _ANSELF_w_MASK                           0xFFFFFFFF */
/* #define _ANSELF_w_LENGTH                         0x00000020 */

/* #define _TRISF_TRISF0_POSITION                   0x00000000 */
/* #define _TRISF_TRISF0_MASK                       0x00000001 */
/* #define _TRISF_TRISF0_LENGTH                     0x00000001 */

/* #define _TRISF_TRISF1_POSITION                   0x00000001 */
/* #define _TRISF_TRISF1_MASK                       0x00000002 */
/* #define _TRISF_TRISF1_LENGTH                     0x00000001 */

/* #define _TRISF_TRISF3_POSITION                   0x00000003 */
/* #define _TRISF_TRISF3_MASK                       0x00000008 */
/* #define _TRISF_TRISF3_LENGTH                     0x00000001 */

/* #define _TRISF_TRISF4_POSITION                   0x00000004 */
/* #define _TRISF_TRISF4_MASK                       0x00000010 */
/* #define _TRISF_TRISF4_LENGTH                     0x00000001 */

/* #define _TRISF_TRISF5_POSITION                   0x00000005 */
/* #define _TRISF_TRISF5_MASK                       0x00000020 */
/* #define _TRISF_TRISF5_LENGTH                     0x00000001 */

/* #define _TRISF_w_POSITION                        0x00000000 */
/* #define _TRISF_w_MASK                            0xFFFFFFFF */
/* #define _TRISF_w_LENGTH                          0x00000020 */

/* #define _PORTF_RF0_POSITION                      0x00000000 */
/* #define _PORTF_RF0_MASK                          0x00000001 */
/* #define _PORTF_RF0_LENGTH                        0x00000001 */

/* #define _PORTF_RF1_POSITION                      0x00000001 */
/* #define _PORTF_RF1_MASK                          0x00000002 */
/* #define _PORTF_RF1_LENGTH                        0x00000001 */

/* #define _PORTF_RF3_POSITION                      0x00000003 */
/* #define _PORTF_RF3_MASK                          0x00000008 */
/* #define _PORTF_RF3_LENGTH                        0x00000001 */

/* #define _PORTF_RF4_POSITION                      0x00000004 */
/* #define _PORTF_RF4_MASK                          0x00000010 */
/* #define _PORTF_RF4_LENGTH                        0x00000001 */

/* #define _PORTF_RF5_POSITION                      0x00000005 */
/* #define _PORTF_RF5_MASK                          0x00000020 */
/* #define _PORTF_RF5_LENGTH                        0x00000001 */

/* #define _PORTF_w_POSITION                        0x00000000 */
/* #define _PORTF_w_MASK                            0xFFFFFFFF */
/* #define _PORTF_w_LENGTH                          0x00000020 */

/* #define _LATF_LATF0_POSITION                     0x00000000 */
/* #define _LATF_LATF0_MASK                         0x00000001 */
/* #define _LATF_LATF0_LENGTH                       0x00000001 */

/* #define _LATF_LATF1_POSITION                     0x00000001 */
/* #define _LATF_LATF1_MASK                         0x00000002 */
/* #define _LATF_LATF1_LENGTH                       0x00000001 */

/* #define _LATF_LATF3_POSITION                     0x00000003 */
/* #define _LATF_LATF3_MASK                         0x00000008 */
/* #define _LATF_LATF3_LENGTH                       0x00000001 */

/* #define _LATF_LATF4_POSITION                     0x00000004 */
/* #define _LATF_LATF4_MASK                         0x00000010 */
/* #define _LATF_LATF4_LENGTH                       0x00000001 */

/* #define _LATF_LATF5_POSITION                     0x00000005 */
/* #define _LATF_LATF5_MASK                         0x00000020 */
/* #define _LATF_LATF5_LENGTH                       0x00000001 */

/* #define _LATF_w_POSITION                         0x00000000 */
/* #define _LATF_w_MASK                             0xFFFFFFFF */
/* #define _LATF_w_LENGTH                           0x00000020 */

/* #define _ODCF_ODCF0_POSITION                     0x00000000 */
/* #define _ODCF_ODCF0_MASK                         0x00000001 */
/* #define _ODCF_ODCF0_LENGTH                       0x00000001 */

/* #define _ODCF_ODCF1_POSITION                     0x00000001 */
/* #define _ODCF_ODCF1_MASK                         0x00000002 */
/* #define _ODCF_ODCF1_LENGTH                       0x00000001 */

/* #define _ODCF_ODCF3_POSITION                     0x00000003 */
/* #define _ODCF_ODCF3_MASK                         0x00000008 */
/* #define _ODCF_ODCF3_LENGTH                       0x00000001 */

/* #define _ODCF_ODCF4_POSITION                     0x00000004 */
/* #define _ODCF_ODCF4_MASK                         0x00000010 */
/* #define _ODCF_ODCF4_LENGTH                       0x00000001 */

/* #define _ODCF_ODCF5_POSITION                     0x00000005 */
/* #define _ODCF_ODCF5_MASK                         0x00000020 */
/* #define _ODCF_ODCF5_LENGTH                       0x00000001 */

/* #define _ODCF_w_POSITION                         0x00000000 */
/* #define _ODCF_w_MASK                             0xFFFFFFFF */
/* #define _ODCF_w_LENGTH                           0x00000020 */

/* #define _CNPUF_CNPUF0_POSITION                   0x00000000 */
/* #define _CNPUF_CNPUF0_MASK                       0x00000001 */
/* #define _CNPUF_CNPUF0_LENGTH                     0x00000001 */

/* #define _CNPUF_CNPUF1_POSITION                   0x00000001 */
/* #define _CNPUF_CNPUF1_MASK                       0x00000002 */
/* #define _CNPUF_CNPUF1_LENGTH                     0x00000001 */

/* #define _CNPUF_CNPUF3_POSITION                   0x00000003 */
/* #define _CNPUF_CNPUF3_MASK                       0x00000008 */
/* #define _CNPUF_CNPUF3_LENGTH                     0x00000001 */

/* #define _CNPUF_CNPUF4_POSITION                   0x00000004 */
/* #define _CNPUF_CNPUF4_MASK                       0x00000010 */
/* #define _CNPUF_CNPUF4_LENGTH                     0x00000001 */

/* #define _CNPUF_CNPUF5_POSITION                   0x00000005 */
/* #define _CNPUF_CNPUF5_MASK                       0x00000020 */
/* #define _CNPUF_CNPUF5_LENGTH                     0x00000001 */

/* #define _CNPUF_w_POSITION                        0x00000000 */
/* #define _CNPUF_w_MASK                            0xFFFFFFFF */
/* #define _CNPUF_w_LENGTH                          0x00000020 */

/* #define _CNPDF_CNPDF0_POSITION                   0x00000000 */
/* #define _CNPDF_CNPDF0_MASK                       0x00000001 */
/* #define _CNPDF_CNPDF0_LENGTH                     0x00000001 */

/* #define _CNPDF_CNPDF1_POSITION                   0x00000001 */
/* #define _CNPDF_CNPDF1_MASK                       0x00000002 */
/* #define _CNPDF_CNPDF1_LENGTH                     0x00000001 */

/* #define _CNPDF_CNPDF3_POSITION                   0x00000003 */
/* #define _CNPDF_CNPDF3_MASK                       0x00000008 */
/* #define _CNPDF_CNPDF3_LENGTH                     0x00000001 */

/* #define _CNPDF_CNPDF4_POSITION                   0x00000004 */
/* #define _CNPDF_CNPDF4_MASK                       0x00000010 */
/* #define _CNPDF_CNPDF4_LENGTH                     0x00000001 */

/* #define _CNPDF_CNPDF5_POSITION                   0x00000005 */
/* #define _CNPDF_CNPDF5_MASK                       0x00000020 */
/* #define _CNPDF_CNPDF5_LENGTH                     0x00000001 */

/* #define _CNPDF_w_POSITION                        0x00000000 */
/* #define _CNPDF_w_MASK                            0xFFFFFFFF */
/* #define _CNPDF_w_LENGTH                          0x00000020 */

/* #define _CNCONF_SIDL_POSITION                    0x0000000D */
/* #define _CNCONF_SIDL_MASK                        0x00002000 */
/* #define _CNCONF_SIDL_LENGTH                      0x00000001 */

/* #define _CNCONF_ON_POSITION                      0x0000000F */
/* #define _CNCONF_ON_MASK                          0x00008000 */
/* #define _CNCONF_ON_LENGTH                        0x00000001 */

/* #define _CNCONF_w_POSITION                       0x00000000 */
/* #define _CNCONF_w_MASK                           0xFFFFFFFF */
/* #define _CNCONF_w_LENGTH                         0x00000020 */

/* #define _CNENF_CNIEF0_POSITION                   0x00000000 */
/* #define _CNENF_CNIEF0_MASK                       0x00000001 */
/* #define _CNENF_CNIEF0_LENGTH                     0x00000001 */

/* #define _CNENF_CNIEF1_POSITION                   0x00000001 */
/* #define _CNENF_CNIEF1_MASK                       0x00000002 */
/* #define _CNENF_CNIEF1_LENGTH                     0x00000001 */

/* #define _CNENF_CNIEF3_POSITION                   0x00000003 */
/* #define _CNENF_CNIEF3_MASK                       0x00000008 */
/* #define _CNENF_CNIEF3_LENGTH                     0x00000001 */

/* #define _CNENF_CNIEF4_POSITION                   0x00000004 */
/* #define _CNENF_CNIEF4_MASK                       0x00000010 */
/* #define _CNENF_CNIEF4_LENGTH                     0x00000001 */

/* #define _CNENF_CNIEF5_POSITION                   0x00000005 */
/* #define _CNENF_CNIEF5_MASK                       0x00000020 */
/* #define _CNENF_CNIEF5_LENGTH                     0x00000001 */

/* #define _CNENF_w_POSITION                        0x00000000 */
/* #define _CNENF_w_MASK                            0xFFFFFFFF */
/* #define _CNENF_w_LENGTH                          0x00000020 */

/* #define _CNSTATF_CNSTATF0_POSITION               0x00000000 */
/* #define _CNSTATF_CNSTATF0_MASK                   0x00000001 */
/* #define _CNSTATF_CNSTATF0_LENGTH                 0x00000001 */

/* #define _CNSTATF_CNSTATF1_POSITION               0x00000001 */
/* #define _CNSTATF_CNSTATF1_MASK                   0x00000002 */
/* #define _CNSTATF_CNSTATF1_LENGTH                 0x00000001 */

/* #define _CNSTATF_CNSTATF3_POSITION               0x00000003 */
/* #define _CNSTATF_CNSTATF3_MASK                   0x00000008 */
/* #define _CNSTATF_CNSTATF3_LENGTH                 0x00000001 */

/* #define _CNSTATF_CNSTATF4_POSITION               0x00000004 */
/* #define _CNSTATF_CNSTATF4_MASK                   0x00000010 */
/* #define _CNSTATF_CNSTATF4_LENGTH                 0x00000001 */

/* #define _CNSTATF_CNSTATF5_POSITION               0x00000005 */
/* #define _CNSTATF_CNSTATF5_MASK                   0x00000020 */
/* #define _CNSTATF_CNSTATF5_LENGTH                 0x00000001 */

/* #define _CNSTATF_w_POSITION                      0x00000000 */
/* #define _CNSTATF_w_MASK                          0xFFFFFFFF */
/* #define _CNSTATF_w_LENGTH                        0x00000020 */

/* #define _ANSELG_ANSG6_POSITION                   0x00000006 */
/* #define _ANSELG_ANSG6_MASK                       0x00000040 */
/* #define _ANSELG_ANSG6_LENGTH                     0x00000001 */

/* #define _ANSELG_ANSG7_POSITION                   0x00000007 */
/* #define _ANSELG_ANSG7_MASK                       0x00000080 */
/* #define _ANSELG_ANSG7_LENGTH                     0x00000001 */

/* #define _ANSELG_ANSG8_POSITION                   0x00000008 */
/* #define _ANSELG_ANSG8_MASK                       0x00000100 */
/* #define _ANSELG_ANSG8_LENGTH                     0x00000001 */

/* #define _ANSELG_ANSG9_POSITION                   0x00000009 */
/* #define _ANSELG_ANSG9_MASK                       0x00000200 */
/* #define _ANSELG_ANSG9_LENGTH                     0x00000001 */

/* #define _ANSELG_w_POSITION                       0x00000000 */
/* #define _ANSELG_w_MASK                           0xFFFFFFFF */
/* #define _ANSELG_w_LENGTH                         0x00000020 */

/* #define _TRISG_TRISG2_POSITION                   0x00000002 */
/* #define _TRISG_TRISG2_MASK                       0x00000004 */
/* #define _TRISG_TRISG2_LENGTH                     0x00000001 */

/* #define _TRISG_TRISG3_POSITION                   0x00000003 */
/* #define _TRISG_TRISG3_MASK                       0x00000008 */
/* #define _TRISG_TRISG3_LENGTH                     0x00000001 */

/* #define _TRISG_TRISG6_POSITION                   0x00000006 */
/* #define _TRISG_TRISG6_MASK                       0x00000040 */
/* #define _TRISG_TRISG6_LENGTH                     0x00000001 */

/* #define _TRISG_TRISG7_POSITION                   0x00000007 */
/* #define _TRISG_TRISG7_MASK                       0x00000080 */
/* #define _TRISG_TRISG7_LENGTH                     0x00000001 */

/* #define _TRISG_TRISG8_POSITION                   0x00000008 */
/* #define _TRISG_TRISG8_MASK                       0x00000100 */
/* #define _TRISG_TRISG8_LENGTH                     0x00000001 */

/* #define _TRISG_TRISG9_POSITION                   0x00000009 */
/* #define _TRISG_TRISG9_MASK                       0x00000200 */
/* #define _TRISG_TRISG9_LENGTH                     0x00000001 */

/* #define _TRISG_w_POSITION                        0x00000000 */
/* #define _TRISG_w_MASK                            0xFFFFFFFF */
/* #define _TRISG_w_LENGTH                          0x00000020 */

/* #define _PORTG_RG2_POSITION                      0x00000002 */
/* #define _PORTG_RG2_MASK                          0x00000004 */
/* #define _PORTG_RG2_LENGTH                        0x00000001 */

/* #define _PORTG_RG3_POSITION                      0x00000003 */
/* #define _PORTG_RG3_MASK                          0x00000008 */
/* #define _PORTG_RG3_LENGTH                        0x00000001 */

/* #define _PORTG_RG6_POSITION                      0x00000006 */
/* #define _PORTG_RG6_MASK                          0x00000040 */
/* #define _PORTG_RG6_LENGTH                        0x00000001 */

/* #define _PORTG_RG7_POSITION                      0x00000007 */
/* #define _PORTG_RG7_MASK                          0x00000080 */
/* #define _PORTG_RG7_LENGTH                        0x00000001 */

/* #define _PORTG_RG8_POSITION                      0x00000008 */
/* #define _PORTG_RG8_MASK                          0x00000100 */
/* #define _PORTG_RG8_LENGTH                        0x00000001 */

/* #define _PORTG_RG9_POSITION                      0x00000009 */
/* #define _PORTG_RG9_MASK                          0x00000200 */
/* #define _PORTG_RG9_LENGTH                        0x00000001 */

/* #define _PORTG_w_POSITION                        0x00000000 */
/* #define _PORTG_w_MASK                            0xFFFFFFFF */
/* #define _PORTG_w_LENGTH                          0x00000020 */

/* #define _LATG_LATG2_POSITION                     0x00000002 */
/* #define _LATG_LATG2_MASK                         0x00000004 */
/* #define _LATG_LATG2_LENGTH                       0x00000001 */

/* #define _LATG_LATG3_POSITION                     0x00000003 */
/* #define _LATG_LATG3_MASK                         0x00000008 */
/* #define _LATG_LATG3_LENGTH                       0x00000001 */

/* #define _LATG_LATG6_POSITION                     0x00000006 */
/* #define _LATG_LATG6_MASK                         0x00000040 */
/* #define _LATG_LATG6_LENGTH                       0x00000001 */

/* #define _LATG_LATG7_POSITION                     0x00000007 */
/* #define _LATG_LATG7_MASK                         0x00000080 */
/* #define _LATG_LATG7_LENGTH                       0x00000001 */

/* #define _LATG_LATG8_POSITION                     0x00000008 */
/* #define _LATG_LATG8_MASK                         0x00000100 */
/* #define _LATG_LATG8_LENGTH                       0x00000001 */

/* #define _LATG_LATG9_POSITION                     0x00000009 */
/* #define _LATG_LATG9_MASK                         0x00000200 */
/* #define _LATG_LATG9_LENGTH                       0x00000001 */

/* #define _LATG_w_POSITION                         0x00000000 */
/* #define _LATG_w_MASK                             0xFFFFFFFF */
/* #define _LATG_w_LENGTH                           0x00000020 */

/* #define _ODCG_ODCG2_POSITION                     0x00000002 */
/* #define _ODCG_ODCG2_MASK                         0x00000004 */
/* #define _ODCG_ODCG2_LENGTH                       0x00000001 */

/* #define _ODCG_ODCG3_POSITION                     0x00000003 */
/* #define _ODCG_ODCG3_MASK                         0x00000008 */
/* #define _ODCG_ODCG3_LENGTH                       0x00000001 */

/* #define _ODCG_ODCG6_POSITION                     0x00000006 */
/* #define _ODCG_ODCG6_MASK                         0x00000040 */
/* #define _ODCG_ODCG6_LENGTH                       0x00000001 */

/* #define _ODCG_ODCG7_POSITION                     0x00000007 */
/* #define _ODCG_ODCG7_MASK                         0x00000080 */
/* #define _ODCG_ODCG7_LENGTH                       0x00000001 */

/* #define _ODCG_ODCG8_POSITION                     0x00000008 */
/* #define _ODCG_ODCG8_MASK                         0x00000100 */
/* #define _ODCG_ODCG8_LENGTH                       0x00000001 */

/* #define _ODCG_ODCG9_POSITION                     0x00000009 */
/* #define _ODCG_ODCG9_MASK                         0x00000200 */
/* #define _ODCG_ODCG9_LENGTH                       0x00000001 */

/* #define _ODCG_w_POSITION                         0x00000000 */
/* #define _ODCG_w_MASK                             0xFFFFFFFF */
/* #define _ODCG_w_LENGTH                           0x00000020 */

/* #define _CNPUG_CNPUG2_POSITION                   0x00000002 */
/* #define _CNPUG_CNPUG2_MASK                       0x00000004 */
/* #define _CNPUG_CNPUG2_LENGTH                     0x00000001 */

/* #define _CNPUG_CNPUG3_POSITION                   0x00000003 */
/* #define _CNPUG_CNPUG3_MASK                       0x00000008 */
/* #define _CNPUG_CNPUG3_LENGTH                     0x00000001 */

/* #define _CNPUG_CNPUG6_POSITION                   0x00000006 */
/* #define _CNPUG_CNPUG6_MASK                       0x00000040 */
/* #define _CNPUG_CNPUG6_LENGTH                     0x00000001 */

/* #define _CNPUG_CNPUG7_POSITION                   0x00000007 */
/* #define _CNPUG_CNPUG7_MASK                       0x00000080 */
/* #define _CNPUG_CNPUG7_LENGTH                     0x00000001 */

/* #define _CNPUG_CNPUG8_POSITION                   0x00000008 */
/* #define _CNPUG_CNPUG8_MASK                       0x00000100 */
/* #define _CNPUG_CNPUG8_LENGTH                     0x00000001 */

/* #define _CNPUG_CNPUG9_POSITION                   0x00000009 */
/* #define _CNPUG_CNPUG9_MASK                       0x00000200 */
/* #define _CNPUG_CNPUG9_LENGTH                     0x00000001 */

/* #define _CNPUG_w_POSITION                        0x00000000 */
/* #define _CNPUG_w_MASK                            0xFFFFFFFF */
/* #define _CNPUG_w_LENGTH                          0x00000020 */

/* #define _CNPDG_CNPDG2_POSITION                   0x00000002 */
/* #define _CNPDG_CNPDG2_MASK                       0x00000004 */
/* #define _CNPDG_CNPDG2_LENGTH                     0x00000001 */

/* #define _CNPDG_CNPDG3_POSITION                   0x00000003 */
/* #define _CNPDG_CNPDG3_MASK                       0x00000008 */
/* #define _CNPDG_CNPDG3_LENGTH                     0x00000001 */

/* #define _CNPDG_CNPDG6_POSITION                   0x00000006 */
/* #define _CNPDG_CNPDG6_MASK                       0x00000040 */
/* #define _CNPDG_CNPDG6_LENGTH                     0x00000001 */

/* #define _CNPDG_CNPDG7_POSITION                   0x00000007 */
/* #define _CNPDG_CNPDG7_MASK                       0x00000080 */
/* #define _CNPDG_CNPDG7_LENGTH                     0x00000001 */

/* #define _CNPDG_CNPDG8_POSITION                   0x00000008 */
/* #define _CNPDG_CNPDG8_MASK                       0x00000100 */
/* #define _CNPDG_CNPDG8_LENGTH                     0x00000001 */

/* #define _CNPDG_CNPDG9_POSITION                   0x00000009 */
/* #define _CNPDG_CNPDG9_MASK                       0x00000200 */
/* #define _CNPDG_CNPDG9_LENGTH                     0x00000001 */

/* #define _CNPDG_w_POSITION                        0x00000000 */
/* #define _CNPDG_w_MASK                            0xFFFFFFFF */
/* #define _CNPDG_w_LENGTH                          0x00000020 */

/* #define _CNCONG_SIDL_POSITION                    0x0000000D */
/* #define _CNCONG_SIDL_MASK                        0x00002000 */
/* #define _CNCONG_SIDL_LENGTH                      0x00000001 */

/* #define _CNCONG_ON_POSITION                      0x0000000F */
/* #define _CNCONG_ON_MASK                          0x00008000 */
/* #define _CNCONG_ON_LENGTH                        0x00000001 */

/* #define _CNCONG_w_POSITION                       0x00000000 */
/* #define _CNCONG_w_MASK                           0xFFFFFFFF */
/* #define _CNCONG_w_LENGTH                         0x00000020 */

/* #define _CNENG_CNIEG2_POSITION                   0x00000002 */
/* #define _CNENG_CNIEG2_MASK                       0x00000004 */
/* #define _CNENG_CNIEG2_LENGTH                     0x00000001 */

/* #define _CNENG_CNIEG3_POSITION                   0x00000003 */
/* #define _CNENG_CNIEG3_MASK                       0x00000008 */
/* #define _CNENG_CNIEG3_LENGTH                     0x00000001 */

/* #define _CNENG_CNIEG6_POSITION                   0x00000006 */
/* #define _CNENG_CNIEG6_MASK                       0x00000040 */
/* #define _CNENG_CNIEG6_LENGTH                     0x00000001 */

/* #define _CNENG_CNIEG7_POSITION                   0x00000007 */
/* #define _CNENG_CNIEG7_MASK                       0x00000080 */
/* #define _CNENG_CNIEG7_LENGTH                     0x00000001 */

/* #define _CNENG_CNIEG8_POSITION                   0x00000008 */
/* #define _CNENG_CNIEG8_MASK                       0x00000100 */
/* #define _CNENG_CNIEG8_LENGTH                     0x00000001 */

/* #define _CNENG_CNIEG9_POSITION                   0x00000009 */
/* #define _CNENG_CNIEG9_MASK                       0x00000200 */
/* #define _CNENG_CNIEG9_LENGTH                     0x00000001 */

/* #define _CNENG_w_POSITION                        0x00000000 */
/* #define _CNENG_w_MASK                            0xFFFFFFFF */
/* #define _CNENG_w_LENGTH                          0x00000020 */

/* #define _CNSTATG_CNSTATG2_POSITION               0x00000002 */
/* #define _CNSTATG_CNSTATG2_MASK                   0x00000004 */
/* #define _CNSTATG_CNSTATG2_LENGTH                 0x00000001 */

/* #define _CNSTATG_CNSTATG3_POSITION               0x00000003 */
/* #define _CNSTATG_CNSTATG3_MASK                   0x00000008 */
/* #define _CNSTATG_CNSTATG3_LENGTH                 0x00000001 */

/* #define _CNSTATG_CNSTATG6_POSITION               0x00000006 */
/* #define _CNSTATG_CNSTATG6_MASK                   0x00000040 */
/* #define _CNSTATG_CNSTATG6_LENGTH                 0x00000001 */

/* #define _CNSTATG_CNSTATG7_POSITION               0x00000007 */
/* #define _CNSTATG_CNSTATG7_MASK                   0x00000080 */
/* #define _CNSTATG_CNSTATG7_LENGTH                 0x00000001 */

/* #define _CNSTATG_CNSTATG8_POSITION               0x00000008 */
/* #define _CNSTATG_CNSTATG8_MASK                   0x00000100 */
/* #define _CNSTATG_CNSTATG8_LENGTH                 0x00000001 */

/* #define _CNSTATG_CNSTATG9_POSITION               0x00000009 */
/* #define _CNSTATG_CNSTATG9_MASK                   0x00000200 */
/* #define _CNSTATG_CNSTATG9_LENGTH                 0x00000001 */

/* #define _CNSTATG_w_POSITION                      0x00000000 */
/* #define _CNSTATG_w_MASK                          0xFFFFFFFF */
/* #define _CNSTATG_w_LENGTH                        0x00000020 */

/* #define _DEVCFG3_USERID_POSITION                 0x00000000 */
/* #define _DEVCFG3_USERID_MASK                     0x0000FFFF */
/* #define _DEVCFG3_USERID_LENGTH                   0x00000010 */

/* #define _DEVCFG3_FSRSSEL_POSITION                0x00000010 */
/* #define _DEVCFG3_FSRSSEL_MASK                    0x00070000 */
/* #define _DEVCFG3_FSRSSEL_LENGTH                  0x00000003 */

/* #define _DEVCFG3_PMDL1WAY_POSITION               0x0000001C */
/* #define _DEVCFG3_PMDL1WAY_MASK                   0x10000000 */
/* #define _DEVCFG3_PMDL1WAY_LENGTH                 0x00000001 */

/* #define _DEVCFG3_IOL1WAY_POSITION                0x0000001D */
/* #define _DEVCFG3_IOL1WAY_MASK                    0x20000000 */
/* #define _DEVCFG3_IOL1WAY_LENGTH                  0x00000001 */

/* #define _DEVCFG3_FUSBIDIO_POSITION               0x0000001E */
/* #define _DEVCFG3_FUSBIDIO_MASK                   0x40000000 */
/* #define _DEVCFG3_FUSBIDIO_LENGTH                 0x00000001 */

/* #define _DEVCFG3_FVBUSONIO_POSITION              0x0000001F */
/* #define _DEVCFG3_FVBUSONIO_MASK                  0x80000000 */
/* #define _DEVCFG3_FVBUSONIO_LENGTH                0x00000001 */

/* #define _DEVCFG3_w_POSITION                      0x00000000 */
/* #define _DEVCFG3_w_MASK                          0xFFFFFFFF */
/* #define _DEVCFG3_w_LENGTH                        0x00000020 */

/* #define _DEVCFG2_FPLLIDIV_POSITION               0x00000000 */
/* #define _DEVCFG2_FPLLIDIV_MASK                   0x00000007 */
/* #define _DEVCFG2_FPLLIDIV_LENGTH                 0x00000003 */

/* #define _DEVCFG2_FPLLMUL_POSITION                0x00000004 */
/* #define _DEVCFG2_FPLLMUL_MASK                    0x00000070 */
/* #define _DEVCFG2_FPLLMUL_LENGTH                  0x00000003 */

/* #define _DEVCFG2_UPLLIDIV_POSITION               0x00000008 */
/* #define _DEVCFG2_UPLLIDIV_MASK                   0x00000700 */
/* #define _DEVCFG2_UPLLIDIV_LENGTH                 0x00000003 */

/* #define _DEVCFG2_UPLLEN_POSITION                 0x0000000F */
/* #define _DEVCFG2_UPLLEN_MASK                     0x00008000 */
/* #define _DEVCFG2_UPLLEN_LENGTH                   0x00000001 */

/* #define _DEVCFG2_FPLLODIV_POSITION               0x00000010 */
/* #define _DEVCFG2_FPLLODIV_MASK                   0x00070000 */
/* #define _DEVCFG2_FPLLODIV_LENGTH                 0x00000003 */

/* #define _DEVCFG2_w_POSITION                      0x00000000 */
/* #define _DEVCFG2_w_MASK                          0xFFFFFFFF */
/* #define _DEVCFG2_w_LENGTH                        0x00000020 */

/* #define _DEVCFG1_FNOSC_POSITION                  0x00000000 */
/* #define _DEVCFG1_FNOSC_MASK                      0x00000007 */
/* #define _DEVCFG1_FNOSC_LENGTH                    0x00000003 */

/* #define _DEVCFG1_FSOSCEN_POSITION                0x00000005 */
/* #define _DEVCFG1_FSOSCEN_MASK                    0x00000020 */
/* #define _DEVCFG1_FSOSCEN_LENGTH                  0x00000001 */

/* #define _DEVCFG1_IESO_POSITION                   0x00000007 */
/* #define _DEVCFG1_IESO_MASK                       0x00000080 */
/* #define _DEVCFG1_IESO_LENGTH                     0x00000001 */

/* #define _DEVCFG1_POSCMOD_POSITION                0x00000008 */
/* #define _DEVCFG1_POSCMOD_MASK                    0x00000300 */
/* #define _DEVCFG1_POSCMOD_LENGTH                  0x00000002 */

/* #define _DEVCFG1_OSCIOFNC_POSITION               0x0000000A */
/* #define _DEVCFG1_OSCIOFNC_MASK                   0x00000400 */
/* #define _DEVCFG1_OSCIOFNC_LENGTH                 0x00000001 */

/* #define _DEVCFG1_FPBDIV_POSITION                 0x0000000C */
/* #define _DEVCFG1_FPBDIV_MASK                     0x00003000 */
/* #define _DEVCFG1_FPBDIV_LENGTH                   0x00000002 */

/* #define _DEVCFG1_FCKSM_POSITION                  0x0000000E */
/* #define _DEVCFG1_FCKSM_MASK                      0x0000C000 */
/* #define _DEVCFG1_FCKSM_LENGTH                    0x00000002 */

/* #define _DEVCFG1_WDTPS_POSITION                  0x00000010 */
/* #define _DEVCFG1_WDTPS_MASK                      0x001F0000 */
/* #define _DEVCFG1_WDTPS_LENGTH                    0x00000005 */

/* #define _DEVCFG1_WINDIS_POSITION                 0x00000016 */
/* #define _DEVCFG1_WINDIS_MASK                     0x00400000 */
/* #define _DEVCFG1_WINDIS_LENGTH                   0x00000001 */

/* #define _DEVCFG1_FWDTEN_POSITION                 0x00000017 */
/* #define _DEVCFG1_FWDTEN_MASK                     0x00800000 */
/* #define _DEVCFG1_FWDTEN_LENGTH                   0x00000001 */

/* #define _DEVCFG1_FWDTWINSZ_POSITION              0x00000018 */
/* #define _DEVCFG1_FWDTWINSZ_MASK                  0x03000000 */
/* #define _DEVCFG1_FWDTWINSZ_LENGTH                0x00000002 */

/* #define _DEVCFG1_w_POSITION                      0x00000000 */
/* #define _DEVCFG1_w_MASK                          0xFFFFFFFF */
/* #define _DEVCFG1_w_LENGTH                        0x00000020 */

/* #define _DEVCFG0_DEBUG_POSITION                  0x00000000 */
/* #define _DEVCFG0_DEBUG_MASK                      0x00000003 */
/* #define _DEVCFG0_DEBUG_LENGTH                    0x00000002 */

/* #define _DEVCFG0_JTAGEN_POSITION                 0x00000002 */
/* #define _DEVCFG0_JTAGEN_MASK                     0x00000004 */
/* #define _DEVCFG0_JTAGEN_LENGTH                   0x00000001 */

/* #define _DEVCFG0_ICESEL_POSITION                 0x00000003 */
/* #define _DEVCFG0_ICESEL_MASK                     0x00000018 */
/* #define _DEVCFG0_ICESEL_LENGTH                   0x00000002 */

/* #define _DEVCFG0_PWP_POSITION                    0x0000000C */
/* #define _DEVCFG0_PWP_MASK                        0x000FF000 */
/* #define _DEVCFG0_PWP_LENGTH                      0x00000008 */

/* #define _DEVCFG0_BWP_POSITION                    0x00000018 */
/* #define _DEVCFG0_BWP_MASK                        0x01000000 */
/* #define _DEVCFG0_BWP_LENGTH                      0x00000001 */

/* #define _DEVCFG0_CP_POSITION                     0x0000001C */
/* #define _DEVCFG0_CP_MASK                         0x10000000 */
/* #define _DEVCFG0_CP_LENGTH                       0x00000001 */

/* #define _DEVCFG0_FDEBUG_POSITION                 0x00000000 */
/* #define _DEVCFG0_FDEBUG_MASK                     0x00000003 */
/* #define _DEVCFG0_FDEBUG_LENGTH                   0x00000002 */

/* #define _DEVCFG0_w_POSITION                      0x00000000 */
/* #define _DEVCFG0_w_MASK                          0xFFFFFFFF */
/* #define _DEVCFG0_w_LENGTH                        0x00000020 */

/* Vector Numbers */
/* #define _CORE_TIMER_VECTOR                       0 */
/* #define _CORE_SOFTWARE_0_VECTOR                  1 */
/* #define _CORE_SOFTWARE_1_VECTOR                  2 */
/* #define _EXTERNAL_0_VECTOR                       3 */
/* #define _TIMER_1_VECTOR                          4 */
/* #define _INPUT_CAPTURE_1_VECTOR                  5 */
/* #define _OUTPUT_COMPARE_1_VECTOR                 6 */
/* #define _EXTERNAL_1_VECTOR                       7 */
/* #define _TIMER_2_VECTOR                          8 */
/* #define _INPUT_CAPTURE_2_VECTOR                  9 */
/* #define _OUTPUT_COMPARE_2_VECTOR                 10 */
/* #define _EXTERNAL_2_VECTOR                       11 */
/* #define _TIMER_3_VECTOR                          12 */
/* #define _INPUT_CAPTURE_3_VECTOR                  13 */
/* #define _OUTPUT_COMPARE_3_VECTOR                 14 */
/* #define _EXTERNAL_3_VECTOR                       15 */
/* #define _TIMER_4_VECTOR                          16 */
/* #define _INPUT_CAPTURE_4_VECTOR                  17 */
/* #define _OUTPUT_COMPARE_4_VECTOR                 18 */
/* #define _EXTERNAL_4_VECTOR                       19 */
/* #define _TIMER_5_VECTOR                          20 */
/* #define _INPUT_CAPTURE_5_VECTOR                  21 */
/* #define _OUTPUT_COMPARE_5_VECTOR                 22 */
/* #define _ADC_VECTOR                              23 */
/* #define _FAIL_SAFE_MONITOR_VECTOR                24 */
/* #define _RTCC_VECTOR                             25 */
/* #define _FCE_VECTOR                              26 */
/* #define _COMPARATOR_1_VECTOR                     27 */
/* #define _COMPARATOR_2_VECTOR                     28 */
/* #define _USB_1_VECTOR                            29 */
/* #define _SPI_1_VECTOR                            30 */
/* #define _UART_1_VECTOR                           31 */
/* #define _I2C_1_VECTOR                            32 */
/* #define _CHANGE_NOTICE_VECTOR                    33 */
/* #define _PMP_VECTOR                              34 */
/* #define _SPI_2_VECTOR                            35 */
/* #define _UART_2_VECTOR                           36 */
/* #define _I2C_2_VECTOR                            37 */
/* #define _UART_3_VECTOR                           38 */
/* #define _UART_4_VECTOR                           39 */
/* #define _CTMU_VECTOR                             41 */
/* #define _DMA_0_VECTOR                            42 */
/* #define _DMA_1_VECTOR                            43 */
/* #define _DMA_2_VECTOR                            44 */
/* #define _DMA_3_VECTOR                            45 */

/* IRQ Numbers */
/* #define _CORE_TIMER_IRQ                          0 */
/* #define _CORE_SOFTWARE_0_IRQ                     1 */
/* #define _CORE_SOFTWARE_1_IRQ                     2 */
/* #define _EXTERNAL_0_IRQ                          3 */
/* #define _TIMER_1_IRQ                             4 */
/* #define _INPUT_CAPTURE_ERROR_1_IRQ               5 */
/* #define _INPUT_CAPTURE_1_IRQ                     6 */
/* #define _OUTPUT_COMPARE_1_IRQ                    7 */
/* #define _EXTERNAL_1_IRQ                          8 */
/* #define _TIMER_2_IRQ                             9 */
/* #define _INPUT_CAPTURE_ERROR_2_IRQ               10 */
/* #define _INPUT_CAPTURE_2_IRQ                     11 */
/* #define _OUTPUT_COMPARE_2_IRQ                    12 */
/* #define _EXTERNAL_2_IRQ                          13 */
/* #define _TIMER_3_IRQ                             14 */
/* #define _INPUT_CAPTURE_ERROR_3_IRQ               15 */
/* #define _INPUT_CAPTURE_3_IRQ                     16 */
/* #define _OUTPUT_COMPARE_3_IRQ                    17 */
/* #define _EXTERNAL_3_IRQ                          18 */
/* #define _TIMER_4_IRQ                             19 */
/* #define _INPUT_CAPTURE_ERROR_4_IRQ               20 */
/* #define _INPUT_CAPTURE_4_IRQ                     21 */
/* #define _OUTPUT_COMPARE_4_IRQ                    22 */
/* #define _EXTERNAL_4_IRQ                          23 */
/* #define _TIMER_5_IRQ                             24 */
/* #define _INPUT_CAPTURE_ERROR_5_IRQ               25 */
/* #define _INPUT_CAPTURE_5_IRQ                     26 */
/* #define _OUTPUT_COMPARE_5_IRQ                    27 */
/* #define _ADC_IRQ                                 28 */
/* #define _FAIL_SAFE_MONITOR_IRQ                   29 */
/* #define _RTCC_IRQ                                30 */
/* #define _FLASH_CONTROL_IRQ                       31 */
/* #define _COMPARATOR_1_IRQ                        32 */
/* #define _COMPARATOR_2_IRQ                        33 */
/* #define _USB_IRQ                                 34 */
/* #define _SPI1_ERR_IRQ                            35 */
/* #define _SPI1_RX_IRQ                             36 */
/* #define _SPI1_TX_IRQ                             37 */
/* #define _UART1_ERR_IRQ                           38 */
/* #define _UART1_RX_IRQ                            39 */
/* #define _UART1_TX_IRQ                            40 */
/* #define _I2C1_BUS_IRQ                            41 */
/* #define _I2C1_SLAVE_IRQ                          42 */
/* #define _I2C1_MASTER_IRQ                         43 */
/* #define _CHANGE_NOTICE_A_IRQ                     44 */
/* #define _CHANGE_NOTICE_B_IRQ                     45 */
/* #define _CHANGE_NOTICE_C_IRQ                     46 */
/* #define _CHANGE_NOTICE_D_IRQ                     47 */
/* #define _CHANGE_NOTICE_E_IRQ                     48 */
/* #define _CHANGE_NOTICE_F_IRQ                     49 */
/* #define _CHANGE_NOTICE_G_IRQ                     50 */
/* #define _PMP_IRQ                                 51 */
/* #define _PMP_ERROR_IRQ                           52 */
/* #define _SPI2_ERR_IRQ                            53 */
/* #define _SPI2_RX_IRQ                             54 */
/* #define _SPI2_TX_IRQ                             55 */
/* #define _UART2_ERR_IRQ                           56 */
/* #define _UART2_RX_IRQ                            57 */
/* #define _UART2_TX_IRQ                            58 */
/* #define _I2C2_BUS_IRQ                            59 */
/* #define _I2C2_SLAVE_IRQ                          60 */
/* #define _I2C2_MASTER_IRQ                         61 */
/* #define _UART3_ERR_IRQ                           62 */
/* #define _UART3_RX_IRQ                            63 */
/* #define _UART3_TX_IRQ                            64 */
/* #define _UART4_ERR_IRQ                           65 */
/* #define _UART4_RX_IRQ                            66 */
/* #define _UART4_TX_IRQ                            67 */
/* #define _CTMU_IRQ                                71 */
/* #define _DMA0_IRQ                                72 */
/* #define _DMA1_IRQ                                73 */
/* #define _DMA2_IRQ                                74 */
/* #define _DMA3_IRQ                                75 */

/* Device Peripherals */
/* #define _ADC10 */
/* #define _BMX */
/* #define _CFG */
/* #define _CMP */
/* #define _CVR */
/* #define _DMAC */
/* #define _DMAC0 */
/* #define _DMAC1 */
/* #define _DMAC2 */
/* #define _DMAC3 */
/* #define _I2C1 */
/* #define _I2C2 */
/* #define _ICAP1 */
/* #define _ICAP2 */
/* #define _ICAP3 */
/* #define _ICAP4 */
/* #define _ICAP5 */
/* #define _INT */
/* #define _NVM */
/* #define _OCMP1 */
/* #define _OCMP2 */
/* #define _OCMP3 */
/* #define _OCMP4 */
/* #define _OCMP5 */
/* #define _OSC */
/* #define _PCACHE */
/* #define _PMP */
/* #define _PORTB */
/* #define _PORTC */
/* #define _PORTD */
/* #define _PORTE */
/* #define _PORTF */
/* #define _PORTG */
/* #define _RCON */
/* #define _RTCC */
/* #define _SPI1 */
/* #define _SPI2 */
/* #define _TMR1 */
/* #define _TMR2 */
/* #define _TMR3 */
/* #define _TMR4 */
/* #define _TMR5 */
/* #define _UART1 */
/* #define _UART2 */
/* #define _UART3 */
/* #define _UART4 */
/* #define _USB */
/* #define _WDT */

/* Base Addresses for Peripherals */
/* #define _ADC10_BASE_ADDRESS                      0xBF809000 */
/* #define _BMX_BASE_ADDRESS                        0xBF882000 */
/* #define _CFG_BASE_ADDRESS                        0xBF80F200 */
/* #define _CMP_BASE_ADDRESS                        0xBF80A000 */
/* #define _CVR_BASE_ADDRESS                        0xBF809800 */
/* #define _DMAC_BASE_ADDRESS                       0xBF883000 */
/* #define _DMAC0_BASE_ADDRESS                      0xBF883060 */
/* #define _DMAC1_BASE_ADDRESS                      0xBF883120 */
/* #define _DMAC2_BASE_ADDRESS                      0xBF8831E0 */
/* #define _DMAC3_BASE_ADDRESS                      0xBF8832A0 */
/* #define _I2C1_BASE_ADDRESS                       0xBF805000 */
/* #define _I2C2_BASE_ADDRESS                       0xBF805100 */
/* #define _ICAP1_BASE_ADDRESS                      0xBF802000 */
/* #define _ICAP2_BASE_ADDRESS                      0xBF802200 */
/* #define _ICAP3_BASE_ADDRESS                      0xBF802400 */
/* #define _ICAP4_BASE_ADDRESS                      0xBF802600 */
/* #define _ICAP5_BASE_ADDRESS                      0xBF802800 */
/* #define _INT_BASE_ADDRESS                        0xBF881000 */
/* #define _NVM_BASE_ADDRESS                        0xBF80F400 */
/* #define _OCMP1_BASE_ADDRESS                      0xBF803000 */
/* #define _OCMP2_BASE_ADDRESS                      0xBF803200 */
/* #define _OCMP3_BASE_ADDRESS                      0xBF803400 */
/* #define _OCMP4_BASE_ADDRESS                      0xBF803600 */
/* #define _OCMP5_BASE_ADDRESS                      0xBF803800 */
/* #define _OSC_BASE_ADDRESS                        0xBF80F000 */
/* #define _PCACHE_BASE_ADDRESS                     0xBF884000 */
/* #define _PMP_BASE_ADDRESS                        0xBF807000 */
/* #define _PORTB_BASE_ADDRESS                      0xBF886120 */
/* #define _PORTC_BASE_ADDRESS                      0xBF886220 */
/* #define _PORTD_BASE_ADDRESS                      0xBF886320 */
/* #define _PORTE_BASE_ADDRESS                      0xBF886420 */
/* #define _PORTF_BASE_ADDRESS                      0xBF886520 */
/* #define _PORTG_BASE_ADDRESS                      0xBF886660 */
/* #define _RCON_BASE_ADDRESS                       0xBF80F600 */
/* #define _RTCC_BASE_ADDRESS                       0xBF800200 */
/* #define _SPI1_BASE_ADDRESS                       0xBF805800 */
/* #define _SPI2_BASE_ADDRESS                       0xBF805A00 */
/* #define _TMR1_BASE_ADDRESS                       0xBF800600 */
/* #define _TMR2_BASE_ADDRESS                       0xBF800800 */
/* #define _TMR3_BASE_ADDRESS                       0xBF800A00 */
/* #define _TMR4_BASE_ADDRESS                       0xBF800C00 */
/* #define _TMR5_BASE_ADDRESS                       0xBF800E00 */
/* #define _UART1_BASE_ADDRESS                      0xBF806000 */
/* #define _UART2_BASE_ADDRESS                      0xBF806200 */
/* #define _UART3_BASE_ADDRESS                      0xBF806400 */
/* #define _UART4_BASE_ADDRESS                      0xBF806600 */
/* #define _USB_BASE_ADDRESS                        0xBF885040 */
/* #define _WDT_BASE_ADDRESS                        0xBF800000 */
