Feature: Morse
	In order to translate english to morse
	As a nonSubmariner
	I want to return Morse as a string
	
	Scenario: Who knows
		When I have entered 7 into translator
		Then the morse returned should be "--..." .

	Scenario: A Single Letter
		When I have entered e into translator
		Then the morse returned should be "." .
		
	Scenario: A different Single Letter
		When I have entered f into translator
		Then the morse returned should be "..-." .
		
	Scenario: Deal with Whitespace
		When I have entered   into translator
		Then the morse returned should be "   " .
	
	Scenario: Deal with space between words
		When I have entered f ee into translator
		Then the morse returned should be "..-.         .   ." .
	
	Scenario: Deal with sentences
		When you find a '. ' in input
		Then the morse returned should be "     \n".

