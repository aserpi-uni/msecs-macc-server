class Worker < ApplicationRecord
  devise :database_authenticatable, :lockable, :recoverable, :validatable

  has_and_belongs_to_many :workspaces

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
