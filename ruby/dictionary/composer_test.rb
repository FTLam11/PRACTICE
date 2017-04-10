gem 'minitest', '>= 5.0.0'
require 'minitest/autorun'
require_relative 'composer'

class FlatTest < Minitest::Test
  def test_empty_string
    # skip
    string = Composer.new("")
    assert_equal [], string.sentences
  end

  def test_invalid_sentence
    # skip
    string = Composer.new("abcd")
    assert_equal [], string.sentences
  end

  def test_short_sentence
    # skip
    string = Composer.new("abcc")
    assert_equal ["a bc c"], string.sentences
  end

  def test_long_sentence
    # skip
    string = Composer.new("abcdefg")
    assert_equal ["a bc def g", "a bcd e fg", "abcd e fg"].sort, string.sentences.sort
  end

  def test_invalid_characters
    # skip
    string = Composer.new("abcdefghzy")
    assert_equal [], string.sentences
  end
end