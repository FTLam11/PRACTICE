module NameGenerator
  def generate_char
    ('A'..'Z').to_a.sample
  end

  def generate_num
    rand(10).to_s
  end

  def generate_name
    2.times { @name.concat(generate_char) }
    3.times { @name.concat(generate_num) }
  end
end

class Robot
  include NameGenerator
  attr_reader :name
  @@name_list = []

  def assign_name
    loop do
      @name = ""
      generate_name
      break if !@@name_list.include? @name
    end
  end

  def initialize
    assign_name
    @@name_list << @name  
  end

  def reset
    initialize
  end
end

module BookKeeping
  VERSION = 2
end