class ProjectsController < ApplicationController
  def index
    @projects = policy_scope(Project)
  end
  def show
    @project = Project.find(params[:id])
  end
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
  def project_params
    params.require(:project).permit(:project_name, :workspace_name, :description, :delivery_time, :current_cost, :currency, :status)
  end

end
