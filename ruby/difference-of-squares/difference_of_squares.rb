class Squares
  def initialize(natural_num)
    @collection = (1..natural_num).to_a
    @collection = [0] if natural_num == 0
  end

  def square_of_sum
    @collection.inject(:+)**2
  end

  def sum_of_squares
    @collection.inject { |sum, element| sum += element**2 }
  end

  def difference
    square_of_sum - sum_of_squares
  end
end

module BookKeeping
  VERSION = 3
end