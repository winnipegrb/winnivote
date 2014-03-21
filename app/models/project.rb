class Project < ActiveRecord::Base
  attr_accessible :name

  has_many :ideas

  validates_presence_of :name
end
