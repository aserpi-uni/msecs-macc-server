class Worker < ApplicationRecord
  devise :database_authenticatable, :lockable, :recoverable, :validatable

  has_and_belongs_to_many :workspaces

  def self.from_params(params)
    worker = Worker.new

    worker.email = params[:email]
    worker.password = Devise.friendly_token 32

    worker
  end
end
