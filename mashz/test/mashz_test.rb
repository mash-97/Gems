require 'minitest/autorun'
require '../lib/mashz.rb'


class Test< Minitest::Test
	def test_basic()
		assert_equal("This Is Test.", "this is test.".titleize())
		assert_equal("THi5 3is A Te*t9", "tHi5 3is A te*t9".titleize())
	end
	
	def test_vowels()
		assert_equal(['i', 'i', 'a', 'e'], "This is a test".vowels())
		assert_equal(['o', 'u', 'e', 'o', 'e'], "you're love".vowels())
		assert_equal(['A', 'a', 'e', 'o', 'I', 'I', 'o', 'u', 'o', 'a', 'E'], "And baby! Let's do IT! I'm your bo7a!E".vowels())
	end
	
	def test_consonants()
		assert_equal(['M', 'y', 'n', 'm', 's'], "My name is!".consonants())
	end
	
	def test_hard()
		assert_equal("Abcd Efg Hij Klkmn O P Qrstuv Wxyz", "abcd efg hij klkmn o p qrstuv wxyz".titleize())
	end
	
end

