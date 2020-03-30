class WorkerAuthenticationToken < ApplicationRecord
  belongs_to :user, class_name: Worker.name, foreign_key: :user_id
end
