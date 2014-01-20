class IdeasController < ApplicationController
  skip_before_filter :authenticate_user!, only: :index
  
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
  
  def update
  	@idea = Idea.find(params[:id])
  	@idea.update_attributes(params[:idea])

  	respond_to do |format|
  		format.html { redirect_to action: "index" }
  		format.js
  	end
  end
end
