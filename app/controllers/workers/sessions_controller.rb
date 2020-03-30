# frozen_string_literal: true

class Workers::SessionsController < Devise::SessionsController
  respond_to :json

  # before_action :configure_sign_in_params, only: [:create]

  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  def create
    self.resource = warden.authenticate!(auth_options)
    set_flash_message(:notice, :signed_in) if is_flashing_format?
    sign_in(resource_name, resource)
    yield resource if block_given?
    respond_with resource, location: after_sign_in_path_for(resource) do |format|
      format.json do
        token = Tiddle.create_and_return_token(resource, request, expires_in: 1.week)
        render json: { email: resource.email, authentication_token: token, url: worker_url(resource, format: :json) }
      end
    end
  end

  # DELETE /resource/sign_out
  def destroy
    Tiddle.expire_token(current_worker, request) if current_worker
    super
  end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end

  private

  def verify_signed_out_user; end
end
