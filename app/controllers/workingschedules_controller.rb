class WorkingschedulesController < ApplicationController
  before_action :get_worker
  before_action :set_workingschedule, only: [:show, :edit, :update, :destroy]

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

    subactivity_id = (params[:subactivity_url].split('/'))[-1].to_i

    @workingschedule = Workingschedule.new(params)
    @workingschedule.subactivity_id = subactivity_id
    @workingschedule.worker_id = @worker.id

    respond_to do |format|
      if @workingschedule.save
        format.html { redirect_to @workingschedule, notice: 'Workingschedule was successfully created.' }
        format.json { render :show, status: :created, location: @workingschedule }
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
        format.html { redirect_to @workingschedule, notice: 'Workingschedule was successfully updated.' }
        format.json { render :show, status: :ok, location: @workingschedule }
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
      format.html { redirect_to workingschedules_url, notice: 'Workingschedule was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_workingschedule
      @workingschedule = @worker.workingschedules.find(params[:id])
    end

    def get_worker
      @worker = Worker.find(params[:worker_id])
    end

    # Only allow a list of trusted parameters through.
    def workingschedule_params
      params.require(:workingschedule).permit(:hours, :date, :worker_id, :activity_id, :subactivity_id)
    end
end
