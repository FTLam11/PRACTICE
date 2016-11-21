module ArabicToRoman
  CONVERT = {
    1000 => "M",
    500 => "D",
    100 => "C",
    50 => "L",
    10 => "X",
    5 => "V",
    1 => "I"
  }

  REPLACE = {
    "DCCCC" => "CM",
    "CCCC" => "CD",
    "LXXXX" => "XC",
    "XXXX" => "XL",
    "VIIII" => "IX",
    "IIII" => "IV"
  }
end

class Fixnum
  include ArabicToRoman

  def to_roman
    num = self

    String.new.tap do |string|
      CONVERT.each do | arbc, rmn |
        (num / arbc).times { string.concat(rmn) }
        num %= arbc
      end
    end
  end

  def arabic_to_modern_roman
    self.to_roman.tap do |modern_roman_num|
      REPLACE.each do | key, value |
        modern_roman_num.sub!(key, value) if modern_roman_num.include? key
      end
    end
  end
end
 
module BookKeeping
  VERSION = 2
end