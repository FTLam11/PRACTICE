class Brackets
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