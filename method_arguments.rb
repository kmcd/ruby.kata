$LOAD_PATH.unshift File.expand_path(".")
require 'test_helper'

class MethodArguments < Minitest::Test
  # @!visibility private
  def setup
  end

  def optional(a, *bar)
    { a:a, bar:bar }
  end

  def required_after_optional(a, *bar, baz)
    { a:a, bar:bar, baz: baz }
  end

  def test_optional
    assert_equal( { a: 1, bar: [] }, optional(1) )
  end

  def test_required_after_optional
    assert_raises(ArgumentError) { required_after_optional(1) }
    assert_equal( { a: 1, bar: [], baz: 1},   required_after_optional(1, 1) )
    assert_equal( { a: 1, bar: [], baz: 2},   required_after_optional(1, 2) )
    assert_equal( { a: 1, bar: [2], baz: 3},  required_after_optional(1, 2, 3) )
  end
end
