$LOAD_PATH.unshift File.expand_path(".")
require 'test_helper'

class InternalDsl < Minitest::Test
  # @!visibility private
  def setup
  end

  class AuditLog
    attr_reader :entries

    def initialize(dsl=nil, &block)
      @entries = Hash.new {|_, key| _[key] = [] }

      if block_given?
        instance_eval(&block)
      else
        instance_eval(dsl)
      end
    end

    def login(name, &block)
      @name = name
      instance_eval(&block)
    end

    def audit_log
      @entries[@name] << yield
    end
  end

  def test_execute_dsl_from_text
    dsl_text = <<~SYNTAX
      login 'Jack Torrance' do
        audit_log do
          "Here's johnny"
        end
      end
    SYNTAX

    audit_log = AuditLog.new dsl_text

    assert_equal( {"Jack Torrance"=>["Here's johnny"]}, audit_log.entries)
  end

  def test_execute_dsl_from_block
    audit_log = AuditLog.new do
      login 'Jack Torrance' do
        audit_log do
          "Here's johnny"
        end
      end
    end

    assert_equal( {"Jack Torrance"=>["Here's johnny"]}, audit_log.entries)
  end
end
