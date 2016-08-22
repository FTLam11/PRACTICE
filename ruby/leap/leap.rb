class Year
  def self.leap?(year)
    if year % 4 == 0
      return true unless year % 100 == 0 && year % 400 != 0
    end
    return false
  end
end

module BookKeeping
  VERSION = 2
end