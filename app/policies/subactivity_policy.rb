class SubactivityPolicy < ApplicationPolicy
  def initialize(user, activity)
    @user = user
    @activity = activity
  end

  def index?
    @user.is_a? Worker
  end

  def show?
    @activity.workspace.master == @user || @user == @activity.worker_1 || @activity.worker_3 || @user == @activity.worker_3
  end

  def create?
    @activity.workspace.master == @user
  end

  def update?
    create?
  end

  def update_status?
    update?
  end

  def destroy?
    create?
  end

  class Scope < Scope
    def resolve
      scope.where(worker_1_id: @user.id).or(scope.where(worker_2_id: @user.id)).or(scope.where(worker_3_id: @user.id))
    end
  end
end
