class Squares
	def initialize(n)
		@collection = (1..n).to_a
		@collection = [0] if n == 0
	end

	def square_of_sum
		@collection.inject(:+)**2
	end

	def sum_of_squares
		@collection.inject { |sum, element| sum += element**2 }
	end

	def difference
		square_of_sum - sum_of_squares
	end
end

module BookKeeping
	VERSION = 3
end