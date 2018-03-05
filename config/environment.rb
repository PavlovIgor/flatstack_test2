# Load the Rails application.
require_relative 'application'

# Initialize the Rails application.
Rails.application.initialize!
ActionMailer::Base.smtp_settings = {
  :tls => true,
  :user_name => '',
  :password => '',
  :domain => '',
  :address => '',
  :port => 465,
  :authentication => :plain,
  :enable_starttls_auto => true
}
