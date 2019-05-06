$LOAD_PATH.unshift File.expand_path(".")
require 'test_helper'

class MethodLookup < Minitest::Test
  # @!visibility private
  def setup
  end

  module Foo
    def bar
      "Foo#bar"
    end
  end

  class Baz
    prepend Foo

    def bar
      "Baz#bar"
    end
  end

  class Quux
    include Foo

    def bar
      "Quux#bar"
    end
  end

  class ZupaClass < Baz
  end

  def test_prepended_modules_override_class_definition
    assert_equal 'Foo#bar', Baz.new.bar
  end

  def test_class_definition
    assert_equal 'Quux#bar', Quux.new.bar
  end

  def test_modules_included_in_class
    Quux.class_eval { remove_method :bar }

    assert_equal 'Foo#bar', Quux.new.bar
  end

  def test_prepended_modules_in_super_class
    assert_equal 'Foo#bar', ZupaClass.new.bar
  end
end
