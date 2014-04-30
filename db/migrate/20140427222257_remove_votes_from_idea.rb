class RemoveVotesFromIdea < ActiveRecord::Migration
  def up
    remove_column :ideas, :votes
  end

  def down
    add_column :ideas, :votes, :integer, default: 0
    add_index :ideas, :votes
  end
end
