class PhoneNumber
	def initialize(num_str)
		@num_str = num_str
	end

	def number
		return '0000000000' if @num_str.scan(/[A-Za-z]/) != []

		formatted_num = @num_str.scan(/\d/).join

		if formatted_num.length == 11 && formatted_num[0] == '1'
			return formatted_num[1..-1]
		elsif formatted_num.length > 11 || formatted_num.size != 10
			return '0000000000'
		else
			return formatted_num
		end
	end

	def area_code
		self.number[0..2]
	end

	def to_s
		"(#{self.number[0..2]}) #{self.number[3..5]}-#{self.number[6..-1]}"
	end
end