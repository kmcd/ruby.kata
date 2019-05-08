$LOAD_PATH.unshift File.expand_path(".")
require 'test_helper'

class SymbolToProc < Minitest::Test
  # @!visibility private
  def setup
  end

  class ::String
    def to_proc
      Proc.new {|_| _.send self.to_sym }
    end
  end

  def test_string_to_proc
    assert_equal [ 3, 5 ],  %w[ two three ].map(&'size')
  end
end
