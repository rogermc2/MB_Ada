
#include "Version.h"

extern int ListCnt;
extern int MMCharPos;

// this is the command table that defines the various tokens for commands in the source code
// most of them are listed in the .h files so you should not add your own here but instead add
// them to the appropriate .h file
#define INCLUDE_COMMAND_TABLE
const struct s_tokentbl commandtbl[] =
{
/*     #include "Functions.h" */
    #include "Commands.h"
/*     #include "Operators.h" */
    { "", 0,  0, cmd_null,    }                   // this dummy entry is always at the end
};

#undef INCLUDE_COMMAND_TABLE
int CommandTableSize =  (sizeof(commandtbl)/sizeof(struct s_tokentbl));

// this is the token table that defines the other tokens in the source code
// most of them are listed in the .h files so you should not add your own here
// but instead add them to the appropriate .h file
#define INCLUDE_TOKEN_TABLE
const struct s_tokentbl tokentbl[] =
{
/*     #include "Functions.h" */
/*     #include "Commands.h" */
    #include "Operators.h"
    { "",   0,  0, cmd_null,    }                   // this dummy entry is always at the end
};
#undef INCLUDE_TOKEN_TABLE
int TokenTableSize =  (sizeof(tokentbl)/sizeof(struct s_tokentbl));


// these are initialised at startup
/* int CommandTableSize, TokenTableSize; */

struct s_vartbl *vartbl;                                            // this table stores all variables
int varcnt;                                                         // number of variables
int VarIndex;                                                       // Global set by findvar after a variable has been created or found
int LocalIndex;                                                     // used to track the level of local variables
char OptionExplicit;                                                // used to force the declaration of variables before their use
char DefaultType;                                                   // the default type if a variable is not specifically typed

char *subfun[MAXSUBFUN];                                            // table used to locate all subroutines and functions
char CurrentSubFunName[MAXVARLEN + 1];                              // the name of the current sub or fun
char CurrentInterruptName[MAXVARLEN + 1];                           // the name of the current interrupt function

jmp_buf mark;                                                       // longjump to recover from an error and abort
jmp_buf ErrNext;                                                    // longjump to recover from an error and continue
char inpbuf[STRINGSIZE];                                            // used to store user keystrokes until we have a line
char tknbuf[STRINGSIZE];                                            // used to store the tokenised representation of the users input line

int NextData;                                                       // used to track the next item to read in DATA & READ stmts
char *NextDataLine;                                                 // used to track the next line to read in DATA & READ stmts
int OptionBase;                                                     // track the state of OPTION BASE



///////////////////////////////////////////////////////////////////////////////////////////////
// Global information used by operators and functions
//
int targ;                                                           // the type of the returned value
MMFLOAT farg1, farg2, fret;                                         // the two float arguments and returned value
long long int iarg1, iarg2, iret;                                   // the two integer arguments and returned value
char *sarg1, *sarg2, *sret;                                         // the two string arguments and returned value

////////////////////////////////////////////////////////////////////////////////////////////////
// Global information used by functions
// functions use targ, fret and sret as defined for operators (above)
char *ep;                                                           // pointer to the argument to the function terminated with a zero byte.
// it is NOT trimmed of spaces

////////////////////////////////////////////////////////////////////////////////////////////////
// Global information used by commands
//
int cmdtoken;                                                // Pointer to the current line (used in error reporting)
char *ContinuePoint;                                                // Where to continue from if using the continue statement


/////////////////////////////////////////////////////////////////////////////////////////////////
// Functions only used within MMBasic.c
//
void getexpr(char *);
void checktype(int *, int);
char *getvalue(char *p, MMFLOAT *fa, long long int *ia, char **sa, int *oo, int *ta);

char tokenTHEN, tokenELSE, tokenGOTO, tokenEQUAL, tokenTO, tokenSTEP, tokenWHILE, tokenUNTIL, tokenGOSUB, tokenAS, tokenFOR;
char cmdIF, cmdENDIF, cmdEND_IF, cmdELSEIF, cmdELSE_IF, cmdELSE, cmdSELECT_CASE, cmdCASE, cmdCASE_ELSE, cmdEND_SELECT;
char cmdSUB, cmdFUN, cmdCFUN, cmdCSUB, cmdIRET;

/********************************************************************************************************************************************
  Program management
  Includes the routines to initialise MMBasic, start running the interpreter, and to run a program in memory
  *********************************************************************************************************************************************/

// Initialise MMBasic
void  InitBasic(void) {
  DefaultType = T_NBR;
  CommandTableSize =  (sizeof(commandtbl)/sizeof(struct s_tokentbl));
  TokenTableSize =  (sizeof(tokentbl)/sizeof(struct s_tokentbl));

  ClearProgram();

  // load the commonly used tokens
  // by looking them up once here performance is improved considerably
  tokenTHEN  = GetTokenValue("Then");
  tokenELSE  = GetTokenValue("Else");
  tokenGOTO  = GetTokenValue("GoTo");
  tokenEQUAL = GetTokenValue("=");
  tokenTO    = GetTokenValue("To");
  tokenSTEP  = GetTokenValue("Step");
  tokenWHILE = GetTokenValue("While");
  tokenUNTIL = GetTokenValue("Until");
  tokenGOSUB = GetTokenValue("GoSub");
  tokenAS    = GetTokenValue("As");
  tokenFOR   = GetTokenValue("For");

  cmdIF      = GetCommandValue("If");
  cmdENDIF   = GetCommandValue("EndIf");
  cmdEND_IF  = GetCommandValue("End If");
  cmdELSEIF  = GetCommandValue("ElseIf");
  cmdELSE_IF = GetCommandValue("Else If");
  cmdELSE    = GetCommandValue("Else");
#if !defined(LITE)
  cmdSELECT_CASE = GetCommandValue("Select Case");
  cmdCASE        = GetCommandValue("Case");
  cmdCASE_ELSE   = GetCommandValue("Case Else");
  cmdEND_SELECT  = GetCommandValue("End Select");
#endif
  cmdSUB = GetCommandValue("Sub");
  cmdFUN = GetCommandValue("Function");
#if !defined(DOS)
  cmdIRET = GetCommandValue("IReturn");
#endif
#if defined(MICROMITE)
  cmdCFUN = GetCommandValue("CFunction");
  cmdCSUB = GetCommandValue("CSub");
#endif
}

// run a program
// this will continuously execute a program until the end (marked by TWO zero chars)
// the argument p must point to the first line to be executed
void ExecuteProgram(char *p) 
{
  int i, SaveLocalIndex = 0;
}

/********************************************************************************************************************************************
  Code associated with processing user defined subroutines and functions
  ********************************************************************************************************************************************/

// Scan through the program loaded in flash and build a table pointing to the definition of all user defined subroutines and functions.
// This pre processing speeds up the program when using defined subroutines and functions
// this routine also looks for embedded fonts and adds them to the font table
void  PrepareProgram(int ErrAbort) {
  int  PrepareProgramExt(char *, int, unsigned char **, int);
  int i, j, NbrFuncts;
  char *p1, *p2;
}

// This scans one area (main program or the library area) for user defined subroutines and functions.
// It is only used by PrepareProgram() above.
int  PrepareProgramExt(char *p, int i, unsigned char **CFunPtr, int ErrAbort) {
  unsigned int *cfp;
  
  return i;
}

// searches the subfun[] table to locate a defined sub or fun
// returns with the index of the sub/function in the table or -1 if not found
// if type = 0 then look for a sub otherwise a function
int FindSubFun(char *p, int type) {
  char *p1, *p2;
  int i;

  for(i = 0;  i < MAXSUBFUN && subfun[i] != NULL; i++) {
    p2 = subfun[i];                                             // point to the command token
    if(type == 0) {                                             // if it is a sub and we want a fun or vice versa skip this one
      if(!(*p2 == cmdSUB || *p2 == cmdCSUB)) continue;
    } else {
      if(!(*p2 == cmdFUN || *p2 == cmdCFUN)) continue;
    }
    p2++; skipspace(p2);                                        // point to the identifier
    if(toupper(*p) != toupper(*p2)) continue;                   // quick first test
    p1 = p + 1;  p2++;
    while(isnamechar(*p1) && toupper(*p1) == toupper(*p2)) { p1++; p2++; };
    if((*p1 == '$' && *p2 == '$') || (*p1 == '%' && *p2 == '%') || (*p1 == '!' && *p2 == '!') || (!isnamechar(*p1) && !isnamechar(*p2))) return i;          // found it !
  }
  return -1;
}



// This function is responsible for executing a defined subroutine or function.
// As these two are similar they are processed in the one lump of code.
//
// The arguments when called are:
//   isfun    = true if we are executing a function
//   cmd      = pointer to the command name used by the caller (in program memory)
//   index    = index into subfun[i] which points to the definition of the sub or funct
//   fa, i64a, sa and typ are pointers to where the return value is to be stored (used by functions only)
void DefinedSubFun(int isfun, char *cmd, int index, MMFLOAT *fa, long long int *i64a, char **sa, int *typ) {
  char *p, *s, *tp, *ttp, tcmdtoken;
  char *CallersLinePtr, *SubLinePtr = NULL;
  char *argbuf1; char **argv1; int argc1;
  char *argbuf2; char **argv2; int argc2;
  char fun_name[MAXVARLEN + 1];
  int i;
  int ArgType, FunType;
  int *argtype;
  union u_argval {
    MMFLOAT f;                                                  // the value if it is a float
    long long int i;                                            // the value if it is an integer
    MMFLOAT *fa;                                                // pointer to the allocated memory if it is an array of floats
    long long int *ia;                                          // pointer to the allocated memory if it is an array of integers
    char *s;                                                    // pointer to the allocated memory if it is a string
  } *argval;
  int *argVarIndex;

  }


/********************************************************************************************************************************************
  take an input line and turn it into a line with tokens suitable for saving into memory
  ********************************************************************************************************************************************/

//take an input string in inpbuf[] and copy it to tknbuf[] and:
// - convert the line number to a binary number
// - convert a label to the token format
// - convert keywords to tokens
// - convert the colon to a zero char
//the result in tknbuf[] is terminated with double zero chars
// if the arg console is true then do not add a line number

void tokenise(int console)
{
  char *p, *op, *tp;
  int i;
  int firstnonwhite;
  int labelvalid;

}

/********************************************************************************************************************************************
  routines for evaluating expressions
  the main functions are getnumber(), getinteger() and getstring()

// A convenient way of evaluating an expression
// it takes two arguments:
//     p = pointer to the expression in memory (leading spaces will be skipped)
//     t = pointer to the type
//         if *t = T_STR or T_NBR or T_INT will throw an error if the result is not the correct type
//         if *t = T_NOTYPE it will not throw an error and will return the type found in *t
// it returns with a void pointer to a float, integer or string depending on the value returned in *t
// this will check that the expression is terminated correctly and throw an error if not
void *DoExpression(char *p, int *t) {
  static MMFLOAT f;
  static long long int i64;
  static char *s;

  evaluate(p, &f, &i64, &s, t, false);
  if(*t & T_INT) return &i64;
  if(*t & T_NBR) return &f;
  if(*t & T_STR) return s;

  error("Internal fault (sorry)");
  return NULL;                                                    // to keep the compiler happy
}

// evaluate an expression.  p points to the start of the expression in memory
// returns either the float or string in the pointer arguments
// *t points to an integer which holds the type of variable we are looking for
//  if *t = T_STR or T_NBR or T_INT will throw an error if the result is not the correct type
//  if *t = T_NOTYPE it will not throw an error and will return the type found in *t
// this will check that the expression is terminated correctly and throw an error if not.  flags & E_NOERROR will suppress that check
char *evaluate(char *p, MMFLOAT *fa, long long int *ia, char **sa, int *ta, int flags) {
  int o;
  int t = *ta;
  char *s;

  p = getvalue(p, fa, ia, &s, &o, &t);                            // get the left hand side of the expression, the operator is returned in o
  while(o != E_END) p = doexpr(p, fa, ia, &s, &o, &t);            // get the right hand side of the expression and evaluate the operator in o

  // check that the types match and convert them if we can
  if((*ta & T_NBR || *ta & T_INT) && t & T_STR) error("Expected a number");
  if(*ta & T_STR && (t & T_NBR || t & T_INT)) error("Expected a string");
  if(o != E_END) error("Argument count");
  if((*ta & T_NBR) && (t & T_INT)) *fa = *ia;
  if((*ta & T_INT) && (t & T_NBR)) *ia = FloatToInt64(*fa);
  *ta = t;
  *sa = s;

  // check that the expression is terminated correctly
  if(!(flags & E_NOERROR)) {
    skipspace(p);
    if(!(*p == 0 || *p == ',' || *p == ')' || *p == '\''))  error("Expression syntax");
  }
  return p;
}


// evaluate an expression to get a number
MMFLOAT getnumber(char *p) {
  int t = T_NBR;
  MMFLOAT f;
  long long int i64;
  char *s;

  evaluate(p, &f, &i64, &s, &t, false);
  if(t & T_INT) return (MMFLOAT)i64;
  return f;
}


// evaluate an expression and return a 64 bit integer
long long int getinteger(char *p) {
  int t = T_INT;
  MMFLOAT f;
  long long int i64;
  char *s;

  evaluate(p, &f, &i64, &s, &t, false);
  if(t & T_NBR) return FloatToInt64(f);
  return i64;
}



// evaluate an expression and return an integer
// this will throw an error is the integer is outside a specified range
// this will correctly round the number if it is a fraction of an integer
int getint(char *p, int min, int max) {
  long long int i;
  i = getinteger(p);
  if(i < min || i > max) error("% is invalid (valid is % to %)", (int)i, min, max);
  return i;
}

// evaluate an expression to get a string
char *getstring(char *p) {
  int t = T_STR;
  MMFLOAT f;
  long long int i64;
  char *s;

  evaluate(p, &f, &i64, &s, &t, false);
  return s;
}



// evaluate an expression to get a string using the C style for a string
// as against the MMBasic style returned by getstring()
char *getCstring(char *p) {
  char *tp;
  tp = GetTempStrMemory();                                        // this will last for the life of the command
  Mstrcpy(tp, getstring(p));                                      // get the string and save in a temp place
  MtoC(tp);                                                       // convert to a C style string
  return tp;
}



// recursively evaluate an expression observing the rules of operator precedence
char *doexpr(char *p, MMFLOAT *fa, long long int *ia, char **sa, int *oo, int *ta) {
  MMFLOAT fa1, fa2;
  long long int ia1, ia2;
  int o1, o2;
  int t1, t2;
  char *sa1, *sa2;

  TestStackOverflow();                                            // throw an error if we have overflowed the PIC32's stack

  fa1 = *fa;
  ia1 = *ia;
  sa1 = *sa;
  t1 = TypeMask(*ta);
  o1 = *oo;
  p = getvalue(p, &fa2, &ia2, &sa2, &o2, &t2);
  while(1) {
    if(o2 == E_END || tokentbl[o1].precedence <= tokentbl[o2].precedence) {
      if((t1 & T_STR) != (t2 & T_STR)) error("Incompatible types in expression");
      targ = tokentbl[o1].type & (T_NBR | T_INT);
      if(targ == T_NBR) {                                     // if the operator does not work with ints convert the args to floats
	if(t1 & T_INT) { fa1 = ia1; t1 = T_NBR; }           // at this time the only example of this is op_div (/)
	if(t2 & T_INT) { fa2 = ia2; t2 = T_NBR; }
      }
      if(targ == T_INT) {                                     // if the operator does not work with floats convert the args to ints
	if(t1 & T_NBR) { ia1 = FloatToInt64(fa1); t1 = T_INT; }
	if(t2 & T_NBR) { ia2 = FloatToInt64(fa2); t2 = T_INT; }
      }
      if(targ == (T_NBR | T_INT)) {                               // if the operator will work with both floats and ints
	if(t1 & T_NBR && t2 & T_INT) { fa2 = ia2; t2 = T_NBR; } // if one arg is float convert the other to a float
	if(t1 & T_INT && t2 & T_NBR) { fa1 = ia1; t1 = T_NBR; }
      }
      if(!(tokentbl[o1].type & T_OPER) || !(tokentbl[o1].type & t1)) {
	error("Invalid operator");
      }
      farg1 = fa1; farg2 = fa2;                               // setup the float args (incase it is a float)
      sarg1 = sa1; sarg2 = sa2;                               // ditto string args
      iarg1 = ia1; iarg2 = ia2;                               // ditto integer args
      targ = t1;                                              // this is what both args are
      tokentbl[o1].fptr();                                    // call the operator function
      *fa = fret;
      *ia = iret;
      *sa = sret;
      *oo = o2;
      *ta = targ;
      return p;
    }
    // the next operator has a higher precedence, recursive call to evaluate it
    else
      p = doexpr(p, &fa2, &ia2, &sa2, &o2, &t2);
  }
}



// get a value, either from a constant, function or variable
// also returns the next operator to the right of the value or E_END if no operator
char *getvalue(char *p, MMFLOAT *fa, long long int *ia, char **sa, int *oo, int *ta) {
  MMFLOAT f = 0;
  long long int i64 = 0;
  char *s = NULL;
  int t = T_NOTYPE;
  char *tp, *p1, *p2;
  int i;

  TestStackOverflow();                                            // throw an error if we have overflowed the PIC32's stack

  skipspace(p);

  // special processing for the NOT operator
  // just get the next value and invert its logical value
  if(tokenfunction(*p) == op_not) {
    int ro;
    p++; t = T_NOTYPE;
    p = getvalue(p, &f, &i64, &s, &ro, &t);                     // get the next value
    if(t &T_NBR)
      f = (MMFLOAT)((f != 0)?0:1);                            // invert the value returned
    else if(t & T_INT)
      i64 = ((i64 != 0)?0:1);
    else
      error("Expected a number");
    skipspace(p);
    *fa = f;                                                    // save what we have
    *ia = i64;
    *sa = s;
    *ta = t;
    *oo = ro;
    return p;                                                   // return straight away as we already have the next operator
  }

  // special processing for the urinary - operator
  // just get the next value and negate it
  if(tokenfunction(*p) == op_subtract) {
    int ro;
    p++; t = T_NOTYPE;
    p = getvalue(p, &f, &i64, &s, &ro, &t);                     // get the next value
    if(t & T_NBR)
      f = -f;                                                 // negate the MMFLOAT returned
    else if(t & T_INT)
      i64 = -i64;                                             // negate the integer returned
    else
      error("Expected a number");
    skipspace(p);
    *fa = f;                                                    // save what we have
    *ia = i64;
    *sa = s;
    *ta = t;
    *oo = ro;
    return p;                                                   // return straight away as we already have the next operator
  }

  // if a function execute it and save the result
  if(tokentype(*p) & (T_FUN | T_FNA)) {
    int tmp;
    tp = p;
    // if it is a function with arguments we need to locate the closing bracket and copy the argument to
    // a temporary variable so that functions like getarg() will work.
    if(tokentype(*p) & T_FUN) {
      p1 = p + 1;
      p = getclosebracket(p);                                 // find the closing bracket
      p2 = ep = GetTempStrMemory();                           // this will last for the life of the command
      while(p1 != p) *p2++ = *p1++;
    }
    p++;                                                        // point to after the function (without argument) or after the closing bracket
    tmp = targ = TypeMask(tokentype(*tp));                      // set the type of the function (which might need to know this)
    tokenfunction(*tp)();                                       // execute the function
    if((tmp & targ) == 0) error("Internal fault (sorry)");      // as a safety check the function must return a type the same as set in the header
    t = targ;                                                   // save the type of the function
    f = fret; i64 = iret; s = sret;                             // save the result
  }
  // if opening bracket then first evaluate the contents of the bracket
  else if(*p == '(') {
    p++;                                                        // step over the bracket
    p = evaluate(p, &f, &i64, &s, &t, true);                    // recursively get the contents
    if(*p != ')') error("No closing bracket");
    ++p;                                                        // step over the closing bracket
  }
  // if it is a variable or a defined function, find it and get its value
  else if(isnamestart(*p)) {
    // first check if it is terminated with a bracket
    tp = p + 1;
    while(isnamechar(*tp)) tp++;                                // search for the end of the identifier
    if(*tp == '$' || *tp == '%' || *tp == '!') tp++;
    i = -1;
    if(*tp == '(') i = FindSubFun(p, 1);                        // if terminated with a bracket it could be a function
    if(i >= 0) {                                                // >= 0 means it is a user defined function
      char *SaveCurrentLinePtr = CurrentLinePtr;              // in case the code in DefinedSubFun messes with this
      DefinedSubFun(true, p, i, &f, &i64, &s, &t);
      CurrentLinePtr = SaveCurrentLinePtr;
    } else {
      s = (char *)findvar(p, V_FIND);                         // if it is a string then the string pointer is automatically set
      t = TypeMask(vartbl[VarIndex].type);
      if(t & T_NBR) f = (*(MMFLOAT *)s);
      if(t & T_INT) i64 = (*(long long int *)s);
    }
    p = skipvar(p, false);
  }
  // if it is a string constant, return a pointer to that.  Note: tokenise() guarantees that strings end with a quote
  else if(*p == '"') {
    p++;                                                        // step over the quote
    p1 = s = GetTempStrMemory();                                // this will last for the life of the command
    tp = strchr(p, '"');
    while(p != tp) *p1++ = *p++;
    p++;
    CtoM(s);                                                    // convert to a MMBasic string
    t = T_STR;
  }
  // if it is a numeric constant starting with the & character then get its base and convert to an integer
  else if(*p == '&') {
    p++; i64 = 0;
    switch(toupper(*p++)) {
      case 'H':   while(isxdigit(*p)) {
	  i64 = (i64 << 4) | ((toupper(*p) >= 'A') ? toupper(*p) - 'A' + 10 : *p - '0');
	  p++;
	} break;
      case 'O':   while(*p >= '0' && *p <= '7') {
	  i64 = (i64 << 3) | (*p++ - '0');
	} break;
      case 'B':   while(*p == '0' || *p == '1') {
	  i64 = (i64 << 1) | (*p++ - '0');
	} break;
      default:    error("Type prefix");
    }
    t = T_INT;
  }
  // is it an ordinary numeric constant?  get its value if yes
  // a leading + or - might have been converted to a token so we need to check for them also
  else if(isdigit(*p) || *p == '+' || (tokenfunction(*p) == op_subtract) || *p == '-' || (tokenfunction(*p) == op_add) || *p == '+' || *p == '.') {
    char ts[21], *tsp;
    int isi64 = true;
    tsp = ts;

    // copy the first digit of the string to a temporary place
    if(tokenfunction(*p) == op_add) {
      *tsp++ = '+'; p++;
    } else if(tokenfunction(*p) == op_subtract) {
      *tsp++ = '-'; p++;
    } else {
      if(*p == '.') isi64 = false;
      *tsp++ = *p++;
    }

    // now concatenate the remaining digits
    while(((*p >= '0' && *p <= '9') || toupper(*p) == 'E' || *p == '-' || *p == '+' || *p == '.') && (tsp - ts) < 20) {
      if(toupper(*p) == 'E' || *p == '.') isi64 = false;
      *tsp++ = *p++;                                          // copy the string to a temporary place
    }
    *tsp = 0;                                                   // terminate it
    if(isi64) {
      i64 = strtoll(ts, &tsp, 10);                            // and convert to an integer
      t = T_INT;
    } else {
      f = (MMFLOAT)strtod(ts, &tsp);                          // and convert to a MMFLOAT
      t = T_NBR;
    }
  }
  else
    error("Syntax");

  skipspace(p);
  *fa = f;                                                        // save what we have
  *ia = i64;
  *sa = s;
  *ta = t;

  // get the next operator, if there is not an operator set the operator to end of expression (E_END)
  if(tokentype(*p) & T_OPER)
    *oo = *p++ - C_BASETOKEN;
  else
    *oo = E_END;

  return p;
}





// search through program memory looking for a line number. Stops when it has a matching or larger number
// returns a pointer to the T_NEWLINE token or a pointer to the two zero characters representing the end of the program
char *findline(int nbr, int mustfind) {
  char *p;
  int i;

  if(CurrentLinePtr >= ProgMemory + Option.ProgFlashSize)
    p = ProgMemory + Option.ProgFlashSize;
  else
    p = ProgMemory;
  while(1) {
    if(p[0] == 0 && p[1] == 0) {
      i = MAXLINENBR;
      break;
    }

    if(p[0] == T_NEWLINE) {
      p++;
      continue;
    }

    if(p[0] == T_LINENBR) {
      i = (p[1] << 8) | p[2];
      if(mustfind) {
	if(i == nbr) break;
      } else {
	if(i >= nbr) break;
      }
      p += 3;
      continue;
    }

    if(p[0] == T_LABEL) {
      p += p[1] + 2;
      continue;
    }

    p++;
  }
  if(mustfind && i != nbr)
    error("Line number");
  return p;
}


// search through program memory looking for a label.
// returns a pointer to the T_NEWLINE token or throws an error if not found
// non cached version
char *findlabel(char *labelptr) {
  char *p, *lastp = ProgMemory + 1;
  int i;
  char label[MAXVARLEN + 1];

  // first, just exit we have a NULL argument
  if(labelptr == NULL) return NULL;

  // convert the label to the token format and load into label[]
  // this assumes that the first character has already been verified as a valid label character
  label[1] = *labelptr++;
  for(i = 2; ; i++) {
    if(!isnamechar(*labelptr)) break;                           // the end of the label
    if(i > MAXVARLEN ) error("Label too long");                 // too long, not a correctly formed label
    label[i] = *labelptr++;
  }
  label[0] = i - 1;                                               // the length byte

  // point to the main program memory or the library
  if(CurrentLinePtr >= ProgMemory + Option.ProgFlashSize)
    p = ProgMemory + Option.ProgFlashSize;
  else {
    p = ProgMemory;
  }

  // now do the search
  while(1) {
    if(p[0] == 0 && p[1] == 0)                                  // end of the program
      error("Cannot find label");

    if(p[0] == T_NEWLINE) {
      lastp = p;                                              // save in case this is the right line
      p++;                                                    // and step over the line number
      continue;
    }

    if(p[0] == T_LINENBR) {
      p += 3;                                                 // and step over the line number
      continue;
    }

    if(p[0] == T_LABEL) {
      p++;                                                    // point to the length of the label
      if(mem_equal(p, label, label[0] + 1))                   // compare the strings including the length byte
	return lastp;                                       // and if successful return pointing to the beginning of the line
      p += p[0] + 1;                                          // still looking! skip over the label
      continue;
    }

    p++;
  }
}



// returns true if 'line' is a valid line in the program
int IsValidLine(int nbr) {
  char *p;
  p = findline(nbr, false);
  if(*p == T_NEWLINE) p++;
  if(*p == T_LINENBR) {
    if(((p[1] << 8) | p[2]) == nbr) return true;
  }
  return false;
}


// count the number of lines up to and including the line pointed to by the argument
// used for error reporting in programs that do not use line numbers
int  CountLines(char *target) {
  char *p;
  int cnt;

  p = ProgMemory;
  cnt = 0;

  while(1) {
    if(*p == 0xff || (p[0] == 0 && p[1] == 0))                  // end of the program
      return cnt;

    if(*p == T_NEWLINE) {
      p++;                                                 // and step over the line number
      cnt++;
      if(p >= target) return cnt;
      continue;
    }

    if(*p == T_LINENBR) {
      p += 3;                                                 // and step over the line number
      continue;
    }

    if(*p == T_LABEL) {
      p += p[0] + 2;                                          // still looking! skip over the label
      continue;
    }

    if(p++ > target) return cnt;

  }
}



/********************************************************************************************************************************************
  routines for storing and manipulating variables
  ********************************************************************************************************************************************/


// find or create a variable
// the action parameter can be the following (these can be ORed together)
// - V_FIND    a straight forward find, if the variable is not found it is created and set to zero
// - V_NOFIND_ERR    throw an error if not found
// - V_NOFIND_NULL   return a null pointer if not found
// - V_DIM_VAR    dimension an array
// - V_LOCAL   create a local variable
//
// there are four types of variable:
//  - T_NOTYPE a free slot that was used but is now free for reuse
//  - T_STR string variable
//  - T_NBR holds a float
//  - T_INT integer variable
//
// A variable can have a number of characteristics
//  - T_PTR the variable points to another variable's data
//  - T_IMPLIED  the variables type does not have to be specified with a suffix
//  - T_CONST the contents of this variable cannot be changed
//  - T_FUNCT this variable represents the return value from a function
//
// storage of the variable's data:
//      if it is type T_NBR or T_INT the value is held in the variable slot
//      for T_STR a block of memory of MAXSTRLEN size (or size determined by the LENGTH keyword) will be malloc'ed and the pointer stored in the variable slot.
void *findvar(char *p, int action) {
  char name[MAXVARLEN + 1];
  int i, j, size, ifree, nbr, vtype, vindex, namelen, tmp;
  char *s, *x;
  void *mptr;
  int dim[MAXDIM], dnbr;

  }


/********************************************************************************************************************************************
  utility routines
  these routines form a library of functions that any command or function can use when dealing with its arguments
  by centralising these routines it is hoped that bugs can be more easily found and corrected (unlike bwBasic !)
  *********************************************************************************************************************************************/

// take a line of basic code and split it into arguments
// this function should always be called via the macro getargs
//
// a new argument is created by any of the chars in the string delim (not in brackets or quotes)
// with this function commands have much less work to do to evaluate the arguments
//
// The arguments are:
//   pointer to a pointer which points to the string to be broken into arguments.
//   the maximum number of arguments that are expected.  an error will be thrown if more than this are found.
//   buffer where the returned strings are to be stored
//   pointer to an array of strings that will contain (after the function has returned) the values of each argument
//   pointer to an integer that will contain (after the function has returned) the number of arguments found
//   pointer to a string that contains the characters to be used in spiting up the line.  If the first char of that
//       string is an opening bracket '(' this function will expect the arg list to be enclosed in brackets.
void makeargs(char **p, int maxargs, char *argbuf, char *argv[], int *argc, char *delim) {
  char *op;
  int inarg, expect_cmd, expect_bracket, then_tkn, else_tkn;
  char *tp;
                                                       // terminate the last argument
}

// throw an error
// displays the error message and aborts the program
// the message can contain variable text which is indicated by a special character in the message string
//  $ = insert a string at this place
//  @ = insert a character
//  % = insert a number
// the optional data to be inserted is the second argument to this function
// this uses longjump to skip back to the command input and cleanup the stack
void  error(char *msg, ...) {
  char *p, *tp, tstr[STRINGSIZE * 2];
    
}

/**********************************************************************************************
  Routines to convert floats and integers to formatted strings
  These replace the sprintf() libraries with much less flash usage
  **********************************************************************************************/

#define IntToStrBufSize 65

// convert a integer to a string.
// sstr is a buffer where the chars are to be written to
// sum is the number to be converted
// base is the numbers base radix (10 = decimal, 16 = hex, etc)
// if base 10 the number will be signed otherwise it will be unsigned
void IntToStr(char *strr, long long int nbr, unsigned int base) {
  int i, negative;
  unsigned char digit;
  unsigned long long int sum;
  extern long long int llabs (long long int n);

  unsigned char str[IntToStrBufSize];

  if(nbr < 0 && base == 10) {                                     // we can have negative numbers in base 10 only
    nbr = llabs(nbr);
    negative = true;
  } else
    negative = false;

  // this generates the digits in reverse order
  sum = (unsigned long long int) nbr;
  i = 0;
  do {
    digit = sum % base;
    if (digit < 0xA)
      str[i++] = '0' + digit;
    else
      str[i++] = 'A' + digit - 0xA;
    sum /= base;
  } while (sum && i < IntToStrBufSize);

  if(negative) *strr++ = '-';

  // we now need to reverse the digits into their correct order
  for(i--; i >= 0; i--) *strr++ = str[i];
  *strr = 0;
}


// convert an integer to a string padded with a leading character
// p is a pointer to the destination
// nbr is the number to convert (can be signed in which case the number is preceeded by '-')
// padch is the leading padding char (usually a space)
// maxch is the desired width of the resultant string (incl padding chars)
// radix is the base of the number.  Base 10 is signed, all others are unsigned
// Special case (used by FloatToStr() only):
//     if padch is negative and nbr is zero prefix the number with the - sign
void IntToStrPad(char *p, long long int nbr, signed char padch, int maxch, int radix) {
  int i, j;
  char sign, buf[IntToStrBufSize];

  sign = 0; i = 0;
  if((nbr < 0 && radix == 10)|| padch < 0) {                      // if the number is negative or we are forced to use a - symbol
    sign = '-';                                                 // set the sign
    nbr *= -1;                                                  // convert to a positive nbr
    padch = abs(padch);
  } else {
    if(nbr >= 0 && maxch < 0 && radix == 10)                    // should we display the + sign?
      sign = '+';
  }

  IntToStr(buf, nbr, radix);
  j = abs(maxch) - strlen(buf);                                   // calc padding required
  if(j <= 0)
    j = 0;
  else
    memset(p, padch, abs(maxch));                               // fill the buffer with the padding char
  if(sign != 0) {                                                 // if we need a sign
    if(j == 0) j = 1;                                           // make space if necessary
    if(padch == '0')
      p[0] = sign;                                            // for 0 padding the sign is before the padding
    else
      p[j - 1] = sign;                                        // for anything else the padding is before the sign
  }
  strcpy(&p[j], buf) ;
}


// convert a float to a string including scientific notation if necessary
// p is the buffer to store the string
// f is the number
// m is the nbr of chars before the decimal point (if negative print the + sign)
// n is the nbr chars after the point
//     if n == STR_AUTO_PRECISION we should automatically determine the precision
//     if n is negative always use exponential format
// ch is the leading pad char
void FloatToStr(char *p, MMFLOAT f, int m, int n, unsigned char ch) {
  int exp, trim = false, digit;
  MMFLOAT rounding;
  char *pp;

  ch &= 0x7f;                                                     // make sure that ch is an ASCII char
  if(f == 0)
    exp = 0;
  else
    exp = floorf(log10f(fabsf(f)));                             // get the exponent part
  if(((fabsf(f) < 0.0001 || fabsf(f) >= 1000000) && f != 0 && n == STR_AUTO_PRECISION) || n < 0) {
    // we must use scientific notation
    f /= powf(10, exp);                                         // scale the number to 1.2345
    if(f >= 10) { f /= 10; exp++; }
    //if(n == STR_AUTO_PRECISION) n = STR_SIG_DIGITS;
    if(n < 0) n = -n;                                           // negative indicates always use exponantial format
    FloatToStr(p, f, m, n, ch);                                 // recursively call ourself to convert that to a string
    p = p + strlen(p);
    *p++ = 'e';                                                 // add the exponent
    if(exp >= 0) {
      *p++ = '+';
      IntToStrPad(p, exp, '0', 2, 10);                        // add a positive exponent
    } else {
      *p++ = '-';
      IntToStrPad(p, exp * -1, '0', 2, 10);                   // add a negative exponent
    }
  } else {
    // we can treat it as a normal number

    // first figure out how many decimal places we want.
    // n == STR_AUTO_PRECISION means that we should automatically determine the precision
    if(n == STR_AUTO_PRECISION) {
      trim = true;
      n = STR_SIG_DIGITS - exp;
      if(n < 0) n = 0;
    }

    // calculate rounding to hide the vagaries of floating point
    if(n > 0)
      rounding = 0.5/powf(10, n);
    else
      rounding = 0.5;
    if(f > 0) f += rounding;                                    // add rounding for positive numbers
    if(f < 0) f -= rounding;                                    // add rounding for negative numbers

    // convert the digits before the decimal point
    if((int)f == 0 && f < 0)
      IntToStrPad(p, 0, -ch, m, 10);                          // convert -0 incl padding if necessary
    else
      IntToStrPad(p, f, ch, m, 10);                           // convert the integer incl padding if necessary
    p += strlen(p);                                             // point to the end of the integer
    pp = p;

    // convert the digits after the decimal point
    if(f < 0) f = -f;                                           // make the number positive
    if(n > 0) {                                                 // if we need to have a decimal point and following digits
      *pp++ = '.';                                            // add the decimal point
      f -= floorf(f);                                         // get just the fractional part
      while(n--) {
	f *= 10;
	digit = floorf(f);                                  // get the next digit for the string
	f -= digit;
	*pp++ = digit + '0';
      }

      // if we do not have a fixed number of decimal places step backwards removing trailing zeros and the decimal point if necessary
      while(trim && pp > p) {
	pp--;
	if(*pp == '.') break;
	if(*pp != '0') { pp++; break; }
      }
    }
    *pp = 0;
  }
}



/**********************************************************************************************
  Various routines to clear memory or the interpreter's state
  **********************************************************************************************/


// clear (or delete) variables
// if level is not zero it will only delete local variables at that level or greater
// if level is zero to will delete all variables and reset global settings
void  ClearVars(int level) {
  int i;

}
// clear all stack pointers (eg, FOR/NEXT stack, DO/LOOP stack, GOSUB stack, etc)
// this is done at the command prompt or at any break
void  ClearStack(void) {
 
}


// clear the runtime (eg, variables, external I/O, etc) includes ClearStack() and ClearVars()
// this is done before running a program
void  ClearRuntime(void) {
  int i;

}



// clear everything including program memory (includes ClearStack() and ClearRuntime())
// this is used before loading a program
void  ClearProgram(void) {
 
}

// round a float to an integer
int FloatToInt32(MMFLOAT x) {
  if(x < LONG_MIN - 0.5 || x > LONG_MAX + 0.5)
    error("Number too large");
  return (x >= 0 ? (int)(x + 0.5) : (int)(x - 0.5)) ;
}

long long int FloatToInt64(MMFLOAT x) {
  if(x < (-(0x7fffffffffffffffLL) -1) - 0.5 || x > 0x7fffffffffffffffLL + 0.5)
    error("Number too large");
  if ((x < -FLOAT_ROUNDING_LIMIT) || (x > FLOAT_ROUNDING_LIMIT))
    return (long long int)(x);
  else
    return (x >= 0 ? (long long int)(x + 0.5) : (long long int)(x - 0.5)) ;
}

// make a string uppercase
void makeupper(char *p) {
  while(*p) {
    *p = toupper(*p);
    p++;
  }
}

// find the value of a command token given its name
int GetCommandValue(char *n)
{
  int i;
  for(i = 0; i < CommandTableSize - 1; i++)
    if(str_equal(n, commandtbl[i].name))
      return i + C_BASETOKEN;
  //    MMPrintString(n);
  error("Internal fault (sorry)");
  return 0;
}

// find the value of a token given its name
int GetTokenValue(char *n) {
  int i;
  for(i = 0; i < TokenTableSize - 1; i++)
    if(str_equal(n, tokentbl[i].name))
      return i + C_BASETOKEN;
  //    MMPrintString(n);
  error("Internal fault (sorry)");
  return 0;
}



// skip to the end of a variable
char *skipvar(char *p, int noerror) {
  char *pp, *tp;
  int i;
  int inquote = false;

  tp = p;
  // check the first char for a legal variable name
  skipspace(p);
  if(!isnamestart(*p)) return tp;

  do {
    p++;
  } while(isnamechar(*p));

  // check the terminating char.
  if(*p == '$' || *p == '%' || *p == '!') p++;

  if(p - tp > MAXVARLEN) {
    if(noerror) return p;
    error("Variable name too long");
  }

  pp = p; skipspace(pp); if(*pp == '(') p = pp;
  if(*p == '(') {
    // this is an array

    p++;
    if(p - tp > MAXVARLEN) {
      if(noerror) return p;
      error("Variable name too long");
    }

    // step over the parameters keeping track of nested brackets
    i = 1;
    while(1) {
      if(*p == '\"') inquote = !inquote;
      if(*p == 0) {
	if(noerror) return p;
	error("Expected closing bracket");
      }
      if(!inquote) {
	if(*p == ')') if(--i == 0) break;
	if(*p == '(' || (tokentype(*p) & T_FUN)) i++;
      }
      p++;
    }
    p++;        // step over the closing bracket
  }
  return p;
}



// skip to the end of an expression (terminates on null, comma, comment or unpaired ')'
char *skipexpression(char *p) {
  int i, inquote;

  for(i = inquote = 0; *p; p++) {
    if(*p == '\"') inquote = !inquote;
    if(!inquote) {
      if(*p == ')') i--;
      if(*p == '(' || (tokentype(*p) & T_FUN)) i++;
    }
    if(i < 0 || (i == 0 && (*p == ',' || *p == '\''))) break;
  }
  return p;
}


// find the next command in the program
// this contains the logic for stepping over a line number and label (if present)
// p is the current place in the program to start the search from
// CLine is a pointer to a char pointer which in turn points to the start of the current line for error reporting (if NULL it will be ignored)
// EOFMsg is the error message to use if the end of the program is reached
// returns a pointer to the next command
char *GetNextCommand(char *p, char **CLine, char *EOFMsg) {
  do {
    if(*p != T_NEWLINE) {                                       // if we are not already at the start of a line
      while(*p) p++;                                          // look for the zero marking the start of an element
      p++;                                                    // step over the zero
    }
    if(*p == 0) {
      if(EOFMsg == NULL) return p;
      error(EOFMsg);
    }
    if(*p == T_NEWLINE) {
      if(CLine) *CLine = p;                                   // and a pointer to the line also for error reporting
      p++;
    }
    if(*p == T_LINENBR) p += 3;

    skipspace(p);
    if(p[0] == T_LABEL) {                                       // got a label
      p += p[1] + 2;                                          // skip over the label
      skipspace(p);                                           // and any following spaces
    }
  } while(*p < C_BASETOKEN);
  return p;
}


// scans text looking for the matching closing bracket
// it will handle nested strings, brackets and functions
// it expects to be called pointing at the opening bracket or a function token
char *getclosebracket(char *p) {
  int i = 0;
  int inquote = false;

  do {
    if(*p == 0) error("Expected closing bracket");
    if(*p == '\"') inquote = !inquote;
    if(!inquote) {
      if(*p == ')') i--;
      if(*p == '(' || (tokentype(*p) & T_FUN)) i++;
    }
    p++;
  } while(i);
  return p - 1;
}


// check that there is no excess text following an element
// will skip spaces and abort if a zero char is not found
void checkend(char *p) {
  skipspace(p);
  if(*p == '\'') return;
  if(*p)
    error("Unexpected text: $", p);
}


// check if the next text in an element (a basic statement) corresponds to an alpha string
// leading white space is skipped and the string must be terminated with a valid terminating
// character (space, null, comma, opening bracket or comment). Returns a pointer a pointer to the next
// non space character after the matched string if found or NULL if not
char *checkstring(char *p, char *tkn) {
  skipspace(p);                                           // skip leading spaces
  while(*tkn && (toupper(*tkn) == toupper(*p))) { tkn++; p++; }   // compare the strings
  if(*tkn == 0 && (*p == ' ' || *p == ',' || *p == '\'' || *p == 0 || *p == '(')) {
    skipspace(p);
    return p;                                                   // if successful return a pointer to the next non space character after the matched string
  }
  return NULL;                                                    // or NULL if not
}



// count the length of a program line excluding the terminating zero byte
// the pointer p must be pointing to the T_NEWLINE token at the start of the line
int GetLineLength(char *p) {
  char *start;
  start = p;
  p++;                                                            // step over the newline token
  if(*p == T_LINENBR) p += 3;                                     // step over a line number
  while(!(p[0] == 0 && (p[1] == 0 || p[1] == T_NEWLINE))) p++;
  return (p - start);
}



/********************************************************************************************************************************************
  A couple of I/O routines that do not belong anywhere else
  *********************************************************************************************************************************************/

// print a string to the console interfaces
void MMPrintString(char* s) {
 
}


// output a string to a file
// the string must be a MMBasic string
void MMfputs(char *p, int filenbr) {
  int i;
  
}


/********************************************************************************************************************************************
  string routines
  these routines form a library of functions for manipulating MMBasic strings.  These strings differ from ordinary C strings in that the length
  of the string is stored in the first byte and the string is NOT terminated with a zero valued byte.  This type of string can store the full
  range of binary values (0x00 to 0xff) in each character.
  *********************************************************************************************************************************************/

// convert a MMBasic string to a C style string
// if the MMstr contains a null byte that byte is skipped and not copied
char *MtoC(char *p) {
  int i;
  char *p1, *p2;
  i = *p;
  p1 = p + 1; p2 = p;
  while(i) {
    if(p1) *p2++ = *p1;
    p1++;
    i--;
  }
  *p2 = 0;
  return p;
}


// convert a c style string to a MMBasic string
char *CtoM(char *p) {
  int len, i;
  char *p1, *p2;
  len = i = strlen(p);
  if(len > MAXSTRLEN) error("String too long");
  p1 = p + len; p2 = p + len - 1;
  while(i--) *p1-- = *p2--;
  *p = len;
  return p;
}


// copy a MMBasic string to a new location
void Mstrcpy(char *dest, char *src) {
  int i;
  i = *src + 1;
  while(i--) *dest++ = *src++;
}



// concatenate two MMBasic strings
void Mstrcat(char *dest, char *src) {
  int i;
  i = *src;
  *dest += i;
  dest += *dest + 1 - i; src++;
  while(i--) *dest++ = *src++;
}


// compare two MMBasic style strings
// returns 1 if s1 > s2  or  0 if s1 = s2  or  -1 if s1 < s2
int Mstrcmp(char *s1, char *s2) {
  register int i;
  register char *p1, *p2;

  // get the smaller length
  i = *s1 < *s2 ? *s1 : *s2;

  // skip the length byte and point to the char array
  p1 = s1 + 1; p2 = s2 + 1;

  // compare each char
  while(i--) {
    if(*p1 > *p2) return 1;
    if(*p1 < *p2) return -1;
    p1++; p2++;
  }
  // up to this point the strings matched - make the decision based on which one is shorter
  if(*s1 > *s2) return 1;
  if(*s1 < *s2) return -1;
  return 0;
}


////////////////////////////////////////////////////////////////////////////////////////////////////
// these library functions went missing in the PIC32 C compiler ver 1.12 and later
////////////////////////////////////////////////////////////////////////////////////////////////////

/*
 * strncasecmp.c --
 *
 *  Source code for the "strncasecmp" library routine.
 *
 * Copyright (c) 1988-1993 The Regents of the University of California.
 * Copyright (c) 1995-1996 Sun Microsystems, Inc.
 *
 * See the file "license.terms" for information on usage and redistribution of
 * this file, and for a DISCLAIMER OF ALL WARRANTIES.
 *
 * RCS: @(#) $Id: strncasecmp.c,v 1.3 2007/04/16 13:36:34 dkf Exp $
 */

/*
 * This array is designed for mapping upper and lower case letter together for
 * a case independent comparison. The mappings are based upon ASCII character
 * sequences.
 */

const static char charmap[] = {
			       0x00, 0x01, 0x02, 0x03, 0x04, 0x05, 0x06, 0x07,
			       0x08, 0x09, 0x0a, 0x0b, 0x0c, 0x0d, 0x0e, 0x0f,
			       0x10, 0x11, 0x12, 0x13, 0x14, 0x15, 0x16, 0x17,
			       0x18, 0x19, 0x1a, 0x1b, 0x1c, 0x1d, 0x1e, 0x1f,
			       0x20, 0x21, 0x22, 0x23, 0x24, 0x25, 0x26, 0x27,
			       0x28, 0x29, 0x2a, 0x2b, 0x2c, 0x2d, 0x2e, 0x2f,
			       0x30, 0x31, 0x32, 0x33, 0x34, 0x35, 0x36, 0x37,
			       0x38, 0x39, 0x3a, 0x3b, 0x3c, 0x3d, 0x3e, 0x3f,
			       0x40, 0x61, 0x62, 0x63, 0x64, 0x65, 0x66, 0x67,
			       0x68, 0x69, 0x6a, 0x6b, 0x6c, 0x6d, 0x6e, 0x6f,
			       0x70, 0x71, 0x72, 0x73, 0x74, 0x75, 0x76, 0x77,
			       0x78, 0x79, 0x7a, 0x5b, 0x5c, 0x5d, 0x5e, 0x5f,
			       0x60, 0x61, 0x62, 0x63, 0x64, 0x65, 0x66, 0x67,
			       0x68, 0x69, 0x6a, 0x6b, 0x6c, 0x6d, 0x6e, 0x6f,
			       0x70, 0x71, 0x72, 0x73, 0x74, 0x75, 0x76, 0x77,
			       0x78, 0x79, 0x7a, 0x7b, 0x7c, 0x7d, 0x7e, 0x7f,
			       0x80, 0x81, 0x82, 0x83, 0x84, 0x85, 0x86, 0x87,
			       0x88, 0x89, 0x8a, 0x8b, 0x8c, 0x8d, 0x8e, 0x8f,
			       0x90, 0x91, 0x92, 0x93, 0x94, 0x95, 0x96, 0x97,
			       0x98, 0x99, 0x9a, 0x9b, 0x9c, 0x9d, 0x9e, 0x9f,
			       0xa0, 0xa1, 0xa2, 0xa3, 0xa4, 0xa5, 0xa6, 0xa7,
			       0xa8, 0xa9, 0xaa, 0xab, 0xac, 0xad, 0xae, 0xaf,
			       0xb0, 0xb1, 0xb2, 0xb3, 0xb4, 0xb5, 0xb6, 0xb7,
			       0xb8, 0xb9, 0xba, 0xbb, 0xbc, 0xbd, 0xbe, 0xbf,
			       0xc0, 0xe1, 0xe2, 0xe3, 0xe4, 0xc5, 0xe6, 0xe7,
			       0xe8, 0xe9, 0xea, 0xeb, 0xec, 0xed, 0xee, 0xef,
			       0xf0, 0xf1, 0xf2, 0xf3, 0xf4, 0xf5, 0xf6, 0xf7,
			       0xf8, 0xf9, 0xfa, 0xdb, 0xdc, 0xdd, 0xde, 0xdf,
			       0xe0, 0xe1, 0xe2, 0xe3, 0xe4, 0xe5, 0xe6, 0xe7,
			       0xe8, 0xe9, 0xea, 0xeb, 0xec, 0xed, 0xee, 0xef,
			       0xf0, 0xf1, 0xf2, 0xf3, 0xf4, 0xf5, 0xf6, 0xf7,
			       0xf8, 0xf9, 0xfa, 0xfb, 0xfc, 0xfd, 0xfe, 0xff,
};


/*
 *----------------------------------------------------------------------
 *
 * strncasecmp --
 *
 *  Compares two strings, ignoring case differences.
 *
 * Results:
 *  Compares up to length chars of s1 and s2, returning -1, 0, or 1 if s1
 *  is lexicographically less than, equal to, or greater than s2 over
 *  those characters.
 *
 * Side effects:
 *  None.
 *
 *----------------------------------------------------------------------
 */


int strncasecmp(
		const char *s1,         /* First string. */
		const char *s2,         /* Second string. */
		size_t length)      /* Maximum number of characters to compare
				     * (stop earlier if the end of either string
				     * is reached). */
{
  register unsigned char u1, u2;

  for (; length != 0; length--, s1++, s2++) {
    u1 = (unsigned char) *s1;
    u2 = (unsigned char) *s2;
    if (charmap[u1] != charmap[u2]) {
      return charmap[u1] - charmap[u2];
    }
    if (u1 == '\0') {
      return 0;
    }
  }
  return 0;
}



// Compare two strings, ignoring case differences.
// Returns true if the strings are equal (ignoring case) otherwise returns false.
int str_equal(const char *s1, const char *s2) {
  if(charmap[*(unsigned char *)s1] != charmap[*(unsigned char *)s2]) return 0;
  for ( ; ; ) {
    if(*s2 == '\0') return 1;
    s1++; s2++;
    if(charmap[*(unsigned char *)s1] != charmap[*(unsigned char *)s2]) return 0;
  }
}


// Compare two areas of memory, ignoring case differences.
// Returns true if they are equal (ignoring case) otherwise returns false.
int mem_equal(char *s1, char *s2, int i) {
  if(charmap[*(unsigned char *)s1] != charmap[*(unsigned char *)s2]) return 0;
  while (--i) {
    if(charmap[*(unsigned char *)++s1] != charmap[*(unsigned char *)++s2])
      return 0;
  }
  return 1;
}



#if defined(DEBUGMODE)

/*
   struct s_vartbl {                               // structure of the variable table
    char name[MAXVARLEN];                       // variable's name
    char type;                                  // its type (T_NUM, T_INT or T_STR)
    char level;                                 // its subroutine or function level (used to track local variables)
    short int dims[MAXDIM];                     // the dimensions. it is an array if the first dimension is NOT zero
    unsigned char size;                         // the number of chars to allocate for each element in a string array
    union u_val {
	MMFLOAT f;                              // the value if it is a MMFLOAT
	long long int i;                        // the value if it is an integer
	MMFLOAT *fa;                            // pointer to the allocated memory if it is an array of floats
	long long int *ia;                      // pointer to the allocated memory if it is an array of integers
	char *s;                                // pointer to the allocated memory if it is a string
    } val;
   };
   extern struct s_vartbl *vartbl;

   extern int varcnt;                              // number of variables defined (eg, largest index into the variable table)
 */

// debug,  dump the variable table
void DumpVarTbl(void) {
  int i;
  dp("idx  name        type level");
  for(i = 0; i < varcnt; i++) {
    char c;
    c = vartbl[i].name[10]; vartbl[i].name[10] = 0;
    dp("%2d: %-10s  %4X  %2d", i, vartbl[i].name, vartbl[i].type, vartbl[i].level);
    vartbl[i].name[10] = c;
  }
}
#endif

