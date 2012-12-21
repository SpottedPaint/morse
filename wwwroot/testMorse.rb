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
		assert('Whats the Frequency Kenneth a'.downcase == m.translate(m.translate('Whats the frequency kenneth ?a')), 'input should be same as output when morsed and back from english, but non alpha numeric characters will be lost')	
	end
	
	def test_Morse_translate_with_sentences
		m = Morse.new
		# hmm lots of issues
		# not really sure how to deal with this
	
	end
end