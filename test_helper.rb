require 'minitest/autorun'
require "minitest/reporters"
require 'pry'
require 'looksee'

Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

Minitest::Test.class_eval do
  def self.inherited(klass)
    klass.class_eval do
      def self.test_order
        :alpha
      end
    end

    super
  end
end
