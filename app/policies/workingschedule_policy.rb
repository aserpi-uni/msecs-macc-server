class WorkingschedulePolicy < ApplicationPolicy
  def initialize(user, subactivity)
    @user = user
    @subactivity =  subactivity
  end

  def index?
    @user.is_a? Worker
  end

  def create?
    @subactivity.worker_1 == @user || @subactivity.worker_2 == @user || @subactivity.worker_3 == @user
  end

  def update?
    create?
  end

  def destroy?
    @user.is_a? Admin
  end
  
  class Scope < Scope
    def resolve
      scope.where(worker_id: @user.id)
    end
  end
end
