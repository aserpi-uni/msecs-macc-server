class ActivitiesController < ApplicationController
  before_action :get_project
  before_action :set_activity, only: [:show, :edit, :update, :destroy]
  def index
    @activities= @project.activities
  end
  def new
    @activity = @project.activities.build
  end
  def create

    params = activity_params
    params[:admin] = current_admin
    #@activity = Activity.from_params(@project, params)


    @activity = @project.activities.build(params)
    if @activity.save
      flash[:notice] = 'Activity created'
      redirect_to @activity
    else
      flash[:notice] = 'Error in creating activity: #{@activity.errors}'
      redirect_to @activity
    end
  end
  def show
    @activity = Activity.find(params[:id])
  end
  def edit

  end
  def update
    respond_to do |format|
      if @activity.update(activity_params)
        format.html { redirect_to project_activity_path(@project), notice: 'Activity was successfully updated.' }
        format.json { render :show, status: :ok, location: @activity }
      else
        format.html { render :edit }
        format.json { render json: @ativity.errors, status: :unprocessable_entity }
        end
      end
    end
  def destroy
    @activity.destroy
    respond_to do |format|
      format.html { redirect_to project_activities_path(@project), notice: 'Activity was successfully destroyed.' }
      format.json { head :no_content }
      end
  end

  private
  def activity_params
    params.require(:activity).permit(:description, :project_id)
  end
  def get_project
    @project = Project.find(params[:project_id])
  end
  def set_activity
    @activity = @project.activities.find(params[:id])
  end
end
