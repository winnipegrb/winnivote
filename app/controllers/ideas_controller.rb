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
    @idea = Idea.find(params[:id])
    @idea.upvote!
    render json: {votes: @idea.votes}
  end
  
  def update
  	@idea = Idea.find(params[:id])
  	@idea.update_attributes(params[:idea])
    respond_with @idea
  end
end
