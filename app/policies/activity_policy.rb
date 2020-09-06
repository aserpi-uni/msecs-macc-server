class ActivityPolicy < ApplicationPolicy
  attr_reader :admin, :user

  def initialize(user, activity)
    @user = user
    @activity = activity
  end

  def show?
    @activity.admin == @user
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
