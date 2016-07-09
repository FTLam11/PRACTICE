class Complement
	COMPLEMENT = {
		G: 'C',
		C: 'G',
		T: 'A',
		A: 'U' 
	}
	def self.of_dna(nucleotide)
		# complement = ""
		# nucleotide.chars.each do |char|
		# complement.concat(COMPLEMENT[char.to_sym])
		# end
		# complement
		complement = nucleotide.chars.map do |char|
		char = (COMPLEMENT[char.to_sym])
		end
		return '' if complement.include? nil
		complement.join
	end
end

module BookKeeping
	VERSION = 4
end