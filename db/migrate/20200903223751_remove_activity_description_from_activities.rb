class RemoveActivityDescriptionFromActivities < ActiveRecord::Migration[6.0]
  def change
    remove_column :activities, :activity_description, :string
  end
end
