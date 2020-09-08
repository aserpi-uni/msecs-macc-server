class WorkingschedulesController < ApplicationController
  after_action :verify_authorized
  before_action :set_project
  before_action :set_activity
  before_action :set_subactivity
  before_action(only: %i[create]) { authorize @subactivity, policy_class: WorkingschedulePolicy }

  # GET /workingschedules
  # GET /workingschedules.json
  def index
    policy_scope(Workingschedule)
  end

  # GET /workingschedules/1/edit
  def edit
  end

  # POST /workingschedules
  # POST /workingschedules.json
  def create
    params = workingschedule_params

    @workingschedule = Workingschedule.new(params)
    @workingschedule.subactivity = @subactivity
    @workingschedule.worker = current_worker

    respond_to do |format|
      if @workingschedule.save
        format.html { redirect_to project_activity_subactivity_workingschedule_path(@project, @activity, @subactivity, @workingschedule), notice: 'Workingschedule was successfully created.' }
        format.json { render :show, status: :created, location: project_activity_subactivity_workingschedule_path(@project, @activity, @subactivity, @workingschedule) }
      else
        format.html { render :new }
        format.json { render json: @workingschedule.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /workingschedules/1
  # PATCH/PUT /workingschedules/1.json
  def update
    respond_to do |format|
      if @workingschedule.update(workingschedule_params)
        format.html { redirect_to project_activity_subactivity_workingschedule_path(@project, @activity, @subactivity, @workingschedule), notice: 'Workingschedule was successfully updated.' }
        format.json { render :show, status: :ok, location: project_activity_subactivity_workingschedule_path(@project, @activity, @subactivity, @workingschedule) }
      else
        format.html { render :edit }
        format.json { render json: @workingschedule.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /workingschedules/1
  # DELETE /workingschedules/1.json
  def destroy
    @workingschedule.destroy
    respond_to do |format|
      format.html { redirect_to project_activity_subactivity_workingschedules_path(@project, @activity, @subactivity), notice: 'Workingschedule was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  def set_activity
    @activity = @project.activities.find(params[:activity_id])
  end

  def set_project
    @project = Project.find(params[:project_id])
  end

  def set_subactivity
    @subactivity = @activity.subactivities.find(params[:subactivity_id])
  end

  # Use callbacks to share common setup or constraints between actions.
  def set_workingschedule
    @workingschedule = @worker.workingschedules.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def workingschedule_params
    params.require(:workingschedule).permit(:hours, :date)
  end
end
