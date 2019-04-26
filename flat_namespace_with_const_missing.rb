$LOAD_PATH.unshift File.expand_path(".")
require 'test_helper'

class FlatNamespaceWithConstMissing < Minitest::Test
  # @!visibility private
  def setup
  end
end
