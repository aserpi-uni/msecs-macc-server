class ControlPanelController < ApplicationController
  after_action :verify_authorized
  before_action { authorize :control_panel }

  # GET /control_panel
  def index; end
end
