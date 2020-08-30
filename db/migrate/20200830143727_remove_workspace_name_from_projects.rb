class RemoveWorkspaceNameFromProjects < ActiveRecord::Migration[6.0]
  def change
    remove_column :projects, :workspace_name, :string
  end
end
