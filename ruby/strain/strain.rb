class Array
  def keep
    self.select { |e| yield(e) }
  end

  def discard
    self.reject { |e| yield(e) }
  end
end