class ProjectPolicy < ApplicationPolicy
  attr_reader :admin, :user

  def initialize(user, project)
    @user = user
    @project = project
  end

  def index?
    @user.is_a? Admin
  end

  def show?
    @project.admin == @user
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
