class AdminsController < ApplicationController
  after_action :verify_authorized
  before_action :set_admin, only: %i[show edit update destroy]
  before_action only: %i[index show new create destroy] do
    authorize Admin
  end
  before_action only: %i[edit update] do
    authorize @admin
  end

  # GET /admins
  # GET /admins.json
  def index
    # TODO: paginate
    @admins = Admin.all
  end

  # GET /admins/1
  # GET /admins/1.json
  def show; end

  # GET /admins/new
  def new
    @admin = Admin.new
  end

  # GET /admins/1/edit
  def edit; end

  # POST /admins
  # POST /admins.json
  def create
    @admin = Admin.from_params(admin_params.permit(:email))

    respond_to do |format|
      if @admin.save
        format.html do
          redirect_to @admin, flash: { success: I18n.t(:new_success,
                                                       scope: :resource,
                                                       resource: Admin.model_name.human.capitalize) }
        end
        format.json { render :show, status: :created, location: @admin }
        AdminMailer.new_admin(@admin).deliver_later
      else
        format.html { render :new }
        format.json { render json: @admin.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /admins/1
  # PATCH/PUT /admins/1.json
  def update
    respond_to do |format|
      if @admin.update(admin_params.permit(%i[email password password_confirmation]))
        format.html do
          redirect_to @admin, flash: { success: I18n.t(:edit_success,
                                                       scope: :resource,
                                                       resource: Admin.model_name.human.capitalize) }
        end
        format.json { render :show, status: :ok, location: @admin }
      else
        format.html { render :edit }
        format.json { render json: @admin.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admins/1
  # DELETE /admins/1.json
  def destroy
    respond_to do |format|
      if @admin.destroy
        format.html do
          redirect_to admins_url, flash: { success: I18n.t(:destroy_success,
                                                           scope: :resource,
                                                           resource: Admin.model_name.human.capitalize) }
        end
        format.json { head :no_content }
      else
        if @admin == current_admin
          format.html { render :edit }
        else
          format.html { render :show }
          flash.now[:error] = I18n.t(:failed, scope: %i[admin_other destroy])
        end
        format.json { render json: @admin.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_admin
    @admin = Admin.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def admin_params
    params.require(:admin)
  end
end
