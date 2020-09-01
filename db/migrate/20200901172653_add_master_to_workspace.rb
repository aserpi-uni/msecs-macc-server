class AddMasterToWorkspace < ActiveRecord::Migration[6.0]
  def change
    add_column :workspaces, :master_id, :bigint
    add_foreign_key :workspaces, :workers, column: :master_id
  end
end
