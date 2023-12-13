/* MMBasic  commands.c */

#include "Version.h"
#include "Configuration.h"

void flist(int, int, int);
void clearprog(void);
void execute_one_command(char *p);

// stack to keep track of nested FOR/NEXT loops
struct s_forstack forstack[MAXFORLOOPS + 1];
int forindex;

// stack to keep track of nested DO/LOOP loops
struct s_dostack dostack[MAXDOLOOPS];
int doindex;                                                        // counts the number of nested DO/LOOP loops

// stack to keep track of GOSUBs, SUBs and FUNCTIONs
char *gosubstack[MAXGOSUB];
char *errorstack[MAXGOSUB];
int gosubindex;

char DimUsed = false;                                               // used to catch OPTION BASE after DIM has been used

int TraceOn;                                                        // used to track the state of TRON/TROFF

int OptionErrorSkip;                                                // how to handle an error
int MMerrno;                                                        // the error number
char MMErrMsg[MAXERRMSG];                                           // the error message

void cmd_null(void) {
  // do nothing (this is just a placeholder for commands that have no action)
}

// the PRINT command
void cmd_print(void) {
    char *s, *p;
    MMFLOAT f;
    long long int i64;
    int i, t, fnbr;
    int docrlf;                                                     // this is used to suppress the cr/lf if needed

    docrlf = true;
                             // print the terminating cr/lf unless it has been suppressed
}

// the LET command
// because the LET is implied (ie, line does not have a recognisable command)
// it ends up as the place where mistyped commands are discovered.  This is why
// the error message is "Unknown command"
void cmd_let(void) {
    int t, size;
  
}


void cmd_list(void) {
  char *p;

}


void ListNewLine(int *ListCnt, int all) {
   
}


void  ListProgram(char *p, int all) {
    char b[STRINGSIZE];
    char *pp;
    int ListCnt = 1;

}

void  cmd_run(void) {

}

void  cmd_continue(void) {
   
}


void  cmd_new(void) {
                                                 // jump back to the input prompt
}
void cmd_clear(void) {
   
}

void cmd_goto(void) {
   
}


void cmd_if(void) {
    int r, i, testgoto, testelseif;
    char ss[3];                                                     // this will be used to split up the argument line
    char *p, *tp;
    char *rp = NULL;

  
}


void cmd_else(void) {
    int i;
    char *p, *tp;

   
}



void cmd_end(void) {
                                                 // jump back to the input prompt */
}

#if !defined(LITE)

void cmd_select(void) {
    int i, type;
    char *p, *rp = NULL, *SaveCurrentLinePtr;
    void *v;
  

}


// if we have hit a CASE or CASE ELSE we must search for a END SELECT at this level and resume at that point
void cmd_case(void) {
    int i;
    char *p;

    
}

#endif

void cmd_input(void) {
    char s[STRINGSIZE];
    char *p, *sp, *tp;
    int i, fnbr;               // this is a macro and must be the first executable stmt

}

void cmd_tron(void) {
   
}

void cmd_troff(void) {
    
}



void cmd_trace(void) {
   
}

// FOR command
void cmd_for(void) {
    int i, t, vlen, test;
    char ss[4];                                                     // this will be used to split up the argument line
    char *p, *tp, *xp;
    void *vptr;
    char *vname, vtype;
    static char fortoken, nexttoken;

  
}



void cmd_next(void) {
    int i, vindex, test;
    void *vtbl[MAXFORLOOPS];
    int vcnt;
    char *p;
    
}




void cmd_do(void) {
    int i, whileloop;
    char *p, *tp, *evalp;
    char looptoken, whiletoken;

}




void cmd_loop(void) {
    char *p;
    int tst = 0;                                                    // initialise tst to stop the compiler from complaining
    int i;

    // search the do table looking for an entry with the same program position as this LOOP statement
   
}



void cmd_exitfor(void) {
    
}



void cmd_exit(void) {
   
}


void cmd_error(void) {
    char *s;
    
}


void cmd_randomize(void) {
  int i;
  
}



// this is the Sub or Fun command
// it simply skips over text until it finds the end of it
void cmd_subfun(void) {
    char *p, returntoken, errtoken;
 
}


void cmd_gosub(void) {
    
}


void cmd_return(void) {
    
}


void cmd_endfun(void) {
    
}



void cmd_read(void) {
    int i, len;
    char *p, datatoken, *lineptr = NULL, *x;
    char *vtbl[MAX_ARG_COUNT];
    int vtype[MAX_ARG_COUNT];
    int vsize[MAX_ARG_COUNT];
    int vcnt, vidx;
  

}



void cmd_restore(void) {
   
}

void cmd_lineinput(void) {
    char *vp;
    int i, fnbr;
                                                // convert to a MMBasic string
}



void cmd_on(void) {
    int r;
    char ss[4];                                                     // this will be used to split up the argument line
    char *p;

}


// utility routine used by DoDim() below and other places in the interpreter
// checks if the type has been explicitly specified as in DIM FLOAT A, B, ... etc
char *CheckIfTypeSpecified(char *p, int *type, int AllowDefaultType) {
    char *tp;

    return tp;
}



char *SetValue(char *p, int t, void *v) {
    MMFLOAT f;
    long long int i64;
    char *s, TempCurrentSubFunName[MAXVARLEN + 1];

               // restore the current sub/fun name
    return p;
}



// define a variable
// DIM [AS INTEGER|FLOAT|STRING] var[(d1 [,d2,...]] [AS INTEGER|FLOAT|STRING] [, ..., ...]
// LOCAL also uses this function the routines only differ in that LOCAL can only be used in a sub/fun
void  cmd_dim(void) {
    int i, j, k, type, typeSave, ImpliedType = 0, VIndexSave, StaticVar = false;
    char *p, chSave, *chPosit;
    char VarName[(MAXVARLEN * 2) + 1];
    void *v, *tv;

}


void  cmd_const(void) {
    char *p;
    void *v;
    int i, type;


}


void cmd_erase(void) {
    int i,j,k, len;
    char p[MAXVARLEN + 1], *s, *x;

}


void cmd_auto(void) {

}


/***********************************************************************************************
utility functions used by the various commands
************************************************************************************************/

// utility function used by llist() below
// it copys a command or function honouring the case selected by the user
void strCopyWithCase(char *d, char *s) {
    
}


// list a line into a buffer (b) given a pointer to the beginning of the line (p).
// the returned string is a C style string (terminated with a zero)
// this is used by cmd_list(), cmd_edit() and cmd_xmodem()
char  *llist(char *b, char *p) {
    int i, firstnonwhite = true;
    char *b_start = b;
                                            // terminate the output buffer
        return ++p;

}

void execute_one_command(char *p) {
    int cmd, i;
}
