
#include <stdio.h>
#include <stdlib.h>
#include <ctype.h>

#include <defs.h>

#include "setjmp.h"
#include "Configuration.h"
#include "Commands.h"
#include "MMBasic.h"

/* #define INCLUDE_COMMAND_TABLE */
/* const struct s_tokentbl commandtbl[] = */
/* { */
/*     #include "Functions.h" */
/*     #include "Commands.h" */
/*     #include "Operators.h" */
/* 	{"", 0, 0, cmd_null} */
/* }; */
/* #undef INCLUDE_COMMAND_TABLE */

int main(void)
{
  char* p;
  int i;
  /*    DefaultType = T_NBR; */
  /*     TokenTableSize =  (sizeof(tokentbl)/sizeof(struct s_tokentbl)); */

  commandtbl[i].type & T_FUN;
  for (i=0; i <  21; i++)
    {
      printf ("i: %d:  ", i);
      printf (",  type: %d", commandtbl[i].type);
      printf (",  name:  %s \n", commandtbl[i].name);
    }
  printf("\n");
}
