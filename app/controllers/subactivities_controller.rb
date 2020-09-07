class SubactivitiesController < ApplicationController
  after_action :verify_authorized
  before_action :set_project
  before_action :set_activity
  before_action :set_subactivity, only: [:show, :update, :update_status, :destroy]
  before_action(only: %i[show create update update_status destroy]) { authorize @activity, policy_class: SubactivityPolicy }

  # GET /subactivities
  # GET /subactivities.json
  def index
    policy_scope(Subactivity)
  end

  # GET /subactivities/1
  # GET /subactivities/1.json
  def show; end

  # POST /subactivities
  # POST /subactivities.json
  def create
    params = subactivity_params
    params[:activity] = @activity
    @subactivity = Subactivity.new(params)

    respond_to do |format|
      if @subactivity.save
        format.html { redirect_to @subactivity, notice: 'Subactivity was successfully created.' }
        format.json { render :show, status: :created, location: [@project, @activity, @subactivity] }
      else
        format.html { render :new }
        format.json { render json: @subactivity.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /subactivities/1
  # PATCH/PUT /subactivities/1.json
  def update
    respond_to do |format|
      if @subactivity.update(subactivity_params)
        format.html { redirect_to @subactivity, notice: 'Subactivity was successfully updated.' }
        format.json { render :show, status: :ok, location: @subactivity }
      else
        format.html { render :edit }
        format.json { render json: @subactivity.errors, status: :unprocessable_entity }
      end
    end
  end

  def update_status
    @subactivity.update(params.require(:subactivity).permit(:status))
  end

  # DELETE /subactivities/1
  # DELETE /subactivities/1.json
  def destroy
    @subactivity.destroy
    respond_to do |format|
      format.html { redirect_to subactivities_url, notice: 'Subactivity was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def set_project
    @project = Project.find(params[:project_id])
  end

  def set_activity
    @activity = @project.activities.find(params[:activity_id])
  end

  # Use callbacks to share common setup or constraints between actions.
  def set_subactivity
    @subactivity = @activity.subactivities.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def subactivity_params
    params.require(:subactivity).permit(:description, :delivery_time, :status, :worker_1_id, :worker_2_id, :worker_3_id)
  end
end
