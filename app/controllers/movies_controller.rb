class MoviesController < ApplicationController

  def index
    @movies = Movie.all
  end

  def show
    @movie = Movie.find(params[:id])
    @bookmark = Bookmark.where(movie_id: params[:id])
  end

end
