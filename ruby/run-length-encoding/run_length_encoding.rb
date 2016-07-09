class RunLengthEncoding
	def self.encode(string)
		encoded_str = ""

		char_freq = 1

		string.chars.each_with_index do | char, index |
			if string[index] == string[index+1]
				char_freq += 1
			else
				if char_freq == 1
					encoded_str.concat(char)
				else
					encoded_str = encoded_str + char_freq.to_s + char
					char_freq = 1
				end
			end
		end

		encoded_str
	end

	def self.decode(encoded_str)
		decoded_str = ""
		encoded_str.scan(/\d*\D{1}/).each do | element |
			if element.length == 1
				decoded_str.concat(element)
			else
				element[0...-1].to_i.times { decoded_str.concat(element[-1]) }
			end
		end
		decoded_str
	end
end

module BookKeeping
	VERSION = 2
end