class Idea < ActiveRecord::Base
  attr_accessible :description, :title, :project_id

  validates_presence_of :description, :title

  belongs_to :project

  def upvote!
    self.votes += 1
    save
  end

  def project_name
    project ? project.name : ""
  end

end
