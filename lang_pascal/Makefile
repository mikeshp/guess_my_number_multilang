## Makefile for "guess_my_number" version Free Pascal

CC   = fpc
FLGS = -vwnh -vm11030,11031 -Seh -Co -Cr -Mobjfpc
NAME = guess_my_number_fpc
MAIN = main.pas
SRCS = maintui.pas game.pas gameresolve.pas variables.pas
OBJS = $(SRCS:.pas=.o)

.PHONY: all
all: $(NAME) $(MAIN) $(SRCS)

$(NAME): $(MAIN) $(SRCS)
	mkdir -p .tmp
	$(CC) $(FLGS) $(MAIN) -FU.tmp -o"$(NAME)"

.PHONY: run
run: $(NAME)
	./$(NAME)

.PHONY: clean
clean:
	rm -rf .tmp $(NAME)
