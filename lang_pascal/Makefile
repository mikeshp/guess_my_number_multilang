## Makefile for "guess_my_number" version Free Pascal

CC   = fpc
FLGS = -vwnh -vm11030,11031 -Seh -Co -Cr
NAME = guess_my_number_fpc
SRCS = guess_my_number.pas
OBJS = $(SRCS:.pas=.o)

.PHONY: all
all: $(NAME)

$(NAME): $(SRCS)
	mkdir -p .tmp
	$(CC) $(FLGS) $(SRCS) -FU.tmp -o"$(NAME)"

.PHONY: run
run: $(NAME)
	./$(NAME)

.PHONY: clean
clean:
	rm -rf .tmp *.o $(NAME)
