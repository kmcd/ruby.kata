$LOAD_PATH.unshift File.expand_path(".")
require 'test_helper'

class ExternalEnumerator < Minitest::Test
  # @!visibility private
  def setup
  end

  def test_lazy
    skip :pending
  end

  def test_encapsulate_collection
    skip :pending
  end
end
