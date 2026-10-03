CC     = gcc
NAME   = guess_my_number
FLAGS  = -Wextra -Wall -Wconversion -Werror
SOURCE = functions.c game.c main.c

all: $(NAME)

$(NAME):
	$(CC) $(FLAGS) $(SOURCE) -o $(NAME)

clean:
	rm -f $(NAME) *.o

run: $(NAME)
	./$(NAME)
