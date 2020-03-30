class CreateJoinTableWorkerWorkspace < ActiveRecord::Migration[6.0]
  def change
    create_join_table :workers, :workspaces do |t|
      t.index [:worker_id, :workspace_id]
      t.index [:workspace_id, :worker_id]
    end
  end
end
