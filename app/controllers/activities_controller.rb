class ActivitiesController < ApplicationController
  def index
    @activity= policy_scope(Activity)
  end
  def new
    @activity = Activity.new
  end
  def create
    params = project_params
    params[:admin] = current_admin
    params[:project]
    @project = Project.from_params(params)
    print(params[:status])
    @project.save
    redirect_to @project
  end
  def show
    @activity = Activity.find(params[:id])
  end
  def edit

  end
  def update

  end

  def destroy

  end
end
