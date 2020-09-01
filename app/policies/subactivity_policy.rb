class SubactivityPolicy < ApplicationPolicy
  attr_reader :admin, :user

  def initialize(user, subactivity, activity)
    @user = user
    @activity = activity
    @subactivity = subactivity
  end

  def index?
    @user.is_a? Admin || Worker
  end

  def show?
    @user.master || @user == @subactivity.worker_1 || @subactivity.worker_3 || @user == @subactivity.worker_3

  end

  def create?
    @user.is_a? Worker && @user.master
  end

  def update?
    @user == @subactivity.worker_1 || @subactivity.worker_3 || @user == @subactivity.worker_3
  end

  def destroy?
    @user.master
  end

  def transfer_supervision?
    index?
  end

  class Scope < Scope
    def resolve
      scope.where(admin: @user)
    end
  end
end
