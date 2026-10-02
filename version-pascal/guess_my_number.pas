program GuessMyNumber;
uses	crt;

var
	tries	: integer = 0;
	score	: integer = 0;
	number	: integer;
	guess	: integer;
	error	: integer;
	UserInput	: string;
	select	: char;

procedure display_header();
const
	HEAD_LINE = '* * * * * * * * * * * * * *';
	HEAD_HALF = '* * *                 * * *';
begin
	writeln;
	writeln(HEAD_LINE);
	writeln(HEAD_LINE);
	writeln(HEAD_HALF);
	writeln('* * * Guess My Number * * *');
	writeln('* * * from 1 to 10... * * *');
	writeln(HEAD_HALF);
	writeln('* * *    tries:', tries:3, '    * * *');
	writeln('* * *    score:', score:3, '    * * *');
	writeln(HEAD_HALF);
	writeln(HEAD_LINE);
	writeln;
end;

procedure display_main_menu();
begin
	writeln('P - Play');
	writeln('Q - Quit');
	writeln;
	write  ('Enter your choice: ');
	readln (select);
	
end;

procedure display_game_menu();
begin
	if (tries = 0)
	then
		begin
			writeln('Try to guess my number (from 1 to 10)!');
//			writeln('Bad guess will decrease score by 1 and good guess will increase it by 10');
			writeln;
		end
	else
		begin
			if (guess > number)
			then writeln('Too high!..')
			else writeln('Too low!..');
			writeln;
		end;		
end;

procedure display_user_wait;
begin
	writeln;
	writeln('Press <Enter> to continue...');
	readln;
end;

procedure display_game_win();
var
	hooray: array[1..4] of string = ('Hooray', 'Bingo', 'Right', 'Fascinating');
	i: integer = 4;
	s: string = '';
	just: string = 'just ';
begin
	if (tries > 1) then
	begin
		Randomize;
		i := random(3) + 1;
		just := '';
		s := 's';
	end;
	writeln(hooray[i], '! The number was indeed ', number, '!');
	writeln('You guessed it in ', just, tries, ' attempt', s, '!');
end;

begin

	repeat
	
		repeat

			clrscr;
			display_header;
			writeln;
			display_main_menu;
			
		until (select = 'q') or (select = 'Q') or (select = 'P') or (select = 'p');

		if (select = 'P') or (select = 'p') then
		begin

			Randomize;
			number := random(10) + 1;

			repeat
			
				repeat
				
					clrscr;
					display_header;
					writeln;
					display_game_menu;
					writeln;
					write  ('Enter your guess: ');
					readln (UserInput);
					val(UserInput, guess, error);

				until error = 0;

				tries += 1;

				if (guess <> number)
				then score -= 1;
				
			until guess = number;

			score += 5;

			clrscr;
			display_header;
			writeln;
			display_game_win;
			display_user_wait;

			tries := 0;

		end;
			
	until (select = 'q') or (select = 'Q');

end.
