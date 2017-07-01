class Matrix
  def initialize(nums)
    @data = nums.split(/\n/).map { |e| e.scan(/\d+/).map(&:to_i) }
  end

  def rows
    @data
  end

  def columns
    @data.transpose
  end
end
