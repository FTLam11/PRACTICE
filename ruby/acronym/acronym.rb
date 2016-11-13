class Acronym
  def self.abbreviate(phrase)
    phrase.gsub(/-/, ' ').split(' ').map { |string| string[0].upcase }.join
  end
end