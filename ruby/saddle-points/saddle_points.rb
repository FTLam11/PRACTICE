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

  def saddle_points
    points = Array.new

    rows.each_with_index do |row, i|
      row.each_with_index do |e, j|
        points << [i, j] if e == row.max && e == columns[j].min
      end
    end

    points
  end
end
