class CreateActivities < ActiveRecord::Migration[6.0]
  def change
    create_table :activities do |t|
      t.string :activity_description
      t.date :delivery_time
      t.timestamps
    end
  end
end
