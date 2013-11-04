class Idea < ActiveRecord::Base
  attr_accessible :description, :title
  
  validates_presence_of :description, :title
end
