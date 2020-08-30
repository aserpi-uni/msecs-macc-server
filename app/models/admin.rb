class Admin < ApplicationRecord
  devise :database_authenticatable,
         :lockable,
         :recoverable,
         :timeoutable,
         :validatable
  before_destroy :check_workspaces, :check_projects

  has_many :workspaces
  has_many :projects

  def check_workspaces
    return true if workspaces.empty?

    errors.add :base, I18n.t(:failed, scope: %i[admin_other destroy])
    throw(:abort)
  end
  def check_projects
    return true if projects.empty?

    errors.add :base, I18n.t(:failed, scope: %i[admin_other destroy])
    throw(:abort)
  end

  # Create a new Admin from +create+ action parameters.
  def self.from_params(params)
    admin = Admin.new

    admin.email = params[:email]
    admin.password = Devise.friendly_token 32

    admin
  end
end
