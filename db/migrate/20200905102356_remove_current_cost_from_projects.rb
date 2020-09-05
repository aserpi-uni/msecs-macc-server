class RemoveCurrentCostFromProjects < ActiveRecord::Migration[6.0]
  def change
    remove_column :projects, :current_cost, :float
  end
end
