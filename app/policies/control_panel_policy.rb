class ControlPanelPolicy < Struct.new(:user, :control_panel)
  def initialize(user, control_panel)
    @user = user
    @control_panel = control_panel
  end

  def index?
    @user.is_a? Admin
  end
end
