class Idea < ActiveRecord::Base
  attr_accessible :description, :title

  validates_presence_of :description, :title

  def upvote!
    self.votes += 1
    save
  end

end
