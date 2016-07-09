class Prime
	def self.nth(num)
		raise ArgumentError if num == 0
		candidate = 3
		prime_num_arr = [2]
		
		until prime_num_arr.length == num do
			is_prime = true
			
			prime_num_arr.each do |num|
				is_prime = false if candidate % num == 0
				break if candidate % num == 0 
			end
			
			prime_num_arr << candidate if is_prime == true
			candidate += 1
		end
		prime_num_arr.last
	end
end