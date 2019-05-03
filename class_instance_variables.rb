$LOAD_PATH.unshift File.expand_path(".")
require 'test_helper'

class ClassInstanceVariables < Minitest::Test
  # @!visibility private
  def setup
  end

  class Foo
    @bar = 1

    class << self
      attr_reader :bar
    end
  end

  class Baz < Foo
    @bar = 2
  end

  def test_not_shared_between_subclasses
    assert_equal 1, Foo.bar
    assert_equal 2, Baz.bar
  end
end
