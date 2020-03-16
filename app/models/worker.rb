class Worker < ApplicationRecord
  devise :database_authenticatable, :lockable, :recoverable, :validatable

  has_and_belongs_to_many :workspaces
end
