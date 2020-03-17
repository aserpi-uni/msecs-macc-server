class WorkspacePolicy < ApplicationPolicy
  attr_reader :admin, :user

  def initialize(user, workspace)
    @user = user
    @workspace = workspace
  end

  def index?
    @user.is_a? Admin
  end

  def show?
    @workspace.admin == @user
  end

  def edit_workers?
    update_workers?
  end

  def create?
    @user.is_a? Admin
  end

  def update?
    show?
  end

  def destroy?
    show?
  end

  def transfer_supervision?
    show?
  end

  class Scope < Scope
    def resolve
      scope.where(admin: @user)
    end
  end
end
