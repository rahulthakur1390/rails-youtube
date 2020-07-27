class CommentsController < ApplicationController
  before_action :find_movie


  def new
    @comment = @movie.comments.build
    respond_to do |format|
      format.html
      format.js
    end
  end

  def create
    @comment = @movie.comments.new(comment_params)
    @comment.user = current_user

    respond_to do |format|
      if @comment.save
        format.html { redirect_to root_path }
      else
        format.html { render :new }
      end
    end
  end

  def destroy
    @comment = @movie.comments.find(params[:id])

    @comment.destroy
    redirect_to root_path
  end

  private

  def comment_params
    params.require(:comment).permit(:body)
  end

  def find_movie
    @movie = Movie.find(params[:movie_id])
  end
end
