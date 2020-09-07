class ProjectPolicy < ApplicationPolicy
  def initialize(user, project)
    @user = user
    @project = project
  end

  def index?
    @user.is_a?(Admin) || @user.is_a?(Worker)
  end

  def show?
    (@user.is_a?(Admin) && @project.workspace.admin == @user) ||
        (@user.is_a?(Worker) && @project.workspace.workers.include?(@user))
  end

  def create?
    @user.is_a? Admin
  end

  def update?
    @project.workspace.admin == @user
  end

  def destroy?
    @project.workspace.admin == @user
  end

  class Scope < Scope
    def resolve
      scope.where(workspace_id: @user.workspaces)
    end
  end
end
