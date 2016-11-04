class Bst
  attr_reader :data
  attr_accessor :left, :right
  VERSION = 1

  def initialize(num)
    @data = num
    @left, @right = nil, nil
  end

  def insert(num)
    if num <= data
      left ? left.insert(num) : self.left = Bst.new(num)
    else
      right ? right.insert(num) : self.right = Bst.new(num)
    end
  end

  def each
    return enum_for(:each) unless block_given?
    left.each { |node| yield node } if left
    yield data
    right.each { |node| yield node } if right
  end
end