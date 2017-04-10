# Given the length of a string, Combination.get() returns all possible 
# combinations of words with length between one and four inclusive.
# The regex combinations are used by Array#scan to build words.
# Loosely based on Pascal's triangle, rows are built recursively.

class Combination
  class << self
    def get(str_len)
      row = build_row(str_len)
      return nil if row.nil?
      to_regex(row)
    end

    def build_row(str_len)
      return nil if str_len == 0
      return [1] if str_len == 1
      return [[1, 1], [2]] if str_len == 2
      row = Array.new
      row.push(left(str_len))
      row.concat(middle(build_row(str_len - 1), str_len))
    end

    private

    def left(str_len)
      [1] * str_len
    end

    def middle(row, str_len)
      row = row - [right(str_len)]
      Array.new.tap do |arr|
        row.each do |combo|
          combo.each_with_index do |_, i|
            add_one_to(arr, combo, i)
          end
        end
      end.uniq
    end

    def right(n)
      [n]
    end

    def add_one_to(arr, combo, i)
      return if combo[i] > 3
      temp = combo.dup
      temp[i] += 1
      arr.push(temp)
    end

    def to_regex(row)
      return [/(.)/] if row.size == 1
      row.map do |combination|
        combination.map do |num|
          "(" + "." * num + ")"
        end.join
      end.map { |combo| Regexp.new(combo) }
    end
  end
end