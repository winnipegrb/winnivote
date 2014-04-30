class Vote < ActiveRecord::Base

  validates_presence_of   :user, :idea
  validates_uniqueness_of :user

  belongs_to :idea
  belongs_to :user
end
