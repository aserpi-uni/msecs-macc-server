class AddMasterToWorkers < ActiveRecord::Migration[6.0]
  def change
    add_column :workers, :master, :boolean
  end
end
