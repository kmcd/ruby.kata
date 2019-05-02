$LOAD_PATH.unshift File.expand_path(".")
require 'test_helper'

class BlockBinding < Minitest::Test
  # @!visibility private
  def setup
  end

  def test_capture_context_from_blocks_current_scope
    skip 'pending'
  end

  def test_should_do_something_else
  end
end
