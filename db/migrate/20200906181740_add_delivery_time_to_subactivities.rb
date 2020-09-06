class AddDeliveryTimeToSubactivities < ActiveRecord::Migration[6.0]
  def change
    add_column :subactivities, :delivery_time, :date
  end
end
