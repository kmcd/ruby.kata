$LOAD_PATH.unshift File.expand_path(".")
require 'test_helper'

class ExternalDSL < Minitest::Test
  def setup
  end

  def test_top_level_method
    skip :pending
  end
end
