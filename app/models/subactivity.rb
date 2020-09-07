class Subactivity < ApplicationRecord
  belongs_to :activity
  belongs_to :worker_1, class_name: "Worker"
  belongs_to :worker_2, class_name: "Worker"
  belongs_to :worker_3, class_name: "Worker"

  has_one :project, through: :activity
  has_one :workspace, through: :project

  has_many :workingschedules

  validates_presence_of :description
end
