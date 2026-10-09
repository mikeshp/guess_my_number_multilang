program GuessMyNumber;

uses
//	Crt,
	Game,
	MainTui,
	Variables;

//var
//	UserInput: char;

//procedure PromptUserQuit;
//begin
//	write('>  Do you want to quit? (Yes/No) ');
//	read(UserInput);
//end;

begin

	SwitchDisplayBuffer;

	repeat
		PlayTheGame;

		if IsFirstGame then
		begin
			IsFirstGame := false;
		end;

		repeat
			ClearScreen;
			UpdateTermCoords;

			MoveCursorHeader;
			DisplayHeader;

			MoveCursorPrompt;
			PromptUserPlayAgain;

		until (upcase(UserInput) = 'Y')
		   or (upcase(UserInput) = 'N');

	until upcase(UserInput) = 'N';

	SwitchDisplayBack;

end.
