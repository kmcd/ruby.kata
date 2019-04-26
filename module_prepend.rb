$LOAD_PATH.unshift File.expand_path(".")
require 'test_helper'

# Useful for cross cutting concerns; e.g. logging
class ModulePrepend < Minitest::Test
  module Bar
    def baz
      ['bar', super].join '->'
    end
  end

  # prepends Bar
  class Foo
    prepend Bar

    def baz
      'foo'
    end
  end

  def setup # @!visibility private
  end

  def test_wrap_around_instead_of_monkey_patching
    assert_equal "bar->foo", Foo.new.baz
  end

  def test_should_be_first_class_ancestor
    assert_equal Bar, Foo.ancestors.first
  end

  def test_that_no_other_paths_are_currently_in_use
    #code
  end
end
