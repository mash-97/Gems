class Integer
	@@factorial_hash = Hash.new do 
		|hself, key|
		hself[key] = (key==0 ? 1 : (Math::gamma(key).floor)*key)
	end
	
	def facto
		return @@factorial_hash[self]
	end
	
	def factorial
		(1..self).inject{|x,y| x*y}
	end
	
	def bits
		number = self
		bits = ""
		if(self==0) then return '0' end
		until number==0 do
			bits << (number&1).to_s
			number >>=1
		end
		return bits.reverse
	end
end



class Array
	$Array_strip_voids_desc = 
<<DESC
\tArray@strip_voids()\n
\t--> strips voids (nil or free spaces)
\t--> returns an array by stripping nil or space elements
\t--> strip_voids!() uses O(n^2)
DESC
	
	def strip_voids()
		array = []
		self.each{|element| array << element if not element.to_s.strip.length==0}
		array
	end
	
	def strip_voids!
		indx = 0
		while indx < self.length do
			if self[indx].to_s.strip.length == 0 then
				self.delete(self[indx])
			else
				indx += 1
			end
		end
		
		self
	end
	
	def nprint()
		(0...(self.length-1)).each{|indx| print("#{self[indx]} ")}
		puts(print(self[self.length-1]))
	end
	
end



class String
	def vowels()
		self.scan(/[aeiouAEIOU]/)
	end
	
	def consonants()
		self.scan(/[^aeiouAEIOU\W\d\s]/)
	end
	
	def titleize()
		self.gsub(/(\A|\s)\w/){|letter| letter.upcase}
	end
end

#~ require 'minitest/autorun'
#~ class TestTitleize < Minitest::Test
	#~ def test_basic()
		#~ assert_equal("This Is Test.", "this is test.".titleize())
		#~ assert_equal("THi5 3is A Te*t9", "tHi5 3is A te*t9".titleize())
	#~ end
	
	#~ def test_vowels()
		#~ assert_equal(['i', 'i', 'a', 'e'], "This is a test".vowels())
		#~ assert_equal(['o', 'u', 'e', 'o', 'e'], "you're love".vowels())
		#~ assert_equal(['A', 'a', 'e', 'o', 'I', 'I', 'o', 'u', 'o', 'a', 'E'], "And baby! Let's do IT! I'm your bo7a!E".vowels())
	#~ end
	
	#~ def test_consonants()
		#~ assert_equal(['M', 'y', 'n', 'm', 's'], "My name is!".consonants())
	#~ end
	
	#~ def test_hard()
		#~ assert_equal("Abcd Efg Hij Klkmn O P Qrstuv Wxyz", "abcd efg hij klkmn o p qrstuv wxyz".titleize())
	#~ end
#~ end

	
	
	
		
