class BookmarksController < ApplicationController
  before_action :set_list, only: %i[new create]
  # before_action :set_bookmark, only: :destroy

  def index
    @bookmarks = Bookmark.all
  end

  def show
    @bookmark = Bookmark.find(params[:bookmark_id])
  end

  def new
    @bookmark = Bookmark.new
  end

  def create
    @bookmark = Bookmark.new(strong_params)
    @bookmark.list = @list
    if @bookmark.save
      redirect_to lists_path
    else
      render :new
    end
  end

  private

  def strong_params
    params.require(:bookmark).permit(:comment, :movie_id)
  end

  def set_list
    @list = List.find(params[:list_id])
  end

end
