class ClientPolicy < ApplicationPolicy
  def initialize(user, client)
    @user = user
    @client = client
  end

  def index?
    @user.is_a?(Admin) || @user.is_a?(Worker)
  end

  def show?
    @user.is_a?(Admin) || (@user.is_a?(Worker) && @client.workers.include?(@user))
  end

  def edit_workspaces?
    edit?
  end

  def create?
    @user.is_a? Admin
  end

  def update?
    @user.is_a? Admin
  end

  def update_workspaces?
    update?
  end

  def destroy?
    @user.is_a? Admin
  end

  class Scope < Scope
    def resolve
      if @user.is_a? Admin
        scope.all
      elsif @user.is_a? Worker
        scope.where(id: @user.client_ids)
      end
    end
  end
end
