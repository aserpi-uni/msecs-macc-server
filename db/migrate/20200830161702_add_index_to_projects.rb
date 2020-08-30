class AddIndexToProjects < ActiveRecord::Migration[6.0]
  def change
    add_index :projects, :project_name, unique: true
    add_column :activities, :description, :string
    add_index :activities, :description, unique: true
  end
end
