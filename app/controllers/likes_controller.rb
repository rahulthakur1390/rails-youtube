class LikesController < ApplicationController
  before_action :find_movie
  before_action :find_like, only: [:destroy]
  
  def create
    if already_liked?
      flash[:notice] = "You can't like more than once"
    else
      @movie.likes.create(user_id: current_user.id)
    end
    respond_to do |format|
      format.html
      format.js
    end
  end

  def destroy
    if !(already_liked?)
      flash[:notice] = "Cannot unlike"
    else
      @like.destroy
    end
    respond_to do |format|
      format.html
      format.js
    end
  end

  private
  
  def find_movie
    @movie = Movie.find(params[:movie_id])
  end

  def already_liked?
    Like.where(user_id: current_user.id, movie_id: params[:movie_id]).exists?
  end

  def find_like
    @like = @movie.likes.find(params[:id])
  end
end
