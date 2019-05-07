$LOAD_PATH.unshift File.expand_path(".")
require 'test_helper'

class AliasMethod < Minitest::Test
  # @!visibility private
  def setup
  end

  class ::String
    alias __old_reverse__ reverse
    alias_method :__old_length__, :length

    def reverse
      print "#{self} -> #{__old_reverse__}"

      __old_reverse__
    end

    def length
      print "length:#{__old_length__}"

      __old_length__
    end
  end

  def test_pass_through_override
    assert_output("foo -> oof") do
      "foo".reverse
    end

    capture_io do
      assert_equal 'oof', 'foo'.reverse
    end
  end

  def test_alias_method_pass_through_override
    assert_output("length:3") do
      "foo".length
    end
  end
end
