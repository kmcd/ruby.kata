$LOAD_PATH.unshift File.expand_path(".")
require 'test_helper'

class RegularExpressions < Minitest::Test
  def setup # @!visibility private
  end

  def test_non_greedy
    assert_equal 'foo foo ', "foo foo bar"[ /fo.*\s+/ ]
    assert_equal 'foo ', "foo bar"[ /fo.*?\s+/ ]
  end

  def test_positive_look_ahead
    assert_equal "foo", "foo bar"[/foo(?= bar)/]
  end

  def test_negative_look_ahead
    assert_equal "foo", "foo bar"[/foo(?! baz)/]
  end

  def test_positive_look_behind
    assert_equal "bar", "foo bar"[/(?<=foo )bar/]
  end

  def test_negative_look_behind
    assert_equal "bar", "baz bar"[/(?<!foo )bar/]
    assert_nil "foo bar"[/(?<!foo )bar/]
  end

  def test_multi_line_match
    assert_equal "foo\nbar", "foo\nbar"[/.*/m]
  end

  def test_named_captures
    regex = /(?<first>foo)\s+(?<second>bar)/
    result = regex.match "foo bar"

    assert_equal 'foo', result[:first]
    assert_equal 'bar', result[:second]
  end
end
