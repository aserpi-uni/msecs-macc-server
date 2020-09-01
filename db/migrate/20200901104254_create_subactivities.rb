class CreateSubactivities < ActiveRecord::Migration[6.0]
  def change
    create_table :subactivities do |t|
      t.string :description
      t.string :status
      t.references :activity, null: false, foreign_key: true
      t.references :worker_1
      t.references :worker_2
      t.references :worker_3

      t.timestamps
    end
    add_foreign_key :subactivities, :workers, column: :worker_1_id
    add_foreign_key :subactivities, :workers, column: :worker_2_id
    add_foreign_key :subactivities, :workers, column: :worker_3_id

  end
end
