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
		classic_roman = ""
		num = self

		CONVERT.each do | arbc, rmn |
			(num / arbc).times { classic_roman.concat(rmn) }
			num = num % arbc
		end

		classic_roman
	end

	def arabic_to_modern_roman
		modern_roman_num =	self.to_roman

		REPLACE.each do | key, value |
			modern_roman_num.sub!(key, value) if modern_roman_num.include? key
		end

		modern_roman_num
	end
end
 
module BookKeeping
	VERSION = 2
end