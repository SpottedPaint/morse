class Morse
	# TODO: add prosigns? http://en.wikipedia.org/wiki/Prosigns_for_Morse_code
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
    	return @morseEnglish[character]
	end
	
	def englishToMorse(character)
    	return @englishMorse[character]
	end

	def morseString(string)
		out = []
		string.split('').each { |character|
			out << self.englishToMorse(character)
		}
		return out.join('   ')
	end
	
	def words(string)
		out = []
		string.split('       ').each { |word|
			out << self.englishString(word)
		}
		return out.join(' ')
	end
	
	def englishString(string)
		out = []
		#string = string.gsub(/(\s){3}/,'  ')
		string.split(' ').each { |morseCharacter|
			out << self.morseToEnglish(morseCharacter)
		}
		return out.join('')
	end

	def translate(paragraph)
		if self.english? paragraph
			return translateFromEnglish(paragraph)
		else
			return translateFromMorse(paragraph)
		end
	end
	
	def translateFromMorse(paragraph)
		paragraph = paragraph.gsub(/\+/,' ')
	    sentences = []
		paragraph.split('.-.-       ').each { |sentence|
			sentences << self.words(sentence)
		}
		return sentences.join("
")
	end 
	
	def translateFromEnglish(paragraph)
		paragraph = paragraph.downcase
		sentences = []
		paragraph.split("
").each { |sentence|
				sentences << self.morseString(sentence)
		}
		return sentences.join(".-.-       ")
		
	end

	def english?(string)
		if /^[-.]/.match(string)
			return false
		else
			return true
		end
	end
end
