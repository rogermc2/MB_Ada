
#include <stdio.h>
#include <stdlib.h>
#include <ctype.h>

#include <defs.h>

#include "setjmp.h"
#include "Configuration.h"
#include "Commands.h"
#include "MMBasic.h"

#define INCLUDE_COMMAND_TABLE
const struct s_tokentbl commandtbl[] = {
    #include "Functions.h"
/*     #include "Commands.h" */
/*     #include "Operators.h" */
 {"", 0, 0, cmd_null}
};
#undef INCLUDE_COMMAND_TABLE

int main(void)
{
  char* p;
  int i;

  printf ("i: %d:\n", i);

}
