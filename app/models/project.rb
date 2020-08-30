class Project < ApplicationRecord
  belongs_to :admin
  has_one :workspace

  def self.from_params(params)
    project = Project.new
    project.admin = params[:admin]
    project.description = params[:description]
    project.project_name = params[:project_name]
    project.workspace_id = params[:workspace_name]
    project.delivery_time = params[:delivery_time]
    project.current_cost = params[:current_cost]
    project.status = params[:status]

    project
  end
end
