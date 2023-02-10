class AddAttributesToComment < ActiveRecord::Migration[7.0]
  def change
    add_column :comments, :user_id, :integer
    add_column :comments, :task_id, :integer
    add_column :comments, :content, :text
  end
end
