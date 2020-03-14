class RemoveBillRateFromWorkspace < ActiveRecord::Migration[6.0]
  def change

    remove_column :workspaces, :currency, :string

    remove_column :workspaces, :bill_rate_cents, :string
  end
end
