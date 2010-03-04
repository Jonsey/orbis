RAILS_GEM_VERSION = '2.3.2' unless defined? RAILS_GEM_VERSION

require File.join(File.dirname(__FILE__), 'boot')

Rails::Initializer.run do |config|
  config.load_paths += %W( #{RAILS_ROOT}/app/builders )

  config.gem 'configatron'
  config.gem "authlogic"
  config.gem "lockdown"
  config.gem "markup_validity"
  config.gem "tidy_table"
  config.gem "thoughtbot-factory_girl", :lib => "factory_girl", :source => "http://gems.github.com"
  config.gem 'paperclip', :source => 'http://gemcutter.org'
  config.gem 'will_paginate', :version => '~> 2.3.11', :source => 'http://gemcutter.org'


  config.time_zone = 'UTC'

  # change this for each app
  config.action_controller.session = {
   :session_key => '_orbis_session',
   :secret      => '97ecd44e13fe9fc0bbcd6a6498ba77d60cd6174d242c62229f4efe84d89d5265ed1511f66ec87d499541f1566925d5f7d66a97979b267c54ca7784c1c1641f23'
  }
end

require 'formatted_form_for'

#ActiveSupport::Inflector.inflections do |inflect|
# inflect.irregular 'staff', 'staff'
#end

