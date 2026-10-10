unit Variables;

interface
const
	NumberOfAttempts = 4;
	BadGuessScore    = 3;
	WinGuessScore    = 12;

	SayTooHigh : array[0..2] of string = (
		 'that''s a bit too high'
		,'that number is too big'
		,'you''ve overshoot it'
	);
	SayTooLow  : array[0..2] of string = (
		 'that''a bit too low'
		,'you are below the target'
		,'that number is too small'
	);
	SayBadGuess: array[0..2] of string = (
		 'Bad guess'
		,'Not quite'
		,'Incorrect'
	);
	SayLetsTry : array[0..2] of string = (
		 'Let''s give it a shot'
		,'Now try and guess it'
		,'Now is your turn to guess'
	);

	SayVictory : array[0..3] of string = (
		 'Hooray'
		,'Bingo'
		,'Fascinating'
		,'Splendid'
	);
	SayWinLine : array[0..2] of string = (
		 'have been victorious'
		,'nailed it'
		,'managed this'
	);
	SayLoss    : array[0..3] of string = (
		 'How sad'
		,'Unfortunatelly'
		,'What a shame'
		,'Oh no'
	);
	SayLossLine: array[0..2] of string = (
		 'couldn''t guess the number'
		,'failed'
		,'didn''t guess'
	);

var
	CurrentScore :integer = 0;
	MaximumScore :integer = 0;
	IsFirstGame  :boolean = true;
	WasVictory   :boolean = false;
	WantToQuit   :boolean = false;

implementation
end.
