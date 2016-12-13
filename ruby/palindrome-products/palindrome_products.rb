class Palindromes
  attr_reader :max_factor

  def initialize(args)
    @max_factor = args[:max_factor]
  end

  def generate
    combinations(prime_factors).select { |pair| is_palindrome?(pair) }
  end

  def largest
    generate.each { |pair| pair.first * pair.last }.max
  end

  def factors
    self
  end

  def value
    self.first * self.last
  end

  private

  def prime_factors
    prime_factors = Array.new
    candidate = 2
    num = max_factor

    until num == 1 do
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

  def combinations(prime_factors)
    prime_factors.permutation(2).to_a
  end

  def is_palindrome?(pair)
    pair == pair.reverse
  end
end