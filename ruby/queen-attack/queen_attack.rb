class Queens
  attr_reader :position

  def initialize(position)
    raise ArgumentError unless valid_position?(position)
    @position = position
  end

  def attack?
    same_rank? || same_file?
  end

  private

  def valid_position?(position)
    valid_rank?(position) && valid_file?(position)
  end

  def valid_rank?(position)
    position.values.all? { |position| position.first > -1 && position.first < 8 }
  end

  def valid_file?(position)
    position.values.all? { |position| position.last > -1 && position.last < 8 }
  end

  def same_rank?
    position[:white].first == position[:black].first
  end

  def same_file?
    position[:white].last == position[:black].last
  end
end