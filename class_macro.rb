$LOAD_PATH.unshift File.expand_path(".")
require 'test_helper'

class ClassMacro < Minitest::Test
  # @!visibility private
  def setup
  end

  class Foo
    def self.macro(name, output)
      class_eval do
        define_method name do |arg=output|
          puts arg
        end
      end
    end
  end

  def test_generate_instance_methods
    Foo.macro :bar, 'baz'
    foo = Foo.new

    assert_output(/baz/)  { foo.bar }
    assert_output(/quux/) { foo.bar 'quux' }
  end
end
