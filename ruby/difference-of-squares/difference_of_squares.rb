class Squares
  attr_reader :collection

  def initialize(natural_num)
    @collection = (0..natural_num).to_a
  end

  def square_of_sum
    collection.inject(:+)**2
  end

  def sum_of_squares
    collection.inject { |sum, element| sum += element**2 }
  end

  def difference
    square_of_sum - sum_of_squares
  end
end

module BookKeeping
  VERSION = 3
end