class ApplicationMailer < ActionMailer::Base
  default from: Rails.application.credentials.dig(:email_from)
  layout 'mailer'
end
