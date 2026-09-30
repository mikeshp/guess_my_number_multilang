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
	int attempts_left;
	int current_score;

	wrong_input   = 0;
	user_guess    = 0;
	current_score = 0;
	attempts_left = MAX_ATTEMPTS;

	while(!(user_guess >= 1 && user_guess <= 9))
	{
		clear_screen();

		display_header(max_score);
		display_game_menu(current_score,attempts_left);
		prompt_game_menu(wrong_input);

		scanf(" %d", &user_guess);
		clear_buffer();

		wrong_input = 1;
	}

//	clear_screen();

	if (user_guess == magic_number)
	{
		/* Update scores and return to main menu */

		current_score = current_score + 10;
		if (current_score > max_score)
		{
			max_score = current_score;
		}

		clear_screen();
		display_header(max_score);
		// left here until separate header blocks from prompts and refactor
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
	printf("%*sYour maximum score: %3.2d\n",TAB,"",max_score);
	printf("%*sGoodbye!\n",TAB,"");
	printf("\n");
}
