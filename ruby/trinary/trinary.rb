class Trinary
  attr_reader :trinary_string

  def initialize(trinary_string)
    @trinary_string = trinary_string
  end

  def to_decimal
    return 0 if contains_invalid_char? || contains_invalid_num?
    trinary_string.chars.map(&:to_i).reverse.map.with_index { | num, index | num * 3**index }.inject(&:+)
  end

  private

  def contains_invalid_char?
    trinary_string.chars.grep(/\D/) != []
  end

  def contains_invalid_num?
    trinary_string.chars.any? { | char | char.to_i > 2 }
  end
end

module BookKeeping
  VERSION = 1
end