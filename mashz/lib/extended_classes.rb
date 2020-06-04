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


print([1," ", 23, nil, 48, "       ", "  ", nil, 2].strip_voids)
puts
print([1," ", 23, nil, 48, "       ", "  ", nil, 2].strip_voids!)
