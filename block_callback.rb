$LOAD_PATH.unshift File.expand_path(".")
require 'test_helper'

class BlockCallback < Minitest::Test
  # @!visibility private
  def setup
  end

  class Command
    def initialize
      @before_execute = []
      @after_execute = []
    end

    def execute(command)
      with_callbacks do
        puts command
      end
    end

    def before_execute(&block)
      @before_execute << block
    end

    def after_execute(&block)
      @after_execute << block
    end

    def with_callbacks
      @before_execute.each &:call
      result = yield
      @after_execute.each &:call
      result
    end
  end

  def test_execute_later
    command = Command.new
    command.before_execute {|_| puts 'BEFORE' }
    command.after_execute {|_| puts 'AFTER' }

    assert_output(/BEFORE\nOHAi!\nAFTER/m) do
      command.execute 'OHAi!'
    end
  end
end
