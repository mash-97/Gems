

class Object
	def to_obj
		return eval(self.to_s)
	end
	
	# ....
	def ownself(identifier=nil)
		return self
	end
	
	alias :def :ownself
	alias :class :ownself
	alias :if :ownself
end


