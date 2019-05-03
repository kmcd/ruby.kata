$LOAD_PATH.unshift File.expand_path(".")
require 'test_helper'

class ProcOrLambda < Minitest::Test
  # @!visibility private
  def setup
  end

  def proc_object
    Proc.new { return }.call

    puts 'Not reached'
  end

  def lambda_object
    lambda { return }.call

    puts 'OHAi!'
  end

  def test_proc_returns_from_calling_method
    assert_silent do
      proc_object
    end
  end

  def test_lambda_does_not_return_from_calling_method
    assert_output(/OHAi/) do
      lambda_object
    end
  end

  def test_proc_has_no_default_arity
    skip 'pending'
  end

  def test_lambda_requires_defined_arity
    skip 'pending'
  end
end
