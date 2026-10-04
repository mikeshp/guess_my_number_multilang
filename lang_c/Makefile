## Makefile for "guess_my_number" version C

CC   = gcc
FLGS = -Wextra -Wall -Wconversion -Werror -Wstrict-prototypes
NAME = guess_my_number_gcc
SRCS = functions.c game.c main.c

.PHONY: all
all: $(NAME)

$(NAME):
	$(CC) $(FLGS) $(SRCS) -o $(NAME)

.PHONY: run
run: $(NAME)
	./$(NAME)

.PHONY: clean
clean:
	rm -f $(NAME) *.o
