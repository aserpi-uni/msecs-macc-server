class ActivitiesController < ApplicationController
  before_action :get_project
  before_action :set_activity, only: [:show, :edit, :update, :destroy]
  def index
    @activities= @project.activities
  end
  def new
    @activity = @project.activities.build
  end

  # POST /project/1/activities/new
  def create
    params = activity_params
    params[:admin] = current_admin
    @activity = @project.activities.build(params)

    respond_to do |format|
      if @activity.save
        format.html do
          redirect_to project_activity_path(@project, @activity), flash: { success: I18n.t(:new_success,
                                                                                           scope: :resource,
                                                                                           resource: Activity.model_name.human.capitalize) }
        end
        format.json { render :show, status: :created, location: project_activity_url(@project, @activity) }
      else
        format.html { render :new }
        format.json { render json: @activity.errors, status: :unprocessable_entity }
      end
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
    params.require(:activity).permit(:delivery_time, :description, :project_id, :status)
  end
  def get_project
    @project = Project.find(params[:project_id])
  end
  def set_activity
    @activity = @project.activities.find(params[:id])
  end
end
