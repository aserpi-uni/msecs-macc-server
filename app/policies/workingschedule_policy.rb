class WorkingschedulePolicy < ApplicationPolicy
  def initialize(user, workingschedule, worker)
    @logged_user = user
    @worker = worker
    @workingschedule =  workingschedule
  end

  def index?
    @logged_user.is_a? Admin || Worker
  end

  def create?
    @logged_user.is_a? Worker
  end

  def update?
    @logged_user == @worker && @worker.master
  end

  def destroy?
    @logged_user.is_a? Admin
  end
end
