#include <stdio.h>
#include "functions.h"
#include "game.h"

#define MAX_ATTEMPTS 7

extern int max_score;
extern const int TAB;
extern const char* PROMPT;

void play_game(int magic_number)
{
	int user_guess;
	int wrong_input;
	int wrong_guess;
	int attempts_left;
	int current_score;
	int have_won;

	wrong_guess   = 0;
	current_score = 0;
	attempts_left = MAX_ATTEMPTS;
	have_won      = 0;

	while (attempts_left > 0)
	{
		wrong_input = 0;
		user_guess  = 0;

		while(!(user_guess >= 1 && user_guess <= 9))
		{
			clear_screen();

			display_header(max_score);
			display_game_menu(current_score,attempts_left);
			prompt_game_menu(wrong_input,wrong_guess);

			scanf(" %d", &user_guess);
			clear_buffer();

			wrong_guess = 0;
			wrong_input = 1;
		}

		attempts_left--;

		if (user_guess == magic_number)
		{
			have_won = 1;
			break;
		}
		else
		{
//			printf("No, it isn't %d! %s\n",user_guess,
//			attempts_left > 0 ? "Try again..." : "How sad.");
			wrong_guess = 1;
			continue;
		}
	}

	if (current_score > max_score)
	{
		max_score = current_score;
	}

	clear_screen();
	display_header(max_score);
	display_game_menu(current_score,attempts_left);

	if (have_won)
	{
		printf("Fascinating! (+5 scores)\n");
		printf("You managed to guess the number %d ",magic_number);
		printf("in only %d attempts!\n",MAX_ATTEMPTS - attempts_left);
	}
	else
	{
		printf("Unfortunatelly, ");
		printf("you couldn't guess the magic number.\n");
		printf("It was %d by the way...\n",magic_number);
	}

//	printf("Your max score is now %d.\n",max_score);

	printf("\n");
	printf("Press <Enter> to continue...\n");
	printf("> ");

	while (getchar() != '\n')
	{
		clear_buffer();
	}
}

void quit_game(int max_score)
{
	printf("%*sYour maximum score: %3.2d\n",TAB,"",max_score);
	printf("%*sGoodbye!\n",TAB,"");
	printf("\n");
}
