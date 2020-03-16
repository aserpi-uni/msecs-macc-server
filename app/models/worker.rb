class Worker < ApplicationRecord
  devise :database_authenticatable, :lockable, :recoverable, :validatable
end
