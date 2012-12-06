Feature: MorseOrEnglish
	In order to translate between english and morse
	and vice versa
	I need to know which i'm being passed
	
Scenario: Discover if Morse or English
	When string starts with '.' or '-'
	Then its Morse
	When string does not start with '.' or '-' 
	Then its English