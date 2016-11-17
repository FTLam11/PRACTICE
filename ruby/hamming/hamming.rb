class Hamming
  def self.compute(s1, s2)
    raise ArgumentError, "Input strands must be the same length" if invalid_strands?(s1, s2)

    s1.size.times.map { |i| 1 if s1.chars[i] != s2.chars[i] }.compact.inject(0, &:+)
  end

  private

  def self.invalid_strands?(s1, s2)
    s1.length != s2.length
  end
end

module BookKeeping
  VERSION = 3
end