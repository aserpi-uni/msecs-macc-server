class ApplicationController < ActionController::Base
  include Pundit

  rescue_from Pundit::NotAuthorizedError, with: :not_authorized

  private

  # Redirects the user after a _Pundit_ nay.
  def not_authorized
    flash.alert = I18n.t :forbidden
    response.headers['Status-Code'] = '403'
    redirect_to(root_url)
  end

  def pundit_user
    current_admin || current_worker
  end
end
