class CreateWorkingschedules < ActiveRecord::Migration[6.0]
  def change
    create_table :workingschedules do |t|
      t.integer :hours
      t.date :date
      t.references :worker, null: false, foreign_key: true
      #t.references :activity, null: false, foreign_key: true
      t.references :subactivity, null: false, foreign_key: true

      t.timestamps
    end
  end
end
