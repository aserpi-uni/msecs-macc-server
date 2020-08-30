class AddAdminAndProjectToActivity < ActiveRecord::Migration[6.0]
  def change
    add_reference :activities, :admin, null: false, foreign_key: true
    add_reference :activities, :project, null: false, foreign_key: true
  end
end
