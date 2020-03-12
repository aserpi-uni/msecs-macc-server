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
  end

  # GET /workspaces/1/edit
  def edit
  end

  # POST /workspaces
  # POST /workspaces.json
  def create
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
end
