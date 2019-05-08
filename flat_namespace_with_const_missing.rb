$LOAD_PATH.unshift File.expand_path(".")
require 'test_helper'

class FlatNamespaceWithConstMissing < Minitest::Test
  # @!visibility private
  def setup
  end

  def test_create_module_namespace_dynamically
    skip 'Not possible methinks ...'
  end
end
