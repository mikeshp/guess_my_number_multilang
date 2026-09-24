#include <stdlib.h>
#include <stdio.h>
#include <time.h>

#include "functions.h"
#include "game.h"

int main()
{
	char input;
	char clear;

	srand(time(NULL));

	do
	{
		printf("P - Play\n");
		printf("Q - Quit\n");

		scanf(" %c", &input);
		while((clear = getchar()) != '\n' && clear != EOF);

		lower_case(&input);

		switch (input)
		{
			case 'p':
				play_game((rand() % 9) + 1);
				break;
			case 'q':
				printf("Goodbye!\n");
				break;
		}
	}
	while (input != 'q');

	return 0;
}
