class GoogleSignInController < ApplicationController

  # GET google_oauth/id
  def id
    render plain: ENV['GOOGLE_OAUTH_ID'], status: 200
  end
end
