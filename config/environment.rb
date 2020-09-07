# Load the Rails application.
require_relative 'application'

# Initialize the Rails application.
Rails.application.initialize!

# Mailer settings
ActionMailer::Base.smtp_settings = {
    address: 'smtp.sendgrid.net',
    port: 587,
    authentication: :plain,
    user_name: 'apikey',
    password: Rails.application.credentials.sendgrid_apikey,
    enable_starttls_auto: true
}

Rails.logger.info 'My log will have something to say about this'
