class IdeasController < ApplicationController
  skip_before_filter :authenticate_user!, only: :index
  respond_to :html, except: [:update, :upvote]
  respond_to :json, only: [:update, :upvote]
  
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
    begin
      @idea = Idea.find(params[:id])
      @idea.upvote current_user
      render json: {total_votes: @idea.total_votes}
    rescue
      render json: {error: "You have already voted on this idea!"}
    end
  end
  
  def update
  	@idea = Idea.find(params[:id])
  	@idea.update_attributes(params[:idea])
    respond_with @idea
  end
end
