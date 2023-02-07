class AddProjectOwnerToProject < ActiveRecord::Migration[7.0]
  def change
    add_column :projects, :project_owner_id, :integer
  end
end
