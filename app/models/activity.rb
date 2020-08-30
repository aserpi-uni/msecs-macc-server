class Activity < ApplicationRecord
  belongs_to :admin, polymorphic: true
  belongs_to :project, polymorphic: true
  def self.from_params(params)
    activity = Activity.new

  end
end
