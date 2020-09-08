class Workingschedule < ApplicationRecord
  belongs_to :worker
  #belongs_to :activity
  belongs_to :subactivity
  has_one :project, through: :subactivity

end
