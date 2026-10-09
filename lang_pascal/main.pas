program GuessMyNumber;

uses
	Crt,
//	Variables,
	MainTui;
//	Game;

var
//	loop     : boolean;
	UserInput: char;

procedure PromptUserQuit;
begin
	write('>  Do you want to quit? (Yes/No) ');
	read(UserInput);
end;

begin

	SwitchDisplayBuffer;

//	loop := true;

	repeat
		ClearScreen;
		UpdateTermCoords;

		MoveCursorHeader;
		DisplayHeader;

		MoveCursorContent;
		writeln('Hello!');
		writeln('How are you doing?');

		MoveCursorPrompt;
//		PromptUserPause;
		PromptUserQuit;

	until upcase(UserInput) = 'Y';

	SwitchDisplayBack;

end.
