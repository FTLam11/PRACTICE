class Triangle
  attr_reader :sides

  def initialize(sides)
    @sides = sides
  end

  def equilateral?
    return false if has_illegal_side? || violates_inequality?
    sides.uniq.size == 1
  end

  def isosceles?
    return false if has_illegal_side? || violates_inequality?
    return true if equilateral?
    sides.uniq.size == 2
  end

  def scalene?
    return false if has_illegal_side? || violates_inequality?
    sides.uniq.size == 3
  end

  private

  def has_illegal_side?
    sides.any? { |side| side.zero? }
  end

  def violates_inequality?
    return true if sides[0] + sides[1] < sides[2] ||
                   sides[2] + sides[0] < sides[1] ||
                   sides[1] + sides[2] < sides[0]
    false
  end
end

module BookKeeping
  VERSION = 1
end
