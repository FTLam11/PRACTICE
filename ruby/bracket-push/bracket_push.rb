class Brackets
  # filter only parens, brackets, braces
  # compare start and end characters
  # continue comparing if chars are equal
  def self.paired?(string)
    legal?(clean(string))
  end

  PAIR = {
    '(' => ')',
    '[' => ']',
    '{' => '}'
  }

  private

  def self.clean(string)
    string.scan(/[(){}\[\]]/)
  end

  def self.equal_ends?(string)
    return false unless PAIR.fetch(string[0], nil)
    true if string[-1] == PAIR[string[0]]
  end

  def self.legal?(string)
    return true if string.empty?
    if equal_ends?(string)
      string.shift
      string.pop
    else
      return false
    end
    legal?(string)
  end
end