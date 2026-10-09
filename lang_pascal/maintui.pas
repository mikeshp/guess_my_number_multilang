unit MainTui;

interface

uses
	Crt,
	BaseUnix,
	Variables;

procedure SwitchDisplayBuffer;
procedure SwitchDisplayBack;
procedure PromptUserPause;
procedure PromptUserPlayAgain;
procedure ClearScreen;
procedure UpdateTermCoords;
procedure MoveCursorHeader;
procedure MoveCursorContent;
procedure MoveCursorPrompt;
procedure InfoWindowSize;
procedure InfoGameHeader;
procedure InfoGameRules;
procedure InfoGameScores;
procedure DisplayHeader;
procedure FillTheLine(symbol:char);

implementation

const
	AltBufferOn   = #27'[?1049h';
	AltBufferOff  = #27'[?1049l';
	Tab           = #9;
	PromptTab     = '>  ';
	GapHeader     = 0;
	GapContent    = 3;
	GapPrompt     = 0;
	IndentHeader  = 0;
	IndentContent = 0;
	IndentPrompt  = 0;

var
	MaxTermX   :integer;
	MaxTermY   :integer;
	RowHeader  :integer;
	ColHeader  :integer;
	RowContent :integer;
	ColContent :integer;
	RowPrompt  :integer;
	ColPrompt  :integer;

procedure UpdateTermCoords;
begin
	// Apparently CRT will cache its globals
	// hence won't recalculate on window resize
	MaxTermX   := ScreenWidth;
	MaxTermY   := ScreenHeight;

	RowHeader  := 1 + GapHeader;
	ColHeader  := 1 + IndentHeader;

	RowContent := MaxTermY - GapContent;
	ColContent := 1 + IndentContent;

	RowPrompt  := MaxTermY - GapPrompt;
	ColPrompt  := 1 + IndentPrompt;
end;

procedure InfoWindowSize;
begin
	writeln('Window Width: ',MaxTermX,Tab,'Window Height: ',MaxTermY);
end;

procedure MoveCursorContent;
begin
	gotoxy(ColContent,RowContent);
end;

procedure MoveCursorHeader;
begin
	gotoxy(ColHeader,RowHeader);
end;

procedure MoveCursorPrompt;
begin
	gotoxy(ColPrompt,RowPrompt);
end;

procedure ClearScreen;
begin
//	write(#27'[2J');
//	flush(stdout);
	clrscr;
end;

procedure SwitchDisplayBuffer;
begin
//	write(#27'[?1049h');
//	flush(stdout);
	fpwrite(1,pchar(AltBufferOn),length(AltBufferOn));
end;

procedure SwitchDisplayBack;
begin
//	write(#27'[?1049l');
//	flush(stdout);
	fpwrite(1,pchar(AltBufferOff),length(AltBufferOff));
end;

procedure PromptUserPause;
begin
//	writeln;
	write(PromptTab,'Press any key to continue... ');
//	write('Press <Enter> to continue...');
//	readln;
	readkey;
end;

procedure PromptUserPlayAgain;
begin
	write(PromptTab,'Do you want to play again? (Y/n) ');
	read(UserInput);
end;

procedure DisplayHeader;
begin
	InfoGameHeader;
	FillTheLine('.');
	InfoGameRules;
	FillTheLine('.');
//	InfoWindowSize;
//	FillTheLine('.');
	InfoGameScores;
end;

procedure InfoGameHeader;
begin
	writeln('Guess My Number!');
	writeln('Written in Free Pascal.');
end;

procedure InfoGameScores;
begin
	writeln('Current Scores:',CurrentScore:3,Tab,'Total Scores:',TotalScore:3);
end;

procedure InfoGameRules;
begin
	writeln('You must guess a secret number, from 1 to 10.');
	writeln('You have only ',NumberOfAttempts,' attempts!');
	writeln('For every wrong attempt you''re charged ',BadGuessScore,' scores.');
	writeln('For the correct guess you get plus ',WinGuessScore,' scores.');
end;

procedure FillTheLine(symbol:char);
var
	i:integer;
begin
	for i:=1 to MaxTermX-1 do
	begin
		write(symbol);
	end;
	writeln;
end;

end.
