class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.references :idea
      t.references :user

      t.timestamps
    end
    add_index :votes, :idea_id
    add_index :votes, :user_id
  end
end
