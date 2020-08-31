class Activity < ApplicationRecord
  belongs_to :admin
  belongs_to :project
  validates_presence_of :description
  def self.from_params(project, params)
    activity = Activity.new
    activity.admin = params[:admin]
    activity.description = params[:description]
    activity
  end
end
