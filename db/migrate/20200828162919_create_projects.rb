class CreateProjects < ActiveRecord::Migration[6.0]
  def change
    create_table :projects do |t|
      t.string :project_name

      t.string :workspace_name
      t.date :delivery_time
      t.float :current_cost


      t.timestamps
    end
  end
end
