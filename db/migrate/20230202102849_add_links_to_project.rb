class AddLinksToProject < ActiveRecord::Migration[7.0]
  def change
    add_column :projects, :repo_link, :string
    add_column :projects, :web_link, :string
  end
end
