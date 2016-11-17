class Binary
  attr_reader :binary_str

  def initialize(binary_str)
    raise ArgumentError if invalid_chars?(binary_str)
    @binary_str = binary_str
  end

  def to_decimal
    binary_str.reverse.chars.each_with_index.map { | num, index | num.to_i * (2 ** index.to_i)}.inject(&:+)
  end

  private

  def invalid_chars?(binary_str)
    binary_str.chars.grep(/[^01]/) != []
  end
end

module BookKeeping
  VERSION = 2
end