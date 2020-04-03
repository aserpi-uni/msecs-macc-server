class ChangeColorFromClients < ActiveRecord::Migration[6.0]
  def up
    change_column :clients, :color, :integer
  end

  def down
    change_column :clients, :color, :bigint
  end
end
