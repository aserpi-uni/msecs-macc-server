class WorkingschedulePolicy < ApplicationPolicy
  def initialize(user, workingschedule)
    @user = user
    @workingschedule =  workingschedule
  end

  def index?
    @user.is_a? Worker
  end

  def create?
    @user.is_a? Worker
  end

  def update?
    create?
  end

  def destroy?
    @user.is_a? Admin
  end
  class Scope < Scope
    def resolve
      scope.where(worker_id == @user.id)
    end
  end
  end
