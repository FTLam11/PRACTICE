class Prime
  def self.nth(num)
    raise ArgumentError if num == 0
    candidate = 3
    prime_nums = [2]
    
    until prime_nums.length == num do
      prime_nums << candidate if self.is_prime?(candidate, prime_nums)
      candidate += 1
    end

    prime_nums.last
  end

  private

  def self.is_prime?(candidate, prime_nums)
    return true if prime_nums.select { |prime_num| candidate % prime_num == 0}.empty?
  end
end