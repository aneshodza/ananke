class AddAssociationToTasks < ActiveRecord::Migration[7.0]
  def change
    add_column :tasks, :project_id, :integer
    add_column :tasks, :assigned_user_id, :integer
    add_column :tasks, :creator_id, :integer
  end
end
