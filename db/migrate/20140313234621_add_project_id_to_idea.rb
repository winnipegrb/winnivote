class AddProjectIdToIdea < ActiveRecord::Migration
  def up
    add_column :ideas, :project_id, :integer
    add_index :ideas, :project_id
  end

  def down
    remove_column :ideas, :project_id
  end
end
