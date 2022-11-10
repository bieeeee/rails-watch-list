class BookmarksController < ApplicationController
  def new
    @movie = Movie.find(params[:movie_id])
    @bookmark = Bookmark.new
  end

  def create
    # raise
    @bookmark = Bookmark.new(bookmark_params)
    @bookmark.movie = Movie.find(params[:movie_id])
    @bookmark.list = List.find(params[:bookmark][:list_id])
    # raise
    if @bookmark.save!
      redirect_to lists_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def bookmark_params
    params.require(:bookmark).permit(:list_id, :comment)
  end
end
