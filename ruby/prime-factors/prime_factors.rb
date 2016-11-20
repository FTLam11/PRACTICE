class PrimeFactors
  def self.for(num)
    prime_factors = Array.new
    candidate = 2
    
    while num != 1 do
      if num % candidate == 0
        prime_factors << candidate
        num /= candidate
        candidate = 2
      else
        candidate += 1
      end
    end

    prime_factors
  end
end
