class PhoneNumber
  attr_reader :phone_num, :formatted_num

  def initialize(num_str)
    @phone_num = num_str
    @formatted_num = num_str.scan(/\d/).join
  end

  def number
    if has_area_code_and_leading_one
      return formatted_num[1..-1]
    elsif invalid_length || contains_letters
      return '0000000000'
    else
      return formatted_num
    end
  end

  def area_code
    self.number[0..2]
  end

  def to_s
    "(#{self.number[0..2]}) #{self.number[3..5]}-#{self.number[6..-1]}"
  end

  private

  def contains_letters
    return true if !phone_num.scan(/[A-Za-z]/).empty?
  end

  def has_area_code_and_leading_one
    formatted_num.length == 11 && formatted_num[0] == '1'
  end

  def invalid_length
    formatted_num.size != 10
  end
end