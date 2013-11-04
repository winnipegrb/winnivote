class IdeasController < ApplicationController
  def index
    @ideas = [OpenStruct.new(title: 'Idea1', description: 'Very nice idea')]
  end
end
