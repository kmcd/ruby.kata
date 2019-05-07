$LOAD_PATH.unshift File.expand_path(".")
require 'test_helper'

class RefineOrExtend < Minitest::Test
  # @!visibility private
  def setup
  end

  module StringFoo
    refine String do
      def to_foo
        "foo:#{self}"
      end
    end
  end

  class Bar
    using StringFoo

    def bar
      "quux".to_foo
    end
  end

  def test_refinement
    assert_equal 'foo:quux', Bar.new.bar
  end
end
