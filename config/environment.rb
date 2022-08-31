# Load the Rails application.
require_relative 'application'

# Initialize the Rails application.
Rails.application.initialize!


 ActionMailer::Base.perform_deliveries = true
  ActionMailer::Base.delivery_method = :smtp
  ActionMailer::Base.smtp_settings = {
    address: 'smtp.gmail.com',
    port: 465,
    user_name:ENV['basemshams30@gmail.com'],
    password: ENV[''],
    domain: '@gmail.com',
    authentication: :plain,
    enable_starttls_auto: true
  }