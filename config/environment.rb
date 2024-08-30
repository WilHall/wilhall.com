# Load the Rails application.
require_relative "application"

# Initialize the Rails application.
Rails.application.initialize!

ActionMailer::Base.smtp_settings = {
  :user_name => 'wil@wilhall.com',
  :password => ENV.fetch("FASTMAIL_PASSWORD"),
  :address => 'smtp.fastmail.com',
  :port => 587,
  :authentication => :plain,
  :enable_starttls_auto => true
}
