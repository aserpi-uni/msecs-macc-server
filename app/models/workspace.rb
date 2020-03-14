class Workspace < ApplicationRecord
  belongs_to :admin

  monetize :bill_rate_cents, with_model_currency: :currency # TODO: validate
end
