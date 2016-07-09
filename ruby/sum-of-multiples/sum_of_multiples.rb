class SumOfMultiples
	def initialize(mult_a, mult_b, *mult_c)
		@multiples = [mult_a, mult_b, mult_c].flatten
	end

	def to(target)
		sum = 0

		(0...target).to_a.each do |num|
			@multiples.each do |multiple|
				if num % multiple == 0
					sum += num
					break
				end
			end
		end

		sum
	end
end