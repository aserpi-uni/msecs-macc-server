class ClientsController < ApplicationController
  after_action :verify_authorized
  before_action :set_client, only: %i[show edit edit_workspaces update update_workspaces destroy]
  before_action(only: %i[index new edit edit_workspaces create update update update_workspaces destroy]) { authorize Client }
  before_action(only: :show) { authorize @client }

  # GET /clients
  # GET /clients.json
  def index
    @clients = policy_scope(Client)
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

  # GET /clients/1/edit_workspaces
  def edit_workspaces; end

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

  # POST /clients/1/update_workspaces
  # POST /clients/1/update_workspaces.json
  def update_workspaces
    workspaces_params = params.require(:workspaces).select { |_, v| v == '1' }.permit!

    # Only supervised workspaces can be added/removed
    old_unsupervised_workspaces = @client.workspaces.where.not admin: current_admin
    submitted_workspaces = Workspace.find(workspaces_params.to_h.map { |k, _| k.to_i })
    @client.workspaces = old_unsupervised_workspaces + submitted_workspaces

    respond_to do |format|
      if @client.save
        format.html do
          redirect_to @client, flash: { success: I18n.t(:success, scope: %i[client update_workspaces]) }
        end
        format.json { render :show, status: :ok, location: @client }
      else
        format.html { render :edit_workers }
        flash.now[:error] = I18n.t(:failed, scope: %i[client update_workspaces])
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
    client_params = params.require(:client).permit(%i[color description name])

    color = Integer(client_params[:color][1..6], 16)
    client_params[:color] = color.positive? ? color : nil # Use black as default color

    client_params
  end
end
