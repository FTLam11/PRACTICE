class PrimeFactors
  def self.for(num)
    prime_factors = Array.new
    test_factor = 2
    
    while num != 1 do
      if num % test_factor == 0
        prime_factors << test_factor
        num /= test_factor
        test_factor = 2
      else
        test_factor += 1
      end
    end

    prime_factors
  end
end
