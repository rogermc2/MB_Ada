/***********************************************************************************************************************
MMBasic

functions.c

Handles all the functions in MMBasic.

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

#include <math.h>
#include <float.h>
#include <stdlib.h>

#include "Version.h"


/********************************************************************************************************************************************
 basic functions
 each function is responsible for decoding a basic function
 all function names are in the form fun_xxxx() so, if you want to search for the function responsible for the ASC() function look for fun_asc

 There are 4 globals used by these functions:

 char *ep       This is a pointer to the argument of the function
                Eg, in the case of INT(35/7) ep would point to "35/7)"

 fret           Is the return value for a basic function that returns a float

 iret           Is the return value for a basic function that returns an integer

 sret           Is the return value for a basic function that returns a string

 tret           Is the type of the return value.  normally this is set by the caller and is not changed by the function

 ********************************************************************************************************************************************/



// return the absolute value of a number (ie, without the sign)
// a = ABS(nbr)
void fun_abs(void) {
    char *p, *s;
    MMFLOAT f;
    long long int i64;

   
}


// return the ASCII value of the first character in a string (ie, its number value)
// a = ASC(str$)
void fun_asc(void) {
  char *s;
;
}



// return the arctangent of a number in radians
void fun_atn(void) {
 
}



// convert a number into a one character string
// s$ = CHR$(nbr)
void fun_chr(void) {
  int i;

}

// Round numbers with fractional portions up or down to the next whole number or integer.
void fun_cint(void) {

}

// return the cosine of a number in radians
void fun_cos(void) {
 
}


// convert radians to degrees.  Thanks to Alan Williams for the contribution
void fun_deg(void) {
  
}

// Returns the exponential value of a number.
void fun_exp(void) {
 
}

// utility function used by HEX$(), OCT$() and BIN$()
void DoHexOctBin(int base) {
    unsigned long long int i;
    int j = 1;
   
}


// return the hexadecimal representation of a number
// s$ = HEX$(nbr)
void fun_hex(void) {
    DoHexOctBin(16);
}


// return the octal representation of a number
// s$ = OCT$(nbr)
void fun_oct(void) {
    DoHexOctBin(8);
}



// return the binary representation of a number
// s$ = BIN$(nbr)
void fun_bin(void) {
    DoHexOctBin(2);
}



// syntax:  nbr = INSTR([start,] string1, string2)
//          find the position of string2 in string1 starting at start chars in string1
// returns an integer
void fun_instr(void) {
  char *s1 = NULL, *s2 = NULL;
  int start = 0;
  getargs(&ep, 5, ",");

 
  iret = 0;
}



// Truncate an expression to the next whole number less than or equal to the argument.
void fun_int(void) {
  
}


// Truncate a number to a whole number by eliminating the decimal point and all characters
// to the right of the decimal point.
void fun_fix(void) {
 
}



// Return a substring offset by a number of characters from the left (beginning) of the string.
// s$ = LEFT$( string$, nbr )
void fun_left(void) {
  int i;
    char *s;
 
 
}

// Return a substring of ?string$? with ?number-of-chars? from the right (end) of the string.
// s$ = RIGHT$( string$, number-of-chars )
void fun_right(void) {
  int nbr;
  char *s, *p1, *p2;
  getargs(&ep, 3, ",");
 
}

// return the length of a string
// nbr = LEN( string$ )
void fun_len(void) {
 
}

// Return the natural logarithm of the argument 'number'.
// n = LOG( number )
void fun_log(void) {
   
}



// Returns a substring of ?string$? beginning at ?start? and continuing for ?nbr? characters.
// S$ = MID$(s, spos [, nbr])
void fun_mid(void) {
  char *s, *p1, *p2;
  int spos, nbr = 0, i;
  getargs(&ep, 5, ",");                         // the mid position

}

// Return the value of Pi.  Thanks to Alan Williams for the contribution
// n = PI
void fun_pi(void) {
    fret = PI_VALUE;
    targ = T_NBR;
}

// convert degrees to radians.  Thanks to Alan Williams for the contribution
// r = RAD( degrees )
void fun_rad(void) {
    
}


// generate a random number that is greater than or equal to 0 but less than 1
// n = RND()
void fun_rnd(void) {
   
}


// Return the sign of the argument
// n = SGN( number )
void fun_sgn(void) {
  
}



// Return the sine of the argument 'number' in radians.
// n = SIN( number )
void fun_sin(void) {
  
}



// Return the square root of the argument 'number'.
// n = SQR( number )
void fun_sqr(void) {
  
}



// Return the tangent of the argument 'number' in radians.
// n = TAN( number )
void fun_tan(void) {
  
}



// Returns the numerical value of a string.
// n = VAL( string$ )
void fun_val(void) {
  char *p, *t1, *t2;
  
}

//#if !defined(MX170)
void fun_eval(void) {
    char *s, *st, *temp_tknbuf;
                                      // restore the saved token buffer
}


void fun_errno(void) {
    iret = MMerrno;
    targ = T_INT;
}


void fun_errmsg(void) {
   
}

// Returns a string of blank spaces 'number' bytes long.
// s$ = SPACE$( number )
void fun_space(void) {
  int i;

}

// Returns a string in the decimal (base 10) representation of  'number'.
// s$ = STR$( number, m, n, c$ )
void fun_str(void) {
    char *s;

}

// Returns a string 'nbr' bytes long
// s$ = STRING$( nbr,  string$ )
// s$ = STRING$( nbr,  number )
void fun_string(void) {
    int i, j, t = T_NOTYPE;
    void *p;
    
    getargs(&ep, 3, ",");

}

// Returns string$ converted to uppercase characters.
// s$ = UCASE$( string$ )
void fun_ucase(void) {
  char *s, *p;
  int i;

}

// Returns string$ converted to lowercase characters.
// s$ = LCASE$( string$ )
void fun_lcase(void) {
  char *s, *p;
  int i;

 
}


// function (which looks like a pre defined variable) to return the version number
// it pulls apart the VERSION string to generate the number
void fun_version(void){
  char *p;
    
}

// Returns the current cursor position in the line in characters.
// n = POS
void fun_pos(void){
  
}

// Outputs spaces until the column indicated by 'number' has been reached.
// PRINT TAB( number )
void fun_tab(void) {
  int i;
  char *p;
 
}

// get a character from the console input queue
// s$ = INKEY$
void fun_inkey(void){
    int i;
  
}

// used by ACos() and ASin() below
MMFLOAT arcsinus(MMFLOAT x) {
     return 2.0 ;
}


// Return the arcsine (in radians) of the argument 'number'.
// n = ASIN(number)
void fun_asin(void) {
     
}


// Return the arccosine (in radians) of the argument 'number'.
// n = ACOS(number)
void fun_acos(void) {
     
}


// utility function to do the max/min comparison and return the value
// it is only called by fun_max() and fun_min() below.
void do_max_min(int cmp) {
    int i;
    MMFLOAT nbr, f;
   
}


void fun_max(void) {
    do_max_min(1);
}


void fun_min(void) {
    do_max_min(0);
}
