ENV["RAILS_ENV"] ||= 'test'
require File.expand_path(File.join(File.dirname(__FILE__),'..','config','environment'))
require 'spec/autorun'
require 'spec/rails'
require 'lockdown/rspec_helper'
require "authlogic/test_case" # include at the top of test_helper.rb

include Authlogic::TestCase

module Lockdown
  module RspecHelper
    def mock_user_group
      mock_model(UserGroup)
    end

    def mock_user
      mock_model  User,
                  :email  => 'email@example.com',
                  :password   => "mysecret",
                  :password_confirmation   => "mysecret",
                  :null_object => true
    end
  end
end

include Lockdown::RspecHelper

# Uncomment the next line to use webrat's matchers
#require 'webrat/integrations/rspec-rails'

# Requires supporting files with custom matchers and macros, etc,
# in ./support/ and its subdirectories.
Dir[File.expand_path(File.join(File.dirname(__FILE__),'support','**','*.rb'))].each {|f| require f}

Spec::Runner.configure do |config|
  config.use_transactional_fixtures = true
  config.use_instantiated_fixtures  = false
  config.fixture_path = RAILS_ROOT + '/spec/fixtures/'
end
