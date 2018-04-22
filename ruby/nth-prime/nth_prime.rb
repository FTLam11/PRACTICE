class Prime
  def self.nth(num)
    raise ArgumentError if num == 0
    primes = [2]
    candidate = 3

    until primes.size == num
      primes << candidate if (2...candidate).all? { |n| candidate % n != 0 }
      candidate += 1
    end

    primes.last
  end
end
