class WorkspacesController < ApplicationController
  before_action :set_workspace, only: %i[show edit update destroy]

  # GET /workspaces
  # GET /workspaces.json
  def index
  end

  # GET /workspaces/1
  # GET /workspaces/1.json
  def show
  end

  # GET /workspaces/new
  def new
    @workspace = Workspace.new
  end

  # GET /workspaces/1/edit
  def edit
  end

  # POST /workspaces
  # POST /workspaces.json
  def create
    params = workspace_params.permit(%i[billable description name])
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
  end

  # DELETE /workspaces/1
  # DELETE /workspaces/1.json
  def destroy
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_workspace
    @workspace = Workspace.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def workspace_params
    params.require(:workspace)
  end
end
