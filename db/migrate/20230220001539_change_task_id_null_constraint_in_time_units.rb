class ChangeTaskIdNullConstraintInTimeUnits < ActiveRecord::Migration[7.0]
  def up
    change_column_null :time_units, :task_id, true
  end

  def down
    change_column_null :time_units, :task_id, false
  end
end
