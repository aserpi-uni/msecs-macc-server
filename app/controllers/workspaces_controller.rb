class WorkspacesController < ApplicationController
  after_action :verify_authorized
  before_action :set_workspace, only: %i[show edit update destroy]
  before_action(only: %i[index new create]) { authorize Workspace }
  before_action(only: %i[show edit update destroy]) { authorize @workspace }

  # GET /workspaces
  # GET /workspaces.json
  def index
    @workspaces = policy_scope(Workspace)
  end

  # GET /workspaces/1
  # GET /workspaces/1.json
  def show; end

  # GET /workspaces/new
  def new
    @workspace = Workspace.new
  end

  # GET /workspaces/1/edit
  def edit; end

  # POST /workspaces
  # POST /workspaces.json
  def create
    params = workspace_params
    params[:admin] = current_admin
    @workspace = Workspace.from_params(params)

    respond_to do |format|
      if @workspace.save
        format.html do
          redirect_to @workspace, flash: { success: I18n.t(:new_success,
                                                           scope: :resource,
                                                           resource: Workspace.model_name.human.capitalize) }
        end
        format.json { render :show, status: :created, location: @workspace }
      else
        format.html { render :new }
        format.json { render json: @workspace.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /workspaces/1
  # PATCH/PUT /workspaces/1.json
  def update
    respond_to do |format|
      if @workspace.update(workspace_params)
        format.html do
          redirect_to @workspace, flash: { success: I18n.t(:edit_success,
                                                           scope: :resource,
                                                           resource: Workspace.model_name.human.capitalize) }
        end
        format.json { render :show, status: :ok, location: @workspace }
      else
        format.html { render :edit }
        format.json { render json: @workspace.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /workspaces/1
  # DELETE /workspaces/1.json
  def destroy
    @workspace.destroy
    respond_to do |format|
      format.html do
        redirect_to workspaces_path, flash: { success: I18n.t(:destroy_success,
                                                              scope: :resource,
                                                              resource: Workspace.model_name.human.capitalize) }
      end
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_workspace
    @workspace = Workspace.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def workspace_params
    params.require(:workspace).permit(%i[billable description name])
  end
end
