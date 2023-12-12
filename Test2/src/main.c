#include <stdio.h>
#include <stdlib.h>
#include <ctype.h>

#include "functions.h"

int main(void)
{
  const struct s_tokentbl commandtbl[] = {
    #include "Functions.h"
    {"", 0, 0, cmd_null}
  };
  char* p;
  int i;

  printf ("i: %d:\n", i);

}
