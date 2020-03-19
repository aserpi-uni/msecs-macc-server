class AdminPolicy < ApplicationPolicy
  def initialize(user, admin)
    @logged_user = user
    @admin = admin
  end

  def index?
    @logged_user.is_a? Admin
  end

  def show?
    @logged_user.is_a? Admin
  end

  def create?
    @logged_user.is_a? Admin
  end

  def update?
    @logged_user == @admin
  end

  def destroy?
    @logged_user.is_a? Admin
  end
end
