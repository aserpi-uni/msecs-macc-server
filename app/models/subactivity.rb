class Subactivity < ApplicationRecord
  belongs_to :activity
  belongs_to :worker_1, class_name: "Worker"
  belongs_to :worker_2, class_name: "Worker"
  belongs_to :worker_3, class_name: "Worker"

  has_one :project, through: :activity
  has_one :workspace, through: :project
  has_one :master, through: :workspace

  has_many :workingschedules

  validates_presence_of :description
  def self.from_params(params)
    subactivity = Subactivity.new
    subactivity.description = params[:description]
    subactivity.worker_1 = params[:worker_1]
    subactivity.worker_2 = params[:worker_2]
    subactivity.worker_3 = params[:worker_3]

    subactivity
  end
end
