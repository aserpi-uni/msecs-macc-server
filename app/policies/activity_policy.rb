class ActivityPolicy < ApplicationPolicy

  def initialize(user, project)
    @user = user
    @project = project
  end

  def show?
    @project.workspace.workers.include?(@user) || @project.workspace.admin == @user
  end

  def show_cost?
    create?
  end

  def create?
    @project.workspace.admin == @admin
  end

  def update?
    create?
  end

  def destroy?
    create?
  end
end
