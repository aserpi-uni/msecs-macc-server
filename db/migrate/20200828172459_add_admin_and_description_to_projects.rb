class AddAdminAndDescriptionToProjects < ActiveRecord::Migration[6.0]
  def change
    add_column :projects, :description, :string
    add_reference :projects, :admin, null: false, foreign_key: true
  end
end
