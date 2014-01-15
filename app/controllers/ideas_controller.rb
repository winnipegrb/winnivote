class IdeasController < ApplicationController
  def index
    @ideas = Idea.all
  end

  def upvote
    @idea = Idea.find(params[:id])

    @idea.upvote!
    respond_to do |format|
      format.json { render json: { votes: @idea.votes } }
    end
  end
end
