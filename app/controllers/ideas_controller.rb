class IdeasController < ApplicationController
  def index
    @ideas = Idea.all
  end
end
