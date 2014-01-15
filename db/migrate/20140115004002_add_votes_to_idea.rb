class AddVotesToIdea < ActiveRecord::Migration
  def change
    add_column :ideas, :votes, :integer, default: 0
  end
end
