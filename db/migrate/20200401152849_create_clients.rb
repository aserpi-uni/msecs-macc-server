class CreateClients < ActiveRecord::Migration[6.0]
  def change
    create_table :clients do |t|
      t.string :name, null: false
      t.string :description
      t.bigint :color

      t.timestamps
    end
    add_index :clients, :name, unique: true
  end
end
