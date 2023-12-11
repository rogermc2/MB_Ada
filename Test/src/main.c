
#include <stdio.h>
#include <ctype.h>

int main(void)
{
  char tp[] = {"C2C4FZ34"};
  char* p;
  int i;
  p = tp;

  for (i = 0; i < 8; i++)
    // is this eight hex digits
    {
      if (!isxdigit(p[i]))
	{
	  printf ("hex test,%d: %d is not a hex digit\n\n", i, p[i]);
	  break;
	}
      else
	printf ("hex test %d: %d is a hex digit\n", i, p[i]);

      if (isdigit (*p) && i < 8)
	{   // if it a digit and not an 8 digit hex number (ie, it is CFUNCTION data) then try for a line number
	  printf ("digit test %d: %d is a digit\n", i, *p);
	}
      else
	{
	  printf ("\n");
	  printf ("digit test %d: %d is not a digit\n\n", i, p);
	}
    }

  printf ("%d:\n", i, *tp);

}
