class RestoreDeliveryTimes < ActiveRecord::Migration[6.0]
  def change
    change_column :activities, :delivery_time, :date
    change_column :projects, :delivery_time, :date
  end
end
