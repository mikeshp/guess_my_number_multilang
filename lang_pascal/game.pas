unit Game;

interface

uses
	MainTui;
//	GameResolve,
//	Variables;

procedure PlayTheGame;

implementation

procedure PlayTheGame;
begin
	ClearScreen;
	UpdateTermCoords;

	MoveCursorHeader;
	DisplayHeader;

	MoveCursorContent;
	writeln('We are so playing!');
	writeln('Yes we are!');

	MoveCursorPrompt;
	PromptUserPause;
end;

end.
