class IdeasController < ApplicationController
  def index
    @ideas = Idea.all
  end

  def new
    @idea = Idea.new
  end

  def create
    @idea = Idea.new(params["idea"])
    if @idea.save
      redirect_to :root
    else
      render "new"
    end
    
  end

  def upvote
    @idea = Idea.find(params[:id])

    @idea.upvote!
    respond_to do |format|
      format.json { render json: { votes: @idea.votes } }
    end
  end

  def new
    @idea = Idea.new
  end

  def create
    @idea = Idea.new(params["idea"])
    if @idea.save
      redirect_to :root
    else
      render "new"
    end
    
  end
end
