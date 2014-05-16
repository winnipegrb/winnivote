class Idea < ActiveRecord::Base
  attr_accessible :description, :title, :project_id

  validates_presence_of :description, :title

  belongs_to :project
  has_many :votes

  def upvote(user)
    vote = self.votes.build(user_id: user.id)
    vote.save
  end

  def project_name
    project ? project.name : ""
  end

  def total_votes
    self.votes.count
  end

end
