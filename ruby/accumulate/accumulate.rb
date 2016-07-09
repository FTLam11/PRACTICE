class Array
	def accumulate
		return [] if self == []
		
		result = []
		i = 0

		while i < self.length 
			result[i] = yield(self[i])
			i += 1
		end
		
		result
	end
end