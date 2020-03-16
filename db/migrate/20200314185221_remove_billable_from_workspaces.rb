class RemoveBillableFromWorkspaces < ActiveRecord::Migration[6.0]
  def change

    remove_column :workspaces, :billable, :boolean
  end
end
