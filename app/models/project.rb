class Project < ApplicationRecord
  belongs_to :admin
  belongs_to :client
  belongs_to :workspace

  has_many :activities, :dependent => :destroy

  validates :currency, inclusion: { in: Money::Currency.table.map { |k, c| c[:iso_code] } }
end
