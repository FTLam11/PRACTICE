class Array
  def accumulate
    Array.new.tap do |arr|
      self.each { |el| arr.push(yield(el)) }
    end
  end
end