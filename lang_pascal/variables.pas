unit Variables;

interface
const
	NumberOfAttempts = 6;
	BadGuessScore    = 3;
	WinGuessScore    = 9;
var
	CurrentScore :integer = 0;
	MaximumScore :integer = 0;
	IsFirstGame  :boolean = true;
	WasVictory   :boolean = false;
	WantToQuit   :boolean = false;

implementation
end.
