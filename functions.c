#include "functions.h"

void lower_case(char *ch)
{
	if (*ch >= 'A' && *ch <= 'Z') *ch += 32;
}
