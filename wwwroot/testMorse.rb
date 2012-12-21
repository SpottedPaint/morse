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
 

end