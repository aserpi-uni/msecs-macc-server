class AddReferencesToProjects < ActiveRecord::Migration[6.0]
  def change
    add_reference :projects, :workspace, foreign_key: true
  end
end
