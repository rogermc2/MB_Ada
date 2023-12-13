
#include <stdio.h>
#include <stdlib.h>
#include <ctype.h>

#include <defs.h>

#include "setjmp.h"
#include "Configuration.h"
#include "Commands.h"
#include "MMBasic.h"

int main(void)
{
  char inbuf[] = "Print 1";
  char* p;
  char* tp;
  char* tp2;
  char* op;
  int i;
  DefaultType = T_NBR;

/*   commandtbl[i].type & T_FUN; */
  printf("CommandTable\n");
  for (i = 0; i <  CommandTableSize - 1; i++)
    {
      printf ("%d: ", i);
      printf (" name: %s", commandtbl[i].name);
      printf (", type: %d", commandtbl[i].type);
      printf (", precedence: %d\n", commandtbl[i].precedence);
    }
  printf("\n");
  printf("TokenTable\n");
  for (i=0; i <  TokenTableSize - 1; i++)
    {
      printf ("%d: ", i);
      printf (" name: %s", tokentbl[i].name);
      printf (", type: %d", tokentbl[i].type);
      printf (", precedence: %d\n", tokentbl[i].precedence);
    }
  printf("\n");

  p = inbuf;
  printf("inbuf: %s\n", inbuf);
  printf("p: %s\n", p);
  printf("\n");

  tp2 = p;
  i = 0;
  tp = commandtbl[i].name;
  printf("tp: %s\n", tp);
  printf("\n");

  printf("Check: %d\n", toupper(*tp2) == toupper(*tp));
  printf("\n");
}
