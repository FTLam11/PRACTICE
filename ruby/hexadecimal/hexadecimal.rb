class Hexadecimal
  attr_reader :hex, :hex_decimal_map

  def initialize(str)
    @hex = str
    @hex_decimal_map = create_hex_decimal_map
  end

  def to_decimal
    return 0 if invalid_hex?(hex)
    hex.chars.reverse.map.with_index { |char, i| hex_decimal_map.fetch(char, char).to_i * 16**i }.inject(&:+)
  end

  private

  def create_hex_decimal_map
    ('a'..'f').to_a.zip((10..15).to_a).to_h
  end

  def invalid_hex?(str)
    not str.scan(/[^\da-f]/).empty?
  end
end