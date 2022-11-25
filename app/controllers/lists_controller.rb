class ListsController < ApplicationController

  def index
    @lists = List.all
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

    # List id: 1

    # go through each bookmark, get associated movie ID
    # select those movies


    # .where ("column" = "paris") - gives you a list in an array
    # get the movies assigned to the list
    # the movies should be associated with a list!
    # because the list has many movies through bookmarks
    # i should be able to grab where bookmark.list_id

    # how do i know if a movie is inside of list?
    # it should be bookmarked
    # doctor has many appointments
    # list appointments for doctor
    # find all appointments with doctor_id = 1
    # find all bookmarks with list_id = x
    # get associated movies in those bookmarks
  end

  def new
    @list = List.new
  end

  def create
    @list = List.new(strong_params)
    @list.save

    redirect_to lists_path
  end

  private

  def strong_params
    params.require(:list).permit(:name)
  end

end
