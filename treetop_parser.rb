$LOAD_PATH.unshift File.expand_path(".")
require 'test_helper'
require 'treetop'
require 'foo_grammar'

class TreetopParser < Minitest::Test
  def setup # @!visibility private
  end

  def test_load_peg_syntax_tree
    parser = FooGrammarParser.new
    parser.parse "replace '/foo/bar' 'BAZ QUXX'"
  end
end
