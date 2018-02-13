class Api::V1::BookmarksController < ApplicationController

  def index
    @bookmarks = Bookmark.all
    render json: @bookmarks, status: 200
  end

  def create
    # bookmark = Bookmark.find_or_create_by(book_id: params[:book_id]) do |bookmark|
    #   bookmark.user_id = params[:user_id]
    #   bookmark.paragraph = params[:paragraph]
    # end

    bookmark = Bookmark.find_by(book_id: params[:book_id])

    if bookmark
      bookmark.update(paragraph: params[:paragraph])
      render json: bookmark, status: 200
    else
      bookmark = bookmark = Bookmark.create(user_id: params[:user_id], book_id: params[:book_id], paragraph: params[:paragraph])
      render json: bookmark, status: 200

    end
  end

  def load_bookmark
    
    @bookmark = Bookmark.find_by(book_id: params[:book_id])
    if @bookmark
      render json: @bookmark, status: 200
    else
      render json: {errors: "No bookmark"}, status: 200
    end

  end

end
