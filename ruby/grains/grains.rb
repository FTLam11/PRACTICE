class Grains
	def self.square(square_index)
		2**(square_index-1)
	end

	def self.plot_grains_per_square
		grain_map = {}

		(1..64).to_a.each do |num|
			grain_map[num] = square(num)	
		end

		grain_map
	end

	def self.total
		(1..64).to_a.inject { |sum, num| sum += square(num) }
	end
end