# Mailer for operations on admins
class AdminMailer < ApplicationMailer
  def new_admin(admin)
    @admin = admin
    mail subject: default_i18n_subject, to: @admin.email
  end
end
