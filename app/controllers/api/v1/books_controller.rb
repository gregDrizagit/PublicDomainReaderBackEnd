class Api::V1::BooksController < ApplicationController
  #validates the uniqueness of the book title
  def index
    @books = Book.all
    render json: @books, status: 200
  end

  def search
    @search_results = Book.where("title LIKE ?", "%#{params[:query]}%")

    if @search_results.length > 0
      render json: @search_results, status: 200
    else
      render json: {error: "Couldn't find anything..."}, status: 401
    end
  end
  
end
