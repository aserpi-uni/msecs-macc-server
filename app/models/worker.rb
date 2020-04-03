class Worker < ApplicationRecord
  include Updatable
  devise :database_authenticatable, :lockable, :recoverable, :token_authenticatable, :validatable

  has_many :authentication_tokens, class_name: WorkerAuthenticationToken.name, foreign_key: :user_id
  has_and_belongs_to_many :workspaces, after_add: :touch_updated_at, after_remove: :touch_updated_at
  has_many :clients, -> { distinct }, through: :workspaces

  monetize :bill_rate_cents, with_model_currency: :currency

  def self.from_params(params)
    worker = Worker.new

    worker.email = params[:email]
    worker.password = Devise.friendly_token 32

    worker.bill_rate_cents = 0
    worker.currency = MoneyRails.default_currency.iso_code

    worker
  end
end
