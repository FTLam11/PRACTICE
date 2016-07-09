class Raindrops
	def self.convert(num)
		output = ""
		prime_factors(num, result = []).uniq.each do |factor|
			case factor
				when 3
					output.concat('Pling')
				when 5
					output.concat('Plang')
				when 7
					output.concat('Plong')
			end
		end
		output = output + "#{num}" if output == ""
		output
	end

	def self.prime_factors(num, result = [])
		counter = 2
		return result if num == 1
		while counter <= num do
			if num % counter == 0
				result << counter
				quotient = num / counter
				break
			else
				counter += 1
			end
		end
		prime_factors(quotient, result)
	end
end

module BookKeeping
	VERSION = 2
end