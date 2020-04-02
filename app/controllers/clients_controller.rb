class ClientsController < ApplicationController
  before_action :set_client, only: %i[show edit update destroy]

  # GET /clients
  # GET /clients.json
  def index
    @clients = Client.all
  end

  # GET /clients/1
  # GET /clients/1.json
  def show; end

  # GET /clients/new
  def new
    @client = Client.new
  end

  # GET /clients/1/edit
  def edit; end

  # POST /clients
  # POST /clients.json
  def create
    @client = Client.from_params(client_params)

    respond_to do |format|
      if @client.save
        format.html do
          redirect_to @client, flash: { success: I18n.t(:new_success,
                                                        scope: :resource,
                                                        resource: Client.model_name.human.capitalize) }
        end
        format.json { render :show, status: :created, location: @client }
      else
        format.html { render :new }
        format.json { render json: @client.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /clients/1
  # PATCH/PUT /clients/1.json
  def update
    respond_to do |format|
      if @client.update(client_params)
        format.html do
          redirect_to @client, flash: { success: I18n.t(:edit_success,
                                                        scope: :resource,
                                                        resource: Client.model_name.human.capitalize) }
        end
        format.json { render :show, status: :ok, location: @client }
      else
        format.html { render :edit }
        format.json { render json: @client.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /clients/1
  # DELETE /clients/1.json
  def destroy
    @client.destroy
    respond_to do |format|
      format.html do
        redirect_to clients_path, flash: { success: I18n.t(:destroy_success,
                                                           scope: :resource,
                                                           resource: Client.model_name.human.capitalize) }
      end
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_client
    @client = Client.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def client_params
    params.require(:client).permit(%i[color description name])
  end
end