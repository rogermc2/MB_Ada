
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
  char inbuf[] = "Clear Continue Print";
  char* p;
  char* tp;
  char* tp2;
  char* op;
  int i;
  int count = 0;
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

  i = 0;
  tp = commandtbl[i].name;
  printf("p: %s, tp: %s\n", p, tp);
  printf("\n");

  printf("commandtbl loop:\n");
  printf("inbuf: %s\n", p);
  printf("p: %s\n", inbuf);
  /*   for (i = 0; i < CommandTableSize - 1; i++) */
  for (i = 0; i < 4; i++)
    {
      tp2 = p;
      printf("tp2: %s, tp:  %s\n", tp2, tp);

      printf("while:\n");
      while ((toupper(*tp2) == toupper(*tp)) & count < 5)
	{
	  count = count + 1;
	  printf("UC tp2: %c\n", toupper(*tp2));
	  if (*tp == ' ')
	    skipspace (tp2);
	  else
	    tp2++;
	  tp++;

	  if (*tp == '(')
	    skipspace (tp2);
	}  // while
    }  //  end for
  printf("\n");
}
