require_relative 'combination'

module Dictionary
  NOUNS = %w(abcd c def h ij cde)
  VERBS = %w(bc fg g hij bcd)
  ARTICLES = %w(a ac e)
end

class Composer
  include Dictionary
  attr_reader :string, :candidates

  def initialize(string)
    @string = string
  end

  def sentences
    return [] if string.size == 0
    @candidates = Combination.get(string.size).map { |regex| string.scan(regex) }.flatten(1)
    candidates.select { |candidate| valid_candidate?(candidate) }.map { |candidate| candidate.join(' ') }
  end

  private

  def valid_candidate?(candidate)
    return false unless has_valid_words?(candidate)
    
    score = {
      noun_count: 0,
      verb_count: 0,
      article_count: 0
    }

    candidate.each { |word| score_word(score, word)}
    
    has_valid_score?(score)      
  end

  def has_valid_words?(candidate)
    candidate.all? { |word| is_valid_word?(word) }
  end

  def is_valid_word?(word)
    NOUNS.include?(word) || VERBS.include?(word) || ARTICLES.include?(word)
  end

  def score_word(score, word)
    score[:noun_count] += 1 if NOUNS.include?(word)
    score[:verb_count] += 1 if VERBS.include?(word)
    score[:article_count] += 1 if ARTICLES.include?(word)
  end

  def has_valid_score?(score)
    has_noun_and_verb?(score) || has_verb_and_at_least_two_articles?(score)
  end

  def has_noun_and_verb?(score)
    score[:noun_count] > 0 && score[:verb_count] > 0    
  end

  def has_verb_and_at_least_two_articles?(score)
    score[:verb_count] > 0 && score[:article_count] > 1
  end
end