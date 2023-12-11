
#include <stdio.h>
#include <ctype.h>

int main(void)
{
  char tp[] = {'0' , '2', 'C' , '4','F' , '2', '3' , '4'};
  char* start;
  char* current;
  int i;
  current = tp;
  start = current;

  for (i = 0; i < 8; i++)
    // is this eight hex digits
    {
      if(!isxdigit(tp[i]))
	{
	  printf ("x test %d is not a x digit\n",tp[i]);
	  break;
	}
      else
	printf ("x test %d is a x digit\n",tp[i]);

/*       *tp = start; */

      if(isdigit(*tp) && i < 8)
	{   // if it a digit and not an 8 digit hex number (ie, it is CFUNCTION data) then try for a line number
	  printf ("digit test %d: %d is a digit\n", i, *tp);
	}
      else
	printf ("digit test %d: %d is not a digit\n", i, *tp);
    }

  printf ("%d:\n", i, *tp);

}
