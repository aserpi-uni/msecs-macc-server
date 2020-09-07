class GoogleSignInController < ApplicationController

  # GET google_oauth/id
  def id
    render plain: Rails.application.credentials.google_oauth_id, status: 200
  end

  # POST google_oauth/sign_in.json
  def sign_in
    validator = GoogleIDToken::Validator.new
    token_id = params.require(:id_token)

    begin
      validated_token = validator.check(token_id, Rails.application.credentials.google_oauth_id, nil)
    rescue GoogleIDToken::ValidationError
      return head :forbidden
    end

    sign_in_with_google(validated_token)
  end

  private

  def sign_in_with_google(payload)
    return head :forbidden unless payload['email_verified']

    worker = Worker.find_by(email: payload['email'])
    return head :forbidden unless worker

    token = Tiddle.create_and_return_token(worker, request, expires_in: 1.week)
    respond_to do |format|
      format.json do
        render json: { email: worker.email, authentication_token: token, url: worker_url(worker, format: :json) }
      end
    end
  end
end
