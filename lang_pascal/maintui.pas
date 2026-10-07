Unit	MainTui;

Interface

//Uses
//	Crt;
//	Variables;

procedure SwitchDisplayBuffer;
procedure SwitchDisplayBack;
procedure PromptUserPause;

Implementation

procedure SwitchDisplayBuffer;
begin
	Write(#27'[?1049h');
	Flush(StdOut);
end;

procedure SwitchDisplayBack;
begin
	Write(#27'[?1049l');
	Flush(StdOut);
end;

procedure PromptUserPause;
begin
	WriteLn;
	Write('Press <Enter> to continue...');
	ReadLn;
end;

End.
