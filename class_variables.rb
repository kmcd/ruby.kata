$LOAD_PATH.unshift File.expand_path(".")
require 'test_helper'

class ClassVariables < Minitest::Test
  # @!visibility private
  def setup
  end

  class Foo
    @@quux = 1
  end

  class Bar < Foo
  end

  class Baz
  end

  def test_available_within_class_hierarchy
    assert_equal 1, Foo.class_variable_get(:@@quux)
    assert_equal 1, Bar.class_variable_get(:@@quux)
  end

  def test_not_available_outside_class_hierarchy
    assert_raises NameError do
      assert_equal 1, Baz.class_variable_get(:@@quux)
    end
  end

  def test_subclasses_overwrite_variable_for_all_classes_in_hierarchy
    Bar.class_variable_set :@@quux, 2
    
    assert_equal 2, Foo.class_variable_get(:@@quux)
  end
end
