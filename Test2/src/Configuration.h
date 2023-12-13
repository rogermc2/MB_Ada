/***********************************************************************************************************************
Configuration.h

Include file that contains the configuration details for the Micromite using MMBasic.

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

// The main clock frequency for the chip at bootup, it can be changed by the CPU command
#define CLOCKFREQ     (100000000L)                // This is set in in Configuration Bits.h

#define DEFAULT_CONSOLE         0                   // 0 = SERIAL, 1 = USB
#define CONSOLE_BAUDRATE        38400               // only applies to the serial console

#define nop __asm__ ("NOP")

#define forever 1
#define true  1
#define false   0

// defines for single precision floats
//#define MMFLOAT float
//#define STR_SIG_DIGITS 5                          // number of significant digits to use when converting MMFLOAT to a string

// defines for double precision floats
#define MMFLOAT long double                         // precision of all floating point operations
#define STR_SIG_DIGITS 9                            // number of significant digits to use when converting MMFLOAT to a string
#define FLOAT_ROUNDING_LIMIT 0x7fffff               // used to limit rounding for large numbers in FloatToInt64()
#define powf(a, b) powl(a, b)
#define log10f(a) log10l(a)
#define floorf(a) floorl(a)
#define fabsf(a) fabsl(a)
#define atanf(a) atanl(a)
#define cosf(a) cosl(a)
#define expf(a) expl(a)
#define logf(a) logl(a)
#define sinf(a) sinl(a)
#define sqrtf(a) sqrtl(a)
#define tanf(a) tanl(a)
#define strtod(a, b) _dstrtod(a, b)

#define BOOL_ALREADY_DEFINED

#define MAXVARLEN           32                      // maximum length of a variable name
#define MAXSTRLEN           255                     // maximum length of a string
#define STRINGSIZE          256                     // must be 1 more than MAXSTRLEN.  3 of these buffers are staticaly created
#define MAXERRMSG           48                      // max error msg size (MM.ErrMsg$ is truncated to this)
#define MAXDIM              8                       // maximum nbr of dimensions to an array

#define MAXFORLOOPS         10                      // maximum nbr of nested for-next loops, each entry uses 17 bytes
#define MAXDOLOOPS          10                      // maximum nbr of nested do-loops, each entry uses 12 bytes
#define MAXGOSUB            50                      // maximum nbr of nested gosubs and defined subs/functs, each entry uses 8 bytes
#define MAX_MULTILINE_IF    10                      // maximum nbr of nested multiline IFs, each entry uses 8 bytes
#define MAXTEMPSTRINGS      64                      // maximum nbr of temporary strings allowed, each entry takes up 4 bytes
#define MAXSUBFUN           200                     // maximum nbr of defined subroutines or functions in a program. each entry takes up 4 bytes
#define NBRSETTICKS         4                       // the number of SETTICK interrupts available
#define MAXBLITBUF          8                       // the maximum number of BLIT buffers

#define BREAK_KEY           3                       // the default value (CTRL-C) for the break key.  Reset at the command prompt.

// define the maximum number of arguments to PRINT, INPUT, WRITE, ON, DIM, ERASE, DATA and READ
// each entry uses zero bytes.  The number is limited by the length of a command line
#define MAX_ARG_COUNT       50

// size of the console terminal emulator's screen
#define SCREENWIDTH     80
#define SCREENHEIGHT    24                          // this is the default and it can be changed using the OPTION command

