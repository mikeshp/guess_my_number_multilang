#include <stdio.h>

#include "functions.h"
#include "game.h"

void play_game(int number)
{
	int  guess = 0;
	char clear;

	while(!(guess >= 1 && guess <= 9))
	{
		printf("Guess my number (1-9):\n");

		scanf(" %d", &guess);
		while((clear = getchar()) != '\n' && clear != EOF);
	}

	if (guess == number)
	{
//		win;
	}
	else
	{
//		loss;
	}
}
