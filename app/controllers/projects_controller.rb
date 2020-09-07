class ProjectsController < ApplicationController
  after_action :verify_authorized
  before_action :set_project, only: %i[show edit update destroy]
  before_action(only: %i[index new create]) { authorize Project }
  before_action(only: %i[show edit update destroy]) { authorize @project }

  # GET /projects
  def index
    @projects = policy_scope(Project)
  end

  # GET /projects/1
  def show; end

  # GET /projects/new
  def new
    @project = Project.new
  end

  # POST /projects/new
  def create
    params = project_params
    @project = Project.new(params)

    respond_to do |format|
      if @project.save
        format.html do
          redirect_to @project, flash: { success: I18n.t(:new_success,
                                                           scope: :resource,
                                                           resource: Project.model_name.human.capitalize) }
        end
        format.json { render :show, status: :created, location: @project }
      else
        format.html { render :new }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  #  /projects/1
  def edit; end

  # PATCH/PUT /projects/1
  def update
    respond_to do |format|
      if @project.update(project_params)
        format.html do
          redirect_to @project, flash: { success: I18n.t(:edit_success,
                                                         scope: :resource,
                                                         resource: Project.model_name.human.capitalize) }
        end
        format.json { render :show, status: :ok, location: @project }
      else
        format.html { render :edit }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /projects/1
  def destroy
    @project.destroy
    respond_to do |format|
      format.html do
        redirect_to projects_path, flash: { success: I18n.t(:destroy_success,
                                                              scope: :resource,
                                                              resource: Project.model_name.human.capitalize) }
      end
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_project
    @project = Project.find(params[:id])
  end

  def project_params
    params.require(:project).permit(:project_name, :client_id, :workspace_id, :description, :delivery_time, :current_cost, :currency, :status)
  end

end
