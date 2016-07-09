class Sieve
	def initialize(n)
		@collection = Hash.new(0)
		(2..n).each do |num|
			@collection[num] = 0
		end
	end

	def primes
		@collection.each do | k, v |
			if v == 0
				@collection.each do | key, value |
					next if key == k
					@collection[key] = 1 if key % k == 0
				end
			end
		end

		@collection.select { |key, value| value == 0 }.keys
	end
end