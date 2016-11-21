class Series
  attr_reader :nums

  def initialize(num_str)
    @nums = num_str.chars.map(&:to_i)
  end 

  def slices(size)
    raise ArgumentError if size > @nums.length
    array_of_slices(size).each_with_index.map { |e, i| @nums[i..i + size - 1]}
  end

  private

  def slice_count(size)
     @nums.length + 1 - size
  end

  def array_of_slices(size)
     Array.new(slice_count(size)) { Array.new }
  end 
end