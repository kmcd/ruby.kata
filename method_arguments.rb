$LOAD_PATH.unshift File.expand_path(".")
require 'test_helper'

class MethodArguments < Minitest::Test
  # @!visibility private
  def setup
  end

  def optional(a, *bar)
    [a, bar].flatten
  end

  def test_optional
    assert_equal [1], optional(1)
  end
end
