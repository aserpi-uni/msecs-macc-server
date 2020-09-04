class Project < ApplicationRecord
  belongs_to :admin
  belongs_to :client
  belongs_to :workspace

  has_many :activities, :dependent => :destroy

  def self.from_params(params)
    project = Project.new
    project.admin = params[:admin]
    project.client_id = params[:client_id]
    project.description = params[:description]
    project.project_name = params[:project_name]
    project.workspace_id = params[:workspace_id]  # TODO: check if admin supervises workspace
    project.delivery_time = params[:delivery_time]
    project.current_cost = params[:current_cost]
    project.status = params[:status]

    project
  end
end
