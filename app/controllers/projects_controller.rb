class ProjectsController < ApplicationController
  before_action :set_project, only: %i[show]

  def index
    @projects = policy_scope(Project)
  end

  # GET /projects/1
  def show;end

  def new
    @project = Project.new
  end
  def create
    params = project_params
    params[:admin] = current_admin
    params[:current_cost] = 0
    @project = Project.from_params(params)
    print(params[:status])
    @project.save
    redirect_to @project

  end
  def edit
    @project = Project.find(params[:id])
  end
  def update
    @project = Project.find(params[:id])
    @project.update(project_params)
    redirect_to @project
  end
  def destroy
    @project = Project.find(params[:id])
    @project.destroy
    redirect_to projects_path
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_project
    @project = Project.find(params[:id])
  end

  def project_params
    params.require(:project).permit(:project_name, :workspace_id, :description, :delivery_time, :current_cost, :currency, :status)
  end

end
