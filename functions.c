#include <stdio.h>

#include "functions.h"

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

void display_header()
{
	/* Header */

	printf("%s\n","=======================");
	printf("%s\n","= * Guess My Number * =");
	printf("%s\n","= *                 * =");
}

void display_menu(int wrong_input)
{
	/* Menu */

	printf("%s\n","= *                 * =");
	printf("%s\n","= *    P - Play     * =");
	printf("%s\n","= *    Q - Quit     * =");
	printf("\n");

	/* Prompt */

	printf(">> %s: ", (wrong_input)
	? "Wrong input, try again"
	: "Enter your choice");
}

void display_prompt(int wrong_input)
{
	/* Game Scores */

	printf("%s\n","= *                 * =");
	printf("%s\n","= * Score:          * =");
	printf("%s\n","= * Attempts:       * =");
	printf("\n");

	/* Game Prompt */

	printf(">> %s: ", (wrong_input)
	? "Wrong input, try again"
	: "Your guess (1-9)");
}
