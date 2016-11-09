require 'byebug'

class RailFenceCipher
  attr_reader :message, :rails_count

  def self.encode(message, rails_count)
    rails = rails_count.times.map { |i| i = Array.new }
    indices = self.generate_indices(message, rails_count)
    indices.each { |i| rails[i].push(message.slice!(0)) }
    rails.flatten.join
  end

  def self.decode(message, rails_count)
    # separate encoded message into subarray rails
    # use indices to build decoded string
    # decoded = Array.new(1) { message.chars }
    # until decoded.length == rails_count
    #   byebug
    #   decoded.push(Array.new)
    #   decoded[-1] = decoded.first.select.with_index { |e, i| i.odd? }
    #   decoded.first.select!.with_index { |e, i| i.even? }
    # end
    # decoded.join
    
  end

  private

  def self.generate_indices(message, rails_count)
    indices = Array.new

    if rails_count == 1
      message.length.times { indices.push(0) }
    else
      until indices.length >= message.length
        self.zig_zag(rails_count).each { |num| indices.push(num) }
      end
    end

    indices.take(message.length)
  end

  def self.zig_zag(rails_count)
    (0...rails_count - 1).to_a.push((1..rails_count - 1).to_a.reverse).flatten
  end
end

=begin
1 rails 1 terms - 0
2 rails 2 terms - 0,1
3 rails 4 terms - 0,1,2,1
4 rails 6 terms - 0,1,2,3,2,1
5 rails 8 terms - 0,1,2,3,4,3,2,1

2 rails
n.odd?
n.even?

3 rails
04  8
13579
2  6

(n + 1) + 4
2n
=end