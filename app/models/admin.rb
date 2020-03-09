class Admin < ApplicationRecord
  devise :database_authenticatable,
         :lockable,
         :recoverable,
         :timeoutable,
         :validatable

  # Create a new Admin from +create+ action parameters.
  def self.from_params(params)
    admin = Admin.new

    admin.email = params[:email]
    admin.password = Devise.friendly_token 32

    admin
  end
end
