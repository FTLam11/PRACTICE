class Series
  def initialize(num_str)
    @num_str = num_str.chars.map(&:to_i)
  end 

  def slices(size)
    raise ArgumentError if size > @num_str.length
    
    slice_count = @num_str.length + 1 - size
    slices = Array.new(slice_count) { Array.new }
    index = 0

    slice_count.times do
      slices[index] = @num_str[index..index + size - 1]
      index += 1
    end

    slices
  end 
end