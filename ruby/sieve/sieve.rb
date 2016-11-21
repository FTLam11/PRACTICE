class Sieve
  def initialize(n)
    @collection = populate_collection(n)
  end

  def primes
    mark_collection.select { |key, value| value == 0 }.keys
  end

  private

  def populate_collection(n)
    Hash.new(0).tap do |collection|
      (2..n).each { |num| collection[num] = 0 }
    end
  end

  def mark_collection
    @collection.each do | k, v |
      if v == 0
        @collection.each do | key, value |
          next if key == k
          @collection[key] = 1 if key % k == 0
        end
      end
    end
  end
end