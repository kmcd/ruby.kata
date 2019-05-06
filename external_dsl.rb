$LOAD_PATH.unshift File.expand_path(".")
require 'test_helper'

class ExternalDSL < Minitest::Test
  def setup # @!visibility private
  end

  class Parser
    attr_reader :text

    def initialize(text)
      @text = text
    end

    def parse
      case text
      when /^replace\s+'(.*?)'\s+'(.*?)'$/
        print "replacing #{$1} with #{$2}"
      end
    end
  end

  def test_parse_lines
    parser = Parser.new "replace '/foo/bar' 'BAZ QUXX'"

    assert_output("replacing /foo/bar with BAZ QUXX") do
      parser.parse
    end
  end
end
