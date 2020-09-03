class Activity < ApplicationRecord
  belongs_to :admin
  belongs_to :project
  has_one :workspace, through: :project

  has_many :subactivities, :dependent => :destroy
  validates_presence_of :description
  def self.from_params(project, params)
    activity = Activity.new
    activity.admin = params[:admin]
    activity.delivery_time = params[:delivery_time]
    activity.description = params[:description]
    activity.status = params[:status]
    activity
  end
end
