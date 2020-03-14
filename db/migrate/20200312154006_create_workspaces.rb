class CreateWorkspaces < ActiveRecord::Migration[6.0]
  def change
    create_table :workspaces do |t|
      t.integer :bill_rate_cents
      t.boolean :billable
      t.string :currency
      t.string :description
      t.string :name
      t.references :admin, null: false, foreign_key: true

      t.timestamps
    end
    add_index :workspaces, :name, unique: true
  end
end
