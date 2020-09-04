class Project < ApplicationRecord
  belongs_to :admin
  belongs_to :client
  belongs_to :workspace

  has_many :activities, :dependent => :destroy
end
