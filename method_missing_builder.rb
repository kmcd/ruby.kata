$LOAD_PATH.unshift File.expand_path(".")
require 'test_helper'

class MethodMissingBuilder < Minitest::Test
  class Builder
    def initialize(spacing:2)
      @list = ""
      @level = 0
      @spacing = spacing
    end

    def indent(string)
      " " * @level + string
    end

    def method_missing(method_name, &block)
      @list << indent(method_name.to_s)

      @list << "\n"
      @level += @spacing

      @list << indent(yield(self)) if block

      @level -= @spacing
      @list << "\n"

      ""
    end

    def output
      @list
    end
  end

  def test_builder_dsl
    builder = Builder.new

    builder.foo do |_|
      _.bar   { '1' }
      _.quux  { '2' }
    end

    output = <<~DSL
    foo
      bar
        1
      quux
        2
    DSL

    assert_equal output.strip, builder.output.strip
  end
end
