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
		out = []
		string.split('').each { |character|
			out << self.englishToMorse(character)
		}
		out.join('   ')
	end
	
	def words(string)
		out = []
		string.split('       ').each { |word|
			out << self.englishString(word)
		}
		out.join(' ')
	end
	
	def englishString(string)
		out = []
		string.split(' ').each { |morseCharacter|
			out << self.morseToEnglish(morseCharacter)
		}
		out.join('')
	end

	def translate(paragraph)
		if self.english? paragraph
			translateFromEnglish(paragraph)
		else
			translateFromMorse(paragraph)
		end
	end
	
	def translateFromMorse(paragraph)
		paragraph = paragraph.gsub(/\+/,' ')
	    sentences = []
		paragraph.split('.-.-       ').each { |sentence|
			sentences << self.words(sentence)
		}
		sentences.join("
")
	end 
	
	def translateFromEnglish(paragraph)
		paragraph = paragraph.downcase
		sentences = []
		paragraph.split("
").each { |sentence|
				sentences << self.morseString(sentence)
		}
		sentences.join(".-.-       ")
	end

	def english?(string)
		if /^[-.]/.match(string)
			false
		else
			true
		end
	end
end
