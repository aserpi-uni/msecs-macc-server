class SubactivitiesController < ApplicationController
  before_action :set_subactivity, only: [:show, :edit, :update, :destroy]

  # GET /subactivities
  # GET /subactivities.json
  def index
    @subactivities = Subactivity.all
  end

  # GET /subactivities/1
  # GET /subactivities/1.json
  def show
  end

  # GET /subactivities/1/edit
  def edit
  end

  # POST /subactivities
  # POST /subactivities.json
  def create
    params = subactivity_params
    @subactivity = Subactivity.from_params(params)

    respond_to do |format|
      if @subactivity.save
        format.html { redirect_to @subactivity, notice: 'Subactivity was successfully created.' }
        format.json { render :show, status: :created, location: @subactivity }
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
    # Use callbacks to share common setup or constraints between actions.
    def set_subactivity
      @subactivity = Subactivity.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def subactivity_params
      params.require(:subactivity).permit(:description, :status, :activity_id, :worker_1_id, :worker_2_id, :worker_3_id)
    end
end
