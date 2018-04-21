class Triangle
  attr_reader :sides

  def initialize(sides)
    @sides = sides.sort
  end

  def equilateral?
    valid? && sides.uniq.size == 1
  end

  def isosceles?
    valid? && sides.uniq.size <= 2
  end

  def scalene?
    valid? && sides.uniq.size == 3
  end

  private

  def valid?
    has_nonzero_sides? && respects_triangle_inequality?
  end

  def has_nonzero_sides?
    sides[0] > 0
  end

  def respects_triangle_inequality?
    sides[2] <= sides[0] + sides[1]
  end
end

module BookKeeping
  VERSION = 1
end
