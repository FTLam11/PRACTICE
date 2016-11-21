class SumOfMultiples
  def initialize(*multiples)
    @multiples = multiples
  end

  def to(target)
    (0...target).to_a.inject(0) do |sum, num|
      @multiples.any? { |multiple| num % multiple == 0 } ? sum + num : sum
    end
  end
end