#include <stdio.h>

#include "functions.h"
#include "game.h"

void play_game(int magic_number)
{
	int user_guess = 0;
	int wrong_input;

	wrong_input = 0;

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
//		win;
printf("win!\n");
	}
	else
	{
//		loss;
printf("loss!\n");
	}
}
void quit_game(int max_score)
{
	printf("Your maximum score: %3.2d\n",max_score);
	printf("Goodbye!\n");
	printf("\n");
}
