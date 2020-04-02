class Workspace < ApplicationRecord
  belongs_to :admin
  has_and_belongs_to_many :clients
  has_and_belongs_to_many :workers

  # Create a new Workspace from +create+ action parameters.
  def self.from_params(params)
    workspace = Workspace.new

    workspace.admin = params[:admin]
    workspace.description = params[:description]
    workspace.name = params[:name]

    workspace
  end

  def transfer_supervision(email)
    unless (new_admin = Admin.find_by email: email)
      errors.add :base, I18n.t(:failed, scope: %i[workspace transfer_supervision])
      return false
    end

    self.admin = new_admin
    save
  end
end
