class Workspace < ApplicationRecord
  include Updatable

  belongs_to :admin
  belongs_to :master, class_name: Worker.name, optional: true

  has_and_belongs_to_many :clients, after_add: :touch_updated_at, after_remove: :touch_updated_at
  has_and_belongs_to_many :workers, after_add: :touch_updated_at, after_remove: :touch_updated_at
  has_many :projects, :dependent => :destroy

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
