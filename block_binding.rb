$LOAD_PATH.unshift File.expand_path(".")
require 'test_helper'

class BlockBinding < Minitest::Test
  # @!visibility private
  def setup
  end

  def block
    yield
  end

  def test_capture_instance_variables_from_current_scope
    @foo = 1
    assert_equal( 1, block { @foo } )
  end

  def test_capture_local_variables_from_current_scope
    bar = 2
    assert_equal( 2, block { bar } )
  end

  def test_raises_an_exception_for_undefined_variables
    assert_raises NameError do
      block { baz }
    end
  end
end
