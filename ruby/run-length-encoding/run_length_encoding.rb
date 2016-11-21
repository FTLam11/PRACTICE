class RunLengthEncoding
  def self.encode(string)
    char_freq = 1

    String.new.tap do |encoded_str|
      string.chars.each_with_index do | char, index |
        if string[index] == string[index+1]
          char_freq += 1
        else
          if char_freq == 1
            encoded_str.concat(char)
          else
            encoded_str.concat(char_freq.to_s).concat(char)
            char_freq = 1
          end
        end
      end
    end
  end

  def self.decode(encoded_str)
    String.new.tap do |decoded_str|
      encoded_str.scan(/\d*\D{1}/).each do | element |
        if element.length == 1
          decoded_str.concat(element)
        else
          element[0...-1].to_i.times { decoded_str.concat(element[-1]) }
        end
      end
    end
  end
end

module BookKeeping
  VERSION = 2
end