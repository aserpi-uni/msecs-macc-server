class WorkerPolicy < ApplicationPolicy
  def initialize(user, worker)
    @logged_user = user
    @worker = worker
  end

  def index?
    @logged_user.is_a? Admin
  end

  def show?
    @logged_user.is_a?(Admin) || @logged_user == @worker
  end

  def show_self?
    @logged_user.is_a? Worker
  end

  def create?
    @logged_user.is_a? Admin
  end

  def update?
    @logged_user == @worker
  end

  def update_master?
    @logged_user.is_a?Admin
  end

  def destroy?
    @logged_user.is_a? Admin
  end
end
