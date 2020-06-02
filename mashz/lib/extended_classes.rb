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
		Array@strip_voids()
		--> strips voids (nil or free spaces)
		--> returns an array by stripping nil or space elements
		--> strip_voids!() uses O(n^2)
DESC
	
	def strip_voids()
		array = []
		self.each{|element| array << element if element.to_s.strip.length==0}
		array
	end
	
	def strip_voids!
		self.each do |element|
			self.delete(element) if element.to_s.strip.length==0
		end
		self
	end
	
	def nprint()
		(0...(self.length-1)).each{|indx| print("#{self[indx]} ")}
		puts(print(self[self.length-1]))
	end
	
end

