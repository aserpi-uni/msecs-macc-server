class ApplicationController < ActionController::Base
  include Pundit

  rescue_from Pundit::NotAuthorizedError, with: :not_authorized

  private

  # Redirects the user after a _Pundit_ nay.
  def not_authorized
    flash.alert = I18n.t :forbidden
    response.headers['Status-Code'] = '403'
    redirect_to admin_signed_in? ? authenticated_root_path : unauthenticated_root_path
  end

  def pundit_user
    current_admin
  end
end
