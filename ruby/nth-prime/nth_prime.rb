class Prime
  def self.nth(num)
    raise ArgumentError if num == 0
    candidate = 3

    [2].tap do |primes|
      until primes.size == num
        primes << candidate if (2...candidate).all? { |n| candidate % n != 0 }
        candidate += 1
      end
    end.last
  end
end
