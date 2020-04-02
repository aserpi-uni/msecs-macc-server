class CreateJoinTableClientWorkspace < ActiveRecord::Migration[6.0]
  def change
    create_join_table :clients, :workspaces do |t|
      t.index [:client_id, :workspace_id]
      t.index [:workspace_id, :client_id]
    end
  end
end
