class ProjectsController < ApplicationController
  def index
    @projects = policy_scope(Project)
  end
  def new
    @project = Project.new
  end
  def create
    params = project_params
    params[:admin] = current_admin
  end

  private
  def project_params
    params.require(:project).permit(:project_name, workspace_name, :description, :delivery_time)
  end

end
