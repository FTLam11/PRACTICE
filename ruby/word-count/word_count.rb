class Phrase
  attr_reader :words

  def initialize(phrase)
    @words = phrase
  end

  def word_count
    Hash.new(0).tap do |word_hash|
      clean_phrase.each do |word|
        if word_hash[word]
          word_hash[word] += 1
        else
          word_hash[word] = 1
        end
      end
    end
  end

  private

  def clean_phrase
    handle_quotations.scan(/\w+'*\w?/)
  end

  def handle_quotations
    words.downcase.gsub(/\s'{1}/, " ").gsub(/'{1}\s/," ")
  end
end

module BookKeeping
  VERSION = 1
end