program GuessMyNumber;

uses
	Game,
	MainTui,
	Variables;

var
	UserInput:char;

begin
	Randomize;
	SwitchDisplayBuffer;

	repeat
		PlayTheGame;

		if IsFirstGame then
		begin
			IsFirstGame := false;
		end;

		if WantToQuit then break;

		repeat
			ClearScreen;
			UpdateTermCoords;

			MoveCursorHeader;
			DisplayHeader;

			MoveCursorContent;
			DisplayGameResolve;

			MoveCursorPrompt;
			PromptUserPlayAgain;
			readln(UserInput);
			// should loop this readln check alone,
			// return cursor to prompt and clear the line,
			// then prompt again. so GameResolve won't trigger

		until (upcase(UserInput) = 'Y')
		   or (upcase(UserInput) = 'N');

	until upcase(UserInput) = 'N';

//	DisplayHallOfFame;
	SwitchDisplayBack;
end.
