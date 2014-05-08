class Vote < ActiveRecord::Base
  attr_accessible :user_id, :idea_id
  validates_presence_of   :user_id, :idea_id
  validates_uniqueness_of :user_id

  belongs_to :idea
  belongs_to :user
end
