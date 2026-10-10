unit Game;

interface

uses
	MainTui,
	Variables;

procedure PlayTheGame;
procedure DisplayGameResolve;
procedure DisplayGuess(WasBadGuess:boolean;AttemptsLeft:integer);

implementation

procedure PlayTheGame;
var
	SecretNumber :integer;
	UserInput    :string;
	UserGuess    :integer;
	InputError   :integer;
	AttemptsLeft :integer;
	WasBadGuess  :boolean;
begin
	SecretNumber := random(10) + 1;
	AttemptsLeft := NumberOfAttempts;
	WasBadGuess  := false;
	WasVictory   := false;

	repeat
		ClearScreen;
		UpdateTermCoords;

		MoveCursorHeader;
		DisplayHeader;

		MoveCursorContent;
		DisplayGuess(WasBadGuess,AttemptsLeft);

		if WasBadGuess then WasBadGuess := false;

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
			// Should add high/low check,
			// send it to the feedback
			// to implement reaction
			WasBadGuess  := true;
			CurrentScore -= BadGuessScore;

			if CurrentScore <= 0 then CurrentScore := 0;

			AttemptsLeft := AttemptsLeft - 1;
		end;

	until AttemptsLeft = 0;

	// win/loss resolve, scores

	// back to main loop, game resolve from there
end;

procedure DisplayGuess(WasBadGuess:boolean;AttemptsLeft:integer);
begin
	if WasBadGuess
	then writeln('That was bad guess!')
	else writeln('Now try and guess!');
	writeln('Attempts left:',AttemptsLeft:2);
end;

procedure DisplayGameResolve;
var
	Victory : array[1..4] of string
		= ('Hooray','Bingo','Fascinating','Splendid');
	WinLine : array[1..3] of string
		= ('have been victorious','nailed it','managed this');
	Loss    : array[1..4] of string
		= ('How sad','Unfortunatelly','What a shame','Oh no');
	LossLine: array[1..3] of string
		= ('couldn''t guess the number','failed','didn''t guess');
	i :integer;
	y :integer;
begin
	i := random(4) + 1;
	y := random(3) + 1;

	if WasVictory
	then writeln(Victory[i],', you ',WinLine[y],'!')
	else writeln(Loss[i],', you ',LossLine[y],'.');

	writeln('Your score record is:',MaximumScore:3);

	// Do not prompt here, prompt back in main loop
end;

end.
