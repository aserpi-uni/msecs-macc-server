class ChangeDeliveryTimes < ActiveRecord::Migration[6.0]
  def change
    change_column :activities, :delivery_time, :datetime
    change_column :projects, :delivery_time, :datetime
  end
end
