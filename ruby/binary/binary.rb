class Binary
	def initialize(binary_str)
		raise ArgumentError if binary_str.chars.grep(/[^01]/) != []
		@binary_str = binary_str
	end

	def to_decimal
		decimal_num = 0
		@binary_str.reverse.chars.each_with_index do | num, index |
			decimal_num += num.to_i * (2**index.to_i)
		end
		decimal_num
	end
end

module BookKeeping
	VERSION = 2
end