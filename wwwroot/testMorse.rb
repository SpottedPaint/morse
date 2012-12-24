require_relative 'Morse'
require "test/unit"
 
class TestMorse < Test::Unit::TestCase
 
	def test_Morse_english?
		assert(true)
		m = Morse.new
		assert(m.english?('a gfjf m'), 'this is english ')
		assert(m.english?('a-m gfjf m.'), 'this is english ')
		assert(!m.english?('.. --'), 'this is morse')
		# potentially tricky strings
		assert(!m.english?('-a gfjf m'), 'this should be considered morse')
		assert(!m.english?('.eqrwrq'), 'this should be considered morse')
		
		assert(m.english?('|.eqrwrq'), 'this should be considered english')
		assert(!m.english?('--- -- eqrwrq'), 'this should be considered morse')
	end
 
	def test_Morse_translate_with_spaces_preserved
		m = Morse.new
		assert(m.translate('Whats the frequency kenneth') != m.translate(m.translate('Whats the frequency kenneth')), 'input should be same as output when morsed and back from english')
		assert('Whats the Frequency Kenneth'.downcase == m.translate(m.translate('Whats the frequency kenneth')), 'input should be same as output when morsed and back from english, but the case will be converted to lower')
		assert('Whats the Frequency Kenneth ?a @.,?!/()&:;=+"$@'.downcase == m.translate(m.translate('Whats the frequency kenneth ?a @.,?!/()&:;=+"$@')), 'input should be same as output when morsed and back from english, with standard non alphanumeric characters preserved')	
	end
	
	def test_Morse_translate_preserving_line_breaks
		m = Morse.new
		assert("Hello
Mum".downcase == m.translate(m.translate('Hello 
Mum')), 'should preserve line breaks')
		
		assert("Adam: Hello Granny, How Are you?
Granny: fine dear
Adam: Dandy".downcase == m.translate(m.translate('Adam: Hello Granny, How Are you?
Granny: fine dear
Adam: Dandy')), 'should preserve line breaks')

		#ideally you would sort this out but Morse isn't really suited to whitespace preservation :)
		#this just pints out the problem
		assert("look a space at the end of the line 
".downcase != m.translate(m.translate('look a space at the end of the line 
')), 'does not currently return spaces at the end of lines')
	end
end