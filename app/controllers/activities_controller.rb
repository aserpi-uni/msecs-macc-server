class ActivitiesController < ApplicationController
  after_action :verify_authorized
  before_action :set_project
  before_action :set_activity, only: [:show, :show_cost, :edit, :update, :destroy]
  before_action(only: %i[show show_cost new create edit update destroy]) { authorize @project }

  # GET /projects/1/activities/1
  def show; end

  # GET /projects/1/activities/1/show_cost
  def show_cost
    bank = Money.default_bank
    bank.update_rates

    query = Worker.joins(:workingschedules, workingschedules: :subactivity)
                .where(subactivities: {activity_id: 4})
                .select(:hours, :bill_rate_cents, :currency)
    @cost = query.map { |h, b, c| bank.exchange(h * b, c, project.currency) }.sum
  end

  # GET /projects/1/activities/new
  def new
    @activity = @project.activities.build
  end

  # POST /projects/1/activities/new
  def create
    params = activity_params
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

  # GET /projects/1/activities/1/edit
  def edit; end

  # POST /projects/1/activities/1/edit
  def update
    respond_to do |format|
      if @activity.update(activity_params)
        format.html { redirect_to project_activity_path(@project), success: I18n.t(:edit_success,
                                                                                   scope: :resource,
                                                                                   resource: Activity.model_name.human.capitalize) }
        format.json { render :show, status: :ok, location: @activity }
      else
        format.html { render :edit }
        format.json { render json: @ativity.errors, status: :unprocessable_entity }
        end
      end
  end

  # DELETE /projects/1/activities/1
  def destroy
    @activity.destroy
    respond_to do |format|
      format.html { redirect_to project_path(@project), success: I18n.t(:destroy_success,
                                                                        scope: :resource,
                                                                        resource: Activity.model_name.human.capitalize) }
      format.json { head :no_content }
      end
  end

  private

  def activity_params
    params.require(:activity).permit(:delivery_time, :description, :project_id, :status)
  end

  def set_activity
    @activity = @project.activities.find(params[:id])
  end

  def set_project
    @project = Project.find(params[:project_id])
  end
end
