require 'simplecov'
SimpleCov.start
 
ENV["RAILS_ENV"] = "test"
require File.expand_path("../../config/environment", __FILE__)
require "rails/test_help"
require "minitest/rails"
require "minitest/spec"
require "minitest/pride"
 
class ActiveSupport::TestCase
  include FactoryGirl::Syntax::Methods
end
 
class ActionController::TestCase
  include FactoryGirl::Syntax::Methods
  include Devise::TestHelpers
end