
package Configuration is

--  The main clock frequency for the chip at bootup, it can be changed by the CPU command
 CLOCKFREQ        : Long_Integer := 100000000;  --  This is set in in Configuration Bits.h

 DEFAULT_CONSOLE  : Natural := 0;      --  0 = SERIAL, 1 = USB
 CONSOLE_BAUDRATE : Natural := 38400;  --  only applies to the serial console

--   nop __asm__ ("NOP")

--  defines for double precision floats
 subtype MMFLOAT is Long_Float;              --  precision of all floating point operations
 STR_SIG_DIGITS   : constant Integer := 9;   --  number of significant digits to use when converting MMFLOAT to a string
--   FLOAT_ROUNDING_LIMIT 0x7fffff           --  used to limit rounding for large numbers in FloatToInt64()

 MAXVARLEN        : constant Integer := 32;   --  maximum length of a variable name
 MAXSTRLEN        : constant Integer := 255;  --  maximum length of a string
 STRINGSIZE       : constant Integer := 256;  --  must be 1 more than MAXSTRLEN.  3 of these buffers are staticaly created
 MAXERRMSG        : constant Integer := 48;   --  max error msg size (MM.ErrMsg$ is truncated to this)
 MAXDIM           : constant Integer := 8;    --  maximum nbr of dimensions to an array

 MAXFORLOOPS      : constant Integer := 10;   --  maximum nbr of nested for-next loops, each entry uses 17 bytes
 MAXDOLOOPS       : constant Integer := 10;   --  maximum nbr of nested do-loops, each entry uses 12 bytes
 MAXGOSUB         : constant Integer := 50;   --  maximum nbr of nested gosubs and defined subs/functs, each entry uses 8 bytes
 MAX_MULTILINE_IF : constant Integer := 10;   --  maximum nbr of nested multiline IFs, each entry uses 8 bytes
 MAXTEMPSTRINGS   : constant Integer := 64;   --  maximum nbr of temporary strings allowed, each entry takes up 4 bytes
 MAXSUBFUN        : constant Integer := 200;  --  maximum nbr of defined subroutines or functions in a program. each entry takes up 4 bytes
 NBRSETTICKS      : constant Integer := 4;    --  the number of SETTICK interrupts available
 MAXBLITBUF       : constant Integer := 8;    --  the maximum number of BLIT buffers

 BREAK_KEY        : constant Integer := 3;    --  the default value (CTRL-C) for the break key.  Reset at the command prompt.

--  define the maximum number of arguments to PRINT, INPUT, WRITE, ON, DIM, ERASE, DATA and READ
--  each entry uses zero bytes.  The number is limited by the length of a command line
 MAX_ARG_COUNT    : constant Integer := 50;

--  size of the console terminal emulator's screen
 SCREENWIDTH      : constant Integer := 80;
 SCREENHEIGHT     : constant Integer := 24;       --  this is the default and it can be changed using the OPTION command

end Configuration;
