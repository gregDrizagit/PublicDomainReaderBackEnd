class Api::V1::BooksController < ApplicationController
  #validates the uniqueness of the book title
  def index
    @books = Book.all
    render json: @books, status: 200
  end
end
