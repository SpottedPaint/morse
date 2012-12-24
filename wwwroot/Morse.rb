class Morse
	
	attr_accessor :morseEnglish
	attr_accessor :englishMorse

	def initialize()
		
		@englishMorse = Hash[
			"a" => ".-",
			"b" => "-...",
			"c" => "-.-.",
			"d" => "-..",
			"e" => ".",
			"f" => "..-.",
			"g" => "--.",
			"h" => "....",
			"i" => "..",
			"j" => ".---",
			"k" => "-.-",
			"l" => ".-..",
			"m" => "--",
			"n" => "-.",
			"o" => "---",
			"p" => ".--.",
			"q" => "--.-",
			"r" => ".-.",
			"s" => "...",
			"t" => "-",
			"u" => "..-",
			"v" => "...-",
			"w" => ".--",
			"x" => "-..-",
			"y" => "-.--",
			"z" => "--..",
			"0" => "-----",
			"1" => ".----",
			"2" => "..---",
			"3" => "...--",
			"4" => "....-",
			"5" => ".....",
			"6" => "-....",
			"7" => "--...",
			"8" => "---..",
			"9"=> "----.",
			"." => ".-.-.-",
			"," => "--..--",
			"?" => "..--..",
			"'" => ".----.",
			"!" => "-.-.--",
			"/" => "-..-.",
			"(" => "-.--.",
			")" => "-.--.-",
			"&" => ".-...",
			":" => "---...",
			";" => "-.-.-.",
			"=" => "-...-",
			"+" => ".-.-.",
			"_" => "..--.-",
			'"' => ".-..-.",
			"$" => "...-..-",
			"@" => ".--.-.",
			" " => "   "
		]
		
		@morseEnglish = Hash[
			".-" => "a",
			"-..." => "b",
			"-.-." => "c",
			"-.." => "d",
			"." => "e",
			"..-." => "f",
			"--." => "g",
			"...." => "h",
			".." => "i",
			".---" => "j",
			"-.-" => "k" ,
			".-.." => "l",
			"--" => "m",
			"-." => "n",
			"---" => "o",
			".--." => "p",
			"--.-" => "q",
			".-." => "r",
			"..." => "s",
			"-" => "t",
			"..-" => "u",
			"...-" => "v",
			".--" => "w",
			"-..-" => "x",
			"-.--" => "y",
			"--.." => "z",
			"-----" => "0",
			".----" => "1",
			"..---" => "2",
			"...--" => "3",
			"....-" => "4",
			"....." => "5",
			"-...." => "6",
			"--..." => "7",
			"---.." => "8",
			"----." => "9",
			".-.-.-" => ".",
			"--..--" => ",",
			"..--.." => "?",
			".----." => "'",
			"-.-.--" => "!",
			"-..-." => "/",
			"-.--." => "(",
			"-.--.-" => ")",
			".-..." => "&",
			"---..." => ":",
			"-.-.-." => ";",
			"-...-" => "=",
			".-.-." => "+",
			"..--.-" => "_",
			".-..-." => '"',
			"...-..-" => "$",
			".--.-." => "@",
			" " => "   "
		]
	end
	

	def morseToEnglish(character)
    	@morseEnglish[character]
	end
	
	def englishToMorse(character)
    	@englishMorse[character]
	end

	def morseString(string)
		string.split('').map { |character| self.englishToMorse(character) }.join('   ')
		#out = []
		#	string.split('').each { |character|
		#		out << self.englishToMorse(character)
		#	}
		#	out.join('   ')
	end
	
	def words(string)
		string.split('       ').map { |word| self.englishString(word) }.join(' ')
	end
	
	def englishString(string)
		string.split(' ').map { |morseCharacter| self.morseToEnglish(morseCharacter) }.join('')
	end

	def translate(paragraph)
		if self.english? paragraph
			translateFromEnglish(paragraph)
		else
			translateFromMorse(paragraph)
		end
	end
	
	def translateFromMorse(paragraph)
		paragraph.gsub(/\+/,' ').split('.-.-       ').map { |sentence| self.words(sentence) }.join("
")
	end 
	
	def translateFromEnglish(paragraph)
		paragraph.downcase.split("
").map { |sentence| self.morseString(sentence) }.join(".-.-       ")
	end

	def english?(string)
		if /^[-.]/.match(string)
			false
		else
			true
		end
	end
end
