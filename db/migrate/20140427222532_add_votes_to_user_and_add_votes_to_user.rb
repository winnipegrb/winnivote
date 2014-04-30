class AddVotesToUserAndAddVotesToUser < ActiveRecord::Migration
  def up
    add_column :ideas, :vote_id, :integer
    add_index :ideas, :vote_id
    add_column :users, :vote_id, :integer
    add_index :users, :vote_id
  end

  def down
    remove_column :ideas, :vote_id
    remove_column :users, :vote_id
  end
end
