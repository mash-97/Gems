class Time
	def plus_mins(minutes)
		self + (minutes*60)
	end
	def plus_hours(hours)
		self + (60*60*hours)
	end
	def plus_days(days)
		self + (60*60*24*days)
	end
end
