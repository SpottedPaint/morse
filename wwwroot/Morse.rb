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
		"9 "=> "----.",
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
		paragraph.split('\n').each { |sentence|
			sentences << self.words(sentence)
		}
		return sentences.join("n")
	end 
	
	def translateFromEnglish(paragraph)
		paragraph = paragraph.downcase
		sentences = []
		paragraph.split('. ').each { |sentence|
			sentences << self.morseString(sentence)
		}
		return sentences.join("     \n")
	end

	def english?(string)
		if /^[-|.]/.match(string)
			return false
		else
			return true
		end
	end
end

m = Morse.new()
#puts m.englishToMorse('w')
#puts m.morseToEnglish('.--')
#puts m.englishString('.--   ')
#puts m.englishString('.--   .--')
#puts m.translateFromMorse('.--   ')
#puts m.translate('.--   .')


#puts m.translateFromEnglish('hello mum')
#puts m.translateFromMorse(m.translateFromEnglish('hello mum'))
#puts m.englishToMorse('e')

#out = []
#input = "what's the frequency kenneth. 
#Yeah that is weird"
#puts m.translate("e")
