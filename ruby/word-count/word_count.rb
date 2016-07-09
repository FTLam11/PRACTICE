class Phrase
	def initialize(phrase)
		@words = phrase.downcase.gsub(/\s'{1}/, " ").gsub(/'{1}\s/," ").scan(/\w+'*\w?/)
	end

	def word_count
		word_count = Hash.new(0)
		@words.each do |word|
			if word_count[word]
				word_count[word] += 1
			else
				word_count[word] = 1
			end
		end
		word_count
	end
end

module BookKeeping
	VERSION = 1
end