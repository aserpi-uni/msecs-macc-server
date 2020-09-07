class RemoveUselessAdminColumns < ActiveRecord::Migration[6.0]
  def change
    remove_reference :activities, :admin, index: true, foreign_key: true, null: false
    remove_reference :projects, :admin, index: true, foreign_key: true, null: false
  end
end
