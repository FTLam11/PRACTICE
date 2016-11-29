gem 'minitest', '>= 5.0.0'
require 'minitest/autorun'
require_relative 'sublist'

class SublistTest < Minitest::Test
  def test_empty_lists_are_equal
    list_a = []
    list_b = []
    lists = Sublist.new(list_a, list_b)
    assert_equal :equal, lists.sublist
  end

  def test_empty_list_with_non_empty_list
    list_a = []
    list_b = [1, 2, 3]
    lists = Sublist.new(list_a, list_b)
    assert_equal :sublist, lists.sublist
  end

  def test_non_empty_list_with_empty_list
    list_a = [1, 2, 3]
    list_b = []
    lists = Sublist.new(list_a, list_b)
    assert_equal :superlist, lists.sublist
  end

  def test_list_equals_itself
    list_a = [1, 2, 3]
    list_b = [1, 2, 3]
    lists = Sublist.new(list_a, list_b)
    assert_equal :equal, lists.sublist
  end

  def test_different_lists
    list_a = [1, 2, 3]
    list_b = [2, 3, 4]
    lists = Sublist.new(list_a, list_b)
    assert_equal :unequal, lists.sublist
  end

  def test_missing_elements_in_first_list
    list_a = [1, 3]
    list_b = [1, 2, 3]
    lists = Sublist.new(list_a, list_b)
    assert_equal :unequal, lists.sublist
  end

  def test_missing_elements_in_second_list
    list_a = [1, 2, 3]
    list_b = [1, 3]
    lists = Sublist.new(list_a, list_b)
    assert_equal :unequal, lists.sublist
  end

  def test_same_digits_but_different_numbers
    list_a = [1, 0, -1]
    list_b = [10, 1]
    lists = Sublist.new(list_a, list_b)
    assert_equal :unequal, lists.sublist
  end
  
  def test_sublist_at_start
    list_a = [0, 1, 2]
    list_b = [0, 1, 2, 3, 4]
    lists = Sublist.new(list_a, list_b)
    assert_equal :sublist, lists.sublist
  end

  def test_sublist_in_middle
    list_a = [2, 3, 4]
    list_b = [1, 2, 3, 4, 5]
    lists = Sublist.new(list_a, list_b)
    assert_equal :sublist, lists.sublist
  end

  def test_sublist_at_end
    list_a = [3, 4, 5]
    list_b = [0, 1, 2, 3, 4, 5]
    lists = Sublist.new(list_a, list_b)
    assert_equal :sublist, lists.sublist
  end

  def test_superlist_at_start
    list_a = [0, 1, 2, 3, 4]
    list_b = [0, 1, 2]
    lists = Sublist.new(list_a, list_b)
    assert_equal :superlist, lists.sublist
  end

  def test_superlist_in_middle
    list_a = [1, 2, 3, 4, 5]
    list_b = [2, 3, 4]
    lists = Sublist.new(list_a, list_b)
    assert_equal :superlist, lists.sublist
  end

  def test_superlist_at_end
    list_a = [0, 1, 2, 3, 4, 5]
    list_b = [3, 4, 5]
    lists = Sublist.new(list_a, list_b)
    assert_equal :superlist, lists.sublist
  end
end