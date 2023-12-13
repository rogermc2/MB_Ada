
#include "Version.h"

/********************************************************************************************************************************************
 basic operators
 each function is responsible for decoding a basic operator
 all function names are in the form op_xxxx() so, if you want to search for the function responsible for the AND operator look for op_and

 There are 5 globals used by these finctions:

 farg1, farg2   These are the floating point arguments to the operator.  farg1 is the left argument

 sarg1, sarg2   These are the string pointers to the arguments for a the string operator.  sarg1 is the left argument

 fret           Is the return value for a basic operator that returns a float value

 iret           Is the return value for a basic operator that returns an integer

 sret           Is the return value for a basic operator that returns a string

 targ           Is the type of the arguments.  normally this is set by the caller and is not changed by the function

 ********************************************************************************************************************************************/

void op_invalid(void) {
  error("Syntax error");
}

void op_exp(void) {
    long long int i;

}


void op_mul(void) {
    if(targ & T_NBR)
        fret = farg1 * farg2;
    else
        iret = iarg1 * iarg2;
}


// division will always return a float even if given integer arguments
void op_div(void) {
    if(farg2 == 0) error("Divide by zero");
    fret = farg1 / farg2;
    targ = T_NBR;
}


void op_divint(void) {
    if(iarg2 == 0) error("Divide by zero");
    iret = iarg1 / iarg2;
}


void op_add(void) {

}

void op_subtract(void) {
  if(targ & T_NBR)
      fret = farg1 - farg2;
  else
      iret = iarg1 - iarg2;
}

void op_mod(void) {
    if(iarg2 == 0) error("Divide by zero");
    iret = iarg1 % iarg2;
}

long long int compare(void) {
    long long int r;
    MMFLOAT f;
    if(targ & T_NBR) {
      f = farg1 - farg2;
        if(f > 0)
            r = 1;
        else if(f < 0)
            r = -1;
        else
            r = 0;
    }
  else
        if(targ & T_INT)
            r = iarg1 - iarg2;
        else
            r = Mstrcmp(sarg1, sarg2);
     targ = T_INT;                                                  // always return an float, even if the args are string
     return r;
}


void op_ne(void) {
    if(targ & T_INT)
        iret = iarg1 != iarg2;
    else
        iret = (compare() != 0);
}



void op_gte(void) {
    iret = (compare() >= 0);
}


void op_lte(void) {
    iret = (compare() <= 0);
}


void op_lt(void) {
    iret = (compare() < 0);
}


void op_gt(void) {
    iret = (compare() > 0);
}


void op_equal(void) {
    if(targ & T_INT)
        iret = iarg1 == iarg2;
    else
        iret = (compare() == 0);
}


void op_shiftleft(void) {
    iret = (long long int)((unsigned long long int)iarg1 << (long long int)iarg2);
}


void op_shiftright(void) {
    iret = (long long int)((unsigned long long int)iarg1 >> (long long int)iarg2);
}


void op_and(void) {
    iret = (long long int)((unsigned long long int)iarg1 & (unsigned long long int)iarg2);
}


void op_or(void) {
    iret = (long long int)((unsigned long long int)iarg1 | (unsigned long long int)iarg2);
}


void op_xor(void) {
    iret = (long long int)((unsigned long long int)iarg1 ^ (unsigned long long int)iarg2);
}


void op_not(void){
  // don't do anything, just a place holder
  error("Syntax error");
}

