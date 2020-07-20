class MoviesController < ApplicationController
  skip_before_action :authenticate_user!, only: :index

  def index
    @movies = Movie.all
  end

  def new
    respond_to do |format|
      format.html
      format.js
    end
  end

  def create
    @movie = Movie.new(movie_params)
    @movie.user_id = current_user.id
    respond_to do |format|
      if @movie.save
        format.html { redirect_to action: "index" }
      else
        format.html { render :new }
      end
    end
  end

  private

  # Never trust parameters from the scary internet, only allow the white list through.
  def movie_params
    params.require(:movie).permit(:url)
  end
end
