unit Game;

interface

uses
	MainTui,
	Variables;

procedure PlayTheGame;
procedure DisplayGameResolve;
procedure DisplayGuess(WasBadGuess:integer;AttemptsLeft:integer);

implementation

procedure PlayTheGame;
var
	SecretNumber :integer;
	UserInput    :string;
	UserGuess    :integer;
	InputError   :integer;
	AttemptsLeft :integer;
//	WasBadGuess  :boolean;
begin
	SecretNumber := random(10) + 1;
	UserGuess    := SecretNumber;
	AttemptsLeft := NumberOfAttempts;
//	WasBadGuess  := false;
	WasVictory   := false;

	repeat
		ClearScreen;
		UpdateTermCoords;

		MoveCursorHeader;
		DisplayHeader;

		MoveCursorContent;
		DisplayGuess(UserGuess-SecretNumber,AttemptsLeft);

//		if WasBadGuess then WasBadGuess := false;

		MoveCursorPrompt;
		PromptUserGuess;
		readln(UserInput);

		if upcase(UserInput) = 'Q' then
		begin
			WantToQuit := true;
			break;
		end;

		val(UserInput,UserGuess,InputError);

		if (InputError = 0) and (UserGuess = SecretNumber) then
		begin
			WasVictory   := true;
			CurrentScore += WinGuessScore;

			if CurrentScore > MaximumScore
			then MaximumScore := CurrentScore;

			break;
		end
		else
		begin
//			WasBadGuess  := true;
			CurrentScore -= BadGuessScore;

			if CurrentScore <= 0 then CurrentScore := 0;

			AttemptsLeft := AttemptsLeft - 1;
		end;

	until AttemptsLeft = 0;

	// win/loss resolve, scores

	// back to main loop, game resolve from there
end;

procedure DisplayGuess(WasBadGuess:integer;AttemptsLeft:integer);
var
	i :integer;
	y :integer;
begin
	i := random(3);
	y := random(3);

	if      WasBadGuess > 0 then writeln(SayBadGuess[i],', ',SayTooHigh[y],'!')
	else if WasBadGuess < 0 then writeln(SayBadGuess[i],', ',SayTooLow[y],'!')
	else    writeln(SayLetsTry[i],'!');

	writeln('Attempts left:',AttemptsLeft:2);
end;

procedure DisplayGameResolve;
var
	i :integer;
	y :integer;
begin
	i := random(4);
	y := random(3);

	if WasVictory
	then writeln(SayVictory[i],', you ',SayWinLine[y],'!')
	else writeln(SayLoss[i],', you ',SayLossLine[y],'.');

	writeln('Your score record is:',MaximumScore:3);

	// Do not prompt here, prompt back in main loop
end;

end.
