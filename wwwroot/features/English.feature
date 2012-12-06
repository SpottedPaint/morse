Feature: English
	In order to translate morse to english
	As a nonSubmariner
	I want to return English as a string

Scenario: I given Morse return English
	
	When I enter Morse . into translator
	Then the English returned should be "e" .
	
	When I enter Morse .-- into translator
	Then the English returned should be "w" .
	
	When I enter Morse .   . into translator
	Then the English returned should be "ee" .
	
	When I enter Morse .   .   . into translator
	Then the English returned should be "eee" .
	
	When I enter Morse .   .   .       . into translator
	Then the English returned should be "eee e" .
	
	When I enter Morse .--   ---   ---       -..   ---       -...   --- into translator
	Then the English returned should be "woo do bo" .