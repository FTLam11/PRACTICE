module Stringy
  refine String do
    def normalize
        downcase.chars.sort
    end
  end
end

class Anagram
  using Stringy

  def initialize(word)
    @word = word
  end

  def match(candidates)
    candidates.select { |candidate| same_chars?(candidate) && !same_word?(candidate) }
  end

  private

  def same_chars?(candidate)
    @word.normalize == candidate.normalize 
  end

  def same_word?(candidate)
    @word.casecmp(candidate) == 0
  end
end