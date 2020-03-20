class ApplicationController < ActionController::Base
  include Pundit
  protect_from_forgery unless: -> { request.format.json? }

  rescue_from Pundit::NotAuthorizedError, with: :not_authorized

  private

  # Redirects the user after a _Pundit_ nay.
  def not_authorized
    flash.alert = I18n.t :forbidden

    return head :forbidden if params['format'] == 'json'

    redirect_to root_url
  end

  def pundit_user
    current_admin || current_worker
  end
end
