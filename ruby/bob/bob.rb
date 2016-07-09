class Bob
	def hey(remark)
		return 'Fine. Be that way!' if remark.scan(/\w+/) == []
		return 'Whoa, chill out!' if remark == remark.upcase && remark.scan(/\w+/).select { |word| word.length > 1 } != []
		return "Sure." if remark[-1] == '?'
		'Whatever.'
	end
end