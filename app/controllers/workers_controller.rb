class WorkersController < ApplicationController
  after_action :verify_authorized
  before_action :set_worker, only: %i[show update destroy]
  before_action only: %i[index show_self new create destroy] do
    authorize Worker
  end
  before_action only: %i[show update] do
    authorize @worker
  end

  # GET /workers
  # GET /workers.json
  def index
    # TODO: paginate
    @workers = Worker.all
  end

  # GET /workers/1.json
  def show; end

  def show_self
    redirect_to current_worker
  end

  # GET /workers/new
  def new
    @worker = Worker.new
  end

  # POST /workers
  # POST /workers.json
  def create
    @worker = Worker.from_params(worker_params.permit(:email))

    respond_to do |format|
      if @worker.save
        format.html do
          redirect_to @worker, flash: { success: I18n.t(:new_success,
                                                        scope: :resource,
                                                        resource: Worker.model_name.human.capitalize) }
        end
        format.json { render :show, status: :created, location: @worker }
        AdminMailer.new_admin(@worker).deliver_later # TODO: unify mailers
      else
        format.html { render :new }
        format.json { render json: @worker.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /workers/1
  # PATCH/PUT /workers/1.json
  def update
    respond_to do |format|
      params = worker_params.permit(%i[bill_rate_cents currency email password password_confirmation])

      if @worker.update(params)
        format.html do
          redirect_to @worker, flash: { success: I18n.t(:edit_success,
                                                       scope: :resource,
                                                       resource: Admin.model_name.human.capitalize) }
        end
        format.json { render :show, status: :ok, location: @worker }
      else
        format.html { render :edit }
        format.json { render json: @worker.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /workers/1
  # DELETE /workers/1.json
  def destroy
    respond_to do |format|
      if @worker.destroy
        format.html do
          redirect_to workers_url, flash: { success: I18n.t(:destroy_success,
                                                            scope: :resource,
                                                            resource: Worker.model_name.human.capitalize) }
        end
        format.json { head :no_content }
      else
        format.html { render :show }
        flash.now[:error] = I18n.t(:failed, scope: %i[worker destroy])
        format.json { render json: @worker.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_worker
    @worker = Worker.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def worker_params
    params.require(:worker)
  end
end
