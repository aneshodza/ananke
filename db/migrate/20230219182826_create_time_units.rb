class CreateTimeUnits < ActiveRecord::Migration[7.0]
  def change
    create_table :time_units do |t|
      t.datetime :start_time
      t.datetime :end_time
      t.references :task, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.string :description

      t.timestamps
    end
  end
end
