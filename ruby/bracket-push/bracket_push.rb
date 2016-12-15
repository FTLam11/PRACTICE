class Brackets
  # filter only parens, brackets, braces
  # compare start and end characters
  # continue comparing if chars are equal
  def self.paired?(expression)
    legal?(clean(expression))
  end

  PAIR = {
    ')' => '(',
    ']' => '[',
    '}' => '{'
  }

  private

  def self.clean(expression)
    expression.scan(/[(){}\[\]]/)
  end

  # def self.equal_ends?(string)
  #   return false unless PAIR.fetch(string.first, nil)
  #   true if string.last == PAIR[string.first]
  # end

  # def self.legal?(string)
  #   return true if string.empty?
  #   if equal_ends?(string)
  #     string.shift
  #     string.pop
  #   else
  #     return false
  #   end
  #   legal?(string)
  # end
  def self.legal?(expression, parsed = Array.new)
    expression.each do |char|
      if open?(char)
        parsed << char
      else
        return false unless parsed.include?(PAIR.fetch(char, nil))
        parsed.pop
      end
    end
    return false unless parsed.empty?
    true
  end

  def self.open?(char)
    char.match(/[(\[{]/) != nil
  end

end

module BookKeeping
  VERSION = 3
end