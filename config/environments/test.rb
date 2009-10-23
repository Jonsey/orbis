# I am putting this in to get through the 
# See http://rails.lighthouseapp.com/projects/8994/tickets/802-eager-load-application-classes-can-block-migration
config.cache_classes = (File.basename($0) == "rake") ? false : true

# Log error messages when you accidentally call methods on nil.
config.whiny_nils = true

# Show full error reports and disable caching
config.action_controller.consider_all_requests_local = true
config.action_controller.perform_caching             = false
config.action_view.cache_template_loading            = true

# Disable request forgery protection in test environment
config.action_controller.allow_forgery_protection    = false

# Tell Action Mailer not to deliver emails to the real world.
# The :test delivery method accumulates sent emails in the
# ActionMailer::Base.deliveries array.
config.action_mailer.delivery_method = :test

config.gem "rspec", :lib => false, :version => ">= 1.2.9"
config.gem "rspec-rails", :lib => false, :version => ">= 1.2.9"

config.gem "cucumber", :lib => false, :version => ">= 0.4.2"
config.gem "webrat", :lib => false, :version => ">= 0.5.3"
