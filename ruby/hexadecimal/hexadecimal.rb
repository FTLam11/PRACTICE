class Hexadecimal
  attr_reader :hex, :hex_decimal_map

  HEX_DECIMAL_MAP = ('a'..'f').to_a.zip((10..15).to_a).to_h

  def initialize(str)
    @hex = str
  end

  def to_decimal
    return 0 if invalid_hex?(hex)
    hex.chars.reverse.map.with_index { |char, i| HEX_DECIMAL_MAP.fetch(char, char).to_i * 16**i }.inject(&:+)
  end

  private

  def invalid_hex?(str)
    not str.scan(/[^\da-f]/).empty?
  end
end