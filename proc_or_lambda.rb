$LOAD_PATH.unshift File.expand_path(".")
require 'test_helper'

class ProcOrLambda < Minitest::Test
  # @!visibility private
  def setup
  end

  def test_lambda_doesnt_return_from_calling_method
    skip "pending"
  end

  def test_lambda_has_no_default_arity
    skip "pending"
  end
end
