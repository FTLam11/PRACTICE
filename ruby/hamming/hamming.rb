class Hamming
	def self.compute(s1, s2)
		raise ArgumentError, "Input strands must be the same length" if s1.length != s2.length
		delta = 0

		s1_arr = s1.chars
		s2_arr = s2.chars

		for i in 0..s1.length-1
			delta += 1 if s1_arr[i] != s2_arr[i]
		end

		delta
	end
end

module BookKeeping
	VERSION = 3
end