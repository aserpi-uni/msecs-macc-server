class CreateWorkers < ActiveRecord::Migration[6.0]
  def change
    create_table :workers do |t|
      t.string :email
      t.integer :bill_rate_cents
      t.string :currency

      t.timestamps
    end
    add_index :workers, :email, unique: true
  end
end
