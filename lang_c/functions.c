#include <stdio.h>

#include "functions.h"

const int TAB = 0;
const char* PROMPT = ">>";

/*** Supplemental Procedures ***/

char to_upper_char(char ch)
{
	if (ch >= 'a' && ch <= 'z')
	{
		ch = ch - 32;
	}

	return ch;
}

void clear_buffer()
{
	int cl;
	while ((cl = getchar()) != '\n' && cl != EOF);
}

void clear_screen()
{
	printf("\e[2J\e[H");
	fflush(stdout);
}

/*** UI Procedures ***/

void display_header(int max_score)
{
	/* Header */

	printf("%s\n","===========================");
	printf("%s\n","= * * * * * * * * * * * * =");
	printf("%s\n","= *   Guess My Number   * =");
	printf("%s%-3.2d%s\n","= *  Maximum Score: ",max_score," * =");
}

void display_main_menu()
{
	/* Menu */
	printf("%s\n","= *                     * =");
	printf("%s\n","= *      P - Play       * =");
	printf("%s\n","= *      Q - Quit       * =");
	printf("\n");
}

void prompt_main_menu(int wrong_input)
{
	/* Prompt */

	printf("%*s%s:\n",TAB,"",(wrong_input)
	? "Wrong input, try again"
	: "Enter your choice");
	printf("%s ",PROMPT);
}

void display_game_menu(int current_score, int attempts_left)
{
	/* Game Scores */

	printf("%s\n","= *                     * =");
	printf("%s%3.2d%s\n","= *  Current Score:",current_score,"  * =");
	printf("%s%3d%s\n","= *  Attempts Left:",attempts_left,"  * =");
	printf("\n");
}

void prompt_game_menu(int wrong_input, int wrong_guess)
{
	/* Game Prompt */

	printf("%*s%s:\n",TAB,"",
	(wrong_guess)
	? "Wrong guess! (-1 score)" :
	(wrong_input)
	? "Wrong input, try again"
	: "Your guess (1-9)");
	printf("%s ",PROMPT);
}
