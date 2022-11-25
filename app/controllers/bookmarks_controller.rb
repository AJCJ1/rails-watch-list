class BookmarksController < ApplicationController

  def index
    @bookmarks = Bookmark.all
    @movies = Movie.all
  end

  def show
    @bookmark = Bookmark.find(params[:bookmark_id])
  end

  def new
    @bookmark = Bookmark.new
  end

  def create
    @bookmark = Bookmark.new(strong_params)
    @bookmark.save

    redirect_to bookmarks_path
  end

  private

  def strong_params
    params.require(:bookmark).permit(:name)
  end
end
