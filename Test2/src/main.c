//  long int strtol(const char *str, char **endptr, int base)
//  converts the initial part of the string in str to a long int value
//  according to the given base which must be between 2 and 36 inclusive
//  or be the special value 0.
//  endptr is a pointer to the next character after the converted psrt of the string
#include <stdio.h>
#include <stdlib.h>  // for strtol
#include <ctype.h>   // for isxdigit

int main(void)
{
/*   char tp[] = {"C2C4F034"}; */
  char tp[] = {"12C4F03 function"};
  char* p;
  int i;
  p = tp;

  printf ("tp[0]: %d\n", tp[0]);
  for (i = 0; i < 8; i++)
    // is this eight hex digits
    {
      if (!isxdigit(tp[i]))
	{
	  printf ("\nhex test,%d: %d is not a hex digit\n", i, tp[i]);
	  break;
	}
      else
	printf ("hex test %d: %d is a hex digit\n", i, tp[i]);
    }

  printf ("\ni: %d:\n", i);

  if (isdigit (*tp) && i < 8)
    {   // if it is a digit but not an 8 digit hex number
        //  (ie, it is CFUNCTION data) then try for a line number
      printf ("digit test %d: %d is a digit\n", i, *tp);
      // strtol converts a string to a long integer
      // tp is the string containing the representation of
      // an integral number.
      // &tp is the reference to an object of type char* whose value
      // is set by the function to the next character in str
      // after the numerical value.
      // 10 is the base.
      printf ("tp: %d\n", *tp);
      i = strtol(tp, &tp, 10);
      printf ("after strtol i: %dl, tp: %d\n", i, *tp);
    }
  else
    {
      printf ("\n");
      printf ("Either %d is not a digit or i = %d > 7\n\n", *tp, i);
    }

}
