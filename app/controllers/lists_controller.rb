class ListsController < ApplicationController

  def index
    @lists = List.all
    if @lists.empty?
      @message = "You've got no lists, why dont you make one?"
    end
  end

  def show
    # get list ID
    @list = List.find(params[:id])
    @list_id = @list.id
    # find bookmarks, with list ID same
    @bookmarks = Bookmark.where(list_id: params[:id])

    @bookmarks.each do |b|
      @movies = Movie.where(id: b.movie_id)
    end
    # Bookmark.where(params[:id])
    # @movies = Movie.where { |m| m.id == @bookmark}
  end

  def new
    @list = List.new
  end

  def create
    @list = List.new(strong_params)
    @list.save

    redirect_to lists_path
  end

  def delete

  end

  private

  def strong_params
    params.require(:list).permit(:name)
  end

end
