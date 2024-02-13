/***********************************************************************************************************************
MMBasic

MiscMX470.c

Handles the a few miscellaneous functions for the MX470 version.

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

/* #include "../../Version.h" */
#include "IOPorts.h"
/* extern void CallCFuncT5(void);                                      // this is implemented in CFunction.c */
/* extern unsigned int CFuncT5;                                        // we should call the CFunction T5 interrupt function if this is non zero */

// function (which looks like a pre defined variable) to return the type of platform
/* void fun_device(void){ */
/*   sret = GetTempStrMemory();                                        // this will last for the life of the command */
/*     strcpy(sret, "Micromite Plus"); */
/*     CtoM(sret); */
/*     targ = T_STR; */
/* } */


///////////////////////////////////////////////////////////////////////////////////////////////
// constants and functions used in the OPTION LIST command
/* char *LCDList[] = {"SSD1963_4", "SSD1963_5", "SSD1963_5A", "SSD1963_7", "SSD1963_7A", "SSD1963_8", "ILI9341", "ILI9163", "ST7735", "ILI9341_I"}; */
/* char *OrientList[] = {"LANDSCAPE", "PORTRAIT", "RLANDSCAPE", "RPORTRAIT"}; */
/* char *CaseList[] = {"", "LOWER", "UPPER"}; */
/* char *KBrdList[] = {"", "US", "FR", "GR", "IT", "BE", "UK", "ES" }; */


/* void __ISR( _TIMER_5_VECTOR, ipl1AUTO) T5Interrupt(void) { */
/*     if(CFuncT5) CallCFuncT5();                                      // T5 interrupt CFunctions (see CFunction.c) */
/*     mT5ClearIntFlag(); */
/* } */


/* void PO(char *s) { */
/*     MMPrintString("OPTION "); */
/*     MMPrintString(s); */
/*     MMPrintString(" "); */
/* } */

/* void PInt(int n) { */
/*     char s[20]; */
/*     IntToStr(s, n, 10); */
/*     MMPrintString(s); */
/* } */

/* void PIntComma(int n) { */
/*     MMPrintString(", "); PInt(n); */
/* } */

/* void PO2Str(char *s1, char *s2) { */
/*     PO(s1); MMPrintString(s2); MMPrintString("\r\n"); */
/* } */


/* void PO2Int(char *s1, int n) { */
/*     PO(s1); PInt(n); MMPrintString("\r\n"); */
/* } */

/* void PO3Int(char *s1, int n1, int n2) { */
/*     PO(s1); PInt(n1); PIntComma(n2); MMPrintString("\r\n"); */
/* } */
///////////////////////////////////////////////////////////////////////////////////////////////

/* void MIPS16 OtherOptions(void) */
/*   { */
/*   char *tp, *ttp; */

/*   tp = checkstring(cmdline, "RESET"); */
/*   if(tp) */
/*     { */
/*     ResetAllOptions(); */
/*     goto saveandreset; */
/*     } */

/*     tp = checkstring(cmdline, "KEYBOARD"); */
/*   if(tp) */
/*     { */
/*       //if(CurrentLinePtr) error("Invalid in a program"); */
/*       if(checkstring(tp, "DISABLE")) */
/*           Option.KeyboardConfig = NO_KEYBOARD; */
/*         else if(checkstring(tp, "US")) */
/*             Option.KeyboardConfig = CONFIG_US; */
/*       else if(checkstring(tp, "FR")) */
/*           Option.KeyboardConfig = CONFIG_FR; */
/*       else if(checkstring(tp, "GR")) */
/*           Option.KeyboardConfig = CONFIG_GR; */
/*       else if(checkstring(tp, "IT")) */
/*           Option.KeyboardConfig = CONFIG_IT; */
/*       else if(checkstring(tp, "BE")) */
/*           Option.KeyboardConfig = CONFIG_BE; */
/*       else if(checkstring(tp, "UK")) */
/*           Option.KeyboardConfig = CONFIG_UK; */
/*       else if(checkstring(tp, "ES")) */
/*           Option.KeyboardConfig = CONFIG_ES; */
/*       goto saveandreset; */
/*     } */

/*     tp = checkstring(cmdline, "CONTROLS"); */
/*     if(tp) */
/*       { */
/*       Option.MaxCtrls = getint(tp, 0, 1000) + 1; */
/*         goto saveandreset; */
/*       } */

/*     tp = checkstring(cmdline, "SDCARD"); */
/*     if(tp) */
/*         { */
/*       //if(CurrentLinePtr) error("Invalid in a program"); */
/*         if(checkstring(tp, "DISABLE")) */
/*             Option.SDCARD_CS = Option.SD_CD = Option.SD_WP = 0; */
/*         else */
/*             ConfigSDCard(tp); */

/*         goto saveandreset; */
/*         } */

/*   tp = checkstring(cmdline, "ERROR"); */
/*   if(tp) { */
/*         if(!Option.SDCARD_CS) */
/*             error("SD card not configured"); */
/*       if(checkstring(tp, "CONTINUE")) */
/*         { */
/*         OptionFileErrorAbort = false; */
/*         return; */
/*         } */
/*       if(checkstring(tp, "ABORT")) */
/*         { */
/*             OptionFileErrorAbort = true; */
/*             return; */
/*         } */
/*     } */

/*     tp = checkstring(cmdline, "LCDPANEL"); */
/*     if(tp) */
/*         { */
/*       //if(CurrentLinePtr) error("Invalid in a program"); */
/*         if((ttp = checkstring(tp, "CONSOLE"))) */
/*             { */
/*             if(!Option.DISPLAY_TYPE || Option.DISPLAY_TYPE > SSD_PANEL) */
/*                 error("SSD1963 display required"); */
/*             if(!DISPLAY_LANDSCAPE) */
/*                 error("Landscape only"); */
/*             Option.Height = VRes/gui_font_height; Option.Width = HRes/gui_font_width; */
/*             skipspace(ttp); */
/*             Option.DefaultFC = WHITE; */
/*             Option.DefaultBC = BLACK; */
/*             Option.DefaultBrightness = 100; */
/*             if(!(*ttp == 0 || *ttp == '\'')) */
/*                 { */
/*                 getargs(&ttp, 7, ",");   // this is a macro and must be the first executable stmt in a block */
/*                 if(argc > 0) */
/*                     { */
/*                     if(*argv[0] == '#') */
/*                         argv[0]++;       // skip the hash if used */
/*                     SetFont(((getint(argv[0], 1, FONT_BUILTIN_NBR) - 1) << 4) | 1); */
/*                     Option.DefaultFont = gui_font; */
/*                     } */
/*                 if(argc > 2) Option.DefaultFC = getint(argv[2], BLACK, WHITE); */
/*                 if(argc > 4) Option.DefaultBC = getint(argv[4], BLACK, WHITE); */
/*                 if(Option.DefaultFC == Option.DefaultBC) error("Same colours"); */
/*                 if(argc > 6) Option.DefaultBrightness = getint(argv[6], 2, 100); */
/*                 SetBacklightSSD1963(Option.DefaultBrightness); */
/*                 } */
/*             else */
/*                 SetFont((Option.DefaultFont = 0x01)); */
/*                  */
/*             Option.DISPLAY_CONSOLE = 1; */
/*             Option.ColourCode = true; */
/*             PromptFont = Option.DefaultFont; */
/*             PromptFC = Option.DefaultFC; */
/*             PromptBC = Option.DefaultBC; */
/*             if(!CurrentLinePtr) */
/*                 { */
/*                 SaveOptions(); */
/*                 ClearScreen(Option.DefaultBC); */
/*                 } */
/*             return; */
/*             } */
/*         else if(checkstring(tp, "NOCONSOLE")) { */
/*             Option.Height = SCREENHEIGHT; Option.Width = SCREENWIDTH; */
/*             Option.DISPLAY_CONSOLE = 0; */
/*             Option.ColourCode = false; */
/*             Option.DefaultFC = WHITE; */
/*             Option.DefaultBC = BLACK; */
/*             SetFont((Option.DefaultFont = 0x01)); */
/*             Option.DefaultBrightness = 100; */
/*             if(!CurrentLinePtr) */
/*                 { */
/*                 SaveOptions(); */
/*                 ClearScreen(Option.DefaultBC); */
/*                 } */
/*             return; */
/*             } */
/*         else if(checkstring(tp, "DISABLE")) */
/*             { */
/*             Option.Height = SCREENHEIGHT; Option.Width = SCREENWIDTH; */
/*             Option.DISPLAY_CONSOLE = Option.DISPLAY_TYPE = Option.DISPLAY_ORIENTATION = Option.DISPLAY_BL = HRes = Option.LCD_RD = 0; */
/*             Option.DefaultFC = WHITE; Option.DefaultBC = BLACK; Option.DefaultFont = 0x01; Option.DefaultBrightness = 100; */
/*             DrawRectangle = (void (*)(int , int , int , int , int )) DisplayNotSet; */
/*             DrawBitmap =  (void (*)(int , int , int , int , int , int , int , unsigned char *)) DisplayNotSet; */
/*             ScrollLCD = (void (*)(int ))DisplayNotSet; */
/*             DrawBuffer = (void (*)(int , int , int , int , char * )) DisplayNotSet; */
/*             ReadBuffer = (void (*)(int , int , int , int , char * )) DisplayNotSet; */
/*             } */
/*         else */
/*             { */
/*             if(Option.DISPLAY_TYPE && !CurrentLinePtr) */
/*                 error("Display already configured"); */
/*             ConfigDisplaySSD(tp); */
/*             if(!Option.DISPLAY_TYPE) */
/*                 ConfigDisplaySPI(tp);  // if it is not an SSD1963 then try for a SPI type */
/*             } */

/*         goto saveandreset; */
/*     } */

/*     tp = checkstring(cmdline, "TOUCH"); */
/*     if(tp) { */
/*       //if(CurrentLinePtr) error("Invalid in a program"); */
/*       if(checkstring(tp, "DISABLE")) { */
/*             TouchIrqPortAddr = NULL; */
/*             Option.TOUCH_Click = Option.TOUCH_CS = Option.TOUCH_IRQ = false; */
/*         } else */
/*             ConfigTouch(tp); */

/*         goto saveandreset; */
/*   } */

/*     tp = checkstring(cmdline, "CONSOLE"); */
/*     if(tp) */
/*         { */
/* //      if(checkstring(tp, "OFF"))          { Option.SerialConDisabled = true;  SaveOptions(); CloseSerialConsole(); return; } */
/* //      if(checkstring(tp, "ON"))           { if(ExtCurrentConfig[CONSOLE_RX_PIN] != EXT_NOT_CONFIG || ExtCurrentConfig[CONSOLE_TX_PIN] != EXT_NOT_CONFIG) */
/* //  error("Console pins are in use"); */
/* //  Option.SerialConDisabled = false; */
/* //  SaveOptions(); initSerialConsole(); return; } */
/*       if(checkstring(tp, "OFF")) */
/*         { */
/* 	     if(CurrentLinePtr) */
/*               error("Invalid in a program"); */
/* 		Option.SerialConDisabled = true; */
/* 		goto saveandreset; */
/* 		} */
/*       if(checkstring(tp, "ON")) */
/*         { */
/* 	    if(CurrentLinePtr) */
/*             error("Invalid in a program"); */
/* 	    if(ExtCurrentConfig[CONSOLE_RX_PIN] != EXT_NOT_CONFIG || ExtCurrentConfig[CONSOLE_TX_PIN] != EXT_NOT_CONFIG) */
/*                error("Console pins are in use"); */
/*         Option.SerialConDisabled = false; */
/*         goto saveandreset; */
/* 		 } */
/*       if(checkstring(tp, "INVERT")) */
/*         { */
/*         Option.Invert = true; */
/*         SaveOptions(); */
/*         initSerialConsole(); */
/*         return; */
/*         } */
/*       if(checkstring(tp, "NOINVERT")) */
/*         { */
/*         Option.Invert = false; */
/*         SaveOptions(); */
/*         initSerialConsole(); */
/*         return; */
/*         } */
/*       if(checkstring(tp, "AUTO")) */
/*         { */
/*         Option.Invert = 2; */
/*         SaveOptions(); */
/*         initSerialConsole(); */
/*         return; */
/*         } */
/*       if(checkstring(tp, "ECHO")) */
/*         { */
/*         EchoOption = true; */
/*         return; */
/*         } */
/*       if(checkstring(tp, "NOECHO")) */
/*         { */
/*         EchoOption = false; */
/*         return; */
/*         } */
/*     } */

/*     tp = checkstring(cmdline, "RTC"); */
/*     if(tp) */
/*         { */
/*       //if(CurrentLinePtr) error("Invalid in a program"); */
/*       if(checkstring(tp, "DISABLE")) */
/*         { */
/*             Option.RTC_Clock = Option.RTC_Data = 0; */
/*         } */
/*       else */
/*         { */
/*             getargs(&tp, 3, ",");   // this is a macro and must be the first executable stmt in a block */
/*             if(argc != 3) */
/*                 error("Invalid Syntax"); */

/*             Option.RTC_Data = getinteger(argv[0]); */
/*             CheckPin(Option.RTC_Data, OptionErrorCheck); */
/*             Option.RTC_Clock = getinteger(argv[2]); */
/*             CheckPin(Option.RTC_Clock, OptionErrorCheck); */
/*         } */
/*         goto saveandreset; */
/*   } */

/*     tp = checkstring(cmdline, "LIST"); */
/*     if(tp) */
/*         { */
/*         checkend(tp); */
/*         if(Option.Autorun == true) */
/*             PO2Str("AUTORUN", "ON"); */
/*         if(Option.SerialConDisabled == true) */
/*             PO2Str("CONSOLE", "OFF"); */
/*         else */
/*             { */
/*             if(Option.Baudrate != CONSOLE_BAUDRATE) */
/*                 PO2Int("BAUDRATE", Option.Baudrate); */
/*             if(Option.Invert == true) */
/*                 PO2Str("CONSOLE", "INVERT"); */
/*             if(Option.Invert == 2) */
/*                 PO2Str("CONSOLE", "AUTO"); */
/*             } */
/*         if(Option.ColourCode == true) */
/*             PO2Str("COLOURCODE", "ON"); */
/*         if(Option.Listcase != CONFIG_TITLE) */
/*             PO2Str("CASE", CaseList[(int)Option.Listcase]); */
/*         if(Option.Tab != 2) */
/*             PO2Int("TAB", Option.Tab); */
/*         if(Option.Height != 24 || Option.Width != 80) */
/*             PO3Int("DISPLAY", Option.Height, Option.Width); */
/*         if(Option.DISPLAY_TYPE == DISP_USER) */
/*             PO3Int("LCDPANEL USER", DisplayHRes, DisplayVRes); */
/*         if(Option.DISPLAY_TYPE > SSD_PANEL && Option.DISPLAY_TYPE < DISP_USER) */
/*             { */
/*             PO("LCDPANEL"); */
/*             MMPrintString(LCDList[Option.DISPLAY_TYPE - 1]); */
/*             MMPrintString(", "); */
/*             MMPrintString(OrientList[(int)Option.DISPLAY_ORIENTATION - 1]); */
/*             PIntComma(Option.LCD_CD); */
/*             PIntComma(Option.LCD_Reset); */
/*             PIntComma(Option.LCD_CS); */
/*             MMPrintString("\r\n"); */
/*             } */
/*         if(Option.DISPLAY_TYPE > 0 && Option.DISPLAY_TYPE <= SSD_PANEL) */
/*             { */
/*             PO("LCDPANEL"); */
/*             MMPrintString(LCDList[Option.DISPLAY_TYPE - 1]); */
/*             MMPrintString(", "); */
/*             MMPrintString(OrientList[(int)Option.DISPLAY_ORIENTATION - 1]); */
/*             if(Option.DISPLAY_BL) */
/*                 PIntComma(Option.DISPLAY_BL); */
/*             if(Option.LCD_RD && Option.DISPLAY_BL) */
/*                 PIntComma(Option.LCD_RD); */
/*             if(Option.LCD_RD && !Option.DISPLAY_BL) */
/*                 { */
/*                 putConsole(','); */
/*                 PIntComma(Option.LCD_RD); */
/*                 } */
/*             MMPrintString("\r\n"); */
/*             } */
/*         if(Option.TOUCH_CS) */
/*             { */
/*             PO("TOUCH"); */
/*             PInt(Option.TOUCH_CS); */
/*             PIntComma(Option.TOUCH_IRQ); */
/*             if(Option.TOUCH_Click) */
/*                 PIntComma(Option.TOUCH_Click); */
/*             MMPrintString("\r\n"); */
/*             if(Option.TOUCH_XZERO != 0 || Option.TOUCH_YZERO != 0) */
/*                 { */
/*                 MMPrintString("GUI CALIBRATE "); */
/*                 PInt(Option.TOUCH_SWAPXY); */
/*                 PIntComma(Option.TOUCH_XZERO); */
/*                 PIntComma(Option.TOUCH_YZERO); */
/*                 PIntComma(Option.TOUCH_XSCALE * 10000); */
/*                 PIntComma(Option.TOUCH_YSCALE * 10000); */
/*                 MMPrintString("\r\n"); */
/*                 } */
/*             } */
/*         if(Option.KeyboardConfig != NO_KEYBOARD) */
/*             PO2Str("KEYBOARD", KBrdList[(int)Option.KeyboardConfig]); */
/*         if(Option.SDCARD_CS) */
/*             { */
/*             PO("SDCARD"); */
/*             PInt(Option.SDCARD_CS); */
/*             if(Option.SD_CD) */
/*                 PIntComma(Option.SD_CD); */
/*             if(Option.SD_WP) */
/*                 PIntComma(Option.SD_WP); */
/*             MMPrintString("\r\n"); */
/*             } */
/*         if(Option.DISPLAY_CONSOLE == true) */
/*             PO2Str("LCDPANEL", "CONSOLE"); */
/*         if(Option.RTC_Data != 0) */
/*             PO3Int("RTC", Option.RTC_Data, Option.RTC_Clock); */
/*         if(Option.MaxCtrls != 101) */
/*             PO2Int("CONTROLS", Option.MaxCtrls - 1); */
/*         return; */
/*     } */

/*   error("Unrecognised option"); */

/* saveandreset: */
/*     // used for options that require the cpu to be reset */
/*     if(!CurrentLinePtr) */
/*         { */
/*         if(SaveOptions()) */
/*             { */
/*             uSec(200000); */
/*             if(U1OTGSTAT & 1)   // if the USB is connected */
/*                 MMPrintString("Restart the Micromite+");  // the user must do the reset */
/*             else */
/*                 { */
/*                 _excep_code = RESTART_NOAUTORUN;    // otherwise do an automatic reset */
/*                 SoftReset();                         // this will restart the processor */
/*                 } */
/*             } */
/*         } */
/*   } */


// Do not use console debugging here - the console is not set up
void InitProcessor(void)
    {
    int i;

    // initial setup of the I/O ports
    // Default all pins to digital input
/* #if !defined(__32MX470F512H__) */
/*     if(!HAS_64PINS) */
/*         { */
/*         ANSELACLR = 0xffffffff; */
/*         LATACLR = CNPUACLR = CNPDACLR = 0xffffffff; */
/*         TRISASET = 0xffffffff; */
/*         } */
/* #endif */
/*     TRISBSET = TRISCSET = TRISDSET = TRISESET = TRISFSET = TRISGSET = 0xffffffff; */
/*     ANSELBCLR = ANSELCCLR = ANSELDCLR = ANSELECLR = ANSELFCLR = ANSELGCLR = 0xffffffff; */
/*     LATBCLR = LATCCLR = LATDCLR = LATECLR = LATFCLR = LATGCLR = 0xffffffff; */
/*     CNENBCLR = CNENCCLR = CNENDCLR = CNENECLR = CNENFCLR = CNENGCLR = 0xffffffff; */
/*     CNCONBCLR = CNCONCCLR = CNCONDCLR = CNCONECLR = CNCONFCLR = CNCONGCLR = 0xffffffff; */
/*     CNPUBCLR = CNPUCCLR = CNPUDCLR = CNPUECLR = CNPUFCLR = CNPUGCLR = 0xffffffff; */
/*     CNPDBCLR  = CNPDCCLR = CNPDDCLR = CNPDECLR = CNPDFCLR = CNPDGCLR = 0xffffffff; */

/*     mJTAGPortEnable(0);                                // turn off jtag */
/*     BusSpeed = SYSTEMConfig(ClockSpeed,SYS_CFG_ALL);  // set wait states, bus speed, etc for the best performance */

/*   SpiChnClose(SPI_CHANNEL1); */
  SPI_PPS_CLOSE;     // SPI is not reset by the watchdog
/*   SpiChnClose(SPI_CHANNEL2); */
  SPI2_PPS_CLOSE;    // SPI is not reset by the watchdog
/*     CloseOC1(); */
    PWM_CH1_CLOSE;
    PWM_CH2_CLOSE;
    PWM_CH3_CLOSE;  // nor the output compare (PWM)
/*     CloseOC4(); */
    PWM_CH4_CLOSE;
    PWM_CH5_CLOSE;

    // clear all UARTs (again not reset by the watchdog)
/*     UARTEnable(UART1, UART_ENABLE_FLAGS(UART_DISABLE | UART_PERIPHERAL)); */
    COM4_TX_PPS_CLOSE;
/*     UARTEnable(UART2, UART_ENABLE_FLAGS(UART_DISABLE | UART_PERIPHERAL)); */
    COM1_TX_PPS_CLOSE;
    COM1_EN_PPS_CLOSE;
/*     UARTEnable(UART3, UART_ENABLE_FLAGS(UART_DISABLE | UART_PERIPHERAL)); */
    COM2_TX_PPS_CLOSE;
/*     UARTEnable(UART4, UART_ENABLE_FLAGS(UART_DISABLE | UART_PERIPHERAL)); */
    COM3_TX_PPS_CLOSE;

/*     LoadOptions();    // populate the Option struct from flash */

    // set the base of the usable memory
/*     RAMBase = (void *)MRoundUp((unsigned int)&_splim + (Option.MaxCtrls * sizeof(struct s_ctrl))); */

    // setup a pointer to the base of the GUI controls table
/*     Ctrl = (struct s_ctrl *)&_splim; */
/*     for(i = 1; i < Option.MaxCtrls; i++) */
/*         { */
/*         Ctrl[i].state = Ctrl[i].type = 0; */
/*         Ctrl[i].s = NULL; */
/*         } */

/*     if(HAS_100PINS)      // setup the I/O pin table */
/*         PinDef = (struct s_PinDef *)PinDef100; */
/*     else */
/*         PinDef = (struct s_PinDef *)PinDef64; */

/*     INTEnableSystemMultiVectoredInt();      // allow vectored interrupts */
/*     initTimers();                          // initialise and startup the timers */
/*     InitHeap();                             // initialise memory allocation */
/*     initExtIO(); */
/*     initConsole();                    // initialise the USB or UART used for the console */
/*     INTEnableInterrupts(); */
/* } */


////////////////////////////////////////////////////////////////////
// MX470 Specific commands and functions
////////////////////////////////////////////////////////////////////


// code by Peter Mather
/* void fun_str2bin(void){ */
/*     union binmap{ */
/*     	int8_t c[8]; */
/*     	uint8_t uc[8]; */
/*     	float f; */
/*     	double d; */
/*     	int64_t l; */
/*     	uint64_t ul; */
/*     	int i; */
/*     	uint32_t ui; */
/*     	short s; */
/*     	uint16_t us; */
/*     }map; */
/*     int j; */
/* 	getargs(&ep, 5,","); */
/* 	if(!(argc==3 || argc==5))error("Syntax"); */
/* 	if(argc==5 && !checkstring(argv[4],"BIG"))error("Syntax"); */
/* 	char *p; */
/* 	p = getstring(argv[2]); */
/* 	int len=p[0]; */
/* 	map.l=0; */
/*     for(j=0;j<len;j++)map.c[j]=p[j+1]; */
/*     if(argc==5){ // big endian so swap byte order */
/*     	char k; */
/*     	int m; */
/*     	for(j=0;j<(len>>1);j++){ */
/*     		m=len-j-1; */
/*     		k=map.c[j]; */
/*     		map.c[j]=map.c[m]; */
/*     		map.c[m]=k; */
/*     	} */
/*     } */
/*     if(checkstring(argv[0],"DOUBLE")){ */
/*         if(len!=8)error("String length"); */
/* 	targ=T_NBR; */
/* 	fret=(MMFLOAT)map.d; */
/*     } else if(checkstring(argv[0],"SINGLE")){ */
/*         if(len!=4)error("String length"); */
/* 	targ=T_NBR; */
/* 	fret=(MMFLOAT)map.f; */
/*     } else if(checkstring(argv[0],"INT64")){ */
/*         if(len!=8)error("String length"); */
/*     	targ=T_INT; */
/*     	iret=(int64_t)map.l; */
/*     } else if( checkstring(argv[0],"INT32")){ */
/*         if(len!=4)error("String length"); */
/*     	targ=T_INT; */
/*     	iret=(int64_t)map.i; */
/*     } else if(checkstring(argv[0],"INT16")){ */
/*         if(len!=2)error("String length"); */
/*     	targ=T_INT; */
/*     	iret=(int64_t)map.s; */
/*     } else if(checkstring(argv[0],"INT8")){ */
/*         if(len!=1)error("String length"); */
/*     	targ=T_INT; */
/*     	iret=(int64_t)map.c[0]; */
/*     } else if(checkstring(argv[0],"UINT64")){ */
/*         if(len!=8)error("String length"); */
/*     	targ=T_INT; */
/*     	iret=(int64_t)map.ul; */
/*     } else if(checkstring(argv[0],"UINT32")){ */
/*         if(len!=4)error("String length"); */
/*     	targ=T_INT; */
/*     	iret=(int64_t)map.ui; */
/*     } else if(checkstring(argv[0],"UINT16")){ */
/*         if(len!=2)error("String length"); */
/*     	targ=T_INT; */
/*     	iret=(int64_t)map.us; */
/*     } else if(checkstring(argv[0],"UINT8")){ */
/*         if(len!=1)error("String length"); */
/*     	targ=T_INT; */
/*     	iret=(int64_t)map.uc[0]; */
/*     } else error("Syntax"); */

/* } */

/* // code by Peter Mather */
/* void fun_bin2str(void){ */
/* 	int j, len=0; */
/*     union binmap{ */
/*     	int8_t c[8]; */
/*     	uint8_t uc[8]; */
/*     	float f; */
/*     	double d; */
/*     	int64_t l; */
/*     	uint64_t ul; */
/*     	int i; */
/*     	uint32_t ui; */
/*     	short s; */
/*     	uint16_t us; */
/*     }map; */
/*     int64_t i64; */
/* 	getargs(&ep, 5,","); */
/* 	if(!(argc==3 || argc==5))error("Syntax"); */
/*     if(argc==5 && !(checkstring(argv[4],"BIG")))error("Syntax"); */
/* 	sret = GetTempStrMemory();									// this will last for the life of the command */
/*     if(checkstring(argv[0],"DOUBLE")){ */
/* 		len=8; */
/* 		map.d=(double)getnumber(argv[2]); */
/*     } else if(checkstring(argv[0],"SINGLE")){ */
/* 		len=4; */
/*     	map.f=(float)getnumber(argv[2]); */
/*     } else { */
/*     	i64=getinteger(argv[2]); */
/*     	if(checkstring(argv[0],"INT64")){ */
/*     		len=8; */
/*     		map.l=(int64_t)i64; */
/*     	} else if( checkstring(argv[0],"INT32")){ */
/*     		len=4; */
/*     		if(i64 > INT_MAX || i64 < INT_MIN)error("Overflow"); */
/*     		map.i=(int32_t)i64; */
/*     	} else if(checkstring(argv[0],"INT16")){ */
/*     		len=2; */
/*     		if(i64 > 32767 || i64 < -32768)error("Overflow"); */
/*     		map.s=(int16_t)i64; */
/*     	} else if(checkstring(argv[0],"INT8")){ */
/*     		len=1; */
/*     		if(i64 > 127 || i64 < -128)error("Overflow"); */
/*     		map.c[0]=(int8_t)i64; */
/*     	} else if(checkstring(argv[0],"UINT64")){ */
/*     		len=8; */
/*     		map.ul=(uint64_t)i64; */
/*     	} else if(checkstring(argv[0],"UINT32")){ */
/*     		len=4; */
/*     		if(i64 > UINT_MAX || i64 < 0)error("Overflow"); */
/*     		map.ui=(uint32_t)i64; */
/*     	} else if(checkstring(argv[0],"UINT16")){ */
/*     		len=2; */
/*     		if(i64 > 65535 || i64 < 0)error("Overflow"); */
/*     		map.us=(uint16_t)i64; */
/*     	} else if(checkstring(argv[0],"UINT8")){ */
/*     		len=1; */
/*     		if(i64 > 255 || i64 < 0)error("Overflow"); */
/*     		map.uc[0]=(uint8_t)i64; */
/*     	} else error("Syntax"); */
/*     } */


/* 	for(j=0;j<len;j++)sret[j]=map.c[j]; */

/*     if(argc==5){ // big endian so swap byte order */
/*     	char k; */
/*     	int m; */
/*     	for(j=0;j<(len>>1);j++){ */
/*     		m=len-j-1; */
/*     		k=sret[j]; */
/*     		sret[j]=sret[m]; */
/*     		sret[m]=k; */
/*     	} */
/*     } */
/*     // convert from c type string but it can contain zeroes */
/*     char *p1, *p2; */
/*     j=len; */
/*     p1 = sret + len; p2 = sret + len - 1; */
/*     while(j--) *p1-- = *p2--; */
/*     *sret = len; */
/* 	targ = T_STR; */
/* } */
 
