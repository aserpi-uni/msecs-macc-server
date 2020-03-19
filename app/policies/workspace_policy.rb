class WorkspacePolicy < ApplicationPolicy
  def initialize(user, workspace)
    @user = user
    @workspace = workspace
  end

  def index?
    @user.is_a? Admin
  end

  def show?
    (@user.is_a?(Admin) && @workspace.admin == @user) || (@user.is_a?(Worker) && @workspace.workers.include?(@user))
  end

  def edit_workers?
    update_workers?
  end

  def create?
    @user.is_a? Admin
  end

  def update?
    @workspace.admin == @user
  end

  def update_workers?
    update?
  end

  def destroy?
    @workspace.admin == @user
  end

  def transfer_supervision?
    update?
  end

  class Scope < Scope
    def resolve
      scope.where(admin: @user)
    end
  end
end
