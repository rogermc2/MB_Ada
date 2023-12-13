
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

/*   commandtbl[i].type & T_FUN; */
  for (i=0; i <  CommandTableSize - 1; i++)
    {
      printf ("i: %d: ", i);
      printf (" name: %s", commandtbl[i].name);
      printf (", type: %d", commandtbl[i].type);
      printf (", type & T_FUN: %d", commandtbl[i].type & T_FUN);
      printf (", precedence: %d\n", commandtbl[i].precedence);
    }
  printf("\n");
}
