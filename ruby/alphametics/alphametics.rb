module BookKeeping
  VERSION = 3
end

class Alphametics
  attr_reader :letters, :puzzle

  def solve(puzzle)
    @letters = puzzle.scan(/[A-Z]/).uniq
    @puzzle = puzzle

    combinations.each do |combination|
      candidate = letters.zip(combination).to_h
      ready_candidate = letters_to_numbers(candidate)
      next if invalid_candidate?(ready_candidate)
      return candidate if eval(ready_candidate)
    end

    nil
  end

  private

  def combinations
    (0..9).to_a.permutation(letters.length)
  end

  def letters_to_numbers(candidate)
    puzzle.chars.map { |char| char.match(/[A-Z]/) ? char = candidate[char] : char = char }.join
  end

  def invalid_candidate?(ready_candidate)
    ready_candidate.match(/\b0/)
  end
end