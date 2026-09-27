#include <stdio.h>

#include "functions.h"
#include "game.h"

void play_game(int magic_number)
{
	int user_guess;
	int wrong_input;

	wrong_input = 0;
	user_guess  = 0;

	while(!(user_guess >= 1 && user_guess <= 9))
	{
		clear_screen();

		display_header();
		display_prompt(wrong_input);

		scanf(" %d", &user_guess);
		clear_buffer();

		wrong_input = 1;
	}

	clear_screen();

	if (user_guess == magic_number)
	{
		/* Update scores and return to main menu */
//		win;
		printf("DEBUG: win!\n");
	}
	else
	{
		/* Check attempts, if any left -> play_game again */
		/* If no attempts left -> update scores, back to main menu */
//		loss;
		printf("DEBUG: loss!\n");
	}
}

void quit_game(int max_score)
{
	printf("Your maximum score: %3.2d\n",max_score);
	printf("Goodbye!\n");
	printf("\n");
}
