class Workspace < ApplicationRecord
  belongs_to :admin

  # Create a new Workspace from +create+ action parameters.
  def self.from_params(params)
    workspace = Workspace.new

    workspace.admin = params[:admin]
    workspace.billable = params[:billable]
    workspace.description = params[:description]
    workspace.name = params[:name]

    workspace
  end
end
