$LOAD_PATH.unshift File.expand_path(".")
require 'test_helper'

class VersionedApi < Minitest::Test
  # @!visibility private
  def setup
  end

  # Can we use module namespacing? e.g.
  # API::V1::Billing
  # API::V2::Billing
  # API::Billing -> use API::V2::Billing
  # (?) use const_missing
  # (?) use inlude with CurrentVersion module

  # Maybe something like ...
  # CurrentVersion = API::V1
  #
  # class API::Billing < CurrentVersion::Billing
  # end
  
end
