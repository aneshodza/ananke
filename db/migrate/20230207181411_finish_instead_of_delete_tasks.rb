class FinishInsteadOfDeleteTasks < ActiveRecord::Migration[7.0]
  def change
    add_column :tasks, :finished, :boolean, default: false
  end
end
