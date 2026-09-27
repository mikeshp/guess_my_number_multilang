#include <stdlib.h>
#include <stdio.h>
#include <time.h>

#include "functions.h"
#include "game.h"

int main()
{
	srand((unsigned int)time(NULL));

	char user_input;
	int wrong_input;
	int max_score;

	max_score   = 0;
	wrong_input = 0;

	while (to_upper_char(user_input) != 'Q')
	{
		clear_screen();

		display_header();
		display_menu(wrong_input);

		if (scanf(" %c", &user_input) != 1
		|| (to_upper_char(user_input) != 'Q'
		&&  to_upper_char(user_input) != 'P'))
		{
			clear_buffer();
			wrong_input = 1;
			continue;
		}

		clear_buffer();
		wrong_input = 0;

		switch (to_upper_char(user_input))
		{
			case 'P':
				play_game((rand() % 9) + 1);
				break;
			case 'Q':
				quit_game(max_score);
				break;
		}
	}

	return 0;
}
