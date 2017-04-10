gem 'minitest', '>= 5.0.0'
require 'minitest/autorun'
require_relative 'combination'

class CombinationTest < Minitest::Test
  def test_empty_string
    # skip
    combos = Combination.build_row(0)
    assert_nil combos
  end

  def test_get_none
    #skip
    regex = Combination.get(0)
    assert_nil regex
  end

  def test_one_character_string
    # skip
    combos = Combination.build_row(1)
    assert_equal combos, [1]
  end

  def test_get_one
    #skip
    regex = Combination.get(1)
    assert_equal [/(.)/], regex
  end

  def test_two_character_string
    # skip
    combos = Combination.build_row(2)
    assert_equal combos, [[1, 1], [2]]
  end

  def test_get_two
    # skip
    regex = Combination.get(2)
    assert_equal [/(.)(.)/, /(..)/], regex
  end

  def test_three_character_string
    # skip
    combos = Combination.build_row(3)
    assert_equal combos, [[1, 1, 1], [2, 1], [1, 2], [3]]
  end

  def test_get_three
    # skip
    regex = Combination.get(3)
    assert_equal [/(.)(.)(.)/, /(..)(.)/, /(.)(..)/, /(...)/], regex
  end

  def test_four_character_string
    # skip
    combos = Combination.build_row(4)
    assert_equal combos, [[1, 1, 1, 1], [2, 1, 1], [1, 2, 1], [1, 1, 2], [3, 1], [2, 2], [1, 3], [4]]
  end

  def test_max_word_length
    # skip
    combos = Combination.build_row(5)
    assert_nil combos.index([5])
  end
end